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
class_name Gs2StateMachineEzVariable
extends RefCounted


var state_machine_name = null
var value = null


func with_state_machine_name(v) -> Gs2StateMachineEzVariable:
    state_machine_name = v
    return self


func with_value(v) -> Gs2StateMachineEzVariable:
    value = v
    return self


func to_model() -> Gs2StateMachineVariable:
    var ret = Gs2StateMachineVariable.new()
    ret.state_machine_name = state_machine_name
    ret.value = value
    return ret


static func from_model(model) -> Gs2StateMachineEzVariable:
    var ret = Gs2StateMachineEzVariable.new()
    ret.state_machine_name = model.state_machine_name
    ret.value = model.value
    return ret