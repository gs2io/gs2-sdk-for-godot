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
# deny overwrite
# diff +++ start
class_name Gs2NewsEzSetCookieRequestEntryGameSessionDomain
extends RefCounted


var _domain: Gs2NewsSetCookieRequestEntryAccessTokenDomain
var _game_session: Variant
var _connection: Gs2Connection
var key: Variant:
    get:
        return null if _domain == null else _domain.key
var value: Variant:
    get:
        return null if _domain == null else _domain.value
var namespace_name: Variant:
    get:
        return null if _domain == null else _domain.namespace_name
var user_id: Variant:
    get:
        return null if _domain == null else _domain.user_id


func _init(domain, game_session, connection):
    _domain = domain
    _game_session = game_session
    _connection = connection


func model() -> Gs2AsyncResult:
    var async_result = await _connection.run(
        _game_session,
        func(): return await _domain.model()
    )
    if async_result.error != null:
        return async_result
    if async_result.result == null:
        return Gs2AsyncResult.new(null, null)
    return Gs2AsyncResult.new(
        Gs2NewsEzSetCookieRequestEntry.from_model(async_result.result),
        null
    )
# diff +++ end
