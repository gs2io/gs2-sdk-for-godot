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

## サーバー側で自動実行されたジョブの結果を待機してキャッシュへ反映する。
## C# の AutoJobQueueDomain / AutoJobQueueAccessTokenDomain 相当。
class_name Gs2AutoJobQueueDomain
extends Gs2TransactionDomain


const TIMEOUT_MS = 10 * 1000

static var _handled: Dictionary = {}

var _namespace_name: Variant = null


func _init(gs2_, access_token_, user_id_, namespace_name, job_name_):
    super._init(gs2_, access_token_, user_id_, [])
    _namespace_name = namespace_name
    job_name = job_name_


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


# 戻り値: Gs2AsyncResult (result = 後続の Gs2TransactionDomain / null)
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
    var begin = Gs2CacheDatabase.now_ms()
    while true:
        if Gs2CacheDatabase.now_ms() - begin > TIMEOUT_MS:
            return Gs2AsyncResult.new(null, Gs2TransactionDomainFactory.timeout_error(
                "Failed to retrieve the results of the Job Queue execution: either there is some kind of failure in GS2, or the GS2-Gateway used for notification has not been configured for GS2-JobQueue used to execute the Job Queue, or the GS2-Gateway has a user ID setting to receive notifications. API may not have been invoked."
            ))
        var user_domain = null
        if access_token != null:
            user_domain = Gs2JobQueue.new(gs2).namespace_(_namespace_name).access_token(access_token)
        else:
            user_domain = Gs2JobQueue.new(gs2).namespace_(_namespace_name).user(_user_id)
        var domain = user_domain.job(job_name).job_result()
        var model_result = await domain.model()
        if model_result.error != null:
            domain.invalidate()
            if not Gs2TransactionDomainFactory.recommend_auto_retry(model_result.error):
                return model_result
            await Gs2Domain.yield_frame()
            continue
        if model_result.result == null:
            domain.invalidate()
            await Gs2Domain.wait_ms(Gs2Constant.RETRY_WAIT)
            if access_token != null:
                var dispatch_result = await Gs2JobQueue.dispatch(gs2, access_token)
                if dispatch_result.error != null:
                    return dispatch_result
            continue
        var result = model_result.result
        var job = Gs2JobQueueJob.new() \
            .with_job_id(result.job_id) \
            .with_name(Gs2JobQueueJob.get_job_name_from_grn(result.job_id)) \
            .with_user_id(Gs2JobQueueJob.get_user_id_from_grn(result.job_id)) \
            .with_script_id(result.script_id) \
            .with_args(result.args)
        var result_body = Gs2JobQueueJobResultBody.new() \
            .with_try_number(result.try_number) \
            .with_status_code(result.status_code) \
            .with_result(result.result)
        var transaction_result = _handle_result(job, result_body)
        if transaction_result.error != null:
            return transaction_result
        if all and transaction_result.result != null:
            return await transaction_result.result.wait(true)
        return transaction_result
    return Gs2AsyncResult.new(null, null)
