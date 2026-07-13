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
class_name Gs2MissionEzConsumeActionResult
extends RefCounted


var action = null
var consume_request = null
var status_code = 0
var consume_result = null


func with_action(v) -> Gs2MissionEzConsumeActionResult:
    action = v
    return self


func with_consume_request(v) -> Gs2MissionEzConsumeActionResult:
    consume_request = v
    return self


func with_status_code(v) -> Gs2MissionEzConsumeActionResult:
    status_code = v
    return self


func with_consume_result(v) -> Gs2MissionEzConsumeActionResult:
    consume_result = v
    return self


func to_model() -> Gs2ConsumeActionResult:
    var ret = Gs2ConsumeActionResult.new()
    ret.action = action
    ret.consume_request = consume_request
    ret.status_code = status_code
    ret.consume_result = consume_result
    return ret


static func from_model(model) -> Gs2MissionEzConsumeActionResult:
    var ret = Gs2MissionEzConsumeActionResult.new()
    ret.action = model.action
    ret.consume_request = model.consume_request
    ret.status_code = 0 if model.status_code == null else model.status_code
    ret.consume_result = model.consume_result
    return ret