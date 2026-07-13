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
class_name Gs2BuffBuffTargetAction
extends RefCounted


var target_action_name = null
var target_field_name = null
var condition_grns = null
var rate = null


func with_target_action_name(v) -> Gs2BuffBuffTargetAction:
    target_action_name = v
    return self


func with_target_field_name(v) -> Gs2BuffBuffTargetAction:
    target_field_name = v
    return self


func with_condition_grns(v) -> Gs2BuffBuffTargetAction:
    condition_grns = v
    return self


func with_rate(v) -> Gs2BuffBuffTargetAction:
    rate = v
    return self


static func from_dict(data) -> Gs2BuffBuffTargetAction:
    if data == null:
        return null
    var ret = Gs2BuffBuffTargetAction.new()
    ret.target_action_name = null if data.get("targetActionName") == null else str(data.get("targetActionName"))
    ret.target_field_name = null if data.get("targetFieldName") == null else str(data.get("targetFieldName"))
    ret.condition_grns = null if data.get("conditionGrns") == null else data.get("conditionGrns").map(func(v): return Gs2BuffBuffTargetGrn.from_dict(v))
    ret.rate = null if data.get("rate") == null else float(data.get("rate"))
    return ret


func to_dict() -> Dictionary:
    var ret = {}
    ret["targetActionName"] = target_action_name
    ret["targetFieldName"] = target_field_name
    ret["conditionGrns"] = null if condition_grns == null else condition_grns.map(func(v): return null if v == null else v.to_dict())
    ret["rate"] = rate
    return ret