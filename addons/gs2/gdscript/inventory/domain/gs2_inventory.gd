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
class_name Gs2Inventory
extends RefCounted



var _gs2: Gs2Domain
var _client: Gs2InventoryRestClient
var url: Variant = null
var upload_token: Variant = null
var upload_url: Variant = null


func _init(
    gs2: Gs2Domain
):
    _gs2 = gs2
    _client = Gs2InventoryRestClient.new(gs2.rest_session)


func create_namespace(
    request: Gs2InventoryCreateNamespaceRequest
) -> Gs2AsyncResult:
    var async_result = await Gs2InventoryCreateNamespaceMethodCache.invoke(
        _gs2.cache,
        null,
        null,
        request,
        func(): return await _client.create_namespace(request)
    )
    if async_result.error != null:
        return async_result
    var result = async_result.result
    var ref = null if result == null else result.item
    var domain = Gs2InventoryNamespaceDomain.new(
        _gs2,
        (null if ref == null else ref.name)
    )
    return Gs2AsyncResult.new(domain, null)


func dump_user_data(
    request: Gs2InventoryDumpUserDataByUserIdRequest
) -> Gs2AsyncResult:
    var async_result = await Gs2InventoryDumpUserDataByUserIdMethodCache.invoke(
        _gs2.cache,
        null,
        null,
        request,
        func(): return await _client.dump_user_data_by_user_id(request)
    )
    if async_result.error != null:
        return async_result
    var result = async_result.result
    var domain = self
    return Gs2AsyncResult.new(domain, null)


func check_dump_user_data(
    request: Gs2InventoryCheckDumpUserDataByUserIdRequest
) -> Gs2AsyncResult:
    var async_result = await Gs2InventoryCheckDumpUserDataByUserIdMethodCache.invoke(
        _gs2.cache,
        null,
        null,
        request,
        func(): return await _client.check_dump_user_data_by_user_id(request)
    )
    if async_result.error != null:
        return async_result
    var result = async_result.result
    var domain = self
    self.url = null if result == null else result.url
    domain.url = self.url
    return Gs2AsyncResult.new(domain, null)


func clean_user_data(
    request: Gs2InventoryCleanUserDataByUserIdRequest
) -> Gs2AsyncResult:
    var async_result = await Gs2InventoryCleanUserDataByUserIdMethodCache.invoke(
        _gs2.cache,
        null,
        null,
        request,
        func(): return await _client.clean_user_data_by_user_id(request)
    )
    if async_result.error != null:
        return async_result
    var result = async_result.result
    var domain = self
    return Gs2AsyncResult.new(domain, null)


func check_clean_user_data(
    request: Gs2InventoryCheckCleanUserDataByUserIdRequest
) -> Gs2AsyncResult:
    var async_result = await Gs2InventoryCheckCleanUserDataByUserIdMethodCache.invoke(
        _gs2.cache,
        null,
        null,
        request,
        func(): return await _client.check_clean_user_data_by_user_id(request)
    )
    if async_result.error != null:
        return async_result
    var result = async_result.result
    var domain = self
    return Gs2AsyncResult.new(domain, null)


func prepare_import_user_data(
    request: Gs2InventoryPrepareImportUserDataByUserIdRequest
) -> Gs2AsyncResult:
    var async_result = await Gs2InventoryPrepareImportUserDataByUserIdMethodCache.invoke(
        _gs2.cache,
        null,
        null,
        request,
        func(): return await _client.prepare_import_user_data_by_user_id(request)
    )
    if async_result.error != null:
        return async_result
    var result = async_result.result
    var domain = self
    self.upload_token = null if result == null else result.upload_token
    domain.upload_token = self.upload_token
    self.upload_url = null if result == null else result.upload_url
    domain.upload_url = self.upload_url
    return Gs2AsyncResult.new(domain, null)


func import_user_data(
    request: Gs2InventoryImportUserDataByUserIdRequest
) -> Gs2AsyncResult:
    var async_result = await Gs2InventoryImportUserDataByUserIdMethodCache.invoke(
        _gs2.cache,
        null,
        null,
        request,
        func(): return await _client.import_user_data_by_user_id(request)
    )
    if async_result.error != null:
        return async_result
    var result = async_result.result
    var domain = self
    return Gs2AsyncResult.new(domain, null)


