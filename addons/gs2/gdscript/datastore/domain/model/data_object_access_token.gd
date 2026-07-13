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
class_name Gs2DatastoreDataObjectAccessTokenDomain
extends RefCounted

var _gs2: Gs2Domain
var _client: Gs2DatastoreRestClient
var namespace_name: Variant = null
var access_token: Gs2AuthAccessToken
var user_id: Variant:
    get:
        return null if access_token == null else access_token.user_id
var data_object_name: Variant = null
var upload_url: Variant = null
var file_url: Variant = null
var content_length: Variant = null
var next_page_token: Variant = null


func _init(
    gs2: Gs2Domain,
    namespace_name_,
    access_token_,
    data_object_name_
):
    _gs2 = gs2
    _client = Gs2DatastoreRestClient.new(gs2.rest_session)
    namespace_name = namespace_name_
    access_token = access_token_
    data_object_name = data_object_name_


func update(
    request: Gs2DatastoreUpdateDataObjectRequest
) -> Gs2AsyncResult:
    request = request.with_context_stack(_gs2.default_context_stack if request.context_stack == null or request.context_stack == "" else request.context_stack)
    request = request.with_namespace_name(namespace_name)
    request = request.with_data_object_name(data_object_name)
    request = request.with_access_token(null if access_token == null else access_token.token)
    var async_result = await Gs2DatastoreUpdateDataObjectMethodCache.invoke(
        _gs2.cache,
        user_id,
        (null if access_token == null else access_token.time_offset),
        request,
        func(): return await _client.update_data_object(request)
    )
    if async_result.error != null:
        return async_result
    var result = async_result.result
    var domain = self
    return Gs2AsyncResult.new(domain, null)


func prepare_re_upload(
    request: Gs2DatastorePrepareReUploadRequest
) -> Gs2AsyncResult:
    request = request.with_context_stack(_gs2.default_context_stack if request.context_stack == null or request.context_stack == "" else request.context_stack)
    request = request.with_namespace_name(namespace_name)
    request = request.with_data_object_name(data_object_name)
    request = request.with_access_token(null if access_token == null else access_token.token)
    var async_result = await Gs2DatastorePrepareReUploadMethodCache.invoke(
        _gs2.cache,
        user_id,
        (null if access_token == null else access_token.time_offset),
        request,
        func(): return await _client.prepare_re_upload(request)
    )
    if async_result.error != null:
        return async_result
    var result = async_result.result
    var domain = self
    domain.upload_url = null if result == null else result.upload_url
    return Gs2AsyncResult.new(domain, null)


func done_upload(
    request: Gs2DatastoreDoneUploadRequest
) -> Gs2AsyncResult:
    request = request.with_context_stack(_gs2.default_context_stack if request.context_stack == null or request.context_stack == "" else request.context_stack)
    request = request.with_namespace_name(namespace_name)
    request = request.with_data_object_name(data_object_name)
    request = request.with_access_token(null if access_token == null else access_token.token)
    var async_result = await Gs2DatastoreDoneUploadMethodCache.invoke(
        _gs2.cache,
        user_id,
        (null if access_token == null else access_token.time_offset),
        request,
        func(): return await _client.done_upload(request)
    )
    if async_result.error != null:
        return async_result
    var result = async_result.result
    var domain = self
    return Gs2AsyncResult.new(domain, null)


func delete(
    request: Gs2DatastoreDeleteDataObjectRequest
) -> Gs2AsyncResult:
    request = request.with_context_stack(_gs2.default_context_stack if request.context_stack == null or request.context_stack == "" else request.context_stack)
    request = request.with_namespace_name(namespace_name)
    request = request.with_access_token(null if access_token == null else access_token.token)
    request = request.with_data_object_name(data_object_name)
    var async_result = await Gs2DatastoreDeleteDataObjectMethodCache.invoke(
        _gs2.cache,
        user_id,
        (null if access_token == null else access_token.time_offset),
        request,
        func(): return await _client.delete_data_object(request)
    )
    if async_result.error != null and not (async_result.error is Gs2NotFoundException):
        return async_result
    var result = async_result.result
    var domain = self
    return Gs2AsyncResult.new(domain, null)


func prepare_download_own_data(
    request: Gs2DatastorePrepareDownloadOwnDataRequest
) -> Gs2AsyncResult:
    request = request.with_context_stack(_gs2.default_context_stack if request.context_stack == null or request.context_stack == "" else request.context_stack)
    request = request.with_namespace_name(namespace_name)
    request = request.with_access_token(null if access_token == null else access_token.token)
    request = request.with_data_object_name(data_object_name)
    var async_result = await Gs2DatastorePrepareDownloadOwnDataMethodCache.invoke(
        _gs2.cache,
        user_id,
        (null if access_token == null else access_token.time_offset),
        request,
        func(): return await _client.prepare_download_own_data(request)
    )
    if async_result.error != null:
        return async_result
    var result = async_result.result
    var domain = self
    domain.file_url = null if result == null else result.file_url
    domain.content_length = null if result == null else result.content_length
    return Gs2AsyncResult.new(domain, null)


