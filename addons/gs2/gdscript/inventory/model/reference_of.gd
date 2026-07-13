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
class_name Gs2InventoryReferenceOf
extends RefCounted


var reference_of_id = null
var name = null


func with_reference_of_id(v) -> Gs2InventoryReferenceOf:
    reference_of_id = v
    return self


func with_name(v) -> Gs2InventoryReferenceOf:
    name = v
    return self


static func get_region_from_grn(grn):
    if grn == null:
        return null
    var regex = RegEx.new()
    regex.compile("grn:gs2:(?<region>.+):(?<ownerId>.+):inventory:(?<namespaceName>.+):user:(?<userId>.+):inventory:(?<inventoryName>.+):item:(?<itemName>.+):itemSet:(?<itemSetName>.+):referenceOf:(?<referenceOf>.+)")
    var matched = regex.search(grn)
    if matched == null:
        return null
    return matched.get_string("region")


static func get_owner_id_from_grn(grn):
    if grn == null:
        return null
    var regex = RegEx.new()
    regex.compile("grn:gs2:(?<region>.+):(?<ownerId>.+):inventory:(?<namespaceName>.+):user:(?<userId>.+):inventory:(?<inventoryName>.+):item:(?<itemName>.+):itemSet:(?<itemSetName>.+):referenceOf:(?<referenceOf>.+)")
    var matched = regex.search(grn)
    if matched == null:
        return null
    return matched.get_string("ownerId")


static func get_namespace_name_from_grn(grn):
    if grn == null:
        return null
    var regex = RegEx.new()
    regex.compile("grn:gs2:(?<region>.+):(?<ownerId>.+):inventory:(?<namespaceName>.+):user:(?<userId>.+):inventory:(?<inventoryName>.+):item:(?<itemName>.+):itemSet:(?<itemSetName>.+):referenceOf:(?<referenceOf>.+)")
    var matched = regex.search(grn)
    if matched == null:
        return null
    return matched.get_string("namespaceName")


static func get_user_id_from_grn(grn):
    if grn == null:
        return null
    var regex = RegEx.new()
    regex.compile("grn:gs2:(?<region>.+):(?<ownerId>.+):inventory:(?<namespaceName>.+):user:(?<userId>.+):inventory:(?<inventoryName>.+):item:(?<itemName>.+):itemSet:(?<itemSetName>.+):referenceOf:(?<referenceOf>.+)")
    var matched = regex.search(grn)
    if matched == null:
        return null
    return matched.get_string("userId")


static func get_inventory_name_from_grn(grn):
    if grn == null:
        return null
    var regex = RegEx.new()
    regex.compile("grn:gs2:(?<region>.+):(?<ownerId>.+):inventory:(?<namespaceName>.+):user:(?<userId>.+):inventory:(?<inventoryName>.+):item:(?<itemName>.+):itemSet:(?<itemSetName>.+):referenceOf:(?<referenceOf>.+)")
    var matched = regex.search(grn)
    if matched == null:
        return null
    return matched.get_string("inventoryName")


static func get_item_name_from_grn(grn):
    if grn == null:
        return null
    var regex = RegEx.new()
    regex.compile("grn:gs2:(?<region>.+):(?<ownerId>.+):inventory:(?<namespaceName>.+):user:(?<userId>.+):inventory:(?<inventoryName>.+):item:(?<itemName>.+):itemSet:(?<itemSetName>.+):referenceOf:(?<referenceOf>.+)")
    var matched = regex.search(grn)
    if matched == null:
        return null
    return matched.get_string("itemName")


static func get_item_set_name_from_grn(grn):
    if grn == null:
        return null
    var regex = RegEx.new()
    regex.compile("grn:gs2:(?<region>.+):(?<ownerId>.+):inventory:(?<namespaceName>.+):user:(?<userId>.+):inventory:(?<inventoryName>.+):item:(?<itemName>.+):itemSet:(?<itemSetName>.+):referenceOf:(?<referenceOf>.+)")
    var matched = regex.search(grn)
    if matched == null:
        return null
    return matched.get_string("itemSetName")


static func get_reference_of_from_grn(grn):
    if grn == null:
        return null
    var regex = RegEx.new()
    regex.compile("grn:gs2:(?<region>.+):(?<ownerId>.+):inventory:(?<namespaceName>.+):user:(?<userId>.+):inventory:(?<inventoryName>.+):item:(?<itemName>.+):itemSet:(?<itemSetName>.+):referenceOf:(?<referenceOf>.+)")
    var matched = regex.search(grn)
    if matched == null:
        return null
    return matched.get_string("referenceOf")


static func from_dict(data) -> Gs2InventoryReferenceOf:
    if data == null:
        return null
    var ret = Gs2InventoryReferenceOf.new()
    ret.reference_of_id = null if data.get("referenceOfId") == null else str(data.get("referenceOfId"))
    ret.name = null if data.get("name") == null else str(data.get("name"))
    return ret


func to_dict() -> Dictionary:
    var ret = {}
    ret["referenceOfId"] = reference_of_id
    ret["name"] = name
    return ret