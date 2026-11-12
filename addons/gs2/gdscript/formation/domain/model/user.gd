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
class_name Gs2FormationUserDomain
extends RefCounted

var _gs2: Gs2DomainCore
var _client: Gs2FormationRestClient
var namespace_name: Variant = null
var user_id: Variant = null
var next_page_token: Variant = null


func _init(
    gs2: Gs2DomainCore,
    namespace_name_,
    user_id_
):
    _gs2 = gs2
    _client = Gs2FormationRestClient.new(gs2.rest_session)
    namespace_name = namespace_name_
    user_id = user_id_


func molds(
    time_offset_token = null
) -> Gs2FormationDescribeMoldsByUserIdIterator:
    return Gs2FormationDescribeMoldsByUserIdIterator.new(
        _gs2,
        _client,
        namespace_name,
        user_id,
        time_offset_token
    )


func subscribe_molds(
    callback: Callable
) -> int:
    return _gs2.cache.list_subscribe(
        "Gs2FormationMold",
        Gs2FormationMoldCache.cache_parent_key(
            namespace_name,
            user_id,
            null
        ),
        callback
    )


func unsubscribe_molds(
    callback_id: int
) -> void:
    _gs2.cache.list_unsubscribe(
        "Gs2FormationMold",
        Gs2FormationMoldCache.cache_parent_key(
            namespace_name,
            user_id,
            null
        ),
        callback_id
    )


func invalidate_molds(
) -> void:
    _gs2.cache.clear_list_cache(
        "Gs2FormationMold",
        Gs2FormationMoldCache.cache_parent_key(
            namespace_name,
            user_id,
            null
        )
    )
func mold(
    mold_model_name
) -> Gs2FormationMoldDomain:
    return Gs2FormationMoldDomain.new(
        _gs2,
        namespace_name,
        user_id,
        mold_model_name
    )


func property_forms(
    property_form_model_name,
    time_offset_token = null
) -> Gs2FormationDescribePropertyFormsByUserIdIterator:
    return Gs2FormationDescribePropertyFormsByUserIdIterator.new(
        _gs2,
        _client,
        namespace_name,
        user_id,
        property_form_model_name,
        time_offset_token
    )


func subscribe_property_forms(
    callback: Callable,
    property_form_model_name
) -> int:
    return _gs2.cache.list_subscribe(
        "Gs2FormationPropertyForm",
        Gs2FormationPropertyFormCache.cache_parent_key(
            namespace_name,
            user_id,
            null
        ),
        callback
    )


func unsubscribe_property_forms(
    callback_id: int,
    property_form_model_name
) -> void:
    _gs2.cache.list_unsubscribe(
        "Gs2FormationPropertyForm",
        Gs2FormationPropertyFormCache.cache_parent_key(
            namespace_name,
            user_id,
            null
        ),
        callback_id
    )


func invalidate_property_forms(
    property_form_model_name
) -> void:
    _gs2.cache.clear_list_cache(
        "Gs2FormationPropertyForm",
        Gs2FormationPropertyFormCache.cache_parent_key(
            namespace_name,
            user_id,
            null
        )
    )
func property_form(
    property_form_model_name,
    property_id
) -> Gs2FormationPropertyFormDomain:
    return Gs2FormationPropertyFormDomain.new(
        _gs2,
        namespace_name,
        user_id,
        property_form_model_name,
        property_id
    )