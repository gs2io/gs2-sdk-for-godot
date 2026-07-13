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
class_name Gs2DistributorAcquireActionResult
extends RefCounted


var action = null
var acquire_request = null
var status_code = null
var acquire_result = null


func with_action(v) -> Gs2DistributorAcquireActionResult:
    action = v
    return self


func with_acquire_request(v) -> Gs2DistributorAcquireActionResult:
    acquire_request = v
    return self


func with_status_code(v) -> Gs2DistributorAcquireActionResult:
    status_code = v
    return self


func with_acquire_result(v) -> Gs2DistributorAcquireActionResult:
    acquire_result = v
    return self


static func from_dict(data) -> Gs2DistributorAcquireActionResult:
    if data == null:
        return null
    var ret = Gs2DistributorAcquireActionResult.new()
    ret.action = null if data.get("action") == null else str(data.get("action"))
    ret.acquire_request = null if data.get("acquireRequest") == null else str(data.get("acquireRequest"))
    ret.status_code = null if data.get("statusCode") == null else int(data.get("statusCode"))
    ret.acquire_result = null if data.get("acquireResult") == null else str(data.get("acquireResult"))
    return ret


func to_dict() -> Dictionary:
    var ret = {}
    ret["action"] = action
    ret["acquireRequest"] = acquire_request
    ret["statusCode"] = status_code
    ret["acquireResult"] = acquire_result
    return ret