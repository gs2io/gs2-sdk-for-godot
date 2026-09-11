# Copyright 2016 Game Server Services, Inc. or its affiliates. All Rights
# Reserved.
#
# Licensed under the Apache License, Version 2.0 (the "License").
# You may not use this file except in compliance with the License.
# A copy of the License is located at
#
#  http://www.apache.org/licenses/LICENSE-2.0
#
# or in the "license" file accompanying this file. This file is distributed
# on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either
# express or implied. See the License for the specific language governing
# permissions and limitations under the License.
class_name Gs2RestSession
extends RefCounted


const METHOD_MAP = {
    "GET": HTTPClient.METHOD_GET,
    "POST": HTTPClient.METHOD_POST,
    "PUT": HTTPClient.METHOD_PUT,
    "DELETE": HTTPClient.METHOD_DELETE,
}

## リクエスト全体のタイムアウト (msec)
## 応答が途絶した接続で await ループが永久に回り、呼び出し元がハングするのを防ぐ
const REQUEST_TIMEOUT_MS = 60 * 1000

var credential: Gs2Credential
var region: String = Gs2Region.AP_NORTHEAST_1
var owner_id: Variant = null
var _opening: bool = false

## Steady（専用フリート）の基点（https://<host>）。空なら共有クラウド（従来どおりの URL）。
## open() の前に設定する（addons/gs2/core/gs2_steady.gd の説明）。設定すると全サービスの接続先が
## <steady_endpoint>/<service> になり、接続段階に上限と 1 回の再送が付く。
## 末尾の / と空白は落とされる
var steady_endpoint: String = "":
    set(value):
        steady_endpoint = Gs2Steady.normalize_steady_endpoint(value)


func _init(credential_: Gs2Credential, region_: String = Gs2Region.AP_NORTHEAST_1):
    credential = credential_
    region = region_


## プロジェクトトークンを取得してセッションを開く
func open() -> Gs2AsyncResult:
    while _opening:
        await Engine.get_main_loop().process_frame
    if credential.project_token != null:
        owner_id = credential.client_id
        return Gs2AsyncResult.new(null, null)
    if credential.client_secret == null:
        return Gs2AsyncResult.new(null, Gs2Exception.session_not_open())
    _opening = true
    var url = endpoint_host("identifier") + "/projectToken/login"
    var body_text = JSON.stringify({
        "client_id": credential.client_id,
        "client_secret": credential.client_secret,
    })
    var response = await _request_with_steady_retry("POST", url, {"Content-Type": "application/json"}, {}, body_text)
    _opening = false
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    if response.body != null:
        credential.project_token = response.body.get("access_token")
    owner_id = credential.client_id
    return Gs2AsyncResult.new(null, null)


## REST セッションを閉じ、次の API 呼び出しで再認証される状態に戻す。
## HTTPClient はリクエストごとに生成・破棄されるため、永続接続の解放は不要。
func close() -> void:
    credential.project_token = null
    owner_id = null


## サービスの接続先（https://<host>/<service>）。
## 優先順は steady_endpoint ＞ Gs2Constant.ENDPOINT_HOST。
## steady_endpoint が空なら結果は従来の Gs2Constant.ENDPOINT_HOST の置換と byte 単位で同じ文字列になる
func endpoint_host(service: String) -> String:
    var template = Gs2Steady.steady_rest_template(steady_endpoint)
    if template == "":
        template = Gs2Constant.ENDPOINT_HOST
    return template.replace("{service}", service).replace("{region}", region)


## GS2 API を呼び出す
## body が null 以外の場合は JSON ボディとして送信する
func send(method: String, url: String, headers: Dictionary, query_strings: Dictionary, body) -> Gs2RestResponse:
    var request_url = _steady_rest_url(url)
    for attempt in range(2):
        if credential.project_token == null:
            var open_result = await open()
            if open_result.error != null:
                var error_response = Gs2RestResponse.new()
                error_response.status_code = open_result.error.status_code
                error_response.error = open_result.error
                return error_response
        var merged_headers = headers.duplicate()
        if credential.client_id != null:
            merged_headers["X-GS2-CLIENT-ID"] = credential.client_id
        if credential.project_token != null:
            merged_headers["Authorization"] = "Bearer " + credential.project_token
        var body_text = null
        if body != null:
            merged_headers["Content-Type"] = "application/json"
            body_text = JSON.stringify(_strip_nulls(body))
        var response = await _request_with_steady_retry(method, request_url, merged_headers, query_strings, body_text)
        if response.status_code == 401 and credential.client_secret != null and attempt == 0:
            # プロジェクトトークンの期限切れを想定して再ログイン
            credential.project_token = null
            continue
        return response
    return Gs2RestResponse.network_error("core.network.retry.failed")


