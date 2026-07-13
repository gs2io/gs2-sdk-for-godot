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
class_name Gs2EnchantUserAccessTokenDomain
extends RefCounted

var _gs2: Gs2Domain
var _client: Gs2EnchantRestClient
var namespace_name: Variant = null
var access_token: Gs2AuthAccessToken
var user_id: Variant:
    get:
        return null if access_token == null else access_token.user_id
var next_page_token: Variant = null


func _init(
    gs2: Gs2Domain,
    namespace_name_,
    access_token_
):
    _gs2 = gs2
    _client = Gs2EnchantRestClient.new(gs2.rest_session)
    namespace_name = namespace_name_
    access_token = access_token_


func balance_parameter_statuses(
    parameter_name = null
) -> Gs2EnchantDescribeBalanceParameterStatusesIterator:
    return Gs2EnchantDescribeBalanceParameterStatusesIterator.new(
        _gs2,
        _client,
        namespace_name,
        access_token,
        parameter_name
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
            null if access_token == null else access_token.time_offset
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
            null if access_token == null else access_token.time_offset
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
            null if access_token == null else access_token.time_offset
        )
    )
func balance_parameter_status(
    parameter_name,
    property_id
) -> Gs2EnchantBalanceParameterStatusAccessTokenDomain:
    return Gs2EnchantBalanceParameterStatusAccessTokenDomain.new(
        _gs2,
        namespace_name,
        access_token,
        parameter_name,
        property_id
    )


func rarity_parameter_statuses(
    parameter_name = null
) -> Gs2EnchantDescribeRarityParameterStatusesIterator:
    return Gs2EnchantDescribeRarityParameterStatusesIterator.new(
        _gs2,
        _client,
        namespace_name,
        access_token,
        parameter_name
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
            null if access_token == null else access_token.time_offset
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
            null if access_token == null else access_token.time_offset
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
            null if access_token == null else access_token.time_offset
        )
    )
func rarity_parameter_status(
    parameter_name,
    property_id
) -> Gs2EnchantRarityParameterStatusAccessTokenDomain:
    return Gs2EnchantRarityParameterStatusAccessTokenDomain.new(
        _gs2,
        namespace_name,
        access_token,
        parameter_name,
        property_id
    )