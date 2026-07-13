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
class_name Gs2LoginRewardUserAccessTokenDomain
extends RefCounted

var _gs2: Gs2Domain
var _client: Gs2LoginRewardRestClient
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
    _client = Gs2LoginRewardRestClient.new(gs2.rest_session)
    namespace_name = namespace_name_
    access_token = access_token_
func bonus(
) -> Gs2LoginRewardBonusAccessTokenDomain:
    return Gs2LoginRewardBonusAccessTokenDomain.new(
        _gs2,
        namespace_name,
        access_token
    )


func receive_statuses(
) -> Gs2LoginRewardDescribeReceiveStatusesIterator:
    return Gs2LoginRewardDescribeReceiveStatusesIterator.new(
        _gs2,
        _client,
        namespace_name,
        access_token
    )


func subscribe_receive_statuses(
    callback: Callable
) -> int:
    return _gs2.cache.list_subscribe(
        "Gs2LoginRewardReceiveStatus",
        Gs2LoginRewardReceiveStatusCache.cache_parent_key(
            namespace_name,
            user_id,
            null if access_token == null else access_token.time_offset
        ),
        callback
    )


func unsubscribe_receive_statuses(
    callback_id: int
) -> void:
    _gs2.cache.list_unsubscribe(
        "Gs2LoginRewardReceiveStatus",
        Gs2LoginRewardReceiveStatusCache.cache_parent_key(
            namespace_name,
            user_id,
            null if access_token == null else access_token.time_offset
        ),
        callback_id
    )


func invalidate_receive_statuses(
) -> void:
    _gs2.cache.clear_list_cache(
        "Gs2LoginRewardReceiveStatus",
        Gs2LoginRewardReceiveStatusCache.cache_parent_key(
            namespace_name,
            user_id,
            null if access_token == null else access_token.time_offset
        )
    )
func receive_status(
    bonus_model_name
) -> Gs2LoginRewardReceiveStatusAccessTokenDomain:
    return Gs2LoginRewardReceiveStatusAccessTokenDomain.new(
        _gs2,
        namespace_name,
        access_token,
        bonus_model_name
    )