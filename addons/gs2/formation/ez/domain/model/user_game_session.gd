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
class_name Gs2FormationEzUserGameSessionDomain
extends RefCounted


var _domain: Gs2FormationUserAccessTokenDomain
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
    domain: Gs2FormationUserAccessTokenDomain,
    game_session: Variant,
    connection: Gs2Connection
):
    _domain = domain
    _game_session = game_session
    _connection = connection


func molds(
) -> Gs2FormationEzListMoldsIterator:
    return Gs2FormationEzListMoldsIterator.new(
        _domain,
        _game_session,
        _connection
    )


func subscribe_molds(
    callback: Callable
) -> int:
    return _domain.subscribe_molds(
        func(items): callback.call([] if items == null else items.map(func(v): return Gs2FormationEzMold.from_model(v)))
    )


func unsubscribe_molds(
    callback_id: int
) -> void:
    _domain.unsubscribe_molds(
        callback_id
    )


func property_forms(
    property_form_model_name
) -> Gs2FormationEzListPropertyFormsIterator:
    return Gs2FormationEzListPropertyFormsIterator.new(
        _domain,
        _game_session,
        _connection,
        property_form_model_name
    )


func subscribe_property_forms(
    callback: Callable,
    property_form_model_name
) -> int:
    return _domain.subscribe_property_forms(
        func(items): callback.call([] if items == null else items.map(func(v): return Gs2FormationEzPropertyForm.from_model(v))),
        property_form_model_name
    )


func unsubscribe_property_forms(
    callback_id: int,
    property_form_model_name
) -> void:
    _domain.unsubscribe_property_forms(
        callback_id,
        property_form_model_name
    )


func mold(
    mold_model_name
) -> Gs2FormationEzMoldGameSessionDomain:
    return Gs2FormationEzMoldGameSessionDomain.new(
        _domain.mold(
            mold_model_name
        ),
        _game_session,
        _connection
    )


func property_form(
    property_form_model_name,
    property_id
) -> Gs2FormationEzPropertyFormGameSessionDomain:
    return Gs2FormationEzPropertyFormGameSessionDomain.new(
        _domain.property_form(
            property_form_model_name,
            property_id
        ),
        _game_session,
        _connection
    )