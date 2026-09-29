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

class_name Gs2JobQueueExecutor
extends RefCounted


const RUN_RETRY_TIMEOUT_MS = 15 * 1000

var _gs2: Gs2Domain
var _tasks: Array = []


func _init(gs2: Gs2Domain):
    _gs2 = gs2


func push(namespace_name) -> void:
    if namespace_name != null and not _tasks.has(namespace_name):
        _tasks.append(namespace_name)


static func _run_with_retry(run_impl: Callable) -> Gs2AsyncResult:
    var begin = Gs2CacheDatabase.now_ms()
    while true:
        var run_result = await run_impl.call()
        if run_result.error == null:
            return run_result
        if not Gs2TransactionDomainFactory.recommend_auto_retry(run_result.error):
            return run_result
        if Gs2CacheDatabase.now_ms() - begin > RUN_RETRY_TIMEOUT_MS:
            return run_result
        await Gs2Domain.wait_ms(Gs2Constant.RETRY_WAIT)
    return Gs2AsyncResult.new(null, null)


func run(access_token) -> Gs2AsyncResult:
    var namespace_name = null
    if _tasks.size() > 0:
        namespace_name = _tasks[0]
    if namespace_name != null:
        var run_result = await _run_with_retry(func(): return await Gs2JobQueue.new(_gs2) \
            .namespace_(namespace_name) \
            .access_token(access_token) \
            .run(Gs2JobQueueRunRequest.new()))
        if run_result.error != null:
            return run_result
        var job_domain = run_result.result
        if job_domain != null and job_domain.is_last_job != null and job_domain.is_last_job:
            _tasks.erase(namespace_name)
    return Gs2AsyncResult.new(_tasks.size() == 0, null)


func run_by_user_id(user_id) -> Gs2AsyncResult:
    var namespace_name = null
    if _tasks.size() > 0:
        namespace_name = _tasks[0]
    if namespace_name != null:
        var run_result = await _run_with_retry(func(): return await Gs2JobQueue.new(_gs2) \
            .namespace_(namespace_name) \
            .user(user_id) \
            .run(Gs2JobQueueRunByUserIdRequest.new()))
        if run_result.error != null:
            return run_result
        var job_domain = run_result.result
        if job_domain != null and job_domain.is_last_job != null and job_domain.is_last_job:
            _tasks.erase(namespace_name)
    return Gs2AsyncResult.new(_tasks.size() == 0, null)
