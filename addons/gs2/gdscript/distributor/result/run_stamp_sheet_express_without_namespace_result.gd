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
class_name Gs2DistributorRunStampSheetExpressWithoutNamespaceResult
extends RefCounted


var verify_task_result_codes = null
var verify_task_results = null
var task_result_codes = null
var task_results = null
var sheet_result_code = null
var sheet_result = null
var metadata = null


func with_verify_task_result_codes(v) -> Gs2DistributorRunStampSheetExpressWithoutNamespaceResult:
    verify_task_result_codes = v
    return self


func with_verify_task_results(v) -> Gs2DistributorRunStampSheetExpressWithoutNamespaceResult:
    verify_task_results = v
    return self


func with_task_result_codes(v) -> Gs2DistributorRunStampSheetExpressWithoutNamespaceResult:
    task_result_codes = v
    return self


func with_task_results(v) -> Gs2DistributorRunStampSheetExpressWithoutNamespaceResult:
    task_results = v
    return self


func with_sheet_result_code(v) -> Gs2DistributorRunStampSheetExpressWithoutNamespaceResult:
    sheet_result_code = v
    return self


func with_sheet_result(v) -> Gs2DistributorRunStampSheetExpressWithoutNamespaceResult:
    sheet_result = v
    return self


func with_metadata(v) -> Gs2DistributorRunStampSheetExpressWithoutNamespaceResult:
    metadata = v
    return self


static func from_dict(data) -> Gs2DistributorRunStampSheetExpressWithoutNamespaceResult:
    if data == null:
        return null
    var ret = Gs2DistributorRunStampSheetExpressWithoutNamespaceResult.new()
    ret.verify_task_result_codes = null if data.get("verifyTaskResultCodes") == null else data.get("verifyTaskResultCodes").map(func(v): return int(v))
    ret.verify_task_results = null if data.get("verifyTaskResults") == null else data.get("verifyTaskResults").map(func(v): return str(v))
    ret.task_result_codes = null if data.get("taskResultCodes") == null else data.get("taskResultCodes").map(func(v): return int(v))
    ret.task_results = null if data.get("taskResults") == null else data.get("taskResults").map(func(v): return str(v))
    ret.sheet_result_code = null if data.get("sheetResultCode") == null else int(data.get("sheetResultCode"))
    ret.sheet_result = null if data.get("sheetResult") == null else str(data.get("sheetResult"))
    ret.metadata = null if data.get("metadata") == null else Gs2ResultMetadata.from_dict(data.get("metadata"))
    return ret


func to_dict() -> Dictionary:
    var ret = {}
    ret["verifyTaskResultCodes"] = verify_task_result_codes
    ret["verifyTaskResults"] = verify_task_results
    ret["taskResultCodes"] = task_result_codes
    ret["taskResults"] = task_results
    ret["sheetResultCode"] = sheet_result_code
    ret["sheetResult"] = sheet_result
    ret["metadata"] = null if metadata == null else metadata.to_dict()
    return ret