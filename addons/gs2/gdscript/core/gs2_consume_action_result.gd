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
class_name Gs2ConsumeActionResult
extends RefCounted


var action: Variant = null
var consume_request: Variant = null
var status_code: Variant = null
var consume_result: Variant = null


func with_action(v) -> Gs2ConsumeActionResult:
    action = v
    return self


func with_consume_request(v) -> Gs2ConsumeActionResult:
    consume_request = v
    return self


func with_status_code(v) -> Gs2ConsumeActionResult:
    status_code = v
    return self


func with_consume_result(v) -> Gs2ConsumeActionResult:
    consume_result = v
    return self


static func from_dict(data) -> Gs2ConsumeActionResult:
    if data == null:
        return null
    var ret = Gs2ConsumeActionResult.new()
    ret.action = data.get("action")
    ret.consume_request = data.get("consumeRequest")
    ret.status_code = null if data.get("statusCode") == null else int(data.get("statusCode"))
    ret.consume_result = data.get("consumeResult")
    return ret


func to_dict() -> Dictionary:
    var ret = {}
    ret["action"] = action
    ret["consumeRequest"] = consume_request
    ret["statusCode"] = status_code
    ret["consumeResult"] = consume_result
    return ret
