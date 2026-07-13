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
class_name Gs2FormationEzSlotModel
extends RefCounted


var name = null
var property_regex = null
var metadata = null


func with_name(v) -> Gs2FormationEzSlotModel:
    name = v
    return self


func with_property_regex(v) -> Gs2FormationEzSlotModel:
    property_regex = v
    return self


func with_metadata(v) -> Gs2FormationEzSlotModel:
    metadata = v
    return self


func to_model() -> Gs2FormationSlotModel:
    var ret = Gs2FormationSlotModel.new()
    ret.name = name
    ret.property_regex = property_regex
    ret.metadata = metadata
    return ret


static func from_model(model) -> Gs2FormationEzSlotModel:
    var ret = Gs2FormationEzSlotModel.new()
    ret.name = model.name
    ret.property_regex = model.property_regex
    ret.metadata = model.metadata
    return ret