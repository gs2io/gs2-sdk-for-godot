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
class_name Gs2DistributorEzStampSheetResult
extends RefCounted


var transaction_id = null
var task_requests = []
var sheet_request = null
var task_results = []
var sheet_result = null


func with_transaction_id(v) -> Gs2DistributorEzStampSheetResult:
    transaction_id = v
    return self


func with_task_requests(v) -> Gs2DistributorEzStampSheetResult:
    task_requests = v
    return self


func with_sheet_request(v) -> Gs2DistributorEzStampSheetResult:
    sheet_request = v
    return self


func with_task_results(v) -> Gs2DistributorEzStampSheetResult:
    task_results = v
    return self


func with_sheet_result(v) -> Gs2DistributorEzStampSheetResult:
    sheet_result = v
    return self


func to_model() -> Gs2DistributorStampSheetResult:
    var ret = Gs2DistributorStampSheetResult.new()
    ret.transaction_id = transaction_id
    ret.task_requests = null if task_requests == null else task_requests.map(func(v): return null if v == null else v.to_model())
    ret.sheet_request = null if sheet_request == null else sheet_request.to_model()
    ret.task_results = null if task_results == null else task_results.map(func(v): return v)
    ret.sheet_result = sheet_result
    return ret


static func from_model(model) -> Gs2DistributorEzStampSheetResult:
    var ret = Gs2DistributorEzStampSheetResult.new()
    ret.transaction_id = model.transaction_id
    ret.task_requests = [] if model.task_requests == null else model.task_requests.map(func(v): return Gs2EzConsumeAction.from_model(v))
    ret.sheet_request = null if model.sheet_request == null else Gs2EzAcquireAction.from_model(model.sheet_request)
    ret.task_results = [] if model.task_results == null else model.task_results.map(func(v): return v)
    ret.sheet_result = model.sheet_result
    return ret