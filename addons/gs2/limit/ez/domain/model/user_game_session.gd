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
class_name Gs2LimitEzUserGameSessionDomain
extends RefCounted


var _domain: Gs2LimitUserAccessTokenDomain
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
    domain: Gs2LimitUserAccessTokenDomain,
    game_session: Variant,
    connection: Gs2Connection
):
    _domain = domain
    _game_session = game_session
    _connection = connection


func counters(
    limit_name = null
) -> Gs2LimitEzListCountersIterator:
    return Gs2LimitEzListCountersIterator.new(
        _domain,
        _game_session,
        _connection,
        limit_name
    )


func subscribe_counters(
    callback: Callable,
    limit_name = null
) -> int:
    return _domain.subscribe_counters(
        func(items): callback.call([] if items == null else items.map(func(v): return Gs2LimitEzCounter.from_model(v))),
        limit_name
    )


func unsubscribe_counters(
    callback_id: int,
    limit_name = null
) -> void:
    _domain.unsubscribe_counters(
        callback_id,
        limit_name
    )


func counter(
    limit_name,
    counter_name
) -> Gs2LimitEzCounterGameSessionDomain:
    return Gs2LimitEzCounterGameSessionDomain.new(
        _domain.counter(
            limit_name,
            counter_name
        ),
        _game_session,
        _connection
    )