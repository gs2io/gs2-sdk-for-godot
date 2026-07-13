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
class_name Gs2FormationEzPropertyForm
extends RefCounted


var name = null
var property_id = null
var slots = []


func with_name(v) -> Gs2FormationEzPropertyForm:
    name = v
    return self


func with_property_id(v) -> Gs2FormationEzPropertyForm:
    property_id = v
    return self


func with_slots(v) -> Gs2FormationEzPropertyForm:
    slots = v
    return self


func to_model() -> Gs2FormationPropertyForm:
    var ret = Gs2FormationPropertyForm.new()
    ret.name = name
    ret.property_id = property_id
    ret.slots = null if slots == null else slots.map(func(v): return null if v == null else v.to_model())
    return ret


static func from_model(model) -> Gs2FormationEzPropertyForm:
    var ret = Gs2FormationEzPropertyForm.new()
    ret.name = model.name
    ret.property_id = model.property_id
    ret.slots = [] if model.slots == null else model.slots.map(func(v): return Gs2FormationEzSlot.from_model(v))
    return ret