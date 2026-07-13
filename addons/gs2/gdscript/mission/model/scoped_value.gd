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
class_name Gs2MissionScopedValue
extends RefCounted


var scope_type = null
var reset_type = null
var condition_name = null
var value = null
var next_reset_at = null
var updated_at = null


func with_scope_type(v) -> Gs2MissionScopedValue:
    scope_type = v
    return self


func with_reset_type(v) -> Gs2MissionScopedValue:
    reset_type = v
    return self


func with_condition_name(v) -> Gs2MissionScopedValue:
    condition_name = v
    return self


func with_value(v) -> Gs2MissionScopedValue:
    value = v
    return self


func with_next_reset_at(v) -> Gs2MissionScopedValue:
    next_reset_at = v
    return self


func with_updated_at(v) -> Gs2MissionScopedValue:
    updated_at = v
    return self


static func from_dict(data) -> Gs2MissionScopedValue:
    if data == null:
        return null
    var ret = Gs2MissionScopedValue.new()
    ret.scope_type = null if data.get("scopeType") == null else str(data.get("scopeType"))
    ret.reset_type = null if data.get("resetType") == null else str(data.get("resetType"))
    ret.condition_name = null if data.get("conditionName") == null else str(data.get("conditionName"))
    ret.value = null if data.get("value") == null else int(data.get("value"))
    ret.next_reset_at = null if data.get("nextResetAt") == null else int(data.get("nextResetAt"))
    ret.updated_at = null if data.get("updatedAt") == null else int(data.get("updatedAt"))
    return ret


func to_dict() -> Dictionary:
    var ret = {}
    ret["scopeType"] = scope_type
    ret["resetType"] = reset_type
    ret["conditionName"] = condition_name
    ret["value"] = value
    ret["nextResetAt"] = next_reset_at
    ret["updatedAt"] = updated_at
    return ret