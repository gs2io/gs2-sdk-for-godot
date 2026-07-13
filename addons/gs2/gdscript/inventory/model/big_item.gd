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
class_name Gs2InventoryBigItem
extends RefCounted


var item_id = null
var user_id = null
var item_name = null
var count = null
var created_at = null
var updated_at = null
var revision = null


func with_item_id(v) -> Gs2InventoryBigItem:
    item_id = v
    return self


func with_user_id(v) -> Gs2InventoryBigItem:
    user_id = v
    return self


func with_item_name(v) -> Gs2InventoryBigItem:
    item_name = v
    return self


func with_count(v) -> Gs2InventoryBigItem:
    count = v
    return self


func with_created_at(v) -> Gs2InventoryBigItem:
    created_at = v
    return self


func with_updated_at(v) -> Gs2InventoryBigItem:
    updated_at = v
    return self


func with_revision(v) -> Gs2InventoryBigItem:
    revision = v
    return self


static func get_region_from_grn(grn):
    if grn == null:
        return null
    var regex = RegEx.new()
    regex.compile("grn:gs2:(?<region>.+):(?<ownerId>.+):inventory:(?<namespaceName>.+):user:(?<userId>.+):big:inventory:(?<inventoryName>.+):item:(?<itemName>.+)")
    var matched = regex.search(grn)
    if matched == null:
        return null
    return matched.get_string("region")


static func get_owner_id_from_grn(grn):
    if grn == null:
        return null
    var regex = RegEx.new()
    regex.compile("grn:gs2:(?<region>.+):(?<ownerId>.+):inventory:(?<namespaceName>.+):user:(?<userId>.+):big:inventory:(?<inventoryName>.+):item:(?<itemName>.+)")
    var matched = regex.search(grn)
    if matched == null:
        return null
    return matched.get_string("ownerId")


static func get_namespace_name_from_grn(grn):
    if grn == null:
        return null
    var regex = RegEx.new()
    regex.compile("grn:gs2:(?<region>.+):(?<ownerId>.+):inventory:(?<namespaceName>.+):user:(?<userId>.+):big:inventory:(?<inventoryName>.+):item:(?<itemName>.+)")
    var matched = regex.search(grn)
    if matched == null:
        return null
    return matched.get_string("namespaceName")


static func get_user_id_from_grn(grn):
    if grn == null:
        return null
    var regex = RegEx.new()
    regex.compile("grn:gs2:(?<region>.+):(?<ownerId>.+):inventory:(?<namespaceName>.+):user:(?<userId>.+):big:inventory:(?<inventoryName>.+):item:(?<itemName>.+)")
    var matched = regex.search(grn)
    if matched == null:
        return null
    return matched.get_string("userId")


static func get_inventory_name_from_grn(grn):
    if grn == null:
        return null
    var regex = RegEx.new()
    regex.compile("grn:gs2:(?<region>.+):(?<ownerId>.+):inventory:(?<namespaceName>.+):user:(?<userId>.+):big:inventory:(?<inventoryName>.+):item:(?<itemName>.+)")
    var matched = regex.search(grn)
    if matched == null:
        return null
    return matched.get_string("inventoryName")


static func get_item_name_from_grn(grn):
    if grn == null:
        return null
    var regex = RegEx.new()
    regex.compile("grn:gs2:(?<region>.+):(?<ownerId>.+):inventory:(?<namespaceName>.+):user:(?<userId>.+):big:inventory:(?<inventoryName>.+):item:(?<itemName>.+)")
    var matched = regex.search(grn)
    if matched == null:
        return null
    return matched.get_string("itemName")


static func from_dict(data) -> Gs2InventoryBigItem:
    if data == null:
        return null
    var ret = Gs2InventoryBigItem.new()
    ret.item_id = null if data.get("itemId") == null else str(data.get("itemId"))
    ret.user_id = null if data.get("userId") == null else str(data.get("userId"))
    ret.item_name = null if data.get("itemName") == null else str(data.get("itemName"))
    ret.count = null if data.get("count") == null else str(data.get("count"))
    ret.created_at = null if data.get("createdAt") == null else int(data.get("createdAt"))
    ret.updated_at = null if data.get("updatedAt") == null else int(data.get("updatedAt"))
    ret.revision = null if data.get("revision") == null else int(data.get("revision"))
    return ret


func to_dict() -> Dictionary:
    var ret = {}
    ret["itemId"] = item_id
    ret["userId"] = user_id
    ret["itemName"] = item_name
    ret["count"] = count
    ret["createdAt"] = created_at
    ret["updatedAt"] = updated_at
    ret["revision"] = revision
    return ret