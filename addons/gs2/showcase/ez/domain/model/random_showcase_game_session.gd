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
class_name Gs2ShowcaseEzRandomShowcaseGameSessionDomain
extends RefCounted


var _domain: Gs2ShowcaseRandomShowcaseAccessTokenDomain
var _game_session: Variant
var _connection: Gs2Connection
var namespace_name: Variant:
    get:
        return null if _domain == null else _domain.namespace_name
var user_id: Variant:
    get:
        return null if _domain == null else _domain.user_id
var showcase_name: Variant:
    get:
        return null if _domain == null else _domain.showcase_name


func _init(
    domain: Gs2ShowcaseRandomShowcaseAccessTokenDomain,
    game_session: Variant,
    connection: Gs2Connection
):
    _domain = domain
    _game_session = game_session
    _connection = connection


func random_display_items(
) -> Gs2ShowcaseEzListRandomShowcaseDisplayItemsIterator:
    return Gs2ShowcaseEzListRandomShowcaseDisplayItemsIterator.new(
        _domain,
        _game_session,
        _connection
    )


func subscribe_random_display_items(
    callback: Callable
) -> int:
    return _domain.subscribe_random_display_items(
        func(items): callback.call([] if items == null else items.map(func(v): return Gs2ShowcaseEzRandomDisplayItem.from_model(v)))
    )


func unsubscribe_random_display_items(
    callback_id: int
) -> void:
    _domain.unsubscribe_random_display_items(
        callback_id
    )


func random_display_item(
    display_item_name
) -> Gs2ShowcaseEzRandomDisplayItemGameSessionDomain:
    return Gs2ShowcaseEzRandomDisplayItemGameSessionDomain.new(
        _domain.random_display_item(
            display_item_name
        ),
        _game_session,
        _connection
    )