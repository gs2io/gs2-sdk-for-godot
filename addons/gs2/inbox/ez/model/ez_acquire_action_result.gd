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
class_name Gs2InboxEzAcquireActionResult
extends RefCounted


var action = null
var acquire_request = null
var status_code = 0
var acquire_result = null


func with_action(v) -> Gs2InboxEzAcquireActionResult:
    action = v
    return self


func with_acquire_request(v) -> Gs2InboxEzAcquireActionResult:
    acquire_request = v
    return self


func with_status_code(v) -> Gs2InboxEzAcquireActionResult:
    status_code = v
    return self


func with_acquire_result(v) -> Gs2InboxEzAcquireActionResult:
    acquire_result = v
    return self


func to_model() -> Gs2AcquireActionResult:
    var ret = Gs2AcquireActionResult.new()
    ret.action = action
    ret.acquire_request = acquire_request
    ret.status_code = status_code
    ret.acquire_result = acquire_result
    return ret


static func from_model(model) -> Gs2InboxEzAcquireActionResult:
    var ret = Gs2InboxEzAcquireActionResult.new()
    ret.action = model.action
    ret.acquire_request = model.acquire_request
    ret.status_code = 0 if model.status_code == null else model.status_code
    ret.acquire_result = model.acquire_result
    return ret