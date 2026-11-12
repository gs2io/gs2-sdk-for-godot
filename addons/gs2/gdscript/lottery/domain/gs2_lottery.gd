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
class_name Gs2Lottery
extends RefCounted



var _gs2: Gs2DomainCore
var _client: Gs2LotteryRestClient
var url: Variant = null
var upload_token: Variant = null
var upload_url: Variant = null


func _init(
    gs2: Gs2DomainCore
):
    _gs2 = gs2
    _client = Gs2LotteryRestClient.new(gs2.rest_session)


func create_namespace(
    request: Gs2LotteryCreateNamespaceRequest
) -> Gs2AsyncResult:
    var async_result = await Gs2LotteryCreateNamespaceMethodCache.invoke(
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
    var domain = Gs2LotteryNamespaceDomain.new(
        _gs2,
        (null if ref == null else ref.name)
    )
    return Gs2AsyncResult.new(domain, null)


func dump_user_data(
    request: Gs2LotteryDumpUserDataByUserIdRequest
) -> Gs2AsyncResult:
    var async_result = await Gs2LotteryDumpUserDataByUserIdMethodCache.invoke(
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
    request: Gs2LotteryCheckDumpUserDataByUserIdRequest
) -> Gs2AsyncResult:
    var async_result = await Gs2LotteryCheckDumpUserDataByUserIdMethodCache.invoke(
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
    request: Gs2LotteryCleanUserDataByUserIdRequest
) -> Gs2AsyncResult:
    var async_result = await Gs2LotteryCleanUserDataByUserIdMethodCache.invoke(
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
    request: Gs2LotteryCheckCleanUserDataByUserIdRequest
) -> Gs2AsyncResult:
    var async_result = await Gs2LotteryCheckCleanUserDataByUserIdMethodCache.invoke(
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
    request: Gs2LotteryPrepareImportUserDataByUserIdRequest
) -> Gs2AsyncResult:
    var async_result = await Gs2LotteryPrepareImportUserDataByUserIdMethodCache.invoke(
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
    request: Gs2LotteryImportUserDataByUserIdRequest
) -> Gs2AsyncResult:
    var async_result = await Gs2LotteryImportUserDataByUserIdMethodCache.invoke(
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
    request: Gs2LotteryCheckImportUserDataByUserIdRequest
) -> Gs2AsyncResult:
    var async_result = await Gs2LotteryCheckImportUserDataByUserIdMethodCache.invoke(
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
) -> Gs2LotteryDescribeNamespacesIterator:
    return Gs2LotteryDescribeNamespacesIterator.new(
        _gs2,
        _client,
        name_prefix
    )


func subscribe_namespaces(
    callback: Callable,
    name_prefix = null
) -> int:
    return _gs2.cache.list_subscribe(
        "Gs2LotteryNamespace",
        Gs2LotteryNamespaceCache.cache_parent_key(
            null
        ),
        callback
    )


func unsubscribe_namespaces(
    callback_id: int,
    name_prefix = null
) -> void:
    _gs2.cache.list_unsubscribe(
        "Gs2LotteryNamespace",
        Gs2LotteryNamespaceCache.cache_parent_key(
            null
        ),
        callback_id
    )


func invalidate_namespaces(
    name_prefix = null
) -> void:
    _gs2.cache.clear_list_cache(
        "Gs2LotteryNamespace",
        Gs2LotteryNamespaceCache.cache_parent_key(
            null
        )
    )
func namespace_(
    namespace_name
) -> Gs2LotteryNamespaceDomain:
    return Gs2LotteryNamespaceDomain.new(
        _gs2,
        namespace_name
    )


static var draw_by_user_id_complete_callbacks: Array = []


static var reset_box_by_user_id_complete_callbacks: Array = []


static var _draw_prize_index = 0


func clear_drawn_result(
    namespace_name
) -> void:
    _draw_prize_index = 0
    _gs2.cache.clear_list_cache(
        "Gs2LotteryDrawnPrize",
        Gs2LotteryDrawnPrizeCache.cache_parent_key(
            namespace_name,
            null
        )
    )


func update_cache_from_stamp_sheet(
    transaction_id,
    time_offset,
    method: String,
    request,
    result
) -> void:
    if method == "DrawByUserId":
        var request_model = Gs2LotteryDrawByUserIdRequest.from_dict(JSON.parse_string(request))
        var result_model = Gs2LotteryDrawByUserIdResult.from_dict(JSON.parse_string(result))
        for item in (result_model.items if result_model.items != null else []):
            _gs2.cache.put(
                "Gs2LotteryDrawnPrize",
                Gs2LotteryDrawnPrizeCache.cache_parent_key(
                    request_model.namespace_name,
                    null
                ),
                str(_draw_prize_index),
                item,
                0
            )
            _draw_prize_index += 1
        _gs2.cache.set_list_cached(
            "Gs2LotteryDrawnPrize",
            Gs2LotteryDrawnPrizeCache.cache_parent_key(
                request_model.namespace_name,
                null
            )
        )
        for callback in draw_by_user_id_complete_callbacks:
            if callback is Callable and callback.is_valid():
                callback.call(transaction_id, request_model, result_model)
        return
    if method == "ResetBoxByUserId":
        var request_model = Gs2LotteryResetBoxByUserIdRequest.from_dict(JSON.parse_string(request))
        var result_model = Gs2LotteryResetBoxByUserIdResult.from_dict(JSON.parse_string(result))
        Gs2LotteryResetBoxByUserIdMethodCache.put_cache(
            result_model,
            _gs2.cache,
            request_model.user_id,
            time_offset,
            request_model
        )
        for callback in reset_box_by_user_id_complete_callbacks:
            if callback is Callable and callback.is_valid():
                callback.call(transaction_id, request_model, result_model)
        return
    pass


func update_cache_from_stamp_task(
    task_id,
    time_offset,
    method: String,
    request,
    result
) -> void:
    pass


func update_cache_from_job_result(
    method: String,
    time_offset,
    job,
    result
) -> void:
    if method == "draw_by_user_id":
        var request_model = Gs2LotteryDrawByUserIdRequest.from_dict(JSON.parse_string(job.args))
        var result_model = Gs2LotteryDrawByUserIdResult.from_dict(JSON.parse_string(result.result))
        for item in (result_model.items if result_model.items != null else []):
            _gs2.cache.put(
                "Gs2LotteryDrawnPrize",
                Gs2LotteryDrawnPrizeCache.cache_parent_key(
                    request_model.namespace_name,
                    time_offset
                ),
                str(_draw_prize_index),
                item,
                0
            )
            _draw_prize_index += 1
        _gs2.cache.set_list_cached(
            "Gs2LotteryDrawnPrize",
            Gs2LotteryDrawnPrizeCache.cache_parent_key(
                request_model.namespace_name,
                time_offset
            )
        )
        for callback in draw_by_user_id_complete_callbacks:
            if callback is Callable and callback.is_valid():
                callback.call(job.job_id, request_model, result_model)
        return
    if method == "reset_box_by_user_id":
        var request_model = Gs2LotteryResetBoxByUserIdRequest.from_dict(JSON.parse_string(job.args))
        var result_model = Gs2LotteryResetBoxByUserIdResult.from_dict(JSON.parse_string(result.result))
        Gs2LotteryResetBoxByUserIdMethodCache.put_cache(
            result_model,
            _gs2.cache,
            request_model.user_id,
            time_offset,
            request_model
        )
        for callback in reset_box_by_user_id_complete_callbacks:
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