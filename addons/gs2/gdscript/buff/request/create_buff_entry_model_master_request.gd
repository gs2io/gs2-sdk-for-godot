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
class_name Gs2BuffCreateBuffEntryModelMasterRequest
extends Gs2Request


var namespace_name = null
var name = null
var description = null
var metadata = null
var expression = null
var target_type = null
var target_model = null
var target_action = null
var priority = null
var apply_period_schedule_event_id = null


func with_namespace_name(v) -> Gs2BuffCreateBuffEntryModelMasterRequest:
    namespace_name = v
    return self


func with_name(v) -> Gs2BuffCreateBuffEntryModelMasterRequest:
    name = v
    return self


func with_description(v) -> Gs2BuffCreateBuffEntryModelMasterRequest:
    description = v
    return self


func with_metadata(v) -> Gs2BuffCreateBuffEntryModelMasterRequest:
    metadata = v
    return self


func with_expression(v) -> Gs2BuffCreateBuffEntryModelMasterRequest:
    expression = v
    return self


func with_target_type(v) -> Gs2BuffCreateBuffEntryModelMasterRequest:
    target_type = v
    return self


func with_target_model(v) -> Gs2BuffCreateBuffEntryModelMasterRequest:
    target_model = v
    return self


func with_target_action(v) -> Gs2BuffCreateBuffEntryModelMasterRequest:
    target_action = v
    return self


func with_priority(v) -> Gs2BuffCreateBuffEntryModelMasterRequest:
    priority = v
    return self


func with_apply_period_schedule_event_id(v) -> Gs2BuffCreateBuffEntryModelMasterRequest:
    apply_period_schedule_event_id = v
    return self


static func from_dict(data) -> Gs2BuffCreateBuffEntryModelMasterRequest:
    if data == null:
        return null
    var ret = Gs2BuffCreateBuffEntryModelMasterRequest.new()
    ret.namespace_name = null if data.get("namespaceName") == null else str(data.get("namespaceName"))
    ret.name = null if data.get("name") == null else str(data.get("name"))
    ret.description = null if data.get("description") == null else str(data.get("description"))
    ret.metadata = null if data.get("metadata") == null else str(data.get("metadata"))
    ret.expression = null if data.get("expression") == null else str(data.get("expression"))
    ret.target_type = null if data.get("targetType") == null else str(data.get("targetType"))
    ret.target_model = null if data.get("targetModel") == null else Gs2BuffBuffTargetModel.from_dict(data.get("targetModel"))
    ret.target_action = null if data.get("targetAction") == null else Gs2BuffBuffTargetAction.from_dict(data.get("targetAction"))
    ret.priority = null if data.get("priority") == null else int(data.get("priority"))
    ret.apply_period_schedule_event_id = null if data.get("applyPeriodScheduleEventId") == null else str(data.get("applyPeriodScheduleEventId"))
    return ret


func to_dict() -> Dictionary:
    var ret = {}
    ret["namespaceName"] = namespace_name
    ret["name"] = name
    ret["description"] = description
    ret["metadata"] = metadata
    ret["expression"] = expression
    ret["targetType"] = target_type
    ret["targetModel"] = null if target_model == null else target_model.to_dict()
    ret["targetAction"] = null if target_action == null else target_action.to_dict()
    ret["priority"] = priority
    ret["applyPeriodScheduleEventId"] = apply_period_schedule_event_id
    return ret