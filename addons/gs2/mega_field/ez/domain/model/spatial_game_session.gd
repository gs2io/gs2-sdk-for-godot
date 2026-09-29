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
class_name Gs2MegaFieldEzSpatialGameSessionDomain
extends RefCounted


var _domain: Gs2MegaFieldSpatialAccessTokenDomain
var _game_session: Variant
var _connection: Gs2Connection
var namespace_name: Variant:
    get:
        return null if _domain == null else _domain.namespace_name
var user_id: Variant:
    get:
        return null if _domain == null else _domain.user_id
var area_model_name: Variant:
    get:
        return null if _domain == null else _domain.area_model_name
var layer_model_name: Variant:
    get:
        return null if _domain == null else _domain.layer_model_name


func _init(
    domain: Gs2MegaFieldSpatialAccessTokenDomain,
    game_session: Variant,
    connection: Gs2Connection
):
    _domain = domain
    _game_session = game_session
    _connection = connection
func update(
    position,
    scopes = null
) -> Gs2AsyncResult:
    var async_result = await _connection.run(
        _game_session,
        func(): return await _domain.action(
            Gs2MegaFieldActionRequest.new()
                .with_position(null if position == null else position.to_model())
                .with_scopes(null if scopes == null else scopes.map(func(v): return null if v == null else v.to_model()))
        )
    )
    if async_result.error != null:
        return async_result
    var domains = []
    if async_result.result != null:
        for v in async_result.result:
            domains.append(Gs2MegaFieldEzSpatialGameSessionDomain.new(
                v,
                _game_session,
                _connection
            ))
    return Gs2AsyncResult.new(domains, null)


func model() -> Gs2AsyncResult:
    var async_result = await _connection.run(
        _game_session,
        func(): return await _domain.model()
    )
    if async_result.error != null:
        return async_result
    if async_result.result == null:
        return Gs2AsyncResult.new(null, null)
    return Gs2AsyncResult.new(Gs2MegaFieldEzSpatial.from_model(async_result.result), null)


func invalidate() -> void:
    _domain.invalidate()


func subscribe_model(callback: Callable) -> int:
    return _domain.subscribe_model(
        func(item): callback.call(null if item == null else Gs2MegaFieldEzSpatial.from_model(item))
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