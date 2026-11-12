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
class_name Gs2GradeUserAccessTokenDomain
extends RefCounted

var _gs2: Gs2DomainCore
var _client: Gs2GradeRestClient
var namespace_name: Variant = null
var access_token: Gs2AuthAccessToken
var user_id: Variant:
    get:
        return null if access_token == null else access_token.user_id
var experience_namespace_name: Variant = null
var next_page_token: Variant = null


func _init(
    gs2: Gs2DomainCore,
    namespace_name_,
    access_token_
):
    _gs2 = gs2
    _client = Gs2GradeRestClient.new(gs2.rest_session)
    namespace_name = namespace_name_
    access_token = access_token_


func statuses(
    grade_name = null
) -> Gs2GradeDescribeStatusesIterator:
    return Gs2GradeDescribeStatusesIterator.new(
        _gs2,
        _client,
        namespace_name,
        access_token,
        grade_name
    )


func subscribe_statuses(
    callback: Callable,
    grade_name = null
) -> int:
    return _gs2.cache.list_subscribe(
        "Gs2GradeStatus",
        Gs2GradeStatusCache.cache_parent_key(
            namespace_name,
            user_id,
            null if access_token == null else access_token.time_offset
        ),
        callback
    )


func unsubscribe_statuses(
    callback_id: int,
    grade_name = null
) -> void:
    _gs2.cache.list_unsubscribe(
        "Gs2GradeStatus",
        Gs2GradeStatusCache.cache_parent_key(
            namespace_name,
            user_id,
            null if access_token == null else access_token.time_offset
        ),
        callback_id
    )


func invalidate_statuses(
    grade_name = null
) -> void:
    _gs2.cache.clear_list_cache(
        "Gs2GradeStatus",
        Gs2GradeStatusCache.cache_parent_key(
            namespace_name,
            user_id,
            null if access_token == null else access_token.time_offset
        )
    )
func status(
    grade_name,
    property_id
) -> Gs2GradeStatusAccessTokenDomain:
    return Gs2GradeStatusAccessTokenDomain.new(
        _gs2,
        namespace_name,
        access_token,
        grade_name,
        property_id
    )