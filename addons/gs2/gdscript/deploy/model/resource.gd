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
class_name Gs2DeployResource
extends RefCounted


var resource_id = null
var type = null
var name = null
var request = null
var response = null
var rollback_context = null
var rollback_request = null
var rollback_after = null
var output_fields = null
var work_id = null
var created_at = null


func with_resource_id(v) -> Gs2DeployResource:
    resource_id = v
    return self


func with_type(v) -> Gs2DeployResource:
    type = v
    return self


func with_name(v) -> Gs2DeployResource:
    name = v
    return self


func with_request(v) -> Gs2DeployResource:
    request = v
    return self


func with_response(v) -> Gs2DeployResource:
    response = v
    return self


func with_rollback_context(v) -> Gs2DeployResource:
    rollback_context = v
    return self


func with_rollback_request(v) -> Gs2DeployResource:
    rollback_request = v
    return self


func with_rollback_after(v) -> Gs2DeployResource:
    rollback_after = v
    return self


func with_output_fields(v) -> Gs2DeployResource:
    output_fields = v
    return self


func with_work_id(v) -> Gs2DeployResource:
    work_id = v
    return self


func with_created_at(v) -> Gs2DeployResource:
    created_at = v
    return self


static func get_region_from_grn(grn):
    if grn == null:
        return null
    var regex = RegEx.new()
    regex.compile("grn:gs2:(?<region>.+):(?<ownerId>.+):deploy:(?<stackName>.+):resource:(?<resourceName>.+)")
    var matched = regex.search(grn)
    if matched == null:
        return null
    return matched.get_string("region")


static func get_owner_id_from_grn(grn):
    if grn == null:
        return null
    var regex = RegEx.new()
    regex.compile("grn:gs2:(?<region>.+):(?<ownerId>.+):deploy:(?<stackName>.+):resource:(?<resourceName>.+)")
    var matched = regex.search(grn)
    if matched == null:
        return null
    return matched.get_string("ownerId")


static func get_stack_name_from_grn(grn):
    if grn == null:
        return null
    var regex = RegEx.new()
    regex.compile("grn:gs2:(?<region>.+):(?<ownerId>.+):deploy:(?<stackName>.+):resource:(?<resourceName>.+)")
    var matched = regex.search(grn)
    if matched == null:
        return null
    return matched.get_string("stackName")


static func get_resource_name_from_grn(grn):
    if grn == null:
        return null
    var regex = RegEx.new()
    regex.compile("grn:gs2:(?<region>.+):(?<ownerId>.+):deploy:(?<stackName>.+):resource:(?<resourceName>.+)")
    var matched = regex.search(grn)
    if matched == null:
        return null
    return matched.get_string("resourceName")


static func from_dict(data) -> Gs2DeployResource:
    if data == null:
        return null
    var ret = Gs2DeployResource.new()
    ret.resource_id = null if data.get("resourceId") == null else str(data.get("resourceId"))
    ret.type = null if data.get("type") == null else str(data.get("type"))
    ret.name = null if data.get("name") == null else str(data.get("name"))
    ret.request = null if data.get("request") == null else str(data.get("request"))
    ret.response = null if data.get("response") == null else str(data.get("response"))
    ret.rollback_context = null if data.get("rollbackContext") == null else str(data.get("rollbackContext"))
    ret.rollback_request = null if data.get("rollbackRequest") == null else str(data.get("rollbackRequest"))
    ret.rollback_after = null if data.get("rollbackAfter") == null else data.get("rollbackAfter").map(func(v): return str(v))
    ret.output_fields = null if data.get("outputFields") == null else data.get("outputFields").map(func(v): return Gs2DeployOutputField.from_dict(v))
    ret.work_id = null if data.get("workId") == null else str(data.get("workId"))
    ret.created_at = null if data.get("createdAt") == null else int(data.get("createdAt"))
    return ret


func to_dict() -> Dictionary:
    var ret = {}
    ret["resourceId"] = resource_id
    ret["type"] = type
    ret["name"] = name
    ret["request"] = request
    ret["response"] = response
    ret["rollbackContext"] = rollback_context
    ret["rollbackRequest"] = rollback_request
    ret["rollbackAfter"] = rollback_after
    ret["outputFields"] = null if output_fields == null else output_fields.map(func(v): return null if v == null else v.to_dict())
    ret["workId"] = work_id
    ret["createdAt"] = created_at
    return ret