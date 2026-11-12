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
class_name Gs2NewsUserAccessTokenDomain
extends RefCounted

var _gs2: Gs2DomainCore
var _client: Gs2NewsRestClient
var namespace_name: Variant = null
var access_token: Gs2AuthAccessToken
var user_id: Variant:
    get:
        return null if access_token == null else access_token.user_id
var content_hash: Variant = null
var template_hash: Variant = null


func _init(
    gs2: Gs2DomainCore,
    namespace_name_,
    access_token_
):
    _gs2 = gs2
    _client = Gs2NewsRestClient.new(gs2.rest_session)
    namespace_name = namespace_name_
    access_token = access_token_


func newses(
) -> Gs2NewsDescribeNewsIterator:
    return Gs2NewsDescribeNewsIterator.new(
        _gs2,
        _client,
        namespace_name,
        access_token,
        self
    )


func subscribe_newses(
    callback: Callable
) -> int:
    return _gs2.cache.list_subscribe(
        "Gs2NewsNews",
        Gs2NewsNewsCache.cache_parent_key(
            namespace_name,
            user_id,
            null if access_token == null else access_token.time_offset
        ),
        callback
    )


func unsubscribe_newses(
    callback_id: int
) -> void:
    _gs2.cache.list_unsubscribe(
        "Gs2NewsNews",
        Gs2NewsNewsCache.cache_parent_key(
            namespace_name,
            user_id,
            null if access_token == null else access_token.time_offset
        ),
        callback_id
    )


func invalidate_newses(
) -> void:
    _gs2.cache.clear_list_cache(
        "Gs2NewsNews",
        Gs2NewsNewsCache.cache_parent_key(
            namespace_name,
            user_id,
            null if access_token == null else access_token.time_offset
        )
    )
func news(
) -> Gs2NewsNewsAccessTokenDomain:
    return Gs2NewsNewsAccessTokenDomain.new(
        _gs2,
        namespace_name,
        access_token
    )