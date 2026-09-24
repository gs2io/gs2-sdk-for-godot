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
class_name Gs2SeasonRatingTransactionSetting
extends RefCounted


var enable_atomic_commit = null
var transaction_use_distributor = null
var commit_script_result_in_use_distributor = null
var acquire_action_use_job_queue = null
var enable_sequential_execution = null
var distributor_namespace_id = null
var queue_namespace_id = null


func with_enable_atomic_commit(v) -> Gs2SeasonRatingTransactionSetting:
    enable_atomic_commit = v
    return self


func with_transaction_use_distributor(v) -> Gs2SeasonRatingTransactionSetting:
    transaction_use_distributor = v
    return self


func with_commit_script_result_in_use_distributor(v) -> Gs2SeasonRatingTransactionSetting:
    commit_script_result_in_use_distributor = v
    return self


func with_acquire_action_use_job_queue(v) -> Gs2SeasonRatingTransactionSetting:
    acquire_action_use_job_queue = v
    return self


func with_enable_sequential_execution(v) -> Gs2SeasonRatingTransactionSetting:
    enable_sequential_execution = v
    return self


func with_distributor_namespace_id(v) -> Gs2SeasonRatingTransactionSetting:
    distributor_namespace_id = v
    return self


func with_queue_namespace_id(v) -> Gs2SeasonRatingTransactionSetting:
    queue_namespace_id = v
    return self


static func from_dict(data) -> Gs2SeasonRatingTransactionSetting:
    if data == null:
        return null
    var ret = Gs2SeasonRatingTransactionSetting.new()
    ret.enable_atomic_commit = null if data.get("enableAtomicCommit") == null else bool(data.get("enableAtomicCommit"))
    ret.transaction_use_distributor = null if data.get("transactionUseDistributor") == null else bool(data.get("transactionUseDistributor"))
    ret.commit_script_result_in_use_distributor = null if data.get("commitScriptResultInUseDistributor") == null else bool(data.get("commitScriptResultInUseDistributor"))
    ret.acquire_action_use_job_queue = null if data.get("acquireActionUseJobQueue") == null else bool(data.get("acquireActionUseJobQueue"))
    ret.enable_sequential_execution = null if data.get("enableSequentialExecution") == null else bool(data.get("enableSequentialExecution"))
    ret.distributor_namespace_id = null if data.get("distributorNamespaceId") == null else str(data.get("distributorNamespaceId"))
    ret.queue_namespace_id = null if data.get("queueNamespaceId") == null else str(data.get("queueNamespaceId"))
    return ret


func to_dict() -> Dictionary:
    var ret = {}
    ret["enableAtomicCommit"] = enable_atomic_commit
    ret["transactionUseDistributor"] = transaction_use_distributor
    ret["commitScriptResultInUseDistributor"] = commit_script_result_in_use_distributor
    ret["acquireActionUseJobQueue"] = acquire_action_use_job_queue
    ret["enableSequentialExecution"] = enable_sequential_execution
    ret["distributorNamespaceId"] = distributor_namespace_id
    ret["queueNamespaceId"] = queue_namespace_id
    return ret