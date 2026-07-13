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
class_name Gs2ExchangeEzUserGameSessionDomain
extends RefCounted


var _domain: Gs2ExchangeUserAccessTokenDomain
var _game_session: Variant
var _connection: Gs2Connection
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
    domain: Gs2ExchangeUserAccessTokenDomain,
    game_session: Variant,
    connection: Gs2Connection
):
    _domain = domain
    _game_session = game_session
    _connection = connection


func awaits(
    rate_name = null
) -> Gs2ExchangeEzListAwaitsIterator:
    return Gs2ExchangeEzListAwaitsIterator.new(
        _domain,
        _game_session,
        _connection,
        rate_name
    )


func subscribe_awaits(
    callback: Callable,
    rate_name = null
) -> int:
    return _domain.subscribe_awaits(
        func(items): callback.call([] if items == null else items.map(func(v): return Gs2ExchangeEzAwait.from_model(v))),
        rate_name
    )


func unsubscribe_awaits(
    callback_id: int,
    rate_name = null
) -> void:
    _domain.unsubscribe_awaits(
        callback_id,
        rate_name
    )


func exchange(
) -> Gs2ExchangeEzExchangeGameSessionDomain:
    return Gs2ExchangeEzExchangeGameSessionDomain.new(
        _domain.exchange(
        ),
        _game_session,
        _connection
    )


func await_(
    await_name
) -> Gs2ExchangeEzAwaitGameSessionDomain:
    return Gs2ExchangeEzAwaitGameSessionDomain.new(
        _domain.await_(
            await_name
        ),
        _game_session,
        _connection
    )