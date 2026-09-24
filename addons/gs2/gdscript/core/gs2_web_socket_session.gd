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
class_name Gs2WebSocketSession
extends RefCounted


## サーバープッシュ通知を受信した (message: Gs2NotificationMessage)
signal notification_received(message: Gs2NotificationMessage)

## 接続が切断された
signal disconnected

static var ENDPOINT_HOST: String = "wss://gateway-ws.{region}.gen2.gs2io.com"

## サーバーやプロキシによるアイドルタイムアウトで接続が切断されないよう、
## WebSocketPeer 組み込みの ping/pong ハートビートを送信する間隔(秒)
const HEARTBEAT_INTERVAL_SEC: float = 30.0

var credential: Gs2Credential
var region: String = Gs2Region.AP_NORTHEAST_1

## Steady（専用フリート）の基点（https://<host>）。空なら共有クラウド（従来どおり ENDPOINT_HOST）。
## 接続先は wss://<host>/（基点が http:// なら ws://）になり、handshake に上限が付く。
## 末尾の / と空白は落とされる
var steady_endpoint: String = "":
    set(value):
        steady_endpoint = Gs2Steady.normalize_steady_endpoint(value)

var _socket: WebSocketPeer
var _request_id: int = 0
var _results: Dictionary = {}
var _pending: Array[String] = []
var _opening: bool = false
## 受信を回している接続（null なら回っていない）。★接続ごとに 1 本だけ回す
var _pumping_socket: WebSocketPeer = null


func _init(credential_: Gs2Credential, region_: String = Gs2Region.AP_NORTHEAST_1):
    credential = credential_
    region = region_


func is_open() -> bool:
    return _socket != null and _socket.get_ready_state() == WebSocketPeer.STATE_OPEN


## 接続が生きていることを示す (実際の ping/pong ハートビートは
## WebSocketPeer.heartbeat_interval によって自動送信される)
func ping() -> bool:
    return is_open()


## WebSocket の接続先。優先順は steady_endpoint ＞ ENDPOINT_HOST。
## steady_endpoint が空なら従来の ENDPOINT_HOST の置換と byte 単位で同じ文字列になる
func web_socket_url() -> String:
    var url = Gs2Steady.steady_web_socket_url(steady_endpoint)
    if url != "":
        return url
    return ENDPOINT_HOST.replace("{region}", region)


## 接続してプロジェクトトークンを取得する
func open() -> Gs2AsyncResult:
    while _opening:
        await Engine.get_main_loop().process_frame
    if is_open():
        return Gs2AsyncResult.new(null, null)
    _opening = true
    _socket = WebSocketPeer.new()
    _socket.set_heartbeat_interval(HEARTBEAT_INTERVAL_SEC)
    var err = _socket.connect_to_url(web_socket_url())
    if err != OK:
        _socket = null
        _opening = false
        return Gs2AsyncResult.new(null, Gs2Exception.extract_error("core.network.connect.failed", 0))
    # ★Steady のときだけ handshake（DNS / TCP の接続 / TLS / WebSocket の upgrade）に上限を置く。
    # フリートが手放した公開 IP は SYN を落とすので、OS 既定に任せない。共有クラウドは不変。
    # 繋ぎ直しは入れない（失敗は呼び出し元へ返す）
    var handshake_deadline = -1
    if steady_endpoint != "":
        handshake_deadline = Time.get_ticks_msec() + Gs2Steady.CONNECT_TIMEOUT_MS
    while _socket != null and _socket.get_ready_state() == WebSocketPeer.STATE_CONNECTING:
        if handshake_deadline >= 0 and Time.get_ticks_msec() > handshake_deadline:
            _socket.close()
            _socket = null
            _opening = false
            return Gs2AsyncResult.new(null, Gs2Exception.extract_error("core.network.timeout", 0))
        _socket.poll()
        await Engine.get_main_loop().process_frame
    if not is_open():
        _socket = null
        _opening = false
        return Gs2AsyncResult.new(null, Gs2Exception.extract_error("core.network.connect.failed", 0))
    _opening = false
    _start_pump()
    if credential.client_secret != null:
        var response = await send("identifier", "projectToken", "login", {
            "client_id": credential.client_id,
            "client_secret": credential.client_secret,
        })
        if response.error != null:
            return Gs2AsyncResult.new(null, response.error)
        if response.body != null:
            credential.project_token = response.body.get("access_token")
    return Gs2AsyncResult.new(null, null)


## 接続を閉じる。応答待ちの要求には「接続が切れた」が返る
func close():
    _drop_connection(_socket)


