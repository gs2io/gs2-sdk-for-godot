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
class_name Gs2DatastoreUserAccessTokenDomain
extends RefCounted

var _gs2: Gs2Domain
var _client: Gs2DatastoreRestClient
var namespace_name: Variant = null
var access_token: Gs2AuthAccessToken
var user_id: Variant:
    get:
        return null if access_token == null else access_token.user_id
var upload_url: Variant = null
var file_url: Variant = null
var content_length: Variant = null
var next_page_token: Variant = null


func _init(
    gs2: Gs2Domain,
    namespace_name_,
    access_token_
):
    _gs2 = gs2
    _client = Gs2DatastoreRestClient.new(gs2.rest_session)
    namespace_name = namespace_name_
    access_token = access_token_


func prepare_upload(
    request: Gs2DatastorePrepareUploadRequest
) -> Gs2AsyncResult:
    request = request.with_context_stack(_gs2.default_context_stack if request.context_stack == null or request.context_stack == "" else request.context_stack)
    request = request.with_namespace_name(namespace_name)
    request = request.with_access_token(null if access_token == null else access_token.token)
    var async_result = await Gs2DatastorePrepareUploadMethodCache.invoke(
        _gs2.cache,
        user_id,
        (null if access_token == null else access_token.time_offset),
        request,
        func(): return await _client.prepare_upload(request)
    )
    if async_result.error != null:
        return async_result
    var result = async_result.result
    var ref = null if result == null else result.item
    var domain = Gs2DatastoreDataObjectAccessTokenDomain.new(
        _gs2,
        namespace_name,
        access_token,
        (null if ref == null else ref.name)
    )
    domain.upload_url = null if result == null else result.upload_url
    return Gs2AsyncResult.new(domain, null)


func prepare_download(
    request: Gs2DatastorePrepareDownloadRequest
) -> Gs2AsyncResult:
    request = request.with_context_stack(_gs2.default_context_stack if request.context_stack == null or request.context_stack == "" else request.context_stack)
    request = request.with_namespace_name(namespace_name)
    request = request.with_access_token(null if access_token == null else access_token.token)
    var async_result = await Gs2DatastorePrepareDownloadMethodCache.invoke(
        _gs2.cache,
        user_id,
        (null if access_token == null else access_token.time_offset),
        request,
        func(): return await _client.prepare_download(request)
    )
    if async_result.error != null:
        return async_result
    var result = async_result.result
    var ref = null if result == null else result.item
    var domain = Gs2DatastoreDataObjectAccessTokenDomain.new(
        _gs2,
        namespace_name,
        access_token,
        (null if ref == null else ref.name)
    )
    domain.file_url = null if result == null else result.file_url
    domain.content_length = null if result == null else result.content_length
    return Gs2AsyncResult.new(domain, null)


func prepare_download_by_generation(
    request: Gs2DatastorePrepareDownloadByGenerationRequest
) -> Gs2AsyncResult:
    request = request.with_context_stack(_gs2.default_context_stack if request.context_stack == null or request.context_stack == "" else request.context_stack)
    request = request.with_namespace_name(namespace_name)
    request = request.with_access_token(null if access_token == null else access_token.token)
    var async_result = await Gs2DatastorePrepareDownloadByGenerationMethodCache.invoke(
        _gs2.cache,
        user_id,
        (null if access_token == null else access_token.time_offset),
        request,
        func(): return await _client.prepare_download_by_generation(request)
    )
    if async_result.error != null:
        return async_result
    var result = async_result.result
    var ref = null if result == null else result.item
    var domain = Gs2DatastoreDataObjectAccessTokenDomain.new(
        _gs2,
        namespace_name,
        access_token,
        (null if ref == null else ref.name)
    )
    domain.file_url = null if result == null else result.file_url
    domain.content_length = null if result == null else result.content_length
    return Gs2AsyncResult.new(domain, null)


func data_objects(
    status = null
) -> Gs2DatastoreDescribeDataObjectsIterator:
    return Gs2DatastoreDescribeDataObjectsIterator.new(
        _gs2,
        _client,
        namespace_name,
        access_token,
        status
    )


func subscribe_data_objects(
    callback: Callable,
    status = null
) -> int:
    return _gs2.cache.list_subscribe(
        "Gs2DatastoreDataObject",
        Gs2DatastoreDataObjectCache.cache_parent_key(
            namespace_name,
            user_id,
            null if access_token == null else access_token.time_offset
        ),
        callback
    )


func unsubscribe_data_objects(
    callback_id: int,
    status = null
) -> void:
    _gs2.cache.list_unsubscribe(
        "Gs2DatastoreDataObject",
        Gs2DatastoreDataObjectCache.cache_parent_key(
            namespace_name,
            user_id,
            null if access_token == null else access_token.time_offset
        ),
        callback_id
    )


func invalidate_data_objects(
    status = null
) -> void:
    _gs2.cache.clear_list_cache(
        "Gs2DatastoreDataObject",
        Gs2DatastoreDataObjectCache.cache_parent_key(
            namespace_name,
            user_id,
            null if access_token == null else access_token.time_offset
        )
    )
func data_object(
    data_object_name
) -> Gs2DatastoreDataObjectAccessTokenDomain:
    return Gs2DatastoreDataObjectAccessTokenDomain.new(
        _gs2,
        namespace_name,
        access_token,
        data_object_name
    )