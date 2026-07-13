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
class_name Gs2LogDashboard
extends RefCounted


var dashboard_id = null
var name = null
var display_name = null
var description = null
var payload = null
var created_at = null
var updated_at = null


func with_dashboard_id(v) -> Gs2LogDashboard:
    dashboard_id = v
    return self


func with_name(v) -> Gs2LogDashboard:
    name = v
    return self


func with_display_name(v) -> Gs2LogDashboard:
    display_name = v
    return self


func with_description(v) -> Gs2LogDashboard:
    description = v
    return self


func with_payload(v) -> Gs2LogDashboard:
    payload = v
    return self


func with_created_at(v) -> Gs2LogDashboard:
    created_at = v
    return self


func with_updated_at(v) -> Gs2LogDashboard:
    updated_at = v
    return self


static func get_region_from_grn(grn):
    if grn == null:
        return null
    var regex = RegEx.new()
    regex.compile("grn:gs2:(?<region>.+):(?<ownerId>.+):log:(?<namespaceName>.+):dashboard:(?<dashboardName>.+)")
    var matched = regex.search(grn)
    if matched == null:
        return null
    return matched.get_string("region")


static func get_owner_id_from_grn(grn):
    if grn == null:
        return null
    var regex = RegEx.new()
    regex.compile("grn:gs2:(?<region>.+):(?<ownerId>.+):log:(?<namespaceName>.+):dashboard:(?<dashboardName>.+)")
    var matched = regex.search(grn)
    if matched == null:
        return null
    return matched.get_string("ownerId")


static func get_namespace_name_from_grn(grn):
    if grn == null:
        return null
    var regex = RegEx.new()
    regex.compile("grn:gs2:(?<region>.+):(?<ownerId>.+):log:(?<namespaceName>.+):dashboard:(?<dashboardName>.+)")
    var matched = regex.search(grn)
    if matched == null:
        return null
    return matched.get_string("namespaceName")


static func get_dashboard_name_from_grn(grn):
    if grn == null:
        return null
    var regex = RegEx.new()
    regex.compile("grn:gs2:(?<region>.+):(?<ownerId>.+):log:(?<namespaceName>.+):dashboard:(?<dashboardName>.+)")
    var matched = regex.search(grn)
    if matched == null:
        return null
    return matched.get_string("dashboardName")


static func from_dict(data) -> Gs2LogDashboard:
    if data == null:
        return null
    var ret = Gs2LogDashboard.new()
    ret.dashboard_id = null if data.get("dashboardId") == null else str(data.get("dashboardId"))
    ret.name = null if data.get("name") == null else str(data.get("name"))
    ret.display_name = null if data.get("displayName") == null else str(data.get("displayName"))
    ret.description = null if data.get("description") == null else str(data.get("description"))
    ret.payload = null if data.get("payload") == null else str(data.get("payload"))
    ret.created_at = null if data.get("createdAt") == null else int(data.get("createdAt"))
    ret.updated_at = null if data.get("updatedAt") == null else int(data.get("updatedAt"))
    return ret


func to_dict() -> Dictionary:
    var ret = {}
    ret["dashboardId"] = dashboard_id
    ret["name"] = name
    ret["displayName"] = display_name
    ret["description"] = description
    ret["payload"] = payload
    ret["createdAt"] = created_at
    ret["updatedAt"] = updated_at
    return ret