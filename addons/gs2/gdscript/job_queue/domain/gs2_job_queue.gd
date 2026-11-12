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
# deny overwrite
class_name Gs2JobQueue
extends RefCounted

signal push_notification(
    notification: Gs2JobQueuePushNotification
)

signal run_notification(
    notification: Gs2JobQueueRunNotification
)


static var _completed_jobs: Array = []


var _gs2: Gs2DomainCore
var _client: Gs2JobQueueRestClient
var url: Variant = null
var upload_token: Variant = null
var upload_url: Variant = null


func _init(
    gs2: Gs2DomainCore
):
    _gs2 = gs2
    _client = Gs2JobQueueRestClient.new(gs2.rest_session)


func create_namespace(
    request: Gs2JobQueueCreateNamespaceRequest
) -> Gs2AsyncResult:
    var async_result = await Gs2JobQueueCreateNamespaceMethodCache.invoke(
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
    var domain = Gs2JobQueueNamespaceDomain.new(
        _gs2,
        (null if ref == null else ref.name)
    )
    return Gs2AsyncResult.new(domain, null)


func dump_user_data(
    request: Gs2JobQueueDumpUserDataByUserIdRequest
) -> Gs2AsyncResult:
    var async_result = await Gs2JobQueueDumpUserDataByUserIdMethodCache.invoke(
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
    request: Gs2JobQueueCheckDumpUserDataByUserIdRequest
) -> Gs2AsyncResult:
    var async_result = await Gs2JobQueueCheckDumpUserDataByUserIdMethodCache.invoke(
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
    request: Gs2JobQueueCleanUserDataByUserIdRequest
) -> Gs2AsyncResult:
    var async_result = await Gs2JobQueueCleanUserDataByUserIdMethodCache.invoke(
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
    request: Gs2JobQueueCheckCleanUserDataByUserIdRequest
) -> Gs2AsyncResult:
    var async_result = await Gs2JobQueueCheckCleanUserDataByUserIdMethodCache.invoke(
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
    request: Gs2JobQueuePrepareImportUserDataByUserIdRequest
) -> Gs2AsyncResult:
    var async_result = await Gs2JobQueuePrepareImportUserDataByUserIdMethodCache.invoke(
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
    request: Gs2JobQueueImportUserDataByUserIdRequest
) -> Gs2AsyncResult:
    var async_result = await Gs2JobQueueImportUserDataByUserIdMethodCache.invoke(
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
    request: Gs2JobQueueCheckImportUserDataByUserIdRequest
) -> Gs2AsyncResult:
    var async_result = await Gs2JobQueueCheckImportUserDataByUserIdMethodCache.invoke(
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
) -> Gs2JobQueueDescribeNamespacesIterator:
    return Gs2JobQueueDescribeNamespacesIterator.new(
        _gs2,
        _client,
        name_prefix
    )


func subscribe_namespaces(
    callback: Callable,
    name_prefix = null
) -> int:
    return _gs2.cache.list_subscribe(
        "Gs2JobQueueNamespace",
        Gs2JobQueueNamespaceCache.cache_parent_key(
            null
        ),
        callback
    )


func unsubscribe_namespaces(
    callback_id: int,
    name_prefix = null
) -> void:
    _gs2.cache.list_unsubscribe(
        "Gs2JobQueueNamespace",
        Gs2JobQueueNamespaceCache.cache_parent_key(
            null
        ),
        callback_id
    )


func invalidate_namespaces(
    name_prefix = null
) -> void:
    _gs2.cache.clear_list_cache(
        "Gs2JobQueueNamespace",
        Gs2JobQueueNamespaceCache.cache_parent_key(
            null
        )
    )
func namespace_(
    namespace_name
) -> Gs2JobQueueNamespaceDomain:
    return Gs2JobQueueNamespaceDomain.new(
        _gs2,
        namespace_name
    )


static var push_by_user_id_complete_callbacks: Array = []


func update_cache_from_stamp_sheet(
    transaction_id,
    time_offset,
    method: String,
    request,
    result
) -> void:
    if method == "PushByUserId":
        var request_model = Gs2JobQueuePushByUserIdRequest.from_dict(JSON.parse_string(request))
        var result_model = Gs2JobQueuePushByUserIdResult.from_dict(JSON.parse_string(result))
        Gs2JobQueuePushByUserIdMethodCache.put_cache(
            result_model,
            _gs2.cache,
            request_model.user_id,
            time_offset,
            request_model
        )
        for callback in push_by_user_id_complete_callbacks:
            if callback is Callable and callback.is_valid():
                callback.call(transaction_id, request_model, result_model)
        return
    pass


static var delete_job_by_user_id_complete_callbacks: Array = []


func update_cache_from_stamp_task(
    task_id,
    time_offset,
    method: String,
    request,
    result
) -> void:
    if method == "DeleteJobByUserId":
        var request_model = Gs2JobQueueDeleteJobByUserIdRequest.from_dict(JSON.parse_string(request))
        var result_model = Gs2JobQueueDeleteJobByUserIdResult.from_dict(JSON.parse_string(result))
        Gs2JobQueueDeleteJobByUserIdMethodCache.put_cache(
            result_model,
            _gs2.cache,
            request_model.user_id,
            time_offset,
            request_model
        )
        for callback in delete_job_by_user_id_complete_callbacks:
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
    if method == "push_by_user_id":
        var request_model = Gs2JobQueuePushByUserIdRequest.from_dict(JSON.parse_string(job.args))
        var result_model = Gs2JobQueuePushByUserIdResult.from_dict(JSON.parse_string(result.result))
        Gs2JobQueuePushByUserIdMethodCache.put_cache(
            result_model,
            _gs2.cache,
            request_model.user_id,
            time_offset,
            request_model
        )
        for callback in push_by_user_id_complete_callbacks:
            if callback is Callable and callback.is_valid():
                callback.call(job.job_id, request_model, result_model)
        return
    pass


func handle_notification(
    action: String,
    payload
) -> void:
    var data = JSON.parse_string(payload) if payload is String else payload
    if action == "Push":
        var notification: Gs2JobQueuePushNotification = Gs2JobQueuePushNotification.from_dict(data)
        if notification == null:
            return
        push_notification.emit(notification)
        return
    if action == "RunNotification":
        var notification: Gs2JobQueueRunNotification = Gs2JobQueueRunNotification.from_dict(data)
        if notification == null:
            return
        _completed_jobs.append(notification)
        run_notification.emit(notification)
        return
    pass


static func dispatch(
    gs2: Gs2DomainCore,
    access_token
) -> Gs2AsyncResult:
    if _completed_jobs.size() == 0:
        return Gs2AsyncResult.new(null, null)
# diff --- start
#    var copied = _completed_jobs.duplicate()
#    _completed_jobs.clear()
#    for completed_job in copied:
#        var client = Gs2JobQueueRestClient.new(gs2.rest_session)
#        var async_result = await client.get_job_result(
#            Gs2JobQueueGetJobResultRequest.new()
#                .with_namespace_name(completed_job.namespace_name)
#                .with_job_name(completed_job.job_name)
#                .with_access_token(access_token.token)
#        )
#        if async_result.error != null:
#            if async_result.error is Gs2NotFoundException:
#                continue
#            return async_result
#        var result = async_result.result
#        if result != null and result.item != null:
#            gs2.update_cache_from_job_result(
#                Gs2JobQueueJob.new()
#                    .with_script_id(result.item.script_id)
#                    .with_args(result.item.args),
#                Gs2JobQueueJobResultBody.new()
#                    .with_try_number(result.item.try_number)
#                    .with_status_code(result.item.status_code)
#                    .with_result(result.item.result)
#                    .with_try_at(result.item.try_at)
#            )
#    return Gs2AsyncResult.new(null, null)
# diff --- end
# diff +++ start
    var copied = []
    for v in _completed_jobs:
        if v != null and v.user_id == access_token.user_id:
            copied.append(v)
    for v in copied:
        _completed_jobs.erase(v)
    for completed_job in copied:
        if completed_job == null:
            continue
        var auto_run = Gs2AutoJobQueueDomain.new(
            gs2,
            access_token,
            null,
            completed_job.namespace_name,
            completed_job.job_name
        )
        Gs2JobQueue.new(gs2).namespace_(
            completed_job.namespace_name
        ).access_token(
            access_token
        ).job(
            completed_job.job_name
        ).job_result().invalidate()
        var wait_result = await auto_run.wait()
        if wait_result.error != null:
            if wait_result.error is Gs2NotFoundException:
                continue
            return wait_result
    return Gs2AsyncResult.new(null, null)
# diff +++ end


# diff +++ start
static func dispatch_by_user_id(
    gs2: Gs2DomainCore,
    user_id
) -> Gs2AsyncResult:
    if _completed_jobs.size() == 0:
        return Gs2AsyncResult.new(null, null)
    var copied = []
    for v in _completed_jobs:
        if v != null and v.user_id == user_id:
            copied.append(v)
    for v in copied:
        _completed_jobs.erase(v)
    for completed_job in copied:
        if completed_job == null:
            continue
        var auto_run = Gs2AutoJobQueueDomain.new(
            gs2,
            null,
            user_id,
            completed_job.namespace_name,
            completed_job.job_name
        )
        var model_result = await Gs2JobQueue.new(gs2).namespace_(
            completed_job.namespace_name
        ).user(
            user_id
        ).job(
            completed_job.job_name
        ).job_result().model_no_cache()
        if model_result.error != null:
            if model_result.error is Gs2NotFoundException:
                continue
            return model_result
        var wait_result = await auto_run.wait()
        if wait_result.error != null:
            if wait_result.error is Gs2NotFoundException:
                continue
            return wait_result
    return Gs2AsyncResult.new(null, null)
# diff +++ end