func check_import_user_data(
    request: Gs2InventoryCheckImportUserDataByUserIdRequest
) -> Gs2AsyncResult:
    var async_result = await Gs2InventoryCheckImportUserDataByUserIdMethodCache.invoke(
        _gs2.cache,
        null,
        null,
        request,
        func(): return await _client.check_import_user_data_by_user_id(request)
    )
    if async_result.error != null:
        return async_result
    var result = async_result.result
    var domain = self
    self.url = null if result == null else result.url
    domain.url = self.url
    return Gs2AsyncResult.new(domain, null)


func namespaces(
    name_prefix = null
) -> Gs2InventoryDescribeNamespacesIterator:
    return Gs2InventoryDescribeNamespacesIterator.new(
        _gs2,
        _client,
        name_prefix
    )


func subscribe_namespaces(
    callback: Callable,
    name_prefix = null
) -> int:
    return _gs2.cache.list_subscribe(
        "Gs2InventoryNamespace",
        Gs2InventoryNamespaceCache.cache_parent_key(
            null
        ),
        callback
    )


func unsubscribe_namespaces(
    callback_id: int,
    name_prefix = null
) -> void:
    _gs2.cache.list_unsubscribe(
        "Gs2InventoryNamespace",
        Gs2InventoryNamespaceCache.cache_parent_key(
            null
        ),
        callback_id
    )


func invalidate_namespaces(
    name_prefix = null
) -> void:
    _gs2.cache.clear_list_cache(
        "Gs2InventoryNamespace",
        Gs2InventoryNamespaceCache.cache_parent_key(
            null
        )
    )
func namespace_(
    namespace_name
) -> Gs2InventoryNamespaceDomain:
    return Gs2InventoryNamespaceDomain.new(
        _gs2,
        namespace_name
    )


static var add_capacity_by_user_id_complete_callbacks: Array = []


static var set_capacity_by_user_id_complete_callbacks: Array = []


static var acquire_item_set_by_user_id_complete_callbacks: Array = []


static var acquire_item_set_with_grade_by_user_id_complete_callbacks: Array = []


static var add_reference_of_by_user_id_complete_callbacks: Array = []


static var delete_reference_of_by_user_id_complete_callbacks: Array = []


static var acquire_simple_items_by_user_id_complete_callbacks: Array = []


static var set_simple_items_by_user_id_complete_callbacks: Array = []


static var acquire_big_item_by_user_id_complete_callbacks: Array = []


static var set_big_item_by_user_id_complete_callbacks: Array = []


