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
class_name Gs2StateMachineEzStatus
extends RefCounted


var status_id = null
var name = null
var enable_speculative_execution = null
var state_machine_definition = null
var random_status = null
var stacks = []
var variables = []
var status = null
var last_error = null
var transition_count = 0


func with_status_id(v) -> Gs2StateMachineEzStatus:
    status_id = v
    return self


func with_name(v) -> Gs2StateMachineEzStatus:
    name = v
    return self


func with_enable_speculative_execution(v) -> Gs2StateMachineEzStatus:
    enable_speculative_execution = v
    return self


func with_state_machine_definition(v) -> Gs2StateMachineEzStatus:
    state_machine_definition = v
    return self


func with_random_status(v) -> Gs2StateMachineEzStatus:
    random_status = v
    return self


func with_stacks(v) -> Gs2StateMachineEzStatus:
    stacks = v
    return self


func with_variables(v) -> Gs2StateMachineEzStatus:
    variables = v
    return self


func with_status(v) -> Gs2StateMachineEzStatus:
    status = v
    return self


func with_last_error(v) -> Gs2StateMachineEzStatus:
    last_error = v
    return self


func with_transition_count(v) -> Gs2StateMachineEzStatus:
    transition_count = v
    return self


func to_model() -> Gs2StateMachineStatus:
    var ret = Gs2StateMachineStatus.new()
    ret.status_id = status_id
    ret.name = name
    ret.enable_speculative_execution = enable_speculative_execution
    ret.state_machine_definition = state_machine_definition
    ret.random_status = null if random_status == null else random_status.to_model()
    ret.stacks = null if stacks == null else stacks.map(func(v): return null if v == null else v.to_model())
    ret.variables = null if variables == null else variables.map(func(v): return null if v == null else v.to_model())
    ret.status = status
    ret.last_error = last_error
    ret.transition_count = transition_count
    return ret


static func from_model(model) -> Gs2StateMachineEzStatus:
    var ret = Gs2StateMachineEzStatus.new()
    ret.status_id = model.status_id
    ret.name = model.name
    ret.enable_speculative_execution = model.enable_speculative_execution
    ret.state_machine_definition = model.state_machine_definition
    ret.random_status = null if model.random_status == null else Gs2StateMachineEzRandomStatus.from_model(model.random_status)
    ret.stacks = [] if model.stacks == null else model.stacks.map(func(v): return Gs2StateMachineEzStackEntry.from_model(v))
    ret.variables = [] if model.variables == null else model.variables.map(func(v): return Gs2StateMachineEzVariable.from_model(v))
    ret.status = model.status
    ret.last_error = model.last_error
    ret.transition_count = 0 if model.transition_count == null else model.transition_count
    return ret