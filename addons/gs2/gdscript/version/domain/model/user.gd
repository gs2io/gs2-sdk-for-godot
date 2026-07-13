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
class_name Gs2VersionUserDomain
extends RefCounted

var _gs2: Gs2Domain
var _client: Gs2VersionRestClient
var namespace_name: Variant = null
var user_id: Variant = null
var body: Variant = null
var signature: Variant = null
var next_page_token: Variant = null


func _init(
    gs2: Gs2Domain,
    namespace_name_,
    user_id_
):
    _gs2 = gs2
    _client = Gs2VersionRestClient.new(gs2.rest_session)
    namespace_name = namespace_name_
    user_id = user_id_


func calculate_signature(
    request: Gs2VersionCalculateSignatureRequest
) -> Gs2AsyncResult:
    request = request.with_context_stack(_gs2.default_context_stack if request.context_stack == null or request.context_stack == "" else request.context_stack)
    request = request.with_namespace_name(namespace_name)
    var async_result = await Gs2VersionCalculateSignatureMethodCache.invoke(
        _gs2.cache,
        user_id,
        null,
        request,
        func(): return await _client.calculate_signature(request)
    )
    if async_result.error != null:
        return async_result
    var result = async_result.result
    var domain = self
    self.body = null if result == null else result.body
    domain.body = self.body
    self.signature = null if result == null else result.signature
    domain.signature = self.signature
    return Gs2AsyncResult.new(domain, null)


func accept_versions(
    time_offset_token = null
) -> Gs2VersionDescribeAcceptVersionsByUserIdIterator:
    return Gs2VersionDescribeAcceptVersionsByUserIdIterator.new(
        _gs2,
        _client,
        namespace_name,
        user_id,
        time_offset_token
    )


func subscribe_accept_versions(
    callback: Callable
) -> int:
    return _gs2.cache.list_subscribe(
        "Gs2VersionAcceptVersion",
        Gs2VersionAcceptVersionCache.cache_parent_key(
            namespace_name,
            user_id,
            null
        ),
        callback
    )


func unsubscribe_accept_versions(
    callback_id: int
) -> void:
    _gs2.cache.list_unsubscribe(
        "Gs2VersionAcceptVersion",
        Gs2VersionAcceptVersionCache.cache_parent_key(
            namespace_name,
            user_id,
            null
        ),
        callback_id
    )


func invalidate_accept_versions(
) -> void:
    _gs2.cache.clear_list_cache(
        "Gs2VersionAcceptVersion",
        Gs2VersionAcceptVersionCache.cache_parent_key(
            namespace_name,
            user_id,
            null
        )
    )
func accept_version(
    version_name
) -> Gs2VersionAcceptVersionDomain:
    return Gs2VersionAcceptVersionDomain.new(
        _gs2,
        namespace_name,
        user_id,
        version_name
    )
func checker(
) -> Gs2VersionCheckerDomain:
    return Gs2VersionCheckerDomain.new(
        _gs2,
        namespace_name,
        user_id
    )