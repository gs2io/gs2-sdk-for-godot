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
class_name Gs2InventoryItemSet
extends RefCounted


var item_set_id = null
var name = null
var inventory_name = null
var user_id = null
var item_name = null
var count = null
var reference_of = null
var sort_value = null
var expires_at = null
var created_at = null
var updated_at = null


func with_item_set_id(v) -> Gs2InventoryItemSet:
    item_set_id = v
    return self


func with_name(v) -> Gs2InventoryItemSet:
    name = v
    return self


func with_inventory_name(v) -> Gs2InventoryItemSet:
    inventory_name = v
    return self


func with_user_id(v) -> Gs2InventoryItemSet:
    user_id = v
    return self


func with_item_name(v) -> Gs2InventoryItemSet:
    item_name = v
    return self


func with_count(v) -> Gs2InventoryItemSet:
    count = v
    return self


func with_reference_of(v) -> Gs2InventoryItemSet:
    reference_of = v
    return self


func with_sort_value(v) -> Gs2InventoryItemSet:
    sort_value = v
    return self


func with_expires_at(v) -> Gs2InventoryItemSet:
    expires_at = v
    return self


func with_created_at(v) -> Gs2InventoryItemSet:
    created_at = v
    return self


func with_updated_at(v) -> Gs2InventoryItemSet:
    updated_at = v
    return self


static func get_region_from_grn(grn):
    if grn == null:
        return null
    var regex = RegEx.new()
    regex.compile("grn:gs2:(?<region>.+):(?<ownerId>.+):inventory:(?<namespaceName>.+):user:(?<userId>.+):inventory:(?<inventoryName>.+):item:(?<itemName>.+):itemSet:(?<itemSetName>.+)")
    var matched = regex.search(grn)
    if matched == null:
        return null
    return matched.get_string("region")


static func get_owner_id_from_grn(grn):
    if grn == null:
        return null
    var regex = RegEx.new()
    regex.compile("grn:gs2:(?<region>.+):(?<ownerId>.+):inventory:(?<namespaceName>.+):user:(?<userId>.+):inventory:(?<inventoryName>.+):item:(?<itemName>.+):itemSet:(?<itemSetName>.+)")
    var matched = regex.search(grn)
    if matched == null:
        return null
    return matched.get_string("ownerId")


static func get_namespace_name_from_grn(grn):
    if grn == null:
        return null
    var regex = RegEx.new()
    regex.compile("grn:gs2:(?<region>.+):(?<ownerId>.+):inventory:(?<namespaceName>.+):user:(?<userId>.+):inventory:(?<inventoryName>.+):item:(?<itemName>.+):itemSet:(?<itemSetName>.+)")
    var matched = regex.search(grn)
    if matched == null:
        return null
    return matched.get_string("namespaceName")


static func get_user_id_from_grn(grn):
    if grn == null:
        return null
    var regex = RegEx.new()
    regex.compile("grn:gs2:(?<region>.+):(?<ownerId>.+):inventory:(?<namespaceName>.+):user:(?<userId>.+):inventory:(?<inventoryName>.+):item:(?<itemName>.+):itemSet:(?<itemSetName>.+)")
    var matched = regex.search(grn)
    if matched == null:
        return null
    return matched.get_string("userId")


static func get_inventory_name_from_grn(grn):
    if grn == null:
        return null
    var regex = RegEx.new()
    regex.compile("grn:gs2:(?<region>.+):(?<ownerId>.+):inventory:(?<namespaceName>.+):user:(?<userId>.+):inventory:(?<inventoryName>.+):item:(?<itemName>.+):itemSet:(?<itemSetName>.+)")
    var matched = regex.search(grn)
    if matched == null:
        return null
    return matched.get_string("inventoryName")


static func get_item_name_from_grn(grn):
    if grn == null:
        return null
    var regex = RegEx.new()
    regex.compile("grn:gs2:(?<region>.+):(?<ownerId>.+):inventory:(?<namespaceName>.+):user:(?<userId>.+):inventory:(?<inventoryName>.+):item:(?<itemName>.+):itemSet:(?<itemSetName>.+)")
    var matched = regex.search(grn)
    if matched == null:
        return null
    return matched.get_string("itemName")


static func get_item_set_name_from_grn(grn):
    if grn == null:
        return null
    var regex = RegEx.new()
    regex.compile("grn:gs2:(?<region>.+):(?<ownerId>.+):inventory:(?<namespaceName>.+):user:(?<userId>.+):inventory:(?<inventoryName>.+):item:(?<itemName>.+):itemSet:(?<itemSetName>.+)")
    var matched = regex.search(grn)
    if matched == null:
        return null
    return matched.get_string("itemSetName")


static func from_dict(data) -> Gs2InventoryItemSet:
    if data == null:
        return null
    var ret = Gs2InventoryItemSet.new()
    ret.item_set_id = null if data.get("itemSetId") == null else str(data.get("itemSetId"))
    ret.name = null if data.get("name") == null else str(data.get("name"))
    ret.inventory_name = null if data.get("inventoryName") == null else str(data.get("inventoryName"))
    ret.user_id = null if data.get("userId") == null else str(data.get("userId"))
    ret.item_name = null if data.get("itemName") == null else str(data.get("itemName"))
    ret.count = null if data.get("count") == null else int(data.get("count"))
    ret.reference_of = null if data.get("referenceOf") == null else data.get("referenceOf").map(func(v): return str(v))
    ret.sort_value = null if data.get("sortValue") == null else int(data.get("sortValue"))
    ret.expires_at = null if data.get("expiresAt") == null else int(data.get("expiresAt"))
    ret.created_at = null if data.get("createdAt") == null else int(data.get("createdAt"))
    ret.updated_at = null if data.get("updatedAt") == null else int(data.get("updatedAt"))
    return ret


func to_dict() -> Dictionary:
    var ret = {}
    ret["itemSetId"] = item_set_id
    ret["name"] = name
    ret["inventoryName"] = inventory_name
    ret["userId"] = user_id
    ret["itemName"] = item_name
    ret["count"] = count
    ret["referenceOf"] = reference_of
    ret["sortValue"] = sort_value
    ret["expiresAt"] = expires_at
    ret["createdAt"] = created_at
    ret["updatedAt"] = updated_at
    return ret