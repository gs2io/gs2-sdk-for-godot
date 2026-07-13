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
class_name Gs2Ranking2EzUserGameSessionDomain
extends RefCounted


var _domain: Gs2Ranking2UserAccessTokenDomain
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
    domain: Gs2Ranking2UserAccessTokenDomain,
    game_session: Variant,
    connection: Gs2Connection
):
    _domain = domain
    _game_session = game_session
    _connection = connection


func subscribes(
    ranking_name
) -> Gs2Ranking2EzListSubscribesIterator:
    return Gs2Ranking2EzListSubscribesIterator.new(
        _domain,
        _game_session,
        _connection,
        ranking_name
    )


func subscribe_subscribes(
    callback: Callable,
    ranking_name
) -> int:
    return _domain.subscribe_subscribes(
        func(items): callback.call([] if items == null else items.map(func(v): return Gs2Ranking2EzSubscribeUser.from_model(v))),
        ranking_name
    )


func unsubscribe_subscribes(
    callback_id: int,
    ranking_name
) -> void:
    _domain.unsubscribe_subscribes(
        callback_id,
        ranking_name
    )


func subscribe(
    ranking_name
) -> Gs2Ranking2EzSubscribeGameSessionDomain:
    return Gs2Ranking2EzSubscribeGameSessionDomain.new(
        _domain.subscribe(
            ranking_name
        ),
        _game_session,
        _connection
    )