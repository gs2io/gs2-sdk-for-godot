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
class_name Gs2StateMachineStateMachineMaster
extends RefCounted


var state_machine_id = null
var main_state_machine_name = null
var payload = null
var version = null
var created_at = null
var updated_at = null
var revision = null


func with_state_machine_id(v) -> Gs2StateMachineStateMachineMaster:
    state_machine_id = v
    return self


func with_main_state_machine_name(v) -> Gs2StateMachineStateMachineMaster:
    main_state_machine_name = v
    return self


func with_payload(v) -> Gs2StateMachineStateMachineMaster:
    payload = v
    return self


func with_version(v) -> Gs2StateMachineStateMachineMaster:
    version = v
    return self


func with_created_at(v) -> Gs2StateMachineStateMachineMaster:
    created_at = v
    return self


func with_updated_at(v) -> Gs2StateMachineStateMachineMaster:
    updated_at = v
    return self


func with_revision(v) -> Gs2StateMachineStateMachineMaster:
    revision = v
    return self


static func get_region_from_grn(grn):
    if grn == null:
        return null
    var regex = RegEx.new()
    regex.compile("grn:gs2:(?<region>.+):(?<ownerId>.+):stateMachine:(?<namespaceName>.+):master:stateMachine:(?<version>.+)")
    var matched = regex.search(grn)
    if matched == null:
        return null
    return matched.get_string("region")


static func get_owner_id_from_grn(grn):
    if grn == null:
        return null
    var regex = RegEx.new()
    regex.compile("grn:gs2:(?<region>.+):(?<ownerId>.+):stateMachine:(?<namespaceName>.+):master:stateMachine:(?<version>.+)")
    var matched = regex.search(grn)
    if matched == null:
        return null
    return matched.get_string("ownerId")


static func get_namespace_name_from_grn(grn):
    if grn == null:
        return null
    var regex = RegEx.new()
    regex.compile("grn:gs2:(?<region>.+):(?<ownerId>.+):stateMachine:(?<namespaceName>.+):master:stateMachine:(?<version>.+)")
    var matched = regex.search(grn)
    if matched == null:
        return null
    return matched.get_string("namespaceName")


static func get_version_from_grn(grn):
    if grn == null:
        return null
    var regex = RegEx.new()
    regex.compile("grn:gs2:(?<region>.+):(?<ownerId>.+):stateMachine:(?<namespaceName>.+):master:stateMachine:(?<version>.+)")
    var matched = regex.search(grn)
    if matched == null:
        return null
    return matched.get_string("version")


static func from_dict(data) -> Gs2StateMachineStateMachineMaster:
    if data == null:
        return null
    var ret = Gs2StateMachineStateMachineMaster.new()
    ret.state_machine_id = null if data.get("stateMachineId") == null else str(data.get("stateMachineId"))
    ret.main_state_machine_name = null if data.get("mainStateMachineName") == null else str(data.get("mainStateMachineName"))
    ret.payload = null if data.get("payload") == null else str(data.get("payload"))
    ret.version = null if data.get("version") == null else int(data.get("version"))
    ret.created_at = null if data.get("createdAt") == null else int(data.get("createdAt"))
    ret.updated_at = null if data.get("updatedAt") == null else int(data.get("updatedAt"))
    ret.revision = null if data.get("revision") == null else int(data.get("revision"))
    return ret


func to_dict() -> Dictionary:
    var ret = {}
    ret["stateMachineId"] = state_machine_id
    ret["mainStateMachineName"] = main_state_machine_name
    ret["payload"] = payload
    ret["version"] = version
    ret["createdAt"] = created_at
    ret["updatedAt"] = updated_at
    ret["revision"] = revision
    return ret