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
class_name Gs2DistributorEzRunStampSheetExpressWithoutNamespaceResult
extends RefCounted


var verify_task_result_codes = []
var verify_task_results = []
var task_result_codes = []
var task_results = []
var sheet_result_code = 0
var sheet_result = null


static func from_model(model) -> Gs2DistributorEzRunStampSheetExpressWithoutNamespaceResult:
    var ret = Gs2DistributorEzRunStampSheetExpressWithoutNamespaceResult.new()
    ret.verify_task_result_codes = [] if model.verify_task_result_codes == null else model.verify_task_result_codes.map(func(v): return v)
    ret.verify_task_results = [] if model.verify_task_results == null else model.verify_task_results.map(func(v): return v)
    ret.task_result_codes = [] if model.task_result_codes == null else model.task_result_codes.map(func(v): return v)
    ret.task_results = [] if model.task_results == null else model.task_results.map(func(v): return v)
    ret.sheet_result_code = 0 if model.sheet_result_code == null else model.sheet_result_code
    ret.sheet_result = model.sheet_result
    return ret