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
class_name Gs2MissionEzNamespaceDomain
extends RefCounted


var _domain: Gs2MissionNamespaceDomain
var _connection: Gs2Connection
var status: Variant:
    get:
        return _domain.status
var url: Variant:
    get:
        return _domain.url
var upload_token: Variant:
    get:
        return _domain.upload_token
var upload_url: Variant:
    get:
        return _domain.upload_url
var next_page_token: Variant:
    get:
        return _domain.next_page_token
var namespace_name: Variant:
    get:
        return null if _domain == null else _domain.namespace_name


func _init(
    domain: Gs2MissionNamespaceDomain,
    connection: Gs2Connection
):
    _domain = domain
    _connection = connection


func counter_models(
) -> Gs2MissionEzListCounterModelsIterator:
    return Gs2MissionEzListCounterModelsIterator.new(
        _domain,
        _connection
    )


func subscribe_counter_models(
    callback: Callable
) -> int:
    return _domain.subscribe_counter_models(
        func(items): callback.call([] if items == null else items.map(func(v): return Gs2MissionEzCounterModel.from_model(v)))
    )


func unsubscribe_counter_models(
    callback_id: int
) -> void:
    _domain.unsubscribe_counter_models(
        callback_id
    )


func mission_group_models(
) -> Gs2MissionEzListMissionGroupModelsIterator:
    return Gs2MissionEzListMissionGroupModelsIterator.new(
        _domain,
        _connection
    )


func subscribe_mission_group_models(
    callback: Callable
) -> int:
    return _domain.subscribe_mission_group_models(
        func(items): callback.call([] if items == null else items.map(func(v): return Gs2MissionEzMissionGroupModel.from_model(v)))
    )


func unsubscribe_mission_group_models(
    callback_id: int
) -> void:
    _domain.unsubscribe_mission_group_models(
        callback_id
    )


func mission_group_model(
    mission_group_name
) -> Gs2MissionEzMissionGroupModelDomain:
    return Gs2MissionEzMissionGroupModelDomain.new(
        _domain.mission_group_model(
            mission_group_name
        ),
        _connection
    )


func counter_model(
    counter_name
) -> Gs2MissionEzCounterModelDomain:
    return Gs2MissionEzCounterModelDomain.new(
        _domain.counter_model(
            counter_name
        ),
        _connection
    )


func user(
    user_id
) -> Gs2MissionEzUserDomain:
    return Gs2MissionEzUserDomain.new(
        _domain.user(
            user_id
        ),
        _connection
    )


func me(
    game_session
) -> Gs2MissionEzUserGameSessionDomain:
    return Gs2MissionEzUserGameSessionDomain.new(
        _domain.access_token(
            game_session.access_token
        ),
        game_session,
        _connection
    )