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
class_name Gs2InventoryInventoryModel
extends RefCounted


var inventory_model_id = null
var name = null
var metadata = null
var initial_capacity = null
var max_capacity = null
var protect_referenced_item = null
var item_models = null


func with_inventory_model_id(v) -> Gs2InventoryInventoryModel:
    inventory_model_id = v
    return self


func with_name(v) -> Gs2InventoryInventoryModel:
    name = v
    return self


func with_metadata(v) -> Gs2InventoryInventoryModel:
    metadata = v
    return self


func with_initial_capacity(v) -> Gs2InventoryInventoryModel:
    initial_capacity = v
    return self


func with_max_capacity(v) -> Gs2InventoryInventoryModel:
    max_capacity = v
    return self


func with_protect_referenced_item(v) -> Gs2InventoryInventoryModel:
    protect_referenced_item = v
    return self


func with_item_models(v) -> Gs2InventoryInventoryModel:
    item_models = v
    return self


static func get_region_from_grn(grn):
    if grn == null:
        return null
    var regex = RegEx.new()
    regex.compile("grn:gs2:(?<region>.+):(?<ownerId>.+):inventory:(?<namespaceName>.+):model:(?<inventoryName>.+)")
    var matched = regex.search(grn)
    if matched == null:
        return null
    return matched.get_string("region")


static func get_owner_id_from_grn(grn):
    if grn == null:
        return null
    var regex = RegEx.new()
    regex.compile("grn:gs2:(?<region>.+):(?<ownerId>.+):inventory:(?<namespaceName>.+):model:(?<inventoryName>.+)")
    var matched = regex.search(grn)
    if matched == null:
        return null
    return matched.get_string("ownerId")


static func get_namespace_name_from_grn(grn):
    if grn == null:
        return null
    var regex = RegEx.new()
    regex.compile("grn:gs2:(?<region>.+):(?<ownerId>.+):inventory:(?<namespaceName>.+):model:(?<inventoryName>.+)")
    var matched = regex.search(grn)
    if matched == null:
        return null
    return matched.get_string("namespaceName")


static func get_inventory_name_from_grn(grn):
    if grn == null:
        return null
    var regex = RegEx.new()
    regex.compile("grn:gs2:(?<region>.+):(?<ownerId>.+):inventory:(?<namespaceName>.+):model:(?<inventoryName>.+)")
    var matched = regex.search(grn)
    if matched == null:
        return null
    return matched.get_string("inventoryName")


static func from_dict(data) -> Gs2InventoryInventoryModel:
    if data == null:
        return null
    var ret = Gs2InventoryInventoryModel.new()
    ret.inventory_model_id = null if data.get("inventoryModelId") == null else str(data.get("inventoryModelId"))
    ret.name = null if data.get("name") == null else str(data.get("name"))
    ret.metadata = null if data.get("metadata") == null else str(data.get("metadata"))
    ret.initial_capacity = null if data.get("initialCapacity") == null else int(data.get("initialCapacity"))
    ret.max_capacity = null if data.get("maxCapacity") == null else int(data.get("maxCapacity"))
    ret.protect_referenced_item = null if data.get("protectReferencedItem") == null else bool(data.get("protectReferencedItem"))
    ret.item_models = null if data.get("itemModels") == null else data.get("itemModels").map(func(v): return Gs2InventoryItemModel.from_dict(v))
    return ret


func to_dict() -> Dictionary:
    var ret = {}
    ret["inventoryModelId"] = inventory_model_id
    ret["name"] = name
    ret["metadata"] = metadata
    ret["initialCapacity"] = initial_capacity
    ret["maxCapacity"] = max_capacity
    ret["protectReferencedItem"] = protect_referenced_item
    ret["itemModels"] = null if item_models == null else item_models.map(func(v): return null if v == null else v.to_dict())
    return ret