func update_cache_from_stamp_sheet(
    transaction_id,
    time_offset,
    method: String,
    request,
    result
) -> void:
    if method == "AddCapacityByUserId":
        var request_model = Gs2InventoryAddCapacityByUserIdRequest.from_dict(JSON.parse_string(request))
        var result_model = Gs2InventoryAddCapacityByUserIdResult.from_dict(JSON.parse_string(result))
        Gs2InventoryAddCapacityByUserIdMethodCache.put_cache(
            result_model,
            _gs2.cache,
            request_model.user_id,
            time_offset,
            request_model
        )
        for callback in add_capacity_by_user_id_complete_callbacks:
            if callback is Callable and callback.is_valid():
                callback.call(transaction_id, request_model, result_model)
        return
    if method == "SetCapacityByUserId":
        var request_model = Gs2InventorySetCapacityByUserIdRequest.from_dict(JSON.parse_string(request))
        var result_model = Gs2InventorySetCapacityByUserIdResult.from_dict(JSON.parse_string(result))
        Gs2InventorySetCapacityByUserIdMethodCache.put_cache(
            result_model,
            _gs2.cache,
            request_model.user_id,
            time_offset,
            request_model
        )
        for callback in set_capacity_by_user_id_complete_callbacks:
            if callback is Callable and callback.is_valid():
                callback.call(transaction_id, request_model, result_model)
        return
    if method == "AcquireItemSetByUserId":
        var request_model = Gs2InventoryAcquireItemSetByUserIdRequest.from_dict(JSON.parse_string(request))
        var result_model = Gs2InventoryAcquireItemSetByUserIdResult.from_dict(JSON.parse_string(result))
        Gs2InventoryAcquireItemSetByUserIdMethodCache.put_cache(
            result_model,
            _gs2.cache,
            request_model.user_id,
            time_offset,
            request_model
        )
        for callback in acquire_item_set_by_user_id_complete_callbacks:
            if callback is Callable and callback.is_valid():
                callback.call(transaction_id, request_model, result_model)
        return
    if method == "AcquireItemSetWithGradeByUserId":
        var request_model = Gs2InventoryAcquireItemSetWithGradeByUserIdRequest.from_dict(JSON.parse_string(request))
        var result_model = Gs2InventoryAcquireItemSetWithGradeByUserIdResult.from_dict(JSON.parse_string(result))
        Gs2InventoryAcquireItemSetWithGradeByUserIdMethodCache.put_cache(
            result_model,
            _gs2.cache,
            request_model.user_id,
            time_offset,
            request_model
        )
        for callback in acquire_item_set_with_grade_by_user_id_complete_callbacks:
            if callback is Callable and callback.is_valid():
                callback.call(transaction_id, request_model, result_model)
        return
    if method == "AddReferenceOfByUserId":
        var request_model = Gs2InventoryAddReferenceOfByUserIdRequest.from_dict(JSON.parse_string(request))
        var result_model = Gs2InventoryAddReferenceOfByUserIdResult.from_dict(JSON.parse_string(result))
        Gs2InventoryAddReferenceOfByUserIdMethodCache.put_cache(
            result_model,
            _gs2.cache,
            request_model.user_id,
            time_offset,
            request_model
        )
        for callback in add_reference_of_by_user_id_complete_callbacks:
            if callback is Callable and callback.is_valid():
                callback.call(transaction_id, request_model, result_model)
        return
    if method == "DeleteReferenceOfByUserId":
        var request_model = Gs2InventoryDeleteReferenceOfByUserIdRequest.from_dict(JSON.parse_string(request))
        var result_model = Gs2InventoryDeleteReferenceOfByUserIdResult.from_dict(JSON.parse_string(result))
        Gs2InventoryDeleteReferenceOfByUserIdMethodCache.put_cache(
            result_model,
            _gs2.cache,
            request_model.user_id,
            time_offset,
            request_model
        )
        for callback in delete_reference_of_by_user_id_complete_callbacks:
            if callback is Callable and callback.is_valid():
                callback.call(transaction_id, request_model, result_model)
        return
    if method == "AcquireSimpleItemsByUserId":
        var request_model = Gs2InventoryAcquireSimpleItemsByUserIdRequest.from_dict(JSON.parse_string(request))
        var result_model = Gs2InventoryAcquireSimpleItemsByUserIdResult.from_dict(JSON.parse_string(result))
        Gs2InventoryAcquireSimpleItemsByUserIdMethodCache.put_cache(
            result_model,
            _gs2.cache,
            request_model.user_id,
            time_offset,
            request_model
        )
        for callback in acquire_simple_items_by_user_id_complete_callbacks:
            if callback is Callable and callback.is_valid():
                callback.call(transaction_id, request_model, result_model)
        return
    if method == "SetSimpleItemsByUserId":
        var request_model = Gs2InventorySetSimpleItemsByUserIdRequest.from_dict(JSON.parse_string(request))
        var result_model = Gs2InventorySetSimpleItemsByUserIdResult.from_dict(JSON.parse_string(result))
        Gs2InventorySetSimpleItemsByUserIdMethodCache.put_cache(
            result_model,
            _gs2.cache,
            request_model.user_id,
            time_offset,
            request_model
        )
        for callback in set_simple_items_by_user_id_complete_callbacks:
            if callback is Callable and callback.is_valid():
                callback.call(transaction_id, request_model, result_model)
        return
    if method == "AcquireBigItemByUserId":
        var request_model = Gs2InventoryAcquireBigItemByUserIdRequest.from_dict(JSON.parse_string(request))
        var result_model = Gs2InventoryAcquireBigItemByUserIdResult.from_dict(JSON.parse_string(result))
        Gs2InventoryAcquireBigItemByUserIdMethodCache.put_cache(
            result_model,
            _gs2.cache,
            request_model.user_id,
            time_offset,
            request_model
        )
        for callback in acquire_big_item_by_user_id_complete_callbacks:
            if callback is Callable and callback.is_valid():
                callback.call(transaction_id, request_model, result_model)
        return
    if method == "SetBigItemByUserId":
        var request_model = Gs2InventorySetBigItemByUserIdRequest.from_dict(JSON.parse_string(request))
        var result_model = Gs2InventorySetBigItemByUserIdResult.from_dict(JSON.parse_string(result))
        Gs2InventorySetBigItemByUserIdMethodCache.put_cache(
            result_model,
            _gs2.cache,
            request_model.user_id,
            time_offset,
            request_model
        )
        for callback in set_big_item_by_user_id_complete_callbacks:
            if callback is Callable and callback.is_valid():
                callback.call(transaction_id, request_model, result_model)
        return
    pass


static var consume_item_set_by_user_id_complete_callbacks: Array = []


static var consume_simple_items_by_user_id_complete_callbacks: Array = []


