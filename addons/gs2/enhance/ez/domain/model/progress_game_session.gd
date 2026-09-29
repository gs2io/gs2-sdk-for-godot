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
class_name Gs2EnhanceEzProgressGameSessionDomain
extends RefCounted


var _domain: Gs2EnhanceProgressAccessTokenDomain
var _game_session: Variant
var _connection: Gs2Connection
var acquire_experience: Variant:
    get:
        return _domain.acquire_experience
var bonus_rate: Variant:
    get:
        return _domain.bonus_rate
var namespace_name: Variant:
    get:
        return null if _domain == null else _domain.namespace_name
var user_id: Variant:
    get:
        return null if _domain == null else _domain.user_id


func _init(
    domain: Gs2EnhanceProgressAccessTokenDomain,
    game_session: Variant,
    connection: Gs2Connection
):
    _domain = domain
    _game_session = game_session
    _connection = connection
func start(
    rate_name,
    target_item_set_id,
    materials = null,
    force = null,
    config = null,
    speculative_execute: bool = true
) -> Gs2AsyncResult:
    var async_result = await _connection.run(
        _game_session,
        func(): return await _domain.start(
            Gs2EnhanceStartRequest.new()
                .with_rate_name(rate_name)
                .with_target_item_set_id(target_item_set_id)
                .with_materials(null if materials == null else materials.map(func(v): return null if v == null else v.to_model()))
                .with_force(force)
                .with_config(null if config == null else config.map(func(v): return null if v == null else v.to_model())),
            speculative_execute
        )
    )
    if async_result.error != null:
        return async_result
    return Gs2AsyncResult.new(null if async_result.result == null else Gs2EzTransactionDomain.new(async_result.result), null)
func end(
    config = null,
    speculative_execute: bool = true
) -> Gs2AsyncResult:
    var async_result = await _connection.run(
        _game_session,
        func(): return await _domain.end(
            Gs2EnhanceEndRequest.new()
                .with_config(null if config == null else config.map(func(v): return null if v == null else v.to_model())),
            speculative_execute
        )
    )
    if async_result.error != null:
        return async_result
    return Gs2AsyncResult.new(null if async_result.result == null else Gs2EzTransactionDomain.new(async_result.result), null)
func delete_progress(
) -> Gs2AsyncResult:
    var async_result = await _connection.run(
        _game_session,
        func(): return await _domain.delete(
            Gs2EnhanceDeleteProgressRequest.new()
        )
    )
    if async_result.error != null:
        return async_result
    return Gs2AsyncResult.new(Gs2EnhanceEzProgressGameSessionDomain.new(
        async_result.result,
        _game_session,
        _connection
    ), null)


func model() -> Gs2AsyncResult:
    var async_result = await _connection.run(
        _game_session,
        func(): return await _domain.model()
    )
    if async_result.error != null:
        return async_result
    if async_result.result == null:
        return Gs2AsyncResult.new(null, null)
    return Gs2AsyncResult.new(Gs2EnhanceEzProgress.from_model(async_result.result), null)


func invalidate() -> void:
    _domain.invalidate()


func subscribe_model(callback: Callable) -> int:
    return _domain.subscribe_model(
        func(item): callback.call(null if item == null else Gs2EnhanceEzProgress.from_model(item))
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