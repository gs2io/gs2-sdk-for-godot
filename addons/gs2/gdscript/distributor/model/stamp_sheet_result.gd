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
class_name Gs2DistributorStampSheetResult
extends RefCounted


var stamp_sheet_result_id = null
var user_id = null
var transaction_id = null
var verify_task_requests = null
var task_requests = null
var sheet_request = null
var verify_task_result_codes = null
var verify_task_results = null
var task_result_codes = null
var task_results = null
var sheet_result_code = null
var sheet_result = null
var next_transaction_id = null
var created_at = null
var revision = null


func with_stamp_sheet_result_id(v) -> Gs2DistributorStampSheetResult:
    stamp_sheet_result_id = v
    return self


func with_user_id(v) -> Gs2DistributorStampSheetResult:
    user_id = v
    return self


func with_transaction_id(v) -> Gs2DistributorStampSheetResult:
    transaction_id = v
    return self


func with_verify_task_requests(v) -> Gs2DistributorStampSheetResult:
    verify_task_requests = v
    return self


func with_task_requests(v) -> Gs2DistributorStampSheetResult:
    task_requests = v
    return self


func with_sheet_request(v) -> Gs2DistributorStampSheetResult:
    sheet_request = v
    return self


func with_verify_task_result_codes(v) -> Gs2DistributorStampSheetResult:
    verify_task_result_codes = v
    return self


func with_verify_task_results(v) -> Gs2DistributorStampSheetResult:
    verify_task_results = v
    return self


func with_task_result_codes(v) -> Gs2DistributorStampSheetResult:
    task_result_codes = v
    return self


func with_task_results(v) -> Gs2DistributorStampSheetResult:
    task_results = v
    return self


func with_sheet_result_code(v) -> Gs2DistributorStampSheetResult:
    sheet_result_code = v
    return self


func with_sheet_result(v) -> Gs2DistributorStampSheetResult:
    sheet_result = v
    return self


func with_next_transaction_id(v) -> Gs2DistributorStampSheetResult:
    next_transaction_id = v
    return self


func with_created_at(v) -> Gs2DistributorStampSheetResult:
    created_at = v
    return self


func with_revision(v) -> Gs2DistributorStampSheetResult:
    revision = v
    return self


static func get_region_from_grn(grn):
    if grn == null:
        return null
    var regex = RegEx.new()
    regex.compile("grn:gs2:(?<region>.+):(?<ownerId>.+):distributor:(?<namespaceName>.+):user:(?<userId>.+):stampSheet:result:(?<transactionId>.+)")
    var matched = regex.search(grn)
    if matched == null:
        return null
    return matched.get_string("region")


static func get_owner_id_from_grn(grn):
    if grn == null:
        return null
    var regex = RegEx.new()
    regex.compile("grn:gs2:(?<region>.+):(?<ownerId>.+):distributor:(?<namespaceName>.+):user:(?<userId>.+):stampSheet:result:(?<transactionId>.+)")
    var matched = regex.search(grn)
    if matched == null:
        return null
    return matched.get_string("ownerId")


static func get_namespace_name_from_grn(grn):
    if grn == null:
        return null
    var regex = RegEx.new()
    regex.compile("grn:gs2:(?<region>.+):(?<ownerId>.+):distributor:(?<namespaceName>.+):user:(?<userId>.+):stampSheet:result:(?<transactionId>.+)")
    var matched = regex.search(grn)
    if matched == null:
        return null
    return matched.get_string("namespaceName")


static func get_user_id_from_grn(grn):
    if grn == null:
        return null
    var regex = RegEx.new()
    regex.compile("grn:gs2:(?<region>.+):(?<ownerId>.+):distributor:(?<namespaceName>.+):user:(?<userId>.+):stampSheet:result:(?<transactionId>.+)")
    var matched = regex.search(grn)
    if matched == null:
        return null
    return matched.get_string("userId")


static func get_transaction_id_from_grn(grn):
    if grn == null:
        return null
    var regex = RegEx.new()
    regex.compile("grn:gs2:(?<region>.+):(?<ownerId>.+):distributor:(?<namespaceName>.+):user:(?<userId>.+):stampSheet:result:(?<transactionId>.+)")
    var matched = regex.search(grn)
    if matched == null:
        return null
    return matched.get_string("transactionId")


static func from_dict(data) -> Gs2DistributorStampSheetResult:
    if data == null:
        return null
    var ret = Gs2DistributorStampSheetResult.new()
    ret.stamp_sheet_result_id = null if data.get("stampSheetResultId") == null else str(data.get("stampSheetResultId"))
    ret.user_id = null if data.get("userId") == null else str(data.get("userId"))
    ret.transaction_id = null if data.get("transactionId") == null else str(data.get("transactionId"))
    ret.verify_task_requests = null if data.get("verifyTaskRequests") == null else data.get("verifyTaskRequests").map(func(v): return Gs2VerifyAction.from_dict(v))
    ret.task_requests = null if data.get("taskRequests") == null else data.get("taskRequests").map(func(v): return Gs2ConsumeAction.from_dict(v))
    ret.sheet_request = null if data.get("sheetRequest") == null else Gs2AcquireAction.from_dict(data.get("sheetRequest"))
    ret.verify_task_result_codes = null if data.get("verifyTaskResultCodes") == null else data.get("verifyTaskResultCodes").map(func(v): return int(v))
    ret.verify_task_results = null if data.get("verifyTaskResults") == null else data.get("verifyTaskResults").map(func(v): return str(v))
    ret.task_result_codes = null if data.get("taskResultCodes") == null else data.get("taskResultCodes").map(func(v): return int(v))
    ret.task_results = null if data.get("taskResults") == null else data.get("taskResults").map(func(v): return str(v))
    ret.sheet_result_code = null if data.get("sheetResultCode") == null else int(data.get("sheetResultCode"))
    ret.sheet_result = null if data.get("sheetResult") == null else str(data.get("sheetResult"))
    ret.next_transaction_id = null if data.get("nextTransactionId") == null else str(data.get("nextTransactionId"))
    ret.created_at = null if data.get("createdAt") == null else int(data.get("createdAt"))
    ret.revision = null if data.get("revision") == null else int(data.get("revision"))
    return ret


func to_dict() -> Dictionary:
    var ret = {}
    ret["stampSheetResultId"] = stamp_sheet_result_id
    ret["userId"] = user_id
    ret["transactionId"] = transaction_id
    ret["verifyTaskRequests"] = null if verify_task_requests == null else verify_task_requests.map(func(v): return null if v == null else v.to_dict())
    ret["taskRequests"] = null if task_requests == null else task_requests.map(func(v): return null if v == null else v.to_dict())
    ret["sheetRequest"] = null if sheet_request == null else sheet_request.to_dict()
    ret["verifyTaskResultCodes"] = verify_task_result_codes
    ret["verifyTaskResults"] = verify_task_results
    ret["taskResultCodes"] = task_result_codes
    ret["taskResults"] = task_results
    ret["sheetResultCode"] = sheet_result_code
    ret["sheetResult"] = sheet_result
    ret["nextTransactionId"] = next_transaction_id
    ret["createdAt"] = created_at
    ret["revision"] = revision
    return ret