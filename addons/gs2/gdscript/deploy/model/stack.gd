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
class_name Gs2DeployStack
extends RefCounted


var stack_id = null
var name = null
var description = null
var template = null
var status = null
var created_at = null
var updated_at = null
var revision = null


func with_stack_id(v) -> Gs2DeployStack:
    stack_id = v
    return self


func with_name(v) -> Gs2DeployStack:
    name = v
    return self


func with_description(v) -> Gs2DeployStack:
    description = v
    return self


func with_template(v) -> Gs2DeployStack:
    template = v
    return self


func with_status(v) -> Gs2DeployStack:
    status = v
    return self


func with_created_at(v) -> Gs2DeployStack:
    created_at = v
    return self


func with_updated_at(v) -> Gs2DeployStack:
    updated_at = v
    return self


func with_revision(v) -> Gs2DeployStack:
    revision = v
    return self


static func get_region_from_grn(grn):
    if grn == null:
        return null
    var regex = RegEx.new()
    regex.compile("grn:gs2:(?<region>.+):(?<ownerId>.+):deploy:(?<stackName>.+)")
    var matched = regex.search(grn)
    if matched == null:
        return null
    return matched.get_string("region")


static func get_owner_id_from_grn(grn):
    if grn == null:
        return null
    var regex = RegEx.new()
    regex.compile("grn:gs2:(?<region>.+):(?<ownerId>.+):deploy:(?<stackName>.+)")
    var matched = regex.search(grn)
    if matched == null:
        return null
    return matched.get_string("ownerId")


static func get_stack_name_from_grn(grn):
    if grn == null:
        return null
    var regex = RegEx.new()
    regex.compile("grn:gs2:(?<region>.+):(?<ownerId>.+):deploy:(?<stackName>.+)")
    var matched = regex.search(grn)
    if matched == null:
        return null
    return matched.get_string("stackName")


static func from_dict(data) -> Gs2DeployStack:
    if data == null:
        return null
    var ret = Gs2DeployStack.new()
    ret.stack_id = null if data.get("stackId") == null else str(data.get("stackId"))
    ret.name = null if data.get("name") == null else str(data.get("name"))
    ret.description = null if data.get("description") == null else str(data.get("description"))
    ret.template = null if data.get("template") == null else str(data.get("template"))
    ret.status = null if data.get("status") == null else str(data.get("status"))
    ret.created_at = null if data.get("createdAt") == null else int(data.get("createdAt"))
    ret.updated_at = null if data.get("updatedAt") == null else int(data.get("updatedAt"))
    ret.revision = null if data.get("revision") == null else int(data.get("revision"))
    return ret


func to_dict() -> Dictionary:
    var ret = {}
    ret["stackId"] = stack_id
    ret["name"] = name
    ret["description"] = description
    ret["template"] = template
    ret["status"] = status
    ret["createdAt"] = created_at
    ret["updatedAt"] = updated_at
    ret["revision"] = revision
    return ret