## 署名付き URL へのアップロード (UpdateCurrent*Master の preUpload で使用)
func upload(
    url: String,
    body: Variant,
    content_type: String = "application/json"
) -> Gs2RestResponse:
    var response = await _request_raw("PUT", url, {"Content-Type": content_type}, {}, body)
    if response == null:
        return Gs2RestResponse.network_error("core.network.request.failed")
    return response


## 署名付き URL からバイナリをダウンロードする。
func download(url: String) -> Gs2RestResponse:
    var response = await _request_raw("GET", url, {}, {}, null)
    if response == null:
        return Gs2RestResponse.network_error("core.network.request.failed")
    return response


static func _strip_nulls(value):
    if value is Dictionary:
        var ret = {}
        for key in value:
            if value[key] == null:
                continue
            ret[key] = _strip_nulls(value[key])
        return ret
    if value is Array:
        return value.map(func(v): return _strip_nulls(v))
    return value


## Steady の基点宛に差し替えた URL。差し替えられないならそのまま
## （steady_endpoint 未設定・署名付き URL 等の template に当てはまらない URL）。
##
## ★生成されたクライアントは Gs2Constant.ENDPOINT_HOST から URL を組んで send に渡すので
## （GDScript にはサービスごとの override が無い）、Steady への差し替えは送る直前にここで行う。
## upload / download の署名付き URL は send を通らないので影響しない
func _steady_rest_url(url: String) -> String:
    if steady_endpoint == "":
        return url
    var rewritten = Gs2Steady.steady_rest_url(steady_endpoint, Gs2Constant.ENDPOINT_HOST, region, url)
    return url if rewritten == "" else rewritten


## 要求を送る。Steady の基点宛なら接続段階に上限（Gs2Steady.CONNECT_TIMEOUT_MS）を置き、
## 接続段階の失敗だけ同じ要求をもう 1 回だけ送る。共有クラウドは従来どおり（上限も再送も無い）
func _request_with_steady_retry(
    method: String,
    url: String,
    headers: Dictionary,
    query_strings: Dictionary,
    body: Variant
) -> Gs2RestResponse:
    var via_steady = Gs2Steady.is_steady_url(steady_endpoint, url)
    var connect_timeout_msec = Gs2Steady.CONNECT_TIMEOUT_MS if via_steady else -1
    var response = await _request_raw(method, url, headers, query_strings, body, connect_timeout_msec)
    if via_steady and response.connect_failed:
        # ★接続段階の失敗（DNS / TCP の接続 / TLS handshake。1 バイトも送っていない）だけ、
        # 同じ要求をもう 1 回だけ送る。フリートが手放した IP に当たったとき、名前を引き直して
        # 別のノードへ着く機会を 1 回だけ作る。送信後の失敗（読み取りタイムアウト・途中切断・5xx）は
        # 届いたかもしれないので再送しない（非冪等要求の二重実行を作らない）。3 回目は無い
        response = await _request_raw(method, url, headers, query_strings, body, connect_timeout_msec)
    return response


