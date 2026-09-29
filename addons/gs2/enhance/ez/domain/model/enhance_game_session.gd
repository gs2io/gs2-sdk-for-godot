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
class_name Gs2EnhanceEzEnhanceGameSessionDomain
extends RefCounted


var _domain: Gs2EnhanceEnhanceAccessTokenDomain
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
    domain: Gs2EnhanceEnhanceAccessTokenDomain,
    game_session: Variant,
    connection: Gs2Connection
):
    _domain = domain
    _game_session = game_session
    _connection = connection
func enhance(
    rate_name,
    target_item_set_id,
    materials,
    config = null,
    speculative_execute: bool = true
) -> Gs2AsyncResult:
    var async_result = await _connection.run(
        _game_session,
        func(): return await _domain.direct(
            Gs2EnhanceDirectEnhanceRequest.new()
                .with_rate_name(rate_name)
                .with_target_item_set_id(target_item_set_id)
                .with_materials(null if materials == null else materials.map(func(v): return null if v == null else v.to_model()))
                .with_config(null if config == null else config.map(func(v): return null if v == null else v.to_model())),
            speculative_execute
        )
    )
    if async_result.error != null:
        return async_result
    return Gs2AsyncResult.new(null if async_result.result == null else Gs2EzTransactionDomain.new(async_result.result), null)