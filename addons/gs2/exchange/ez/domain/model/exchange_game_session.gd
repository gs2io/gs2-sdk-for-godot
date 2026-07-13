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
class_name Gs2ExchangeEzExchangeGameSessionDomain
extends RefCounted


var _domain: Gs2ExchangeExchangeAccessTokenDomain
var _game_session: Variant
var _connection: Gs2Connection
var namespace_name: Variant:
    get:
        return null if _domain == null else _domain.namespace_name
var user_id: Variant:
    get:
        return null if _domain == null else _domain.user_id


func _init(
    domain: Gs2ExchangeExchangeAccessTokenDomain,
    game_session: Variant,
    connection: Gs2Connection
):
    _domain = domain
    _game_session = game_session
    _connection = connection
# 戻り値: Gs2AsyncResult (result = Gs2EzTransactionDomain)
func exchange(
    rate_name,
    count,
    config = null,
    speculative_execute: bool = true
) -> Gs2AsyncResult:
    var async_result = await _connection.run(
        _game_session,
        func(): return await _domain.exchange(
            Gs2ExchangeExchangeRequest.new()
                .with_rate_name(rate_name)
                .with_count(count)
                .with_config(null if config == null else config.map(func(v): return null if v == null else v.to_model())),
            speculative_execute
        )
    )
    if async_result.error != null:
        return async_result
    return Gs2AsyncResult.new(null if async_result.result == null else Gs2EzTransactionDomain.new(async_result.result), null)
# 戻り値: Gs2AsyncResult (result = Gs2EzTransactionDomain)
func incremental_exchange(
    rate_name,
    count,
    config = null,
    speculative_execute: bool = true
) -> Gs2AsyncResult:
    var async_result = await _connection.run(
        _game_session,
        func(): return await _domain.incremental(
            Gs2ExchangeIncrementalExchangeRequest.new()
                .with_rate_name(rate_name)
                .with_count(count)
                .with_config(null if config == null else config.map(func(v): return null if v == null else v.to_model())),
            speculative_execute
        )
    )
    if async_result.error != null:
        return async_result
    return Gs2AsyncResult.new(null if async_result.result == null else Gs2EzTransactionDomain.new(async_result.result), null)