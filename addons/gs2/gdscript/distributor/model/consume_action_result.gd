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
class_name Gs2DistributorConsumeActionResult
extends RefCounted


var action = null
var consume_request = null
var status_code = null
var consume_result = null


func with_action(v) -> Gs2DistributorConsumeActionResult:
    action = v
    return self


func with_consume_request(v) -> Gs2DistributorConsumeActionResult:
    consume_request = v
    return self


func with_status_code(v) -> Gs2DistributorConsumeActionResult:
    status_code = v
    return self


func with_consume_result(v) -> Gs2DistributorConsumeActionResult:
    consume_result = v
    return self


static func from_dict(data) -> Gs2DistributorConsumeActionResult:
    if data == null:
        return null
    var ret = Gs2DistributorConsumeActionResult.new()
    ret.action = null if data.get("action") == null else str(data.get("action"))
    ret.consume_request = null if data.get("consumeRequest") == null else str(data.get("consumeRequest"))
    ret.status_code = null if data.get("statusCode") == null else int(data.get("statusCode"))
    ret.consume_result = null if data.get("consumeResult") == null else str(data.get("consumeResult"))
    return ret


func to_dict() -> Dictionary:
    var ret = {}
    ret["action"] = action
    ret["consumeRequest"] = consume_request
    ret["statusCode"] = status_code
    ret["consumeResult"] = consume_result
    return ret