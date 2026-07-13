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
class_name Gs2NewsEzUserGameSessionDomain
extends RefCounted


var _domain: Gs2NewsUserAccessTokenDomain
var _game_session: Variant
var _connection: Gs2Connection
var content_hash: Variant:
    get:
        return _domain.content_hash
var template_hash: Variant:
    get:
        return _domain.template_hash
var namespace_name: Variant:
    get:
        return null if _domain == null else _domain.namespace_name
var user_id: Variant:
    get:
        return null if _domain == null else _domain.user_id


func _init(
    domain: Gs2NewsUserAccessTokenDomain,
    game_session: Variant,
    connection: Gs2Connection
):
    _domain = domain
    _game_session = game_session
    _connection = connection


func newses(
) -> Gs2NewsEzListNewsesIterator:
    return Gs2NewsEzListNewsesIterator.new(
        _domain,
        _game_session,
        _connection
    )


func subscribe_newses(
    callback: Callable
) -> int:
    return _domain.subscribe_newses(
        func(items): callback.call([] if items == null else items.map(func(v): return Gs2NewsEzNews.from_model(v)))
    )


func unsubscribe_newses(
    callback_id: int
) -> void:
    _domain.unsubscribe_newses(
        callback_id
    )


func news(
) -> Gs2NewsEzNewsGameSessionDomain:
    return Gs2NewsEzNewsGameSessionDomain.new(
        _domain.news(
        ),
        _game_session,
        _connection
    )