static var consume_big_item_by_user_id_complete_callbacks: Array = []


func update_cache_from_stamp_task(
    task_id,
    time_offset,
    method: String,
    request,
    result
) -> void:
    if method == "ConsumeItemSetByUserId":
        var request_model = Gs2InventoryConsumeItemSetByUserIdRequest.from_dict(JSON.parse_string(request))
        var result_model = Gs2InventoryConsumeItemSetByUserIdResult.from_dict(JSON.parse_string(result))
        Gs2InventoryConsumeItemSetByUserIdMethodCache.put_cache(
            result_model,
            _gs2.cache,
            request_model.user_id,
            time_offset,
            request_model
        )
        for callback in consume_item_set_by_user_id_complete_callbacks:
            if callback is Callable and callback.is_valid():
                callback.call(task_id, request_model, result_model)
        return
    if method == "ConsumeSimpleItemsByUserId":
        var request_model = Gs2InventoryConsumeSimpleItemsByUserIdRequest.from_dict(JSON.parse_string(request))
        var result_model = Gs2InventoryConsumeSimpleItemsByUserIdResult.from_dict(JSON.parse_string(result))
        Gs2InventoryConsumeSimpleItemsByUserIdMethodCache.put_cache(
            result_model,
            _gs2.cache,
            request_model.user_id,
            time_offset,
            request_model
        )
        for callback in consume_simple_items_by_user_id_complete_callbacks:
            if callback is Callable and callback.is_valid():
                callback.call(task_id, request_model, result_model)
        return
    if method == "ConsumeBigItemByUserId":
        var request_model = Gs2InventoryConsumeBigItemByUserIdRequest.from_dict(JSON.parse_string(request))
        var result_model = Gs2InventoryConsumeBigItemByUserIdResult.from_dict(JSON.parse_string(result))
        Gs2InventoryConsumeBigItemByUserIdMethodCache.put_cache(
            result_model,
            _gs2.cache,
            request_model.user_id,
            time_offset,
            request_model
        )
        for callback in consume_big_item_by_user_id_complete_callbacks:
            if callback is Callable and callback.is_valid():
                callback.call(task_id, request_model, result_model)
        return
    pass