func prepare_download_own_data_by_generation(
    request: Gs2DatastorePrepareDownloadOwnDataByGenerationRequest
) -> Gs2AsyncResult:
    request = request.with_context_stack(_gs2.default_context_stack if request.context_stack == null or request.context_stack == "" else request.context_stack)
    request = request.with_namespace_name(namespace_name)
    request = request.with_access_token(null if access_token == null else access_token.token)
    request = request.with_data_object_name(data_object_name)
    var async_result = await Gs2DatastorePrepareDownloadOwnDataByGenerationMethodCache.invoke(
        _gs2.cache,
        user_id,
        (null if access_token == null else access_token.time_offset),
        request,
        func(): return await _client.prepare_download_own_data_by_generation(request)
    )
    if async_result.error != null:
        return async_result
    var result = async_result.result
    var domain = self
    domain.file_url = null if result == null else result.file_url
    domain.content_length = null if result == null else result.content_length
    return Gs2AsyncResult.new(domain, null)


func data_object_histories(
) -> Gs2DatastoreDescribeDataObjectHistoriesIterator:
    return Gs2DatastoreDescribeDataObjectHistoriesIterator.new(
        _gs2,
        _client,
        namespace_name,
        access_token,
        data_object_name
    )


func subscribe_data_object_histories(
    callback: Callable
) -> int:
    return _gs2.cache.list_subscribe(
        "Gs2DatastoreDataObjectHistory",
        Gs2DatastoreDataObjectHistoryCache.cache_parent_key(
            namespace_name,
            user_id,
            data_object_name,
            null if access_token == null else access_token.time_offset
        ),
        callback
    )


func unsubscribe_data_object_histories(
    callback_id: int
) -> void:
    _gs2.cache.list_unsubscribe(
        "Gs2DatastoreDataObjectHistory",
        Gs2DatastoreDataObjectHistoryCache.cache_parent_key(
            namespace_name,
            user_id,
            data_object_name,
            null if access_token == null else access_token.time_offset
        ),
        callback_id
    )


func invalidate_data_object_histories(
) -> void:
    _gs2.cache.clear_list_cache(
        "Gs2DatastoreDataObjectHistory",
        Gs2DatastoreDataObjectHistoryCache.cache_parent_key(
            namespace_name,
            user_id,
            data_object_name,
            null if access_token == null else access_token.time_offset
        )
    )
func data_object_history(
    generation
) -> Gs2DatastoreDataObjectHistoryAccessTokenDomain:
    return Gs2DatastoreDataObjectHistoryAccessTokenDomain.new(
        _gs2,
        namespace_name,
        access_token,
        data_object_name,
        generation
    )


func model() -> Gs2AsyncResult:
    var pair = Gs2DatastoreDataObjectCache.get_cache(
        _gs2.cache,
        namespace_name,
        user_id,
        data_object_name,
        (null if access_token == null else access_token.time_offset)
    )
    if pair[1]:
        return Gs2AsyncResult.new(pair[0], null)
    return Gs2AsyncResult.new(null, null)


func invalidate() -> void:
    Gs2DatastoreDataObjectCache.delete_cache(
        _gs2.cache,
        namespace_name,
        user_id,
        data_object_name,
        (null if access_token == null else access_token.time_offset)
    )


func subscribe_model(callback: Callable) -> int:
    return _gs2.cache.subscribe(
        "Gs2DatastoreDataObject",
        Gs2DatastoreDataObjectCache.cache_parent_key(
            namespace_name,
            user_id,
            (null if access_token == null else access_token.time_offset)
        ),
        Gs2DatastoreDataObjectCache.cache_key(
            data_object_name
        ),
        callback,
        func(): await model()
    )


func unsubscribe_model(callback_id: int) -> void:
    _gs2.cache.unsubscribe(
        "Gs2DatastoreDataObject",
        Gs2DatastoreDataObjectCache.cache_parent_key(
            namespace_name,
            user_id,
            (null if access_token == null else access_token.time_offset)
        ),
        Gs2DatastoreDataObjectCache.cache_key(
            data_object_name
        ),
        callback_id
    )


func subscribe_model_with_initial_call(callback: Callable) -> Gs2AsyncResult:
    var model_result = await model()
    if model_result.error != null:
        return model_result
    var callback_id = subscribe_model(callback)
    callback.call(model_result.result)
    return Gs2AsyncResult.new(callback_id, null)