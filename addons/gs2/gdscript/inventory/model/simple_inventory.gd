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
class_name Gs2InventorySimpleInventory
extends RefCounted


var inventory_id = null
var inventory_name = null
var user_id = null
var simple_items = null
var created_at = null
var updated_at = null
var revision = null


func with_inventory_id(v) -> Gs2InventorySimpleInventory:
    inventory_id = v
    return self


func with_inventory_name(v) -> Gs2InventorySimpleInventory:
    inventory_name = v
    return self


func with_user_id(v) -> Gs2InventorySimpleInventory:
    user_id = v
    return self


func with_simple_items(v) -> Gs2InventorySimpleInventory:
    simple_items = v
    return self


func with_created_at(v) -> Gs2InventorySimpleInventory:
    created_at = v
    return self


func with_updated_at(v) -> Gs2InventorySimpleInventory:
    updated_at = v
    return self


func with_revision(v) -> Gs2InventorySimpleInventory:
    revision = v
    return self


static func get_region_from_grn(grn):
    if grn == null:
        return null
    var regex = RegEx.new()
    regex.compile("grn:gs2:(?<region>.+):(?<ownerId>.+):inventory:(?<namespaceName>.+):user:(?<userId>.+):simple:inventory:(?<inventoryName>.+)")
    var matched = regex.search(grn)
    if matched == null:
        return null
    return matched.get_string("region")


static func get_owner_id_from_grn(grn):
    if grn == null:
        return null
    var regex = RegEx.new()
    regex.compile("grn:gs2:(?<region>.+):(?<ownerId>.+):inventory:(?<namespaceName>.+):user:(?<userId>.+):simple:inventory:(?<inventoryName>.+)")
    var matched = regex.search(grn)
    if matched == null:
        return null
    return matched.get_string("ownerId")


static func get_namespace_name_from_grn(grn):
    if grn == null:
        return null
    var regex = RegEx.new()
    regex.compile("grn:gs2:(?<region>.+):(?<ownerId>.+):inventory:(?<namespaceName>.+):user:(?<userId>.+):simple:inventory:(?<inventoryName>.+)")
    var matched = regex.search(grn)
    if matched == null:
        return null
    return matched.get_string("namespaceName")


static func get_user_id_from_grn(grn):
    if grn == null:
        return null
    var regex = RegEx.new()
    regex.compile("grn:gs2:(?<region>.+):(?<ownerId>.+):inventory:(?<namespaceName>.+):user:(?<userId>.+):simple:inventory:(?<inventoryName>.+)")
    var matched = regex.search(grn)
    if matched == null:
        return null
    return matched.get_string("userId")


static func get_inventory_name_from_grn(grn):
    if grn == null:
        return null
    var regex = RegEx.new()
    regex.compile("grn:gs2:(?<region>.+):(?<ownerId>.+):inventory:(?<namespaceName>.+):user:(?<userId>.+):simple:inventory:(?<inventoryName>.+)")
    var matched = regex.search(grn)
    if matched == null:
        return null
    return matched.get_string("inventoryName")


static func from_dict(data) -> Gs2InventorySimpleInventory:
    if data == null:
        return null
    var ret = Gs2InventorySimpleInventory.new()
    ret.inventory_id = null if data.get("inventoryId") == null else str(data.get("inventoryId"))
    ret.inventory_name = null if data.get("inventoryName") == null else str(data.get("inventoryName"))
    ret.user_id = null if data.get("userId") == null else str(data.get("userId"))
    ret.simple_items = null if data.get("simpleItems") == null else data.get("simpleItems").map(func(v): return Gs2InventorySimpleItem.from_dict(v))
    ret.created_at = null if data.get("createdAt") == null else int(data.get("createdAt"))
    ret.updated_at = null if data.get("updatedAt") == null else int(data.get("updatedAt"))
    ret.revision = null if data.get("revision") == null else int(data.get("revision"))
    return ret


func to_dict() -> Dictionary:
    var ret = {}
    ret["inventoryId"] = inventory_id
    ret["inventoryName"] = inventory_name
    ret["userId"] = user_id
    ret["simpleItems"] = null if simple_items == null else simple_items.map(func(v): return null if v == null else v.to_dict())
    ret["createdAt"] = created_at
    ret["updatedAt"] = updated_at
    ret["revision"] = revision
    return ret