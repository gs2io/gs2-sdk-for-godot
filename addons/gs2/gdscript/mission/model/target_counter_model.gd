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
class_name Gs2MissionTargetCounterModel
extends RefCounted


var counter_name = null
var scope_type = null
var reset_type = null
var condition_name = null
var value = null


func with_counter_name(v) -> Gs2MissionTargetCounterModel:
    counter_name = v
    return self


func with_scope_type(v) -> Gs2MissionTargetCounterModel:
    scope_type = v
    return self


func with_reset_type(v) -> Gs2MissionTargetCounterModel:
    reset_type = v
    return self


func with_condition_name(v) -> Gs2MissionTargetCounterModel:
    condition_name = v
    return self


func with_value(v) -> Gs2MissionTargetCounterModel:
    value = v
    return self


static func from_dict(data) -> Gs2MissionTargetCounterModel:
    if data == null:
        return null
    var ret = Gs2MissionTargetCounterModel.new()
    ret.counter_name = null if data.get("counterName") == null else str(data.get("counterName"))
    ret.scope_type = null if data.get("scopeType") == null else str(data.get("scopeType"))
    ret.reset_type = null if data.get("resetType") == null else str(data.get("resetType"))
    ret.condition_name = null if data.get("conditionName") == null else str(data.get("conditionName"))
    ret.value = null if data.get("value") == null else int(data.get("value"))
    return ret


func to_dict() -> Dictionary:
    var ret = {}
    ret["counterName"] = counter_name
    ret["scopeType"] = scope_type
    ret["resetType"] = reset_type
    ret["conditionName"] = condition_name
    ret["value"] = value
    return ret