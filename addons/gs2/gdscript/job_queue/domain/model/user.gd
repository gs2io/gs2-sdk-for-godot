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
class_name Gs2JobQueueUserDomain
extends RefCounted

var _gs2: Gs2DomainCore
var _client: Gs2JobQueueRestClient
var namespace_name: Variant = null
var user_id: Variant = null
var auto_run: Variant = null
var is_last_job: Variant = null
var next_page_token: Variant = null


func _init(
    gs2: Gs2DomainCore,
    namespace_name_,
    user_id_
):
    _gs2 = gs2
    _client = Gs2JobQueueRestClient.new(gs2.rest_session)
    namespace_name = namespace_name_
    user_id = user_id_


func push(
    request: Gs2JobQueuePushByUserIdRequest
) -> Gs2AsyncResult:
    request = request.with_context_stack(_gs2.default_context_stack if request.context_stack == null or request.context_stack == "" else request.context_stack)
    request = request.with_namespace_name(namespace_name)
    request = request.with_user_id(user_id)
    var async_result = await Gs2JobQueuePushByUserIdMethodCache.invoke(
        _gs2.cache,
        user_id,
        null,
        request,
        func(): return await _client.push_by_user_id(request)
    )
    if async_result.error != null:
        return async_result
    var result = async_result.result
    var domain = []
    if result != null and result.items != null:
        for v in result.items:
            domain.append(Gs2JobQueueJobDomain.new(
                _gs2,
                namespace_name,
                (null if v == null else v.user_id),
                (null if v == null else v.name)
            ))
    if result != null and result.auto_run != null and not result.auto_run:
        _gs2.job_queue_domain.push(namespace_name)
    self.auto_run = null if result == null else result.auto_run
    return Gs2AsyncResult.new(domain, null)


func run(
    request: Gs2JobQueueRunByUserIdRequest
) -> Gs2AsyncResult:
    request = request.with_context_stack(_gs2.default_context_stack if request.context_stack == null or request.context_stack == "" else request.context_stack)
    request = request.with_namespace_name(namespace_name)
    request = request.with_user_id(user_id)
    var async_result = await Gs2JobQueueRunByUserIdMethodCache.invoke(
        _gs2.cache,
        user_id,
        null,
        request,
        func(): return await _client.run_by_user_id(request)
    )
    if async_result.error != null:
        return async_result
    var result = async_result.result
    if result != null and result.item != null:
        _gs2.update_cache_from_job_result(
            result.item,
            result.result
        )
    var ref = null if result == null else result.item
    var domain = Gs2JobQueueJobDomain.new(
        _gs2,
        namespace_name,
        (null if ref == null else ref.user_id),
        (null if ref == null else ref.name)
    )
    domain.is_last_job = null if result == null else result.is_last_job
    domain.item = null if result == null else result.item # diff +++
    domain.result = null if result == null else result.result # diff +++
    return Gs2AsyncResult.new(domain, null)


func jobs(
    time_offset_token = null
) -> Gs2JobQueueDescribeJobsByUserIdIterator:
    return Gs2JobQueueDescribeJobsByUserIdIterator.new(
        _gs2,
        _client,
        namespace_name,
        user_id,
        time_offset_token
    )


func subscribe_jobs(
    callback: Callable
) -> int:
    return _gs2.cache.list_subscribe(
        "Gs2JobQueueJob",
        Gs2JobQueueJobCache.cache_parent_key(
            namespace_name,
            user_id,
            null
        ),
        callback
    )


func unsubscribe_jobs(
    callback_id: int
) -> void:
    _gs2.cache.list_unsubscribe(
        "Gs2JobQueueJob",
        Gs2JobQueueJobCache.cache_parent_key(
            namespace_name,
            user_id,
            null
        ),
        callback_id
    )


func invalidate_jobs(
) -> void:
    _gs2.cache.clear_list_cache(
        "Gs2JobQueueJob",
        Gs2JobQueueJobCache.cache_parent_key(
            namespace_name,
            user_id,
            null
        )
    )
func job(
    job_name
) -> Gs2JobQueueJobDomain:
    return Gs2JobQueueJobDomain.new(
        _gs2,
        namespace_name,
        user_id,
        job_name
    )