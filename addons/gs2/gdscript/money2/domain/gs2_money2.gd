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
class_name Gs2Money2
extends RefCounted

signal change_subscription_status(
    notification: Gs2Money2ChangeSubscriptionStatus
)



var _gs2: Gs2Domain
var _client: Gs2Money2RestClient
var url: Variant = null
var upload_token: Variant = null
var upload_url: Variant = null


func _init(
    gs2: Gs2Domain
):
    _gs2 = gs2
    _client = Gs2Money2RestClient.new(gs2.rest_session)


func create_namespace(
    request: Gs2Money2CreateNamespaceRequest
) -> Gs2AsyncResult:
    var async_result = await Gs2Money2CreateNamespaceMethodCache.invoke(
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
    var domain = Gs2Money2NamespaceDomain.new(
        _gs2,
        (null if ref == null else ref.name)
    )
    return Gs2AsyncResult.new(domain, null)


func dump_user_data(
    request: Gs2Money2DumpUserDataByUserIdRequest
) -> Gs2AsyncResult:
    var async_result = await Gs2Money2DumpUserDataByUserIdMethodCache.invoke(
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
    request: Gs2Money2CheckDumpUserDataByUserIdRequest
) -> Gs2AsyncResult:
    var async_result = await Gs2Money2CheckDumpUserDataByUserIdMethodCache.invoke(
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
    request: Gs2Money2CleanUserDataByUserIdRequest
) -> Gs2AsyncResult:
    var async_result = await Gs2Money2CleanUserDataByUserIdMethodCache.invoke(
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
    request: Gs2Money2CheckCleanUserDataByUserIdRequest
) -> Gs2AsyncResult:
    var async_result = await Gs2Money2CheckCleanUserDataByUserIdMethodCache.invoke(
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
    request: Gs2Money2PrepareImportUserDataByUserIdRequest
) -> Gs2AsyncResult:
    var async_result = await Gs2Money2PrepareImportUserDataByUserIdMethodCache.invoke(
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
    request: Gs2Money2ImportUserDataByUserIdRequest
) -> Gs2AsyncResult:
    var async_result = await Gs2Money2ImportUserDataByUserIdMethodCache.invoke(
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
    request: Gs2Money2CheckImportUserDataByUserIdRequest
) -> Gs2AsyncResult:
    var async_result = await Gs2Money2CheckImportUserDataByUserIdMethodCache.invoke(
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
) -> Gs2Money2DescribeNamespacesIterator:
    return Gs2Money2DescribeNamespacesIterator.new(
        _gs2,
        _client,
        name_prefix
    )


func subscribe_namespaces(
    callback: Callable,
    name_prefix = null
) -> int:
    return _gs2.cache.list_subscribe(
        "Gs2Money2Namespace",
        Gs2Money2NamespaceCache.cache_parent_key(
            null
        ),
        callback
    )


func unsubscribe_namespaces(
    callback_id: int,
    name_prefix = null
) -> void:
    _gs2.cache.list_unsubscribe(
        "Gs2Money2Namespace",
        Gs2Money2NamespaceCache.cache_parent_key(
            null
        ),
        callback_id
    )


func invalidate_namespaces(
    name_prefix = null
) -> void:
    _gs2.cache.clear_list_cache(
        "Gs2Money2Namespace",
        Gs2Money2NamespaceCache.cache_parent_key(
            null
        )
    )
func namespace_(
    namespace_name
) -> Gs2Money2NamespaceDomain:
    return Gs2Money2NamespaceDomain.new(
        _gs2,
        namespace_name
    )


static var deposit_by_user_id_complete_callbacks: Array = []


func update_cache_from_stamp_sheet(
    transaction_id,
    time_offset,
    method: String,
    request,
    result
) -> void:
    if method == "DepositByUserId":
        var request_model = Gs2Money2DepositByUserIdRequest.from_dict(JSON.parse_string(request))
        var result_model = Gs2Money2DepositByUserIdResult.from_dict(JSON.parse_string(result))
        Gs2Money2DepositByUserIdMethodCache.put_cache(
            result_model,
            _gs2.cache,
            request_model.user_id,
            time_offset,
            request_model
        )
        for callback in deposit_by_user_id_complete_callbacks:
            if callback is Callable and callback.is_valid():
                callback.call(transaction_id, request_model, result_model)
        return
    pass


static var withdraw_by_user_id_complete_callbacks: Array = []


static var verify_receipt_by_user_id_complete_callbacks: Array = []


func update_cache_from_stamp_task(
    task_id,
    time_offset,
    method: String,
    request,
    result
) -> void:
    if method == "WithdrawByUserId":
        var request_model = Gs2Money2WithdrawByUserIdRequest.from_dict(JSON.parse_string(request))
        var result_model = Gs2Money2WithdrawByUserIdResult.from_dict(JSON.parse_string(result))
        Gs2Money2WithdrawByUserIdMethodCache.put_cache(
            result_model,
            _gs2.cache,
            request_model.user_id,
            time_offset,
            request_model
        )
        for callback in withdraw_by_user_id_complete_callbacks:
            if callback is Callable and callback.is_valid():
                callback.call(task_id, request_model, result_model)
        return
    if method == "VerifyReceiptByUserId":
        var request_model = Gs2Money2VerifyReceiptByUserIdRequest.from_dict(JSON.parse_string(request))
        var result_model = Gs2Money2VerifyReceiptByUserIdResult.from_dict(JSON.parse_string(result))
        Gs2Money2VerifyReceiptByUserIdMethodCache.put_cache(
            result_model,
            _gs2.cache,
            request_model.user_id,
            time_offset,
            request_model
        )
        for callback in verify_receipt_by_user_id_complete_callbacks:
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
    if method == "deposit_by_user_id":
        var request_model = Gs2Money2DepositByUserIdRequest.from_dict(JSON.parse_string(job.args))
        var result_model = Gs2Money2DepositByUserIdResult.from_dict(JSON.parse_string(result.result))
        Gs2Money2DepositByUserIdMethodCache.put_cache(
            result_model,
            _gs2.cache,
            request_model.user_id,
            time_offset,
            request_model
        )
        for callback in deposit_by_user_id_complete_callbacks:
            if callback is Callable and callback.is_valid():
                callback.call(job.job_id, request_model, result_model)
        return
    pass


func handle_notification(
    action: String,
    payload
) -> void:
    var data = JSON.parse_string(payload) if payload is String else payload
    if action == "ChangeSubscriptionStatus":
        var notification: Gs2Money2ChangeSubscriptionStatus = Gs2Money2ChangeSubscriptionStatus.from_dict(data)
        if notification == null:
            return
        var n = notification
        _gs2.cache.clear_list_cache(
            "Gs2Money2SubscriptionStatus",
            Gs2Money2SubscriptionStatusCache.cache_parent_key(
                n.namespace_name,
                n.user_id,
                null
            )
        )
        Gs2Money2SubscriptionStatusCache.delete_cache(
            _gs2.cache,
            n.namespace_name,
            n.user_id,
            n.content_name,
            null
        )
        change_subscription_status.emit(notification)
        return
    pass