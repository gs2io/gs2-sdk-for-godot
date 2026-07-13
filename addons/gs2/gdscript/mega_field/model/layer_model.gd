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
class_name Gs2MegaFieldLayerModel
extends RefCounted


var layer_model_id = null
var name = null
var metadata = null


func with_layer_model_id(v) -> Gs2MegaFieldLayerModel:
    layer_model_id = v
    return self


func with_name(v) -> Gs2MegaFieldLayerModel:
    name = v
    return self


func with_metadata(v) -> Gs2MegaFieldLayerModel:
    metadata = v
    return self


static func get_region_from_grn(grn):
    if grn == null:
        return null
    var regex = RegEx.new()
    regex.compile("grn:gs2:(?<region>.+):(?<ownerId>.+):megaField:(?<namespaceName>.+):model:area:(?<areaModelName>.+):layer:(?<layerModelName>.+)")
    var matched = regex.search(grn)
    if matched == null:
        return null
    return matched.get_string("region")


static func get_owner_id_from_grn(grn):
    if grn == null:
        return null
    var regex = RegEx.new()
    regex.compile("grn:gs2:(?<region>.+):(?<ownerId>.+):megaField:(?<namespaceName>.+):model:area:(?<areaModelName>.+):layer:(?<layerModelName>.+)")
    var matched = regex.search(grn)
    if matched == null:
        return null
    return matched.get_string("ownerId")


static func get_namespace_name_from_grn(grn):
    if grn == null:
        return null
    var regex = RegEx.new()
    regex.compile("grn:gs2:(?<region>.+):(?<ownerId>.+):megaField:(?<namespaceName>.+):model:area:(?<areaModelName>.+):layer:(?<layerModelName>.+)")
    var matched = regex.search(grn)
    if matched == null:
        return null
    return matched.get_string("namespaceName")


static func get_area_model_name_from_grn(grn):
    if grn == null:
        return null
    var regex = RegEx.new()
    regex.compile("grn:gs2:(?<region>.+):(?<ownerId>.+):megaField:(?<namespaceName>.+):model:area:(?<areaModelName>.+):layer:(?<layerModelName>.+)")
    var matched = regex.search(grn)
    if matched == null:
        return null
    return matched.get_string("areaModelName")


static func get_layer_model_name_from_grn(grn):
    if grn == null:
        return null
    var regex = RegEx.new()
    regex.compile("grn:gs2:(?<region>.+):(?<ownerId>.+):megaField:(?<namespaceName>.+):model:area:(?<areaModelName>.+):layer:(?<layerModelName>.+)")
    var matched = regex.search(grn)
    if matched == null:
        return null
    return matched.get_string("layerModelName")


static func from_dict(data) -> Gs2MegaFieldLayerModel:
    if data == null:
        return null
    var ret = Gs2MegaFieldLayerModel.new()
    ret.layer_model_id = null if data.get("layerModelId") == null else str(data.get("layerModelId"))
    ret.name = null if data.get("name") == null else str(data.get("name"))
    ret.metadata = null if data.get("metadata") == null else str(data.get("metadata"))
    return ret


func to_dict() -> Dictionary:
    var ret = {}
    ret["layerModelId"] = layer_model_id
    ret["name"] = name
    ret["metadata"] = metadata
    return ret