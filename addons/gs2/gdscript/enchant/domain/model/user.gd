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
class_name Gs2EnchantUserDomain
extends RefCounted

var _gs2: Gs2DomainCore
var _client: Gs2EnchantRestClient
var namespace_name: Variant = null
var user_id: Variant = null
var next_page_token: Variant = null


func _init(
    gs2: Gs2DomainCore,
    namespace_name_,
    user_id_
):
    _gs2 = gs2
    _client = Gs2EnchantRestClient.new(gs2.rest_session)
    namespace_name = namespace_name_
    user_id = user_id_


func balance_parameter_statuses(
    parameter_name = null,
    time_offset_token = null
) -> Gs2EnchantDescribeBalanceParameterStatusesByUserIdIterator:
    return Gs2EnchantDescribeBalanceParameterStatusesByUserIdIterator.new(
        _gs2,
        _client,
        namespace_name,
        user_id,
        parameter_name,
        time_offset_token
    )


func subscribe_balance_parameter_statuses(
    callback: Callable,
    parameter_name = null
) -> int:
    return _gs2.cache.list_subscribe(
        "Gs2EnchantBalanceParameterStatus",
        Gs2EnchantBalanceParameterStatusCache.cache_parent_key(
            namespace_name,
            user_id,
            null
        ),
        callback
    )


func unsubscribe_balance_parameter_statuses(
    callback_id: int,
    parameter_name = null
) -> void:
    _gs2.cache.list_unsubscribe(
        "Gs2EnchantBalanceParameterStatus",
        Gs2EnchantBalanceParameterStatusCache.cache_parent_key(
            namespace_name,
            user_id,
            null
        ),
        callback_id
    )


func invalidate_balance_parameter_statuses(
    parameter_name = null
) -> void:
    _gs2.cache.clear_list_cache(
        "Gs2EnchantBalanceParameterStatus",
        Gs2EnchantBalanceParameterStatusCache.cache_parent_key(
            namespace_name,
            user_id,
            null
        )
    )
func balance_parameter_status(
    parameter_name,
    property_id
) -> Gs2EnchantBalanceParameterStatusDomain:
    return Gs2EnchantBalanceParameterStatusDomain.new(
        _gs2,
        namespace_name,
        user_id,
        parameter_name,
        property_id
    )


func rarity_parameter_statuses(
    parameter_name = null,
    time_offset_token = null
) -> Gs2EnchantDescribeRarityParameterStatusesByUserIdIterator:
    return Gs2EnchantDescribeRarityParameterStatusesByUserIdIterator.new(
        _gs2,
        _client,
        namespace_name,
        user_id,
        parameter_name,
        time_offset_token
    )


func subscribe_rarity_parameter_statuses(
    callback: Callable,
    parameter_name = null
) -> int:
    return _gs2.cache.list_subscribe(
        "Gs2EnchantRarityParameterStatus",
        Gs2EnchantRarityParameterStatusCache.cache_parent_key(
            namespace_name,
            user_id,
            null
        ),
        callback
    )


func unsubscribe_rarity_parameter_statuses(
    callback_id: int,
    parameter_name = null
) -> void:
    _gs2.cache.list_unsubscribe(
        "Gs2EnchantRarityParameterStatus",
        Gs2EnchantRarityParameterStatusCache.cache_parent_key(
            namespace_name,
            user_id,
            null
        ),
        callback_id
    )


func invalidate_rarity_parameter_statuses(
    parameter_name = null
) -> void:
    _gs2.cache.clear_list_cache(
        "Gs2EnchantRarityParameterStatus",
        Gs2EnchantRarityParameterStatusCache.cache_parent_key(
            namespace_name,
            user_id,
            null
        )
    )
func rarity_parameter_status(
    parameter_name,
    property_id
) -> Gs2EnchantRarityParameterStatusDomain:
    return Gs2EnchantRarityParameterStatusDomain.new(
        _gs2,
        namespace_name,
        user_id,
        parameter_name,
        property_id
    )