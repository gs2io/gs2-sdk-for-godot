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
class_name Gs2InventoryDescribeReferenceOfResult
extends RefCounted


var items = null
var item_set = null
var item_model = null
var inventory = null
var metadata = null


func with_items(v) -> Gs2InventoryDescribeReferenceOfResult:
    items = v
    return self


func with_item_set(v) -> Gs2InventoryDescribeReferenceOfResult:
    item_set = v
    return self


func with_item_model(v) -> Gs2InventoryDescribeReferenceOfResult:
    item_model = v
    return self


func with_inventory(v) -> Gs2InventoryDescribeReferenceOfResult:
    inventory = v
    return self


func with_metadata(v) -> Gs2InventoryDescribeReferenceOfResult:
    metadata = v
    return self


static func from_dict(data) -> Gs2InventoryDescribeReferenceOfResult:
    if data == null:
        return null
    var ret = Gs2InventoryDescribeReferenceOfResult.new()
    ret.items = null if data.get("items") == null else data.get("items").map(func(v): return str(v))
    ret.item_set = null if data.get("itemSet") == null else Gs2InventoryItemSet.from_dict(data.get("itemSet"))
    ret.item_model = null if data.get("itemModel") == null else Gs2InventoryItemModel.from_dict(data.get("itemModel"))
    ret.inventory = null if data.get("inventory") == null else Gs2InventoryInventory.from_dict(data.get("inventory"))
    ret.metadata = null if data.get("metadata") == null else Gs2ResultMetadata.from_dict(data.get("metadata"))
    return ret


func to_dict() -> Dictionary:
    var ret = {}
    ret["items"] = items
    ret["itemSet"] = null if item_set == null else item_set.to_dict()
    ret["itemModel"] = null if item_model == null else item_model.to_dict()
    ret["inventory"] = null if inventory == null else inventory.to_dict()
    ret["metadata"] = null if metadata == null else metadata.to_dict()
    return ret