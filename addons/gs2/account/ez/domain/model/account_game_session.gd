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
class_name Gs2AccountEzAccountGameSessionDomain
extends RefCounted


var _domain: Gs2AccountAccountAccessTokenDomain
var _game_session: Variant
var _connection: Gs2Connection
var ban_statuses: Variant:
    get:
        return null if _domain.ban_statuses == null else _domain.ban_statuses.map(func(v): return Gs2AccountEzBanStatus.from_model(v))
var body: Variant:
    get:
        return _domain.body
var signature: Variant:
    get:
        return _domain.signature
var authorization_url: Variant:
    get:
        return _domain.authorization_url
var next_page_token: Variant:
    get:
        return _domain.next_page_token
var namespace_name: Variant:
    get:
        return null if _domain == null else _domain.namespace_name
var user_id: Variant:
    get:
        return null if _domain == null else _domain.user_id


func _init(
    domain: Gs2AccountAccountAccessTokenDomain,
    game_session: Variant,
    connection: Gs2Connection
):
    _domain = domain
    _game_session = game_session
    _connection = connection
func request_deletion(
) -> Gs2AsyncResult:
    var async_result = await _connection.run(
        _game_session,
        func(): return await _domain.request_deletion(
            Gs2AccountRequestDeletionRequest.new()
        )
    )
    if async_result.error != null:
        return async_result
    return Gs2AsyncResult.new(Gs2AccountEzAccountGameSessionDomain.new(
        async_result.result,
        _game_session,
        _connection
    ), null)
func delete_take_over_setting(
    type
) -> Gs2AsyncResult:
    var async_result = await _connection.run(
        _game_session,
        func(): return await _domain.delete_take_over(
            Gs2AccountDeleteTakeOverRequest.new()
                .with_type(type)
        )
    )
    if async_result.error != null:
        return async_result
    return Gs2AsyncResult.new(Gs2AccountEzTakeOverGameSessionDomain.new(
        async_result.result,
        _game_session,
        _connection
    ), null)


func take_overs(
) -> Gs2AccountEzListTakeOverSettingsIterator:
    return Gs2AccountEzListTakeOverSettingsIterator.new(
        _domain,
        _game_session,
        _connection
    )


func subscribe_take_overs(
    callback: Callable
) -> int:
    return _domain.subscribe_take_overs(
        func(items): callback.call([] if items == null else items.map(func(v): return Gs2AccountEzTakeOver.from_model(v)))
    )


func unsubscribe_take_overs(
    callback_id: int
) -> void:
    _domain.unsubscribe_take_overs(
        callback_id
    )


func platform_ids(
) -> Gs2AccountEzListPlatformIdSettingsIterator:
    return Gs2AccountEzListPlatformIdSettingsIterator.new(
        _domain,
        _game_session,
        _connection
    )


func subscribe_platform_ids(
    callback: Callable
) -> int:
    return _domain.subscribe_platform_ids(
        func(items): callback.call([] if items == null else items.map(func(v): return Gs2AccountEzPlatformId.from_model(v)))
    )


func unsubscribe_platform_ids(
    callback_id: int
) -> void:
    _domain.unsubscribe_platform_ids(
        callback_id
    )


func take_over(
    type
) -> Gs2AccountEzTakeOverGameSessionDomain:
    return Gs2AccountEzTakeOverGameSessionDomain.new(
        _domain.take_over(
            type
        ),
        _game_session,
        _connection
    )


func platform_id(
    type
) -> Gs2AccountEzPlatformIdGameSessionDomain:
    return Gs2AccountEzPlatformIdGameSessionDomain.new(
        _domain.platform_id(
            type
        ),
        _game_session,
        _connection
    )


func model() -> Gs2AsyncResult:
    var async_result = await _connection.run(
        _game_session,
        func(): return await _domain.model()
    )
    if async_result.error != null:
        return async_result
    if async_result.result == null:
        return Gs2AsyncResult.new(null, null)
    return Gs2AsyncResult.new(Gs2AccountEzAccount.from_model(async_result.result), null)


func invalidate() -> void:
    _domain.invalidate()


func subscribe_model(callback: Callable) -> int:
    return _domain.subscribe_model(
        func(item): callback.call(null if item == null else Gs2AccountEzAccount.from_model(item))
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