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
    var url = Gs2Constant.ENDPOINT_HOST.replace("{service}", "identifier").replace("{region}", region) + "/projectToken/login"
    var body_text = JSON.stringify({
        "client_id": credential.client_id,
        "client_secret": credential.client_secret,
    })
    var response = await _request_raw("POST", url, {"Content-Type": "application/json"}, {}, body_text)
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


## GS2 API を呼び出す
## body が null 以外の場合は JSON ボディとして送信する
func send(method: String, url: String, headers: Dictionary, query_strings: Dictionary, body) -> Gs2RestResponse:
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
        var response = await _request_raw(method, url, merged_headers, query_strings, body_text)
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


func _request_raw(
    method: String,
    url: String,
    headers: Dictionary,
    query_strings: Dictionary,
    body: Variant
) -> Gs2RestResponse:
    var scheme_end = url.find("://")
    var remainder = url.substr(scheme_end + 3)
    var slash_pos = remainder.find("/")
    var host = remainder if slash_pos == -1 else remainder.substr(0, slash_pos)
    var path = "/" if slash_pos == -1 else remainder.substr(slash_pos)
    var query = ""
    for key in query_strings:
        if query_strings[key] == null:
            continue
        query += "?" if query == "" else "&"
        query += str(key).uri_encode() + "=" + str(query_strings[key]).uri_encode()
    var deadline = Time.get_ticks_msec() + REQUEST_TIMEOUT_MS
    var client = HTTPClient.new()
    var err = client.connect_to_host(host, 443, TLSOptions.client())
    if err != OK:
        return Gs2RestResponse.network_error("core.network.connect.failed")
    while client.get_status() == HTTPClient.STATUS_CONNECTING or client.get_status() == HTTPClient.STATUS_RESOLVING:
        if Time.get_ticks_msec() > deadline:
            client.close()
            return Gs2RestResponse.network_error("core.network.timeout")
        client.poll()
        await Engine.get_main_loop().process_frame
    if client.get_status() != HTTPClient.STATUS_CONNECTED:
        return Gs2RestResponse.network_error("core.network.connect.failed")
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
