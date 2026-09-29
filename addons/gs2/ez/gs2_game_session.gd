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
class_name Gs2GameSession
extends Gs2GameSessionBase

var _authenticator: Gs2AccountAuthenticator
var _connection: Gs2Connection
var _user_id: String
var _password: String
var _refresh_in_progress := false
var _last_refresh_result: Gs2AsyncResult


func _init(
    authenticator: Gs2AccountAuthenticator,
    connection: Gs2Connection,
    user_id: String,
    password: String
):
    _authenticator = authenticator
    _connection = connection
    _user_id = user_id
    _password = password


func get_user_id() -> String:
    if access_token == null:
        return ""
    return access_token.user_id


func get_login_user_id() -> String:
    return _user_id


func login() -> Gs2AsyncResult:
    return await refresh()


func refresh() -> Gs2AsyncResult:
    if _refresh_in_progress:
        await refresh_completed
        return _last_refresh_result
    _refresh_in_progress = true
    _last_refresh_result = await _refresh_impl()
    _refresh_in_progress = false
    refresh_completed.emit()
    return _last_refresh_result


func _refresh_impl() -> Gs2AsyncResult:
    if _authenticator == null:
        return Gs2AsyncResult.new(null, null)
    var authentication_result = await _authenticator.authentication(_connection, _user_id, _password)
    if authentication_result.error != null:
        return Gs2AsyncResult.new(null, authentication_result.error)
    if access_token == null:
        access_token = authentication_result.result
    else:
        access_token.token = authentication_result.result.token
        access_token.user_id = authentication_result.result.user_id
        access_token.expire = authentication_result.result.expire
        access_token.time_offset = authentication_result.result.time_offset
    return Gs2AsyncResult.new(null, null)


func refresh_if_need_refresh() -> Gs2AsyncResult:
    if _authenticator == null or not _authenticator.need_re_authentication:
        return Gs2AsyncResult.new(false, null)
    var refresh_result = await refresh()
    if refresh_result.error != null:
        return Gs2AsyncResult.new(false, refresh_result.error)
    return Gs2AsyncResult.new(true, null)