## ★接続を捨て、応答待ちの要求すべてに「接続が切れた」を返す。
##
## 待ち行列（_pending）を片付けないことが致命的だった: 切れた接続の要求 id が残ると、
## 繋ぎ直したときに requestId を持たない応答（ログイン応答等）が _pending の先頭＝死んだ
## 要求へ割り当てられ、本当の待ち手が永久に await から返らない（サーバーが応答の前に接続を
## 閉じる形。gateway の setUserId が自分自身の接続を切る・ノードの死亡・ネットワーク断）。
##
## 既に別の接続へ差し替わっていたら何もしない（古い接続の後始末が新しい接続を殺さないように）
func _drop_connection(socket: WebSocketPeer):
    if socket == null or socket != _socket:
        return
    _socket = null
    socket.close()
    var broken = _pending.duplicate()
    _pending.clear()
    for request_id in broken:
        # 既に応答が届いているものはそれを残す（送信者が取り出して消す）
        if not _results.has(request_id):
            _results[request_id] = Gs2RestResponse.network_error("core.network.disconnected")


## GS2 API を WebSocket 経由で呼び出す
func send(service: String, component: String, function: String, body) -> Gs2RestResponse:
    if not is_open():
        var open_result = await open()
        if open_result.error != null:
            var error_response = Gs2RestResponse.new()
            error_response.status_code = open_result.error.status_code
            error_response.error = open_result.error
            return error_response
    if not is_open():
        return Gs2RestResponse.network_error("core.network.disconnected")
    _request_id += 1
    var request_id = "%032d" % _request_id
    var message = {} if body == null else body.duplicate()
    message["xGs2ClientId"] = credential.client_id
    if credential.project_token != null:
        message["xGs2ProjectToken"] = credential.project_token
    message["x_gs2"] = {
        "service": service,
        "component": component,
        "function": function,
        "contentType": "application/json",
        "requestId": request_id,
    }
    _pending.append(request_id)
    _socket.send_text(JSON.stringify(Gs2RestSession._strip_nulls(message)))
    while true:
        if _socket != null:
            _socket.poll()
            while _socket != null and _socket.get_available_packet_count() > 0:
                _handle_message(_socket.get_packet().get_string_from_utf8())
            # ★STATE_CLOSING / STATE_CLOSED になったらもう応答は来ない。
            # 接続を捨て、待ち中の要求すべてを「接続が切れた」で終わらせる（待ち続けない）
            if _socket != null and _socket.get_ready_state() != WebSocketPeer.STATE_OPEN:
                _drop_connection(_socket)
        if _results.has(request_id):
            var response = _results[request_id]
            _results.erase(request_id)
            _pending.erase(request_id)
            return response
        if _socket == null:
            # ★どの経路で抜けても待ち行列から自分を外す（残すと次の接続の応答を取り違える）
            _pending.erase(request_id)
            return Gs2RestResponse.network_error("core.network.disconnected")
        await Engine.get_main_loop().process_frame
    return null


func _handle_message(packet: String):
    var parsed = JSON.parse_string(packet)
    if parsed == null or not (parsed is Dictionary):
        return
    var request_id = parsed.get("requestId")
    if request_id == null:
        # ログイン応答等、requestId を持たない response は最も古い送信待ちに割り当てる
        if parsed.get("type") == "response" and _pending.size() > 0:
            request_id = _pending[0]
        else:
            notification_received.emit(Gs2NotificationMessage.from_dict(parsed.get("body")))
            return
    if not _pending.has(request_id):
        # ★待っていない要求の応答（切断の後に届いた等）は捨てる。_results を溜めない
        return
    var response = Gs2RestResponse.new()
    var status = 0 if parsed.get("status") == null else int(parsed.get("status"))
    response.status_code = status
    if status == 200:
        response.body = parsed.get("body")
    else:
        var message = packet
        var metadata = null
        if parsed.get("body") is Dictionary:
            if parsed.get("body").get("message") != null:
                message = parsed.get("body").get("message")
            metadata = parsed.get("body").get("metadata")
        response.error = Gs2Exception.extract_error(message, status)
        if response.error != null:
            response.error.metadata = metadata
    _results[request_id] = response


func _start_pump():
    if _socket == null or _pumping_socket == _socket:
        return
    _pumping_socket = _socket
    _pump(_socket)


## 接続が開いている間、受信を回し続ける（応答を待っている要求が無くても通知を受け取るため）。
## ★接続ごとに 1 本。自分の接続が差し替わったら（繋ぎ直し）新しい pump に任せて抜ける。
## 切れたら _drop_connection で待ち中の要求すべてを終わらせてから抜ける（polling を残さない）
func _pump(socket: WebSocketPeer):
    while socket == _socket:
        socket.poll()
        while socket == _socket and socket.get_available_packet_count() > 0:
            _handle_message(socket.get_packet().get_string_from_utf8())
        if socket != _socket:
            break
        if socket.get_ready_state() != WebSocketPeer.STATE_OPEN:
            _drop_connection(socket)
            break
        await Engine.get_main_loop().process_frame
    if _pumping_socket == socket:
        _pumping_socket = null
    disconnected.emit()
