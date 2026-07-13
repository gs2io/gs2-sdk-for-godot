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
class_name Gs2FormationSlot
extends RefCounted


var name = null
var property_id = null
var metadata = null


func with_name(v) -> Gs2FormationSlot:
    name = v
    return self


func with_property_id(v) -> Gs2FormationSlot:
    property_id = v
    return self


func with_metadata(v) -> Gs2FormationSlot:
    metadata = v
    return self


static func from_dict(data) -> Gs2FormationSlot:
    if data == null:
        return null
    var ret = Gs2FormationSlot.new()
    ret.name = null if data.get("name") == null else str(data.get("name"))
    ret.property_id = null if data.get("propertyId") == null else str(data.get("propertyId"))
    ret.metadata = null if data.get("metadata") == null else str(data.get("metadata"))
    return ret


func to_dict() -> Dictionary:
    var ret = {}
    ret["name"] = name
    ret["propertyId"] = property_id
    ret["metadata"] = metadata
    return ret