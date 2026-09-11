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
class_name Gs2Connection
extends RefCounted


## サーバープッシュ通知を受信した (message: Gs2NotificationMessage)
signal notification_received(message: Gs2NotificationMessage)

var rest_session: Gs2RestSession
var web_socket_session: Gs2WebSocketSession


## steady_endpoint: Steady（専用フリート）の基点（https://<host>）。空なら共有クラウド
func _init(
    credential: Gs2Credential,
    region: String = Gs2Region.AP_NORTHEAST_1,
    steady_endpoint: String = ""
):
    rest_session = Gs2RestSession.new(credential, region)
    web_socket_session = Gs2WebSocketSession.new(credential, region)
    rest_session.steady_endpoint = steady_endpoint
    web_socket_session.steady_endpoint = steady_endpoint
    web_socket_session.notification_received.connect(func(message): notification_received.emit(message))


func connect_session() -> Gs2AsyncResult:
    var rest_result = await rest_session.open()
    if rest_result.error != null:
        return rest_result
    var web_socket_result = await web_socket_session.open()
    if web_socket_result.error != null:
        return web_socket_result
    return Gs2AsyncResult.new(Gs2OpenResult.new(), null)


## REST / WebSocket の両セッションを明示的に閉じる。
## 次回の API 呼び出しは run() によって自動再接続される。
func disconnect_session() -> void:
    web_socket_session.close()
    rest_session.close()


func is_disconnected() -> bool:
    return rest_session.credential.project_token == null


## バージョンチェック等で再発行されたプロジェクトトークンを以後の通信に適用する。
func update_project_token(project_token) -> void:
    rest_session.credential.project_token = project_token


## API 呼び出しを実行する
## セッション切断時は再接続、認証切れ時はゲームセッションの再認証を行ってリトライする
func run(game_session: Gs2GameSessionBase, request_action: Callable) -> Gs2AsyncResult:
    var is_reopen_tried = false
    var is_authentication_tried = false
    while true:
        if game_session != null and not is_authentication_tried:
            var refresh_result = await game_session.refresh_if_need_refresh()
            if refresh_result.error != null:
                return Gs2AsyncResult.new(null, refresh_result.error)
            if refresh_result.result == true:
                is_authentication_tried = true
                continue
        var async_result = await request_action.call()
        if async_result.error != null and async_result.error.is_session_not_open() and not is_reopen_tried:
            is_authentication_tried = false
            is_reopen_tried = true
            var connect_result = await connect_session()
            if connect_result.error != null:
                return Gs2AsyncResult.new(null, connect_result.error)
            continue
        if game_session != null and async_result.error != null and async_result.error.is_unauthorized() and not is_authentication_tried:
            is_authentication_tried = true
            var refresh_result = await game_session.refresh()
            if refresh_result.error != null:
                return Gs2AsyncResult.new(null, refresh_result.error)
            continue
        return async_result
    return null
