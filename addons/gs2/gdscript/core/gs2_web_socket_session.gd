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

var credential: Gs2Credential
var region: String = Gs2Region.AP_NORTHEAST_1

var _socket: WebSocketPeer
var _request_id: int = 0
var _results: Dictionary = {}
var _pending: Array[String] = []
var _opening: bool = false
var _pumping: bool = false


func _init(credential_: Gs2Credential, region_: String = Gs2Region.AP_NORTHEAST_1):
    credential = credential_
    region = region_


func is_open() -> bool:
    return _socket != null and _socket.get_ready_state() == WebSocketPeer.STATE_OPEN


## 接続してプロジェクトトークンを取得する
func open() -> Gs2AsyncResult:
    while _opening:
        await Engine.get_main_loop().process_frame
    if is_open():
        return Gs2AsyncResult.new(null, null)
    _opening = true
    _socket = WebSocketPeer.new()
    var err = _socket.connect_to_url(ENDPOINT_HOST.replace("{region}", region))
    if err != OK:
        _socket = null
        _opening = false
        return Gs2AsyncResult.new(null, Gs2Exception.extract_error("core.network.connect.failed", 0))
    while _socket != null and _socket.get_ready_state() == WebSocketPeer.STATE_CONNECTING:
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


func close():
    if _socket != null:
        _socket.close()
        _socket = null


## GS2 API を WebSocket 経由で呼び出す
func send(service: String, component: String, function: String, body) -> Gs2RestResponse:
    if not is_open():
        var open_result = await open()
        if open_result.error != null:
            var error_response = Gs2RestResponse.new()
            error_response.status_code = open_result.error.status_code
            error_response.error = open_result.error
            return error_response
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
        if _socket == null:
            return Gs2RestResponse.network_error("core.network.disconnected")
        _socket.poll()
        while _socket != null and _socket.get_available_packet_count() > 0:
            _handle_message(_socket.get_packet().get_string_from_utf8())
        if _results.has(request_id):
            var response = _results[request_id]
            _results.erase(request_id)
            _pending.erase(request_id)
            return response
        if _socket == null or _socket.get_ready_state() != WebSocketPeer.STATE_OPEN:
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
    if _pumping:
        return
    _pumping = true
    _pump()


func _pump():
    while _socket != null and _socket.get_ready_state() != WebSocketPeer.STATE_CLOSED:
        _socket.poll()
        while _socket != null and _socket.get_available_packet_count() > 0:
            _handle_message(_socket.get_packet().get_string_from_utf8())
        await Engine.get_main_loop().process_frame
    _pumping = false
    disconnected.emit()
