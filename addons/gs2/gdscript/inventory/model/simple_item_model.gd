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
class_name Gs2InventorySimpleItemModel
extends RefCounted


var item_model_id = null
var name = null
var metadata = null


func with_item_model_id(v) -> Gs2InventorySimpleItemModel:
    item_model_id = v
    return self


func with_name(v) -> Gs2InventorySimpleItemModel:
    name = v
    return self


func with_metadata(v) -> Gs2InventorySimpleItemModel:
    metadata = v
    return self


static func get_region_from_grn(grn):
    if grn == null:
        return null
    var regex = RegEx.new()
    regex.compile("grn:gs2:(?<region>.+):(?<ownerId>.+):inventory:(?<namespaceName>.+):simple:model:(?<inventoryName>.+):item:(?<itemName>.+)")
    var matched = regex.search(grn)
    if matched == null:
        return null
    return matched.get_string("region")


static func get_owner_id_from_grn(grn):
    if grn == null:
        return null
    var regex = RegEx.new()
    regex.compile("grn:gs2:(?<region>.+):(?<ownerId>.+):inventory:(?<namespaceName>.+):simple:model:(?<inventoryName>.+):item:(?<itemName>.+)")
    var matched = regex.search(grn)
    if matched == null:
        return null
    return matched.get_string("ownerId")


static func get_namespace_name_from_grn(grn):
    if grn == null:
        return null
    var regex = RegEx.new()
    regex.compile("grn:gs2:(?<region>.+):(?<ownerId>.+):inventory:(?<namespaceName>.+):simple:model:(?<inventoryName>.+):item:(?<itemName>.+)")
    var matched = regex.search(grn)
    if matched == null:
        return null
    return matched.get_string("namespaceName")


static func get_inventory_name_from_grn(grn):
    if grn == null:
        return null
    var regex = RegEx.new()
    regex.compile("grn:gs2:(?<region>.+):(?<ownerId>.+):inventory:(?<namespaceName>.+):simple:model:(?<inventoryName>.+):item:(?<itemName>.+)")
    var matched = regex.search(grn)
    if matched == null:
        return null
    return matched.get_string("inventoryName")


static func get_item_name_from_grn(grn):
    if grn == null:
        return null
    var regex = RegEx.new()
    regex.compile("grn:gs2:(?<region>.+):(?<ownerId>.+):inventory:(?<namespaceName>.+):simple:model:(?<inventoryName>.+):item:(?<itemName>.+)")
    var matched = regex.search(grn)
    if matched == null:
        return null
    return matched.get_string("itemName")


static func from_dict(data) -> Gs2InventorySimpleItemModel:
    if data == null:
        return null
    var ret = Gs2InventorySimpleItemModel.new()
    ret.item_model_id = null if data.get("itemModelId") == null else str(data.get("itemModelId"))
    ret.name = null if data.get("name") == null else str(data.get("name"))
    ret.metadata = null if data.get("metadata") == null else str(data.get("metadata"))
    return ret


func to_dict() -> Dictionary:
    var ret = {}
    ret["itemModelId"] = item_model_id
    ret["name"] = name
    ret["metadata"] = metadata
    return ret