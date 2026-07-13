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
class_name Gs2DistributorVerifyActionResult
extends RefCounted


var action = null
var verify_request = null
var status_code = null
var verify_result = null


func with_action(v) -> Gs2DistributorVerifyActionResult:
    action = v
    return self


func with_verify_request(v) -> Gs2DistributorVerifyActionResult:
    verify_request = v
    return self


func with_status_code(v) -> Gs2DistributorVerifyActionResult:
    status_code = v
    return self


func with_verify_result(v) -> Gs2DistributorVerifyActionResult:
    verify_result = v
    return self


static func from_dict(data) -> Gs2DistributorVerifyActionResult:
    if data == null:
        return null
    var ret = Gs2DistributorVerifyActionResult.new()
    ret.action = null if data.get("action") == null else str(data.get("action"))
    ret.verify_request = null if data.get("verifyRequest") == null else str(data.get("verifyRequest"))
    ret.status_code = null if data.get("statusCode") == null else int(data.get("statusCode"))
    ret.verify_result = null if data.get("verifyResult") == null else str(data.get("verifyResult"))
    return ret


func to_dict() -> Dictionary:
    var ret = {}
    ret["action"] = action
    ret["verifyRequest"] = verify_request
    ret["statusCode"] = status_code
    ret["verifyResult"] = verify_result
    return ret