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
class_name Gs2BuffEzNamespaceDomain
extends RefCounted


var _domain: Gs2BuffNamespaceDomain
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
    domain: Gs2BuffNamespaceDomain,
    connection: Gs2Connection
):
    _domain = domain
    _connection = connection


func buff_entry_models(
) -> Gs2BuffEzListBuffEntryModelsIterator:
    return Gs2BuffEzListBuffEntryModelsIterator.new(
        _domain,
        _connection
    )


func subscribe_buff_entry_models(
    callback: Callable
) -> int:
    return _domain.subscribe_buff_entry_models(
        func(items): callback.call([] if items == null else items.map(func(v): return Gs2BuffEzBuffEntryModel.from_model(v)))
    )


func unsubscribe_buff_entry_models(
    callback_id: int
) -> void:
    _domain.unsubscribe_buff_entry_models(
        callback_id
    )


func buff_entry_model(
    buff_entry_name
) -> Gs2BuffEzBuffEntryModelDomain:
    return Gs2BuffEzBuffEntryModelDomain.new(
        _domain.buff_entry_model(
            buff_entry_name
        ),
        _connection
    )


func user(
    user_id
) -> Gs2BuffEzUserDomain:
    return Gs2BuffEzUserDomain.new(
        _domain.user(
            user_id
        ),
        _connection
    )


func me(
    game_session
) -> Gs2BuffEzUserGameSessionDomain:
    return Gs2BuffEzUserGameSessionDomain.new(
        _domain.access_token(
            game_session.access_token
        ),
        game_session,
        _connection
    )