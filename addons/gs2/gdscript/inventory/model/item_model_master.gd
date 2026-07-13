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
class_name Gs2InventoryItemModelMaster
extends RefCounted


var item_model_id = null
var inventory_name = null
var name = null
var description = null
var metadata = null
var stacking_limit = null
var allow_multiple_stacks = null
var sort_value = null
var created_at = null
var updated_at = null
var revision = null


func with_item_model_id(v) -> Gs2InventoryItemModelMaster:
    item_model_id = v
    return self


func with_inventory_name(v) -> Gs2InventoryItemModelMaster:
    inventory_name = v
    return self


func with_name(v) -> Gs2InventoryItemModelMaster:
    name = v
    return self


func with_description(v) -> Gs2InventoryItemModelMaster:
    description = v
    return self


func with_metadata(v) -> Gs2InventoryItemModelMaster:
    metadata = v
    return self


func with_stacking_limit(v) -> Gs2InventoryItemModelMaster:
    stacking_limit = v
    return self


func with_allow_multiple_stacks(v) -> Gs2InventoryItemModelMaster:
    allow_multiple_stacks = v
    return self


func with_sort_value(v) -> Gs2InventoryItemModelMaster:
    sort_value = v
    return self


func with_created_at(v) -> Gs2InventoryItemModelMaster:
    created_at = v
    return self


func with_updated_at(v) -> Gs2InventoryItemModelMaster:
    updated_at = v
    return self


func with_revision(v) -> Gs2InventoryItemModelMaster:
    revision = v
    return self


static func get_region_from_grn(grn):
    if grn == null:
        return null
    var regex = RegEx.new()
    regex.compile("grn:gs2:(?<region>.+):(?<ownerId>.+):inventory:(?<namespaceName>.+):model:(?<inventoryName>.+):item:(?<itemName>.+)")
    var matched = regex.search(grn)
    if matched == null:
        return null
    return matched.get_string("region")


static func get_owner_id_from_grn(grn):
    if grn == null:
        return null
    var regex = RegEx.new()
    regex.compile("grn:gs2:(?<region>.+):(?<ownerId>.+):inventory:(?<namespaceName>.+):model:(?<inventoryName>.+):item:(?<itemName>.+)")
    var matched = regex.search(grn)
    if matched == null:
        return null
    return matched.get_string("ownerId")


static func get_namespace_name_from_grn(grn):
    if grn == null:
        return null
    var regex = RegEx.new()
    regex.compile("grn:gs2:(?<region>.+):(?<ownerId>.+):inventory:(?<namespaceName>.+):model:(?<inventoryName>.+):item:(?<itemName>.+)")
    var matched = regex.search(grn)
    if matched == null:
        return null
    return matched.get_string("namespaceName")


static func get_inventory_name_from_grn(grn):
    if grn == null:
        return null
    var regex = RegEx.new()
    regex.compile("grn:gs2:(?<region>.+):(?<ownerId>.+):inventory:(?<namespaceName>.+):model:(?<inventoryName>.+):item:(?<itemName>.+)")
    var matched = regex.search(grn)
    if matched == null:
        return null
    return matched.get_string("inventoryName")


static func get_item_name_from_grn(grn):
    if grn == null:
        return null
    var regex = RegEx.new()
    regex.compile("grn:gs2:(?<region>.+):(?<ownerId>.+):inventory:(?<namespaceName>.+):model:(?<inventoryName>.+):item:(?<itemName>.+)")
    var matched = regex.search(grn)
    if matched == null:
        return null
    return matched.get_string("itemName")


static func from_dict(data) -> Gs2InventoryItemModelMaster:
    if data == null:
        return null
    var ret = Gs2InventoryItemModelMaster.new()
    ret.item_model_id = null if data.get("itemModelId") == null else str(data.get("itemModelId"))
    ret.inventory_name = null if data.get("inventoryName") == null else str(data.get("inventoryName"))
    ret.name = null if data.get("name") == null else str(data.get("name"))
    ret.description = null if data.get("description") == null else str(data.get("description"))
    ret.metadata = null if data.get("metadata") == null else str(data.get("metadata"))
    ret.stacking_limit = null if data.get("stackingLimit") == null else int(data.get("stackingLimit"))
    ret.allow_multiple_stacks = null if data.get("allowMultipleStacks") == null else bool(data.get("allowMultipleStacks"))
    ret.sort_value = null if data.get("sortValue") == null else int(data.get("sortValue"))
    ret.created_at = null if data.get("createdAt") == null else int(data.get("createdAt"))
    ret.updated_at = null if data.get("updatedAt") == null else int(data.get("updatedAt"))
    ret.revision = null if data.get("revision") == null else int(data.get("revision"))
    return ret


func to_dict() -> Dictionary:
    var ret = {}
    ret["itemModelId"] = item_model_id
    ret["inventoryName"] = inventory_name
    ret["name"] = name
    ret["description"] = description
    ret["metadata"] = metadata
    ret["stackingLimit"] = stacking_limit
    ret["allowMultipleStacks"] = allow_multiple_stacks
    ret["sortValue"] = sort_value
    ret["createdAt"] = created_at
    ret["updatedAt"] = updated_at
    ret["revision"] = revision
    return ret