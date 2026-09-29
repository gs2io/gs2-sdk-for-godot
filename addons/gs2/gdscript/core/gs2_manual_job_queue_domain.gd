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

class_name Gs2ManualJobQueueDomain
extends Gs2TransactionDomain


const RUN_RETRY_TIMEOUT_MS = 15 * 1000

static var _handled: Dictionary = {}

var _namespace_name: Variant = null


func _init(gs2_, access_token_, user_id_, namespace_name, job_name_):
    super._init(gs2_, access_token_, user_id_, [])
    _namespace_name = namespace_name
    job_name = job_name_


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


func _skip_callback() -> bool:
    if _handled.has(job_name):
        var now = Gs2CacheDatabase.now_ms()
        var filtered = {}
        for k in _handled:
            if _handled[k] >= now:
                filtered[k] = _handled[k]
        _handled = filtered
        return true
    _handled[job_name] = Gs2CacheDatabase.now_ms() + 3 * 60 * 1000
    return false


func _handle_result(job, result) -> Gs2AsyncResult:
    var code = result.status_code if result.status_code != null else 0
    if int(code / 100.0) != 2:
        return Gs2AsyncResult.new(null, Gs2Exception.extract_error(result.result, code))
    if not _skip_callback():
        gs2.update_cache_from_job_result(job, result, _time_offset())
    var next_transactions = []
    if job.script_id != null and job.script_id.ends_with("push_by_user_id"):
        _append_next_transactions("Gs2JobQueue:PushByUserId", result.result, next_transactions)
    else:
        _append_next_transactions(null, result.result, next_transactions)
    if next_transactions.size() > 0:
        return Gs2AsyncResult.new(Gs2TransactionDomain.new(gs2, access_token, _user_id, next_transactions), null)
    return Gs2AsyncResult.new(null, null)


func wait(all: bool = false) -> Gs2AsyncResult:
    while true:
        var user_domain = null
        if access_token != null:
            user_domain = Gs2JobQueue.new(gs2).namespace_(_namespace_name).access_token(access_token)
            var run_result = await _run_with_retry(func(): return await user_domain.run(Gs2JobQueueRunRequest.new()))
            if run_result.error != null:
                return run_result
            var job_domain = run_result.result
            if job_domain == null or (job_domain.is_last_job == null or job_domain.is_last_job):
                return Gs2AsyncResult.new(null, null)
            var model_result = await job_domain.model()
            if model_result.error != null:
                return model_result
            var job = model_result.result
            if job == null:
                return Gs2AsyncResult.new(null, null)
            var handle_result = _handle_result(job, job_domain.result)
            if handle_result.error != null:
                return handle_result
            if job.name != job_name:
                continue
            if all and handle_result.result != null:
                return await handle_result.result.wait(true)
            return handle_result
        else:
            user_domain = Gs2JobQueue.new(gs2).namespace_(_namespace_name).user(_user_id)
            var run_result = await _run_with_retry(func(): return await user_domain.run(Gs2JobQueueRunByUserIdRequest.new()))
            if run_result.error != null:
                return run_result
            var job_domain = run_result.result
            if job_domain == null or (job_domain.is_last_job == null or job_domain.is_last_job):
                return Gs2AsyncResult.new(null, null)
            var model_result = await job_domain.model()
            if model_result.error != null:
                return model_result
            var job = model_result.result
            if job == null:
                return Gs2AsyncResult.new(null, null)
            var handle_result = _handle_result(job, job_domain.result)
            if handle_result.error != null:
                return handle_result
            if job.name != job_name:
                continue
            if all and handle_result.result != null:
                return await handle_result.result.wait(true)
            return handle_result
    return Gs2AsyncResult.new(null, null)
