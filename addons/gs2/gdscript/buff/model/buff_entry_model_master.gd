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
class_name Gs2BuffBuffEntryModelMaster
extends RefCounted


var buff_entry_model_id = null
var name = null
var description = null
var metadata = null
var expression = null
var target_type = null
var target_model = null
var target_action = null
var priority = null
var apply_period_schedule_event_id = null
var created_at = null
var updated_at = null
var revision = null


func with_buff_entry_model_id(v) -> Gs2BuffBuffEntryModelMaster:
    buff_entry_model_id = v
    return self


func with_name(v) -> Gs2BuffBuffEntryModelMaster:
    name = v
    return self


func with_description(v) -> Gs2BuffBuffEntryModelMaster:
    description = v
    return self


func with_metadata(v) -> Gs2BuffBuffEntryModelMaster:
    metadata = v
    return self


func with_expression(v) -> Gs2BuffBuffEntryModelMaster:
    expression = v
    return self


func with_target_type(v) -> Gs2BuffBuffEntryModelMaster:
    target_type = v
    return self


func with_target_model(v) -> Gs2BuffBuffEntryModelMaster:
    target_model = v
    return self


func with_target_action(v) -> Gs2BuffBuffEntryModelMaster:
    target_action = v
    return self


func with_priority(v) -> Gs2BuffBuffEntryModelMaster:
    priority = v
    return self


func with_apply_period_schedule_event_id(v) -> Gs2BuffBuffEntryModelMaster:
    apply_period_schedule_event_id = v
    return self


func with_created_at(v) -> Gs2BuffBuffEntryModelMaster:
    created_at = v
    return self


func with_updated_at(v) -> Gs2BuffBuffEntryModelMaster:
    updated_at = v
    return self


func with_revision(v) -> Gs2BuffBuffEntryModelMaster:
    revision = v
    return self


static func get_region_from_grn(grn):
    if grn == null:
        return null
    var regex = RegEx.new()
    regex.compile("grn:gs2:(?<region>.+):(?<ownerId>.+):buff:(?<namespaceName>.+):model:(?<buffEntryName>.+)")
    var matched = regex.search(grn)
    if matched == null:
        return null
    return matched.get_string("region")


static func get_owner_id_from_grn(grn):
    if grn == null:
        return null
    var regex = RegEx.new()
    regex.compile("grn:gs2:(?<region>.+):(?<ownerId>.+):buff:(?<namespaceName>.+):model:(?<buffEntryName>.+)")
    var matched = regex.search(grn)
    if matched == null:
        return null
    return matched.get_string("ownerId")


static func get_namespace_name_from_grn(grn):
    if grn == null:
        return null
    var regex = RegEx.new()
    regex.compile("grn:gs2:(?<region>.+):(?<ownerId>.+):buff:(?<namespaceName>.+):model:(?<buffEntryName>.+)")
    var matched = regex.search(grn)
    if matched == null:
        return null
    return matched.get_string("namespaceName")


static func get_buff_entry_name_from_grn(grn):
    if grn == null:
        return null
    var regex = RegEx.new()
    regex.compile("grn:gs2:(?<region>.+):(?<ownerId>.+):buff:(?<namespaceName>.+):model:(?<buffEntryName>.+)")
    var matched = regex.search(grn)
    if matched == null:
        return null
    return matched.get_string("buffEntryName")


static func from_dict(data) -> Gs2BuffBuffEntryModelMaster:
    if data == null:
        return null
    var ret = Gs2BuffBuffEntryModelMaster.new()
    ret.buff_entry_model_id = null if data.get("buffEntryModelId") == null else str(data.get("buffEntryModelId"))
    ret.name = null if data.get("name") == null else str(data.get("name"))
    ret.description = null if data.get("description") == null else str(data.get("description"))
    ret.metadata = null if data.get("metadata") == null else str(data.get("metadata"))
    ret.expression = null if data.get("expression") == null else str(data.get("expression"))
    ret.target_type = null if data.get("targetType") == null else str(data.get("targetType"))
    ret.target_model = null if data.get("targetModel") == null else Gs2BuffBuffTargetModel.from_dict(data.get("targetModel"))
    ret.target_action = null if data.get("targetAction") == null else Gs2BuffBuffTargetAction.from_dict(data.get("targetAction"))
    ret.priority = null if data.get("priority") == null else int(data.get("priority"))
    ret.apply_period_schedule_event_id = null if data.get("applyPeriodScheduleEventId") == null else str(data.get("applyPeriodScheduleEventId"))
    ret.created_at = null if data.get("createdAt") == null else int(data.get("createdAt"))
    ret.updated_at = null if data.get("updatedAt") == null else int(data.get("updatedAt"))
    ret.revision = null if data.get("revision") == null else int(data.get("revision"))
    return ret


func to_dict() -> Dictionary:
    var ret = {}
    ret["buffEntryModelId"] = buff_entry_model_id
    ret["name"] = name
    ret["description"] = description
    ret["metadata"] = metadata
    ret["expression"] = expression
    ret["targetType"] = target_type
    ret["targetModel"] = null if target_model == null else target_model.to_dict()
    ret["targetAction"] = null if target_action == null else target_action.to_dict()
    ret["priority"] = priority
    ret["applyPeriodScheduleEventId"] = apply_period_schedule_event_id
    ret["createdAt"] = created_at
    ret["updatedAt"] = updated_at
    ret["revision"] = revision
    return ret