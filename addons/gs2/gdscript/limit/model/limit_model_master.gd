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
class_name Gs2LimitLimitModelMaster
extends RefCounted


var limit_model_id = null
var name = null
var description = null
var metadata = null
var reset_type = null
var reset_day_of_month = null
var reset_day_of_week = null
var reset_hour = null
var anchor_timestamp = null
var days = null
var created_at = null
var updated_at = null
var revision = null


func with_limit_model_id(v) -> Gs2LimitLimitModelMaster:
    limit_model_id = v
    return self


func with_name(v) -> Gs2LimitLimitModelMaster:
    name = v
    return self


func with_description(v) -> Gs2LimitLimitModelMaster:
    description = v
    return self


func with_metadata(v) -> Gs2LimitLimitModelMaster:
    metadata = v
    return self


func with_reset_type(v) -> Gs2LimitLimitModelMaster:
    reset_type = v
    return self


func with_reset_day_of_month(v) -> Gs2LimitLimitModelMaster:
    reset_day_of_month = v
    return self


func with_reset_day_of_week(v) -> Gs2LimitLimitModelMaster:
    reset_day_of_week = v
    return self


func with_reset_hour(v) -> Gs2LimitLimitModelMaster:
    reset_hour = v
    return self


func with_anchor_timestamp(v) -> Gs2LimitLimitModelMaster:
    anchor_timestamp = v
    return self


func with_days(v) -> Gs2LimitLimitModelMaster:
    days = v
    return self


func with_created_at(v) -> Gs2LimitLimitModelMaster:
    created_at = v
    return self


func with_updated_at(v) -> Gs2LimitLimitModelMaster:
    updated_at = v
    return self


func with_revision(v) -> Gs2LimitLimitModelMaster:
    revision = v
    return self


static func get_region_from_grn(grn):
    if grn == null:
        return null
    var regex = RegEx.new()
    regex.compile("grn:gs2:(?<region>.+):(?<ownerId>.+):limit:(?<namespaceName>.+):limit:(?<limitName>.+)")
    var matched = regex.search(grn)
    if matched == null:
        return null
    return matched.get_string("region")


static func get_owner_id_from_grn(grn):
    if grn == null:
        return null
    var regex = RegEx.new()
    regex.compile("grn:gs2:(?<region>.+):(?<ownerId>.+):limit:(?<namespaceName>.+):limit:(?<limitName>.+)")
    var matched = regex.search(grn)
    if matched == null:
        return null
    return matched.get_string("ownerId")


static func get_namespace_name_from_grn(grn):
    if grn == null:
        return null
    var regex = RegEx.new()
    regex.compile("grn:gs2:(?<region>.+):(?<ownerId>.+):limit:(?<namespaceName>.+):limit:(?<limitName>.+)")
    var matched = regex.search(grn)
    if matched == null:
        return null
    return matched.get_string("namespaceName")


static func get_limit_name_from_grn(grn):
    if grn == null:
        return null
    var regex = RegEx.new()
    regex.compile("grn:gs2:(?<region>.+):(?<ownerId>.+):limit:(?<namespaceName>.+):limit:(?<limitName>.+)")
    var matched = regex.search(grn)
    if matched == null:
        return null
    return matched.get_string("limitName")


static func from_dict(data) -> Gs2LimitLimitModelMaster:
    if data == null:
        return null
    var ret = Gs2LimitLimitModelMaster.new()
    ret.limit_model_id = null if data.get("limitModelId") == null else str(data.get("limitModelId"))
    ret.name = null if data.get("name") == null else str(data.get("name"))
    ret.description = null if data.get("description") == null else str(data.get("description"))
    ret.metadata = null if data.get("metadata") == null else str(data.get("metadata"))
    ret.reset_type = null if data.get("resetType") == null else str(data.get("resetType"))
    ret.reset_day_of_month = null if data.get("resetDayOfMonth") == null else int(data.get("resetDayOfMonth"))
    ret.reset_day_of_week = null if data.get("resetDayOfWeek") == null else str(data.get("resetDayOfWeek"))
    ret.reset_hour = null if data.get("resetHour") == null else int(data.get("resetHour"))
    ret.anchor_timestamp = null if data.get("anchorTimestamp") == null else int(data.get("anchorTimestamp"))
    ret.days = null if data.get("days") == null else int(data.get("days"))
    ret.created_at = null if data.get("createdAt") == null else int(data.get("createdAt"))
    ret.updated_at = null if data.get("updatedAt") == null else int(data.get("updatedAt"))
    ret.revision = null if data.get("revision") == null else int(data.get("revision"))
    return ret


func to_dict() -> Dictionary:
    var ret = {}
    ret["limitModelId"] = limit_model_id
    ret["name"] = name
    ret["description"] = description
    ret["metadata"] = metadata
    ret["resetType"] = reset_type
    ret["resetDayOfMonth"] = reset_day_of_month
    ret["resetDayOfWeek"] = reset_day_of_week
    ret["resetHour"] = reset_hour
    ret["anchorTimestamp"] = anchor_timestamp
    ret["days"] = days
    ret["createdAt"] = created_at
    ret["updatedAt"] = updated_at
    ret["revision"] = revision
    return ret