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
class_name Gs2MissionEzScopedValue
extends RefCounted


var scope_type = null
var reset_type = null
var condition_name = null
var value = 0
var next_reset_at = 0


func with_scope_type(v) -> Gs2MissionEzScopedValue:
    scope_type = v
    return self


func with_reset_type(v) -> Gs2MissionEzScopedValue:
    reset_type = v
    return self


func with_condition_name(v) -> Gs2MissionEzScopedValue:
    condition_name = v
    return self


func with_value(v) -> Gs2MissionEzScopedValue:
    value = v
    return self


func with_next_reset_at(v) -> Gs2MissionEzScopedValue:
    next_reset_at = v
    return self


func to_model() -> Gs2MissionScopedValue:
    var ret = Gs2MissionScopedValue.new()
    ret.scope_type = scope_type
    ret.reset_type = reset_type
    ret.condition_name = condition_name
    ret.value = value
    ret.next_reset_at = next_reset_at
    return ret


static func from_model(model) -> Gs2MissionEzScopedValue:
    var ret = Gs2MissionEzScopedValue.new()
    ret.scope_type = model.scope_type
    ret.reset_type = model.reset_type
    ret.condition_name = model.condition_name
    ret.value = 0 if model.value == null else model.value
    ret.next_reset_at = 0 if model.next_reset_at == null else model.next_reset_at
    return ret