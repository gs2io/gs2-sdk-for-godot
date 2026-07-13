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
class_name Gs2InventoryEzItemSet
extends RefCounted


var item_set_id = null
var name = null
var inventory_name = null
var item_name = null
var count = 0
var sort_value = 0
var expires_at = 0
var reference_of = []


func with_item_set_id(v) -> Gs2InventoryEzItemSet:
    item_set_id = v
    return self


func with_name(v) -> Gs2InventoryEzItemSet:
    name = v
    return self


func with_inventory_name(v) -> Gs2InventoryEzItemSet:
    inventory_name = v
    return self


func with_item_name(v) -> Gs2InventoryEzItemSet:
    item_name = v
    return self


func with_count(v) -> Gs2InventoryEzItemSet:
    count = v
    return self


func with_sort_value(v) -> Gs2InventoryEzItemSet:
    sort_value = v
    return self


func with_expires_at(v) -> Gs2InventoryEzItemSet:
    expires_at = v
    return self


func with_reference_of(v) -> Gs2InventoryEzItemSet:
    reference_of = v
    return self


func to_model() -> Gs2InventoryItemSet:
    var ret = Gs2InventoryItemSet.new()
    ret.item_set_id = item_set_id
    ret.name = name
    ret.inventory_name = inventory_name
    ret.item_name = item_name
    ret.count = count
    ret.sort_value = sort_value
    ret.expires_at = expires_at
    ret.reference_of = null if reference_of == null else reference_of.map(func(v): return v)
    return ret


static func from_model(model) -> Gs2InventoryEzItemSet:
    var ret = Gs2InventoryEzItemSet.new()
    ret.item_set_id = model.item_set_id
    ret.name = model.name
    ret.inventory_name = model.inventory_name
    ret.item_name = model.item_name
    ret.count = 0 if model.count == null else model.count
    ret.sort_value = 0 if model.sort_value == null else model.sort_value
    ret.expires_at = 0 if model.expires_at == null else model.expires_at
    ret.reference_of = [] if model.reference_of == null else model.reference_of.map(func(v): return v)
    return ret