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
class_name Gs2LimitCreateLimitModelMasterRequest
extends Gs2Request


var namespace_name = null
var name = null
var description = null
var metadata = null
var reset_type = null
var reset_day_of_month = null
var reset_day_of_week = null
var reset_hour = null
var anchor_timestamp = null
var days = null


func with_namespace_name(v) -> Gs2LimitCreateLimitModelMasterRequest:
    namespace_name = v
    return self


func with_name(v) -> Gs2LimitCreateLimitModelMasterRequest:
    name = v
    return self


func with_description(v) -> Gs2LimitCreateLimitModelMasterRequest:
    description = v
    return self


func with_metadata(v) -> Gs2LimitCreateLimitModelMasterRequest:
    metadata = v
    return self


func with_reset_type(v) -> Gs2LimitCreateLimitModelMasterRequest:
    reset_type = v
    return self


func with_reset_day_of_month(v) -> Gs2LimitCreateLimitModelMasterRequest:
    reset_day_of_month = v
    return self


func with_reset_day_of_week(v) -> Gs2LimitCreateLimitModelMasterRequest:
    reset_day_of_week = v
    return self


func with_reset_hour(v) -> Gs2LimitCreateLimitModelMasterRequest:
    reset_hour = v
    return self


func with_anchor_timestamp(v) -> Gs2LimitCreateLimitModelMasterRequest:
    anchor_timestamp = v
    return self


func with_days(v) -> Gs2LimitCreateLimitModelMasterRequest:
    days = v
    return self


static func from_dict(data) -> Gs2LimitCreateLimitModelMasterRequest:
    if data == null:
        return null
    var ret = Gs2LimitCreateLimitModelMasterRequest.new()
    ret.namespace_name = null if data.get("namespaceName") == null else str(data.get("namespaceName"))
    ret.name = null if data.get("name") == null else str(data.get("name"))
    ret.description = null if data.get("description") == null else str(data.get("description"))
    ret.metadata = null if data.get("metadata") == null else str(data.get("metadata"))
    ret.reset_type = null if data.get("resetType") == null else str(data.get("resetType"))
    ret.reset_day_of_month = null if data.get("resetDayOfMonth") == null else int(data.get("resetDayOfMonth"))
    ret.reset_day_of_week = null if data.get("resetDayOfWeek") == null else str(data.get("resetDayOfWeek"))
    ret.reset_hour = null if data.get("resetHour") == null else int(data.get("resetHour"))
    ret.anchor_timestamp = null if data.get("anchorTimestamp") == null else int(data.get("anchorTimestamp"))
    ret.days = null if data.get("days") == null else int(data.get("days"))
    return ret


func to_dict() -> Dictionary:
    var ret = {}
    ret["namespaceName"] = namespace_name
    ret["name"] = name
    ret["description"] = description
    ret["metadata"] = metadata
    ret["resetType"] = reset_type
    ret["resetDayOfMonth"] = reset_day_of_month
    ret["resetDayOfWeek"] = reset_day_of_week
    ret["resetHour"] = reset_hour
    ret["anchorTimestamp"] = anchor_timestamp
    ret["days"] = days
    return ret