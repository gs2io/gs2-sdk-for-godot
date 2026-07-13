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
class_name Gs2LogInsight
extends RefCounted


var insight_id = null
var name = null
var task_id = null
var host = null
var password = null
var status = null
var created_at = null
var revision = null


func with_insight_id(v) -> Gs2LogInsight:
    insight_id = v
    return self


func with_name(v) -> Gs2LogInsight:
    name = v
    return self


func with_task_id(v) -> Gs2LogInsight:
    task_id = v
    return self


func with_host(v) -> Gs2LogInsight:
    host = v
    return self


func with_password(v) -> Gs2LogInsight:
    password = v
    return self


func with_status(v) -> Gs2LogInsight:
    status = v
    return self


func with_created_at(v) -> Gs2LogInsight:
    created_at = v
    return self


func with_revision(v) -> Gs2LogInsight:
    revision = v
    return self


static func get_region_from_grn(grn):
    if grn == null:
        return null
    var regex = RegEx.new()
    regex.compile("grn:gs2:(?<region>.+):(?<ownerId>.+):log:(?<namespaceName>.+):insight:(?<insightName>.+)")
    var matched = regex.search(grn)
    if matched == null:
        return null
    return matched.get_string("region")


static func get_owner_id_from_grn(grn):
    if grn == null:
        return null
    var regex = RegEx.new()
    regex.compile("grn:gs2:(?<region>.+):(?<ownerId>.+):log:(?<namespaceName>.+):insight:(?<insightName>.+)")
    var matched = regex.search(grn)
    if matched == null:
        return null
    return matched.get_string("ownerId")


static func get_namespace_name_from_grn(grn):
    if grn == null:
        return null
    var regex = RegEx.new()
    regex.compile("grn:gs2:(?<region>.+):(?<ownerId>.+):log:(?<namespaceName>.+):insight:(?<insightName>.+)")
    var matched = regex.search(grn)
    if matched == null:
        return null
    return matched.get_string("namespaceName")


static func get_insight_name_from_grn(grn):
    if grn == null:
        return null
    var regex = RegEx.new()
    regex.compile("grn:gs2:(?<region>.+):(?<ownerId>.+):log:(?<namespaceName>.+):insight:(?<insightName>.+)")
    var matched = regex.search(grn)
    if matched == null:
        return null
    return matched.get_string("insightName")


static func from_dict(data) -> Gs2LogInsight:
    if data == null:
        return null
    var ret = Gs2LogInsight.new()
    ret.insight_id = null if data.get("insightId") == null else str(data.get("insightId"))
    ret.name = null if data.get("name") == null else str(data.get("name"))
    ret.task_id = null if data.get("taskId") == null else str(data.get("taskId"))
    ret.host = null if data.get("host") == null else str(data.get("host"))
    ret.password = null if data.get("password") == null else str(data.get("password"))
    ret.status = null if data.get("status") == null else str(data.get("status"))
    ret.created_at = null if data.get("createdAt") == null else int(data.get("createdAt"))
    ret.revision = null if data.get("revision") == null else int(data.get("revision"))
    return ret


func to_dict() -> Dictionary:
    var ret = {}
    ret["insightId"] = insight_id
    ret["name"] = name
    ret["taskId"] = task_id
    ret["host"] = host
    ret["password"] = password
    ret["status"] = status
    ret["createdAt"] = created_at
    ret["revision"] = revision
    return ret