func update_cache_from_job_result(
    method: String,
    time_offset,
    job,
    result
) -> void:
    if method == "add_capacity_by_user_id":
        var request_model = Gs2InventoryAddCapacityByUserIdRequest.from_dict(JSON.parse_string(job.args))
        var result_model = Gs2InventoryAddCapacityByUserIdResult.from_dict(JSON.parse_string(result.result))
        Gs2InventoryAddCapacityByUserIdMethodCache.put_cache(
            result_model,
            _gs2.cache,
            request_model.user_id,
            time_offset,
            request_model
        )
        for callback in add_capacity_by_user_id_complete_callbacks:
            if callback is Callable and callback.is_valid():
                callback.call(job.job_id, request_model, result_model)
        return
    if method == "set_capacity_by_user_id":
        var request_model = Gs2InventorySetCapacityByUserIdRequest.from_dict(JSON.parse_string(job.args))
        var result_model = Gs2InventorySetCapacityByUserIdResult.from_dict(JSON.parse_string(result.result))
        Gs2InventorySetCapacityByUserIdMethodCache.put_cache(
            result_model,
            _gs2.cache,
            request_model.user_id,
            time_offset,
            request_model
        )
        for callback in set_capacity_by_user_id_complete_callbacks:
            if callback is Callable and callback.is_valid():
                callback.call(job.job_id, request_model, result_model)
        return
    if method == "acquire_item_set_by_user_id":
        var request_model = Gs2InventoryAcquireItemSetByUserIdRequest.from_dict(JSON.parse_string(job.args))
        var result_model = Gs2InventoryAcquireItemSetByUserIdResult.from_dict(JSON.parse_string(result.result))
        Gs2InventoryAcquireItemSetByUserIdMethodCache.put_cache(
            result_model,
            _gs2.cache,
            request_model.user_id,
            time_offset,
            request_model
        )
        for callback in acquire_item_set_by_user_id_complete_callbacks:
            if callback is Callable and callback.is_valid():
                callback.call(job.job_id, request_model, result_model)
        return
    if method == "acquire_item_set_with_grade_by_user_id":
        var request_model = Gs2InventoryAcquireItemSetWithGradeByUserIdRequest.from_dict(JSON.parse_string(job.args))
        var result_model = Gs2InventoryAcquireItemSetWithGradeByUserIdResult.from_dict(JSON.parse_string(result.result))
        Gs2InventoryAcquireItemSetWithGradeByUserIdMethodCache.put_cache(
            result_model,
            _gs2.cache,
            request_model.user_id,
            time_offset,
            request_model
        )
        for callback in acquire_item_set_with_grade_by_user_id_complete_callbacks:
            if callback is Callable and callback.is_valid():
                callback.call(job.job_id, request_model, result_model)
        return
    if method == "add_reference_of_by_user_id":
        var request_model = Gs2InventoryAddReferenceOfByUserIdRequest.from_dict(JSON.parse_string(job.args))
        var result_model = Gs2InventoryAddReferenceOfByUserIdResult.from_dict(JSON.parse_string(result.result))
        Gs2InventoryAddReferenceOfByUserIdMethodCache.put_cache(
            result_model,
            _gs2.cache,
            request_model.user_id,
            time_offset,
            request_model
        )
        for callback in add_reference_of_by_user_id_complete_callbacks:
            if callback is Callable and callback.is_valid():
                callback.call(job.job_id, request_model, result_model)
        return
    if method == "delete_reference_of_by_user_id":
        var request_model = Gs2InventoryDeleteReferenceOfByUserIdRequest.from_dict(JSON.parse_string(job.args))
        var result_model = Gs2InventoryDeleteReferenceOfByUserIdResult.from_dict(JSON.parse_string(result.result))
        Gs2InventoryDeleteReferenceOfByUserIdMethodCache.put_cache(
            result_model,
            _gs2.cache,
            request_model.user_id,
            time_offset,
            request_model
        )
        for callback in delete_reference_of_by_user_id_complete_callbacks:
            if callback is Callable and callback.is_valid():
                callback.call(job.job_id, request_model, result_model)
        return
    if method == "acquire_simple_items_by_user_id":
        var request_model = Gs2InventoryAcquireSimpleItemsByUserIdRequest.from_dict(JSON.parse_string(job.args))
        var result_model = Gs2InventoryAcquireSimpleItemsByUserIdResult.from_dict(JSON.parse_string(result.result))
        Gs2InventoryAcquireSimpleItemsByUserIdMethodCache.put_cache(
            result_model,
            _gs2.cache,
            request_model.user_id,
            time_offset,
            request_model
        )
        for callback in acquire_simple_items_by_user_id_complete_callbacks:
            if callback is Callable and callback.is_valid():
                callback.call(job.job_id, request_model, result_model)
        return
    if method == "set_simple_items_by_user_id":
        var request_model = Gs2InventorySetSimpleItemsByUserIdRequest.from_dict(JSON.parse_string(job.args))
        var result_model = Gs2InventorySetSimpleItemsByUserIdResult.from_dict(JSON.parse_string(result.result))
        Gs2InventorySetSimpleItemsByUserIdMethodCache.put_cache(
            result_model,
            _gs2.cache,
            request_model.user_id,
            time_offset,
            request_model
        )
        for callback in set_simple_items_by_user_id_complete_callbacks:
            if callback is Callable and callback.is_valid():
                callback.call(job.job_id, request_model, result_model)
        return
    if method == "acquire_big_item_by_user_id":
        var request_model = Gs2InventoryAcquireBigItemByUserIdRequest.from_dict(JSON.parse_string(job.args))
        var result_model = Gs2InventoryAcquireBigItemByUserIdResult.from_dict(JSON.parse_string(result.result))
        Gs2InventoryAcquireBigItemByUserIdMethodCache.put_cache(
            result_model,
            _gs2.cache,
            request_model.user_id,
            time_offset,
            request_model
        )
        for callback in acquire_big_item_by_user_id_complete_callbacks:
            if callback is Callable and callback.is_valid():
                callback.call(job.job_id, request_model, result_model)
        return
    if method == "set_big_item_by_user_id":
        var request_model = Gs2InventorySetBigItemByUserIdRequest.from_dict(JSON.parse_string(job.args))
        var result_model = Gs2InventorySetBigItemByUserIdResult.from_dict(JSON.parse_string(result.result))
        Gs2InventorySetBigItemByUserIdMethodCache.put_cache(
            result_model,
            _gs2.cache,
            request_model.user_id,
            time_offset,
            request_model
        )
        for callback in set_big_item_by_user_id_complete_callbacks:
            if callback is Callable and callback.is_valid():
                callback.call(job.job_id, request_model, result_model)
        return
    pass


func handle_notification(
    action: String,
    payload
) -> void:
    var data = JSON.parse_string(payload) if payload is String else payload
    pass