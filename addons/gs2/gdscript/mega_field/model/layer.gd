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
class_name Gs2MegaFieldLayer
extends RefCounted


var layer_id = null
var area_model_name = null
var layer_model_name = null
var number_of_min_entries = null
var number_of_max_entries = null
var created_at = null


func with_layer_id(v) -> Gs2MegaFieldLayer:
    layer_id = v
    return self


func with_area_model_name(v) -> Gs2MegaFieldLayer:
    area_model_name = v
    return self


func with_layer_model_name(v) -> Gs2MegaFieldLayer:
    layer_model_name = v
    return self


func with_number_of_min_entries(v) -> Gs2MegaFieldLayer:
    number_of_min_entries = v
    return self


func with_number_of_max_entries(v) -> Gs2MegaFieldLayer:
    number_of_max_entries = v
    return self


func with_created_at(v) -> Gs2MegaFieldLayer:
    created_at = v
    return self


static func get_region_from_grn(grn):
    if grn == null:
        return null
    var regex = RegEx.new()
    regex.compile("grn:gs2:(?<region>.+):(?<ownerId>.+):megaField:(?<namespaceName>.+):layer:(?<areaModelName>.+):(?<layerModelName>.+)")
    var matched = regex.search(grn)
    if matched == null:
        return null
    return matched.get_string("region")


static func get_owner_id_from_grn(grn):
    if grn == null:
        return null
    var regex = RegEx.new()
    regex.compile("grn:gs2:(?<region>.+):(?<ownerId>.+):megaField:(?<namespaceName>.+):layer:(?<areaModelName>.+):(?<layerModelName>.+)")
    var matched = regex.search(grn)
    if matched == null:
        return null
    return matched.get_string("ownerId")


static func get_namespace_name_from_grn(grn):
    if grn == null:
        return null
    var regex = RegEx.new()
    regex.compile("grn:gs2:(?<region>.+):(?<ownerId>.+):megaField:(?<namespaceName>.+):layer:(?<areaModelName>.+):(?<layerModelName>.+)")
    var matched = regex.search(grn)
    if matched == null:
        return null
    return matched.get_string("namespaceName")


static func get_area_model_name_from_grn(grn):
    if grn == null:
        return null
    var regex = RegEx.new()
    regex.compile("grn:gs2:(?<region>.+):(?<ownerId>.+):megaField:(?<namespaceName>.+):layer:(?<areaModelName>.+):(?<layerModelName>.+)")
    var matched = regex.search(grn)
    if matched == null:
        return null
    return matched.get_string("areaModelName")


static func get_layer_model_name_from_grn(grn):
    if grn == null:
        return null
    var regex = RegEx.new()
    regex.compile("grn:gs2:(?<region>.+):(?<ownerId>.+):megaField:(?<namespaceName>.+):layer:(?<areaModelName>.+):(?<layerModelName>.+)")
    var matched = regex.search(grn)
    if matched == null:
        return null
    return matched.get_string("layerModelName")


static func from_dict(data) -> Gs2MegaFieldLayer:
    if data == null:
        return null
    var ret = Gs2MegaFieldLayer.new()
    ret.layer_id = null if data.get("layerId") == null else str(data.get("layerId"))
    ret.area_model_name = null if data.get("areaModelName") == null else str(data.get("areaModelName"))
    ret.layer_model_name = null if data.get("layerModelName") == null else str(data.get("layerModelName"))
    ret.number_of_min_entries = null if data.get("numberOfMinEntries") == null else int(data.get("numberOfMinEntries"))
    ret.number_of_max_entries = null if data.get("numberOfMaxEntries") == null else int(data.get("numberOfMaxEntries"))
    ret.created_at = null if data.get("createdAt") == null else int(data.get("createdAt"))
    return ret


func to_dict() -> Dictionary:
    var ret = {}
    ret["layerId"] = layer_id
    ret["areaModelName"] = area_model_name
    ret["layerModelName"] = layer_model_name
    ret["numberOfMinEntries"] = number_of_min_entries
    ret["numberOfMaxEntries"] = number_of_max_entries
    ret["createdAt"] = created_at
    return ret