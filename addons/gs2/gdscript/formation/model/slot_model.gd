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
class_name Gs2FormationSlotModel
extends RefCounted


var name = null
var property_regex = null
var metadata = null


func with_name(v) -> Gs2FormationSlotModel:
    name = v
    return self


func with_property_regex(v) -> Gs2FormationSlotModel:
    property_regex = v
    return self


func with_metadata(v) -> Gs2FormationSlotModel:
    metadata = v
    return self


static func from_dict(data) -> Gs2FormationSlotModel:
    if data == null:
        return null
    var ret = Gs2FormationSlotModel.new()
    ret.name = null if data.get("name") == null else str(data.get("name"))
    ret.property_regex = null if data.get("propertyRegex") == null else str(data.get("propertyRegex"))
    ret.metadata = null if data.get("metadata") == null else str(data.get("metadata"))
    return ret


func to_dict() -> Dictionary:
    var ret = {}
    ret["name"] = name
    ret["propertyRegex"] = property_regex
    ret["metadata"] = metadata
    return ret