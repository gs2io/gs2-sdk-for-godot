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
class_name Gs2DistributorEzVerifyActionResult
extends RefCounted


var verify_request = null
var status_code = 0
var verify_result = null


func with_verify_request(v) -> Gs2DistributorEzVerifyActionResult:
    verify_request = v
    return self


func with_status_code(v) -> Gs2DistributorEzVerifyActionResult:
    status_code = v
    return self


func with_verify_result(v) -> Gs2DistributorEzVerifyActionResult:
    verify_result = v
    return self


func to_model() -> Gs2DistributorVerifyActionResult:
    var ret = Gs2DistributorVerifyActionResult.new()
    ret.verify_request = verify_request
    ret.status_code = status_code
    ret.verify_result = verify_result
    return ret


static func from_model(model) -> Gs2DistributorEzVerifyActionResult:
    var ret = Gs2DistributorEzVerifyActionResult.new()
    ret.verify_request = model.verify_request
    ret.status_code = 0 if model.status_code == null else model.status_code
    ret.verify_result = model.verify_result
    return ret