## connect_timeout_msec >= 0 なら接続段階（DNS / TCP の接続 / TLS handshake）だけその上限で
## 打ち切る（Steady の基点宛のときに使う）。-1 なら従来どおり REQUEST_TIMEOUT_MS。
## 接続段階の失敗は connect_failed = true の応答になる（1 バイトも送っていない）
func _request_raw(
    method: String,
    url: String,
    headers: Dictionary,
    query_strings: Dictionary,
    body: Variant,
    connect_timeout_msec: int = -1
) -> Gs2RestResponse:
    var scheme_end = url.find("://")
    var scheme = "https" if scheme_end == -1 else url.substr(0, scheme_end)
    var remainder = url.substr(scheme_end + 3)
    var slash_pos = remainder.find("/")
    var host = remainder if slash_pos == -1 else remainder.substr(0, slash_pos)
    var path = "/" if slash_pos == -1 else remainder.substr(slash_pos)
    # http:// はローカルの試験・開発用（TLS 無し）。それ以外は従来どおり 443 + TLS
    var use_tls = scheme != "http"
    var port = 443 if use_tls else 80
    var port_pos = host.rfind(":")
    if port_pos != -1 and host.find("]") < port_pos and host.substr(port_pos + 1).is_valid_int():
        port = int(host.substr(port_pos + 1))
        host = host.substr(0, port_pos)
    var query = ""
    for key in query_strings:
        if query_strings[key] == null:
            continue
        query += "?" if query == "" else "&"
        query += str(key).uri_encode() + "=" + str(query_strings[key]).uri_encode()
    var deadline = Time.get_ticks_msec() + REQUEST_TIMEOUT_MS
    # ★接続段階だけ短い上限を置く。要求全体（POST / PUT 等の長い API）の上限は縮めない
    var connect_deadline = deadline if connect_timeout_msec < 0 else Time.get_ticks_msec() + connect_timeout_msec
    var client = HTTPClient.new()
    var err = client.connect_to_host(host, port, TLSOptions.client() if use_tls else null)
    if err != OK:
        return Gs2RestResponse.network_error("core.network.connect.failed", true)
    # Godot の HTTPClient は DNS 解決・TCP の接続・TLS handshake を
    # STATUS_RESOLVING / STATUS_CONNECTING で表すので、この待ちが接続段階そのもの
    while client.get_status() == HTTPClient.STATUS_CONNECTING or client.get_status() == HTTPClient.STATUS_RESOLVING:
        if Time.get_ticks_msec() > connect_deadline:
            client.close()
            return Gs2RestResponse.network_error("core.network.timeout", connect_timeout_msec >= 0)
        client.poll()
        await Engine.get_main_loop().process_frame
    if client.get_status() != HTTPClient.STATUS_CONNECTED:
        # STATUS_CANT_RESOLVE / STATUS_CANT_CONNECT / STATUS_TLS_HANDSHAKE_ERROR / STATUS_CONNECTION_ERROR
        return Gs2RestResponse.network_error(
            "core.network.connect.failed",
            Gs2Steady.is_connect_failure_status(client.get_status())
        )
    var header_list := PackedStringArray()
    for key in headers:
        header_list.append(str(key) + ": " + str(headers[key]))
    var http_method: HTTPClient.Method = METHOD_MAP.get(method, HTTPClient.METHOD_GET)
    if body is PackedByteArray:
        if not headers.has("Content-Length"):
            header_list.append("Content-Length: " + str(body.size()))
        err = client.request_raw(http_method, path + query, header_list, body)
    else:
        err = client.request(http_method, path + query, header_list, "" if body == null else str(body))
    if err != OK:
        return Gs2RestResponse.network_error("core.network.request.failed")
    while client.get_status() == HTTPClient.STATUS_REQUESTING:
        if Time.get_ticks_msec() > deadline:
            client.close()
            return Gs2RestResponse.network_error("core.network.timeout")
        client.poll()
        await Engine.get_main_loop().process_frame
    if client.get_status() != HTTPClient.STATUS_BODY and client.get_status() != HTTPClient.STATUS_CONNECTED:
        return Gs2RestResponse.network_error("core.network.response.failed")
    var status_code = client.get_response_code()
    var body_bytes = PackedByteArray()
    while client.get_status() == HTTPClient.STATUS_BODY:
        if Time.get_ticks_msec() > deadline:
            client.close()
            return Gs2RestResponse.network_error("core.network.timeout")
        client.poll()
        var chunk = client.read_response_body_chunk()
        if chunk.size() == 0:
            await Engine.get_main_loop().process_frame
        else:
            body_bytes.append_array(chunk)
    client.close()
    var response = Gs2RestResponse.from_response(status_code, body_bytes.get_string_from_utf8())
    response.body_bytes = body_bytes
    return response
