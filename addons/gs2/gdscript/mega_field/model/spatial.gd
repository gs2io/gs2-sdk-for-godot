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
class_name Gs2MegaFieldSpatial
extends RefCounted


var spatial_id = null
var user_id = null
var area_model_name = null
var layer_model_name = null
var position = null
var vector = null
var r = null
var last_sync_at = null
var created_at = null


func with_spatial_id(v) -> Gs2MegaFieldSpatial:
    spatial_id = v
    return self


func with_user_id(v) -> Gs2MegaFieldSpatial:
    user_id = v
    return self


func with_area_model_name(v) -> Gs2MegaFieldSpatial:
    area_model_name = v
    return self


func with_layer_model_name(v) -> Gs2MegaFieldSpatial:
    layer_model_name = v
    return self


func with_position(v) -> Gs2MegaFieldSpatial:
    position = v
    return self


func with_vector(v) -> Gs2MegaFieldSpatial:
    vector = v
    return self


func with_r(v) -> Gs2MegaFieldSpatial:
    r = v
    return self


func with_last_sync_at(v) -> Gs2MegaFieldSpatial:
    last_sync_at = v
    return self


func with_created_at(v) -> Gs2MegaFieldSpatial:
    created_at = v
    return self


static func get_region_from_grn(grn):
    if grn == null:
        return null
    var regex = RegEx.new()
    regex.compile("grn:gs2:(?<region>.+):(?<ownerId>.+):megaField:(?<namespaceName>.+):user:(?<userId>.+):spatial:(?<areaModelName>.+):(?<layerModelName>.+)")
    var matched = regex.search(grn)
    if matched == null:
        return null
    return matched.get_string("region")


static func get_owner_id_from_grn(grn):
    if grn == null:
        return null
    var regex = RegEx.new()
    regex.compile("grn:gs2:(?<region>.+):(?<ownerId>.+):megaField:(?<namespaceName>.+):user:(?<userId>.+):spatial:(?<areaModelName>.+):(?<layerModelName>.+)")
    var matched = regex.search(grn)
    if matched == null:
        return null
    return matched.get_string("ownerId")


static func get_namespace_name_from_grn(grn):
    if grn == null:
        return null
    var regex = RegEx.new()
    regex.compile("grn:gs2:(?<region>.+):(?<ownerId>.+):megaField:(?<namespaceName>.+):user:(?<userId>.+):spatial:(?<areaModelName>.+):(?<layerModelName>.+)")
    var matched = regex.search(grn)
    if matched == null:
        return null
    return matched.get_string("namespaceName")


static func get_user_id_from_grn(grn):
    if grn == null:
        return null
    var regex = RegEx.new()
    regex.compile("grn:gs2:(?<region>.+):(?<ownerId>.+):megaField:(?<namespaceName>.+):user:(?<userId>.+):spatial:(?<areaModelName>.+):(?<layerModelName>.+)")
    var matched = regex.search(grn)
    if matched == null:
        return null
    return matched.get_string("userId")


static func get_area_model_name_from_grn(grn):
    if grn == null:
        return null
    var regex = RegEx.new()
    regex.compile("grn:gs2:(?<region>.+):(?<ownerId>.+):megaField:(?<namespaceName>.+):user:(?<userId>.+):spatial:(?<areaModelName>.+):(?<layerModelName>.+)")
    var matched = regex.search(grn)
    if matched == null:
        return null
    return matched.get_string("areaModelName")


static func get_layer_model_name_from_grn(grn):
    if grn == null:
        return null
    var regex = RegEx.new()
    regex.compile("grn:gs2:(?<region>.+):(?<ownerId>.+):megaField:(?<namespaceName>.+):user:(?<userId>.+):spatial:(?<areaModelName>.+):(?<layerModelName>.+)")
    var matched = regex.search(grn)
    if matched == null:
        return null
    return matched.get_string("layerModelName")


static func from_dict(data) -> Gs2MegaFieldSpatial:
    if data == null:
        return null
    var ret = Gs2MegaFieldSpatial.new()
    ret.spatial_id = null if data.get("spatialId") == null else str(data.get("spatialId"))
    ret.user_id = null if data.get("userId") == null else str(data.get("userId"))
    ret.area_model_name = null if data.get("areaModelName") == null else str(data.get("areaModelName"))
    ret.layer_model_name = null if data.get("layerModelName") == null else str(data.get("layerModelName"))
    ret.position = null if data.get("position") == null else Gs2MegaFieldPosition.from_dict(data.get("position"))
    ret.vector = null if data.get("vector") == null else Gs2MegaFieldVector.from_dict(data.get("vector"))
    ret.r = null if data.get("r") == null else float(data.get("r"))
    ret.last_sync_at = null if data.get("lastSyncAt") == null else int(data.get("lastSyncAt"))
    ret.created_at = null if data.get("createdAt") == null else int(data.get("createdAt"))
    return ret


func to_dict() -> Dictionary:
    var ret = {}
    ret["spatialId"] = spatial_id
    ret["userId"] = user_id
    ret["areaModelName"] = area_model_name
    ret["layerModelName"] = layer_model_name
    ret["position"] = null if position == null else position.to_dict()
    ret["vector"] = null if vector == null else vector.to_dict()
    ret["r"] = r
    ret["lastSyncAt"] = last_sync_at
    ret["createdAt"] = created_at
    return ret