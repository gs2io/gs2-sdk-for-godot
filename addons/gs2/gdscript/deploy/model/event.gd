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
class_name Gs2DeployEvent
extends RefCounted


var event_id = null
var name = null
var resource_name = null
var type = null
var message = null
var event_at = null
var revision = null


func with_event_id(v) -> Gs2DeployEvent:
    event_id = v
    return self


func with_name(v) -> Gs2DeployEvent:
    name = v
    return self


func with_resource_name(v) -> Gs2DeployEvent:
    resource_name = v
    return self


func with_type(v) -> Gs2DeployEvent:
    type = v
    return self


func with_message(v) -> Gs2DeployEvent:
    message = v
    return self


func with_event_at(v) -> Gs2DeployEvent:
    event_at = v
    return self


func with_revision(v) -> Gs2DeployEvent:
    revision = v
    return self


static func get_region_from_grn(grn):
    if grn == null:
        return null
    var regex = RegEx.new()
    regex.compile("grn:gs2:(?<region>.+):(?<ownerId>.+):deploy:(?<stackName>.+):event:(?<eventName>.+)")
    var matched = regex.search(grn)
    if matched == null:
        return null
    return matched.get_string("region")


static func get_owner_id_from_grn(grn):
    if grn == null:
        return null
    var regex = RegEx.new()
    regex.compile("grn:gs2:(?<region>.+):(?<ownerId>.+):deploy:(?<stackName>.+):event:(?<eventName>.+)")
    var matched = regex.search(grn)
    if matched == null:
        return null
    return matched.get_string("ownerId")


static func get_stack_name_from_grn(grn):
    if grn == null:
        return null
    var regex = RegEx.new()
    regex.compile("grn:gs2:(?<region>.+):(?<ownerId>.+):deploy:(?<stackName>.+):event:(?<eventName>.+)")
    var matched = regex.search(grn)
    if matched == null:
        return null
    return matched.get_string("stackName")


static func get_event_name_from_grn(grn):
    if grn == null:
        return null
    var regex = RegEx.new()
    regex.compile("grn:gs2:(?<region>.+):(?<ownerId>.+):deploy:(?<stackName>.+):event:(?<eventName>.+)")
    var matched = regex.search(grn)
    if matched == null:
        return null
    return matched.get_string("eventName")


static func from_dict(data) -> Gs2DeployEvent:
    if data == null:
        return null
    var ret = Gs2DeployEvent.new()
    ret.event_id = null if data.get("eventId") == null else str(data.get("eventId"))
    ret.name = null if data.get("name") == null else str(data.get("name"))
    ret.resource_name = null if data.get("resourceName") == null else str(data.get("resourceName"))
    ret.type = null if data.get("type") == null else str(data.get("type"))
    ret.message = null if data.get("message") == null else str(data.get("message"))
    ret.event_at = null if data.get("eventAt") == null else int(data.get("eventAt"))
    ret.revision = null if data.get("revision") == null else int(data.get("revision"))
    return ret


func to_dict() -> Dictionary:
    var ret = {}
    ret["eventId"] = event_id
    ret["name"] = name
    ret["resourceName"] = resource_name
    ret["type"] = type
    ret["message"] = message
    ret["eventAt"] = event_at
    ret["revision"] = revision
    return ret