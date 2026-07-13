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
class_name Gs2FreezeStage
extends RefCounted


var stage_id = null
var name = null
var source_stage_name = null
var sort_number = null
var status = null
var created_at = null
var updated_at = null
var revision = null


func with_stage_id(v) -> Gs2FreezeStage:
    stage_id = v
    return self


func with_name(v) -> Gs2FreezeStage:
    name = v
    return self


func with_source_stage_name(v) -> Gs2FreezeStage:
    source_stage_name = v
    return self


func with_sort_number(v) -> Gs2FreezeStage:
    sort_number = v
    return self


func with_status(v) -> Gs2FreezeStage:
    status = v
    return self


func with_created_at(v) -> Gs2FreezeStage:
    created_at = v
    return self


func with_updated_at(v) -> Gs2FreezeStage:
    updated_at = v
    return self


func with_revision(v) -> Gs2FreezeStage:
    revision = v
    return self


static func get_region_from_grn(grn):
    if grn == null:
        return null
    var regex = RegEx.new()
    regex.compile("grn:gs2:(?<region>.+):(?<ownerId>.+):freeze:(?<stageName>.+)")
    var matched = regex.search(grn)
    if matched == null:
        return null
    return matched.get_string("region")


static func get_owner_id_from_grn(grn):
    if grn == null:
        return null
    var regex = RegEx.new()
    regex.compile("grn:gs2:(?<region>.+):(?<ownerId>.+):freeze:(?<stageName>.+)")
    var matched = regex.search(grn)
    if matched == null:
        return null
    return matched.get_string("ownerId")


static func get_stage_name_from_grn(grn):
    if grn == null:
        return null
    var regex = RegEx.new()
    regex.compile("grn:gs2:(?<region>.+):(?<ownerId>.+):freeze:(?<stageName>.+)")
    var matched = regex.search(grn)
    if matched == null:
        return null
    return matched.get_string("stageName")


static func from_dict(data) -> Gs2FreezeStage:
    if data == null:
        return null
    var ret = Gs2FreezeStage.new()
    ret.stage_id = null if data.get("stageId") == null else str(data.get("stageId"))
    ret.name = null if data.get("name") == null else str(data.get("name"))
    ret.source_stage_name = null if data.get("sourceStageName") == null else str(data.get("sourceStageName"))
    ret.sort_number = null if data.get("sortNumber") == null else int(data.get("sortNumber"))
    ret.status = null if data.get("status") == null else str(data.get("status"))
    ret.created_at = null if data.get("createdAt") == null else int(data.get("createdAt"))
    ret.updated_at = null if data.get("updatedAt") == null else int(data.get("updatedAt"))
    ret.revision = null if data.get("revision") == null else int(data.get("revision"))
    return ret


func to_dict() -> Dictionary:
    var ret = {}
    ret["stageId"] = stage_id
    ret["name"] = name
    ret["sourceStageName"] = source_stage_name
    ret["sortNumber"] = sort_number
    ret["status"] = status
    ret["createdAt"] = created_at
    ret["updatedAt"] = updated_at
    ret["revision"] = revision
    return ret