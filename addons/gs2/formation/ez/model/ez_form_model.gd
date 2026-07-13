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
class_name Gs2FormationEzFormModel
extends RefCounted


var name = null
var metadata = null
var slots = []


func with_name(v) -> Gs2FormationEzFormModel:
    name = v
    return self


func with_metadata(v) -> Gs2FormationEzFormModel:
    metadata = v
    return self


func with_slots(v) -> Gs2FormationEzFormModel:
    slots = v
    return self


func to_model() -> Gs2FormationFormModel:
    var ret = Gs2FormationFormModel.new()
    ret.name = name
    ret.metadata = metadata
    ret.slots = null if slots == null else slots.map(func(v): return null if v == null else v.to_model())
    return ret


static func from_model(model) -> Gs2FormationEzFormModel:
    var ret = Gs2FormationEzFormModel.new()
    ret.name = model.name
    ret.metadata = model.metadata
    ret.slots = [] if model.slots == null else model.slots.map(func(v): return Gs2FormationEzSlotModel.from_model(v))
    return ret