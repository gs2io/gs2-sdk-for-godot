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
class_name Gs2InventoryEzInventory
extends RefCounted


var inventory_id = null
var inventory_name = null
var current_inventory_capacity_usage = 0
var current_inventory_max_capacity = 0


func with_inventory_id(v) -> Gs2InventoryEzInventory:
    inventory_id = v
    return self


func with_inventory_name(v) -> Gs2InventoryEzInventory:
    inventory_name = v
    return self


func with_current_inventory_capacity_usage(v) -> Gs2InventoryEzInventory:
    current_inventory_capacity_usage = v
    return self


func with_current_inventory_max_capacity(v) -> Gs2InventoryEzInventory:
    current_inventory_max_capacity = v
    return self


func to_model() -> Gs2InventoryInventory:
    var ret = Gs2InventoryInventory.new()
    ret.inventory_id = inventory_id
    ret.inventory_name = inventory_name
    ret.current_inventory_capacity_usage = current_inventory_capacity_usage
    ret.current_inventory_max_capacity = current_inventory_max_capacity
    return ret


static func from_model(model) -> Gs2InventoryEzInventory:
    var ret = Gs2InventoryEzInventory.new()
    ret.inventory_id = model.inventory_id
    ret.inventory_name = model.inventory_name
    ret.current_inventory_capacity_usage = 0 if model.current_inventory_capacity_usage == null else model.current_inventory_capacity_usage
    ret.current_inventory_max_capacity = 0 if model.current_inventory_max_capacity == null else model.current_inventory_max_capacity
    return ret