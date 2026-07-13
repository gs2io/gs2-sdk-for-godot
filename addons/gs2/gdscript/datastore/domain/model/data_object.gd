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
class_name Gs2DatastoreDataObjectDomain
extends RefCounted

var _gs2: Gs2Domain
var _client: Gs2DatastoreRestClient
var namespace_name: Variant = null
var user_id: Variant = null
var data_object_name: Variant = null
var upload_url: Variant = null
var file_url: Variant = null
var content_length: Variant = null
var next_page_token: Variant = null


func _init(
    gs2: Gs2Domain,
    namespace_name_,
    user_id_,
    data_object_name_
):
    _gs2 = gs2
    _client = Gs2DatastoreRestClient.new(gs2.rest_session)
    namespace_name = namespace_name_
    user_id = user_id_
    data_object_name = data_object_name_


func update(
    request: Gs2DatastoreUpdateDataObjectByUserIdRequest
) -> Gs2AsyncResult:
    request = request.with_context_stack(_gs2.default_context_stack if request.context_stack == null or request.context_stack == "" else request.context_stack)
    request = request.with_namespace_name(namespace_name)
    request = request.with_data_object_name(data_object_name)
    request = request.with_user_id(user_id)
    var async_result = await Gs2DatastoreUpdateDataObjectByUserIdMethodCache.invoke(
        _gs2.cache,
        user_id,
        null,
        request,
        func(): return await _client.update_data_object_by_user_id(request)
    )
    if async_result.error != null:
        return async_result
    var result = async_result.result
    var domain = self
    return Gs2AsyncResult.new(domain, null)


func prepare_re_upload(
    request: Gs2DatastorePrepareReUploadByUserIdRequest
) -> Gs2AsyncResult:
    request = request.with_context_stack(_gs2.default_context_stack if request.context_stack == null or request.context_stack == "" else request.context_stack)
    request = request.with_namespace_name(namespace_name)
    request = request.with_data_object_name(data_object_name)
    request = request.with_user_id(user_id)
    var async_result = await Gs2DatastorePrepareReUploadByUserIdMethodCache.invoke(
        _gs2.cache,
        user_id,
        null,
        request,
        func(): return await _client.prepare_re_upload_by_user_id(request)
    )
    if async_result.error != null:
        return async_result
    var result = async_result.result
    var domain = self
    domain.upload_url = null if result == null else result.upload_url
    return Gs2AsyncResult.new(domain, null)


func done_upload(
    request: Gs2DatastoreDoneUploadByUserIdRequest
) -> Gs2AsyncResult:
    request = request.with_context_stack(_gs2.default_context_stack if request.context_stack == null or request.context_stack == "" else request.context_stack)
    request = request.with_namespace_name(namespace_name)
    request = request.with_data_object_name(data_object_name)
    request = request.with_user_id(user_id)
    var async_result = await Gs2DatastoreDoneUploadByUserIdMethodCache.invoke(
        _gs2.cache,
        user_id,
        null,
        request,
        func(): return await _client.done_upload_by_user_id(request)
    )
    if async_result.error != null:
        return async_result
    var result = async_result.result
    var domain = self
    return Gs2AsyncResult.new(domain, null)


func delete(
    request: Gs2DatastoreDeleteDataObjectByUserIdRequest
) -> Gs2AsyncResult:
    request = request.with_context_stack(_gs2.default_context_stack if request.context_stack == null or request.context_stack == "" else request.context_stack)
    request = request.with_namespace_name(namespace_name)
    request = request.with_user_id(user_id)
    request = request.with_data_object_name(data_object_name)
    var async_result = await Gs2DatastoreDeleteDataObjectByUserIdMethodCache.invoke(
        _gs2.cache,
        user_id,
        null,
        request,
        func(): return await _client.delete_data_object_by_user_id(request)
    )
    if async_result.error != null and not (async_result.error is Gs2NotFoundException):
        return async_result
    var result = async_result.result
    var domain = self
    return Gs2AsyncResult.new(domain, null)


func prepare_download_by_user_id_and_data_object_name(
    request: Gs2DatastorePrepareDownloadByUserIdAndDataObjectNameRequest
) -> Gs2AsyncResult:
    request = request.with_context_stack(_gs2.default_context_stack if request.context_stack == null or request.context_stack == "" else request.context_stack)
    request = request.with_namespace_name(namespace_name)
    request = request.with_user_id(user_id)
    request = request.with_data_object_name(data_object_name)
    var async_result = await Gs2DatastorePrepareDownloadByUserIdAndDataObjectNameMethodCache.invoke(
        _gs2.cache,
        user_id,
        null,
        request,
        func(): return await _client.prepare_download_by_user_id_and_data_object_name(request)
    )
    if async_result.error != null:
        return async_result
    var result = async_result.result
    var domain = self
    domain.file_url = null if result == null else result.file_url
    domain.content_length = null if result == null else result.content_length
    return Gs2AsyncResult.new(domain, null)


func prepare_download_by_user_id_and_data_object_name_and_generation(
    request: Gs2DatastorePrepareDownloadByUserIdAndDataObjectNameAndGenerationRequest
) -> Gs2AsyncResult:
    request = request.with_context_stack(_gs2.default_context_stack if request.context_stack == null or request.context_stack == "" else request.context_stack)
    request = request.with_namespace_name(namespace_name)
    request = request.with_user_id(user_id)
    request = request.with_data_object_name(data_object_name)
    var async_result = await Gs2DatastorePrepareDownloadByUserIdAndDataObjectNameAndGenerationMethodCache.invoke(
        _gs2.cache,
        user_id,
        null,
        request,
        func(): return await _client.prepare_download_by_user_id_and_data_object_name_and_generation(request)
    )
    if async_result.error != null:
        return async_result
    var result = async_result.result
    var domain = self
    domain.file_url = null if result == null else result.file_url
    domain.content_length = null if result == null else result.content_length
    return Gs2AsyncResult.new(domain, null)


func data_object_histories(
    time_offset_token = null
) -> Gs2DatastoreDescribeDataObjectHistoriesByUserIdIterator:
    return Gs2DatastoreDescribeDataObjectHistoriesByUserIdIterator.new(
        _gs2,
        _client,
        namespace_name,
        user_id,
        data_object_name,
        time_offset_token
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
            null
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
            null
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
            null
        )
    )
func data_object_history(
    generation
) -> Gs2DatastoreDataObjectHistoryDomain:
    return Gs2DatastoreDataObjectHistoryDomain.new(
        _gs2,
        namespace_name,
        user_id,
        data_object_name,
        generation
    )


func model() -> Gs2AsyncResult:
    var pair = Gs2DatastoreDataObjectCache.get_cache(
        _gs2.cache,
        namespace_name,
        user_id,
        data_object_name,
        null
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
        null
    )


func subscribe_model(callback: Callable) -> int:
    return _gs2.cache.subscribe(
        "Gs2DatastoreDataObject",
        Gs2DatastoreDataObjectCache.cache_parent_key(
            namespace_name,
            user_id,
            null
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
            null
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