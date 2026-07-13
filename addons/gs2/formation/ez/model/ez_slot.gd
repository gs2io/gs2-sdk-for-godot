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
class_name Gs2FormationEzSlot
extends RefCounted


var name = null
var property_id = null
var metadata = null


func with_name(v) -> Gs2FormationEzSlot:
    name = v
    return self


func with_property_id(v) -> Gs2FormationEzSlot:
    property_id = v
    return self


func with_metadata(v) -> Gs2FormationEzSlot:
    metadata = v
    return self


func to_model() -> Gs2FormationSlot:
    var ret = Gs2FormationSlot.new()
    ret.name = name
    ret.property_id = property_id
    ret.metadata = metadata
    return ret


static func from_model(model) -> Gs2FormationEzSlot:
    var ret = Gs2FormationEzSlot.new()
    ret.name = model.name
    ret.property_id = model.property_id
    ret.metadata = model.metadata
    return ret