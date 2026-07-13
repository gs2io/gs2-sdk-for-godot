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
class_name Gs2MissionEzUserGameSessionDomain
extends RefCounted


var _domain: Gs2MissionUserAccessTokenDomain
var _game_session: Variant
var _connection: Gs2Connection
var changed_completes: Variant:
    get:
        return null if _domain.changed_completes == null else _domain.changed_completes.map(func(v): return Gs2MissionEzComplete.from_model(v))
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
    domain: Gs2MissionUserAccessTokenDomain,
    game_session: Variant,
    connection: Gs2Connection
):
    _domain = domain
    _game_session = game_session
    _connection = connection


func completes(
) -> Gs2MissionEzListCompletesIterator:
    return Gs2MissionEzListCompletesIterator.new(
        _domain,
        _game_session,
        _connection
    )


func subscribe_completes(
    callback: Callable
) -> int:
    return _domain.subscribe_completes(
        func(items): callback.call([] if items == null else items.map(func(v): return Gs2MissionEzComplete.from_model(v)))
    )


func unsubscribe_completes(
    callback_id: int
) -> void:
    _domain.unsubscribe_completes(
        callback_id
    )


func counters(
) -> Gs2MissionEzListCountersIterator:
    return Gs2MissionEzListCountersIterator.new(
        _domain,
        _game_session,
        _connection
    )


func subscribe_counters(
    callback: Callable
) -> int:
    return _domain.subscribe_counters(
        func(items): callback.call([] if items == null else items.map(func(v): return Gs2MissionEzCounter.from_model(v)))
    )


func unsubscribe_counters(
    callback_id: int
) -> void:
    _domain.unsubscribe_counters(
        callback_id
    )


func complete(
    mission_group_name
) -> Gs2MissionEzCompleteGameSessionDomain:
    return Gs2MissionEzCompleteGameSessionDomain.new(
        _domain.complete(
            mission_group_name
        ),
        _game_session,
        _connection
    )


func counter(
    counter_name
) -> Gs2MissionEzCounterGameSessionDomain:
    return Gs2MissionEzCounterGameSessionDomain.new(
        _domain.counter(
            counter_name
        ),
        _game_session,
        _connection
    )