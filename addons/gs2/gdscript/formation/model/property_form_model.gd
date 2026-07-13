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
class_name Gs2FormationPropertyFormModel
extends RefCounted


var property_form_model_id = null
var name = null
var metadata = null
var slots = null


func with_property_form_model_id(v) -> Gs2FormationPropertyFormModel:
    property_form_model_id = v
    return self


func with_name(v) -> Gs2FormationPropertyFormModel:
    name = v
    return self


func with_metadata(v) -> Gs2FormationPropertyFormModel:
    metadata = v
    return self


func with_slots(v) -> Gs2FormationPropertyFormModel:
    slots = v
    return self


static func get_region_from_grn(grn):
    if grn == null:
        return null
    var regex = RegEx.new()
    regex.compile("grn:gs2:(?<region>.+):(?<ownerId>.+):formation:(?<namespaceName>.+):model:propertyForm:(?<propertyFormModelName>.+)")
    var matched = regex.search(grn)
    if matched == null:
        return null
    return matched.get_string("region")


static func get_owner_id_from_grn(grn):
    if grn == null:
        return null
    var regex = RegEx.new()
    regex.compile("grn:gs2:(?<region>.+):(?<ownerId>.+):formation:(?<namespaceName>.+):model:propertyForm:(?<propertyFormModelName>.+)")
    var matched = regex.search(grn)
    if matched == null:
        return null
    return matched.get_string("ownerId")


static func get_namespace_name_from_grn(grn):
    if grn == null:
        return null
    var regex = RegEx.new()
    regex.compile("grn:gs2:(?<region>.+):(?<ownerId>.+):formation:(?<namespaceName>.+):model:propertyForm:(?<propertyFormModelName>.+)")
    var matched = regex.search(grn)
    if matched == null:
        return null
    return matched.get_string("namespaceName")


static func get_property_form_model_name_from_grn(grn):
    if grn == null:
        return null
    var regex = RegEx.new()
    regex.compile("grn:gs2:(?<region>.+):(?<ownerId>.+):formation:(?<namespaceName>.+):model:propertyForm:(?<propertyFormModelName>.+)")
    var matched = regex.search(grn)
    if matched == null:
        return null
    return matched.get_string("propertyFormModelName")


static func from_dict(data) -> Gs2FormationPropertyFormModel:
    if data == null:
        return null
    var ret = Gs2FormationPropertyFormModel.new()
    ret.property_form_model_id = null if data.get("propertyFormModelId") == null else str(data.get("propertyFormModelId"))
    ret.name = null if data.get("name") == null else str(data.get("name"))
    ret.metadata = null if data.get("metadata") == null else str(data.get("metadata"))
    ret.slots = null if data.get("slots") == null else data.get("slots").map(func(v): return Gs2FormationSlotModel.from_dict(v))
    return ret


func to_dict() -> Dictionary:
    var ret = {}
    ret["propertyFormModelId"] = property_form_model_id
    ret["name"] = name
    ret["metadata"] = metadata
    ret["slots"] = null if slots == null else slots.map(func(v): return null if v == null else v.to_dict())
    return ret