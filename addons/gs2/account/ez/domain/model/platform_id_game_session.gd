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
class_name Gs2AccountEzPlatformIdGameSessionDomain
extends RefCounted


var _domain: Gs2AccountPlatformIdAccessTokenDomain
var _game_session: Variant
var _connection: Gs2Connection
var namespace_name: Variant:
    get:
        return null if _domain == null else _domain.namespace_name
var user_id: Variant:
    get:
        return null if _domain == null else _domain.user_id
var type: Variant:
    get:
        return null if _domain == null else _domain.type
var user_identifier: Variant:
    get:
        return null if _domain == null else _domain.user_identifier


func _init(
    domain: Gs2AccountPlatformIdAccessTokenDomain,
    game_session: Variant,
    connection: Gs2Connection
):
    _domain = domain
    _game_session = game_session
    _connection = connection
# 戻り値: Gs2AsyncResult (result = Gs2AccountEzPlatformIdGameSessionDomain)
func add_platform_id_setting(
    user_identifier  # diff +++
) -> Gs2AsyncResult:
    var async_result = await _connection.run(
        _game_session,
        func(): return await _domain.create(
            Gs2AccountCreatePlatformIdRequest.new()
                .with_user_identifier(user_identifier)  # diff +++
        )
    )
    if async_result.error != null:
        return async_result
    return Gs2AsyncResult.new(Gs2AccountEzPlatformIdGameSessionDomain.new(
        async_result.result,
        _game_session,
        _connection
    ), null)
# 戻り値: Gs2AsyncResult (result = Gs2AccountEzPlatformUser)
func find_platform_user(
    user_identifier  # diff +++
) -> Gs2AsyncResult:
    var async_result = await _connection.run(
        _game_session,
        func(): return await _domain.find(
            Gs2AccountFindPlatformIdRequest.new()
                .with_user_identifier(user_identifier)  # diff +++
        )
    )
    if async_result.error != null:
        return async_result
    # diff --- start
    # return async_result
    # diff --- end
    # diff +++ start
    return Gs2AsyncResult.new(
        null if async_result.result == null else Gs2AccountEzPlatformUser.from_model(async_result.result),
        null
    )
    # diff +++ end
# 戻り値: Gs2AsyncResult (result = Gs2AccountEzPlatformIdGameSessionDomain)
func delete_platform_id_setting(
) -> Gs2AsyncResult:
    var async_result = await _connection.run(
        _game_session,
        func(): return await _domain.delete(
            Gs2AccountDeletePlatformIdRequest.new()
        )
    )
    if async_result.error != null:
        return async_result
    return Gs2AsyncResult.new(Gs2AccountEzPlatformIdGameSessionDomain.new(
        async_result.result,
        _game_session,
        _connection
    ), null)


# 戻り値: Gs2AsyncResult (result = Gs2AccountEzPlatformId)
func model() -> Gs2AsyncResult:
    var async_result = await _connection.run(
        _game_session,
        func(): return await _domain.model()
    )
    if async_result.error != null:
        return async_result
    if async_result.result == null:
        return Gs2AsyncResult.new(null, null)
    return Gs2AsyncResult.new(Gs2AccountEzPlatformId.from_model(async_result.result), null)


func invalidate() -> void:
    _domain.invalidate()


func subscribe_model(callback: Callable) -> int:
    return _domain.subscribe_model(
        func(item): callback.call(null if item == null else Gs2AccountEzPlatformId.from_model(item))
    )


func unsubscribe_model(callback_id: int) -> void:
    _domain.unsubscribe_model(callback_id)


func subscribe_model_with_initial_call(callback: Callable) -> Gs2AsyncResult:
    var model_result = await model()
    if model_result.error != null:
        return model_result
    var callback_id = subscribe_model(callback)
    callback.call(model_result.result)
    return Gs2AsyncResult.new(callback_id, null)
