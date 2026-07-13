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
class_name Gs2VerifyActionResult
extends RefCounted


var action: Variant = null
var verify_request: Variant = null
var status_code: Variant = null
var verify_result: Variant = null


func with_action(v) -> Gs2VerifyActionResult:
    action = v
    return self


func with_verify_request(v) -> Gs2VerifyActionResult:
    verify_request = v
    return self


func with_status_code(v) -> Gs2VerifyActionResult:
    status_code = v
    return self


func with_verify_result(v) -> Gs2VerifyActionResult:
    verify_result = v
    return self


static func from_dict(data) -> Gs2VerifyActionResult:
    if data == null:
        return null
    var ret = Gs2VerifyActionResult.new()
    ret.action = data.get("action")
    ret.verify_request = data.get("verifyRequest")
    ret.status_code = null if data.get("statusCode") == null else int(data.get("statusCode"))
    ret.verify_result = data.get("verifyResult")
    return ret


func to_dict() -> Dictionary:
    var ret = {}
    ret["action"] = action
    ret["verifyRequest"] = verify_request
    ret["statusCode"] = status_code
    ret["verifyResult"] = verify_result
    return ret
