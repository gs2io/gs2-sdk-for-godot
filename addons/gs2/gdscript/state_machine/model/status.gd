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
class_name Gs2StateMachineStatus
extends RefCounted


var status_id = null
var user_id = null
var name = null
var state_machine_version = null
var enable_speculative_execution = null
var state_machine_definition = null
var random_status = null
var stacks = null
var variables = null
var status = null
var last_error = null
var transition_count = null
var created_at = null
var updated_at = null


func with_status_id(v) -> Gs2StateMachineStatus:
    status_id = v
    return self


func with_user_id(v) -> Gs2StateMachineStatus:
    user_id = v
    return self


func with_name(v) -> Gs2StateMachineStatus:
    name = v
    return self


func with_state_machine_version(v) -> Gs2StateMachineStatus:
    state_machine_version = v
    return self


func with_enable_speculative_execution(v) -> Gs2StateMachineStatus:
    enable_speculative_execution = v
    return self


func with_state_machine_definition(v) -> Gs2StateMachineStatus:
    state_machine_definition = v
    return self


func with_random_status(v) -> Gs2StateMachineStatus:
    random_status = v
    return self


func with_stacks(v) -> Gs2StateMachineStatus:
    stacks = v
    return self


func with_variables(v) -> Gs2StateMachineStatus:
    variables = v
    return self


func with_status(v) -> Gs2StateMachineStatus:
    status = v
    return self


func with_last_error(v) -> Gs2StateMachineStatus:
    last_error = v
    return self


func with_transition_count(v) -> Gs2StateMachineStatus:
    transition_count = v
    return self


func with_created_at(v) -> Gs2StateMachineStatus:
    created_at = v
    return self


func with_updated_at(v) -> Gs2StateMachineStatus:
    updated_at = v
    return self


static func get_region_from_grn(grn):
    if grn == null:
        return null
    var regex = RegEx.new()
    regex.compile("grn:gs2:(?<region>.+):(?<ownerId>.+):stateMachine:(?<namespaceName>.+):user:(?<userId>.+):status:(?<statusName>.+)")
    var matched = regex.search(grn)
    if matched == null:
        return null
    return matched.get_string("region")


static func get_owner_id_from_grn(grn):
    if grn == null:
        return null
    var regex = RegEx.new()
    regex.compile("grn:gs2:(?<region>.+):(?<ownerId>.+):stateMachine:(?<namespaceName>.+):user:(?<userId>.+):status:(?<statusName>.+)")
    var matched = regex.search(grn)
    if matched == null:
        return null
    return matched.get_string("ownerId")


static func get_namespace_name_from_grn(grn):
    if grn == null:
        return null
    var regex = RegEx.new()
    regex.compile("grn:gs2:(?<region>.+):(?<ownerId>.+):stateMachine:(?<namespaceName>.+):user:(?<userId>.+):status:(?<statusName>.+)")
    var matched = regex.search(grn)
    if matched == null:
        return null
    return matched.get_string("namespaceName")


static func get_user_id_from_grn(grn):
    if grn == null:
        return null
    var regex = RegEx.new()
    regex.compile("grn:gs2:(?<region>.+):(?<ownerId>.+):stateMachine:(?<namespaceName>.+):user:(?<userId>.+):status:(?<statusName>.+)")
    var matched = regex.search(grn)
    if matched == null:
        return null
    return matched.get_string("userId")


static func get_status_name_from_grn(grn):
    if grn == null:
        return null
    var regex = RegEx.new()
    regex.compile("grn:gs2:(?<region>.+):(?<ownerId>.+):stateMachine:(?<namespaceName>.+):user:(?<userId>.+):status:(?<statusName>.+)")
    var matched = regex.search(grn)
    if matched == null:
        return null
    return matched.get_string("statusName")


static func from_dict(data) -> Gs2StateMachineStatus:
    if data == null:
        return null
    var ret = Gs2StateMachineStatus.new()
    ret.status_id = null if data.get("statusId") == null else str(data.get("statusId"))
    ret.user_id = null if data.get("userId") == null else str(data.get("userId"))
    ret.name = null if data.get("name") == null else str(data.get("name"))
    ret.state_machine_version = null if data.get("stateMachineVersion") == null else int(data.get("stateMachineVersion"))
    ret.enable_speculative_execution = null if data.get("enableSpeculativeExecution") == null else str(data.get("enableSpeculativeExecution"))
    ret.state_machine_definition = null if data.get("stateMachineDefinition") == null else str(data.get("stateMachineDefinition"))
    ret.random_status = null if data.get("randomStatus") == null else Gs2StateMachineRandomStatus.from_dict(data.get("randomStatus"))
    ret.stacks = null if data.get("stacks") == null else data.get("stacks").map(func(v): return Gs2StateMachineStackEntry.from_dict(v))
    ret.variables = null if data.get("variables") == null else data.get("variables").map(func(v): return Gs2StateMachineVariable.from_dict(v))
    ret.status = null if data.get("status") == null else str(data.get("status"))
    ret.last_error = null if data.get("lastError") == null else str(data.get("lastError"))
    ret.transition_count = null if data.get("transitionCount") == null else int(data.get("transitionCount"))
    ret.created_at = null if data.get("createdAt") == null else int(data.get("createdAt"))
    ret.updated_at = null if data.get("updatedAt") == null else int(data.get("updatedAt"))
    return ret


func to_dict() -> Dictionary:
    var ret = {}
    ret["statusId"] = status_id
    ret["userId"] = user_id
    ret["name"] = name
    ret["stateMachineVersion"] = state_machine_version
    ret["enableSpeculativeExecution"] = enable_speculative_execution
    ret["stateMachineDefinition"] = state_machine_definition
    ret["randomStatus"] = null if random_status == null else random_status.to_dict()
    ret["stacks"] = null if stacks == null else stacks.map(func(v): return null if v == null else v.to_dict())
    ret["variables"] = null if variables == null else variables.map(func(v): return null if v == null else v.to_dict())
    ret["status"] = status
    ret["lastError"] = last_error
    ret["transitionCount"] = transition_count
    ret["createdAt"] = created_at
    ret["updatedAt"] = updated_at
    return ret