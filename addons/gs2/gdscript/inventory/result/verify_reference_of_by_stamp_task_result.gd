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
class_name Gs2InventoryVerifyReferenceOfByStampTaskResult
extends RefCounted


var item = null
var item_set = null
var item_model = null
var inventory = null
var new_context_stack = null
var metadata = null


func with_item(v) -> Gs2InventoryVerifyReferenceOfByStampTaskResult:
    item = v
    return self


func with_item_set(v) -> Gs2InventoryVerifyReferenceOfByStampTaskResult:
    item_set = v
    return self


func with_item_model(v) -> Gs2InventoryVerifyReferenceOfByStampTaskResult:
    item_model = v
    return self


func with_inventory(v) -> Gs2InventoryVerifyReferenceOfByStampTaskResult:
    inventory = v
    return self


func with_new_context_stack(v) -> Gs2InventoryVerifyReferenceOfByStampTaskResult:
    new_context_stack = v
    return self


func with_metadata(v) -> Gs2InventoryVerifyReferenceOfByStampTaskResult:
    metadata = v
    return self


static func from_dict(data) -> Gs2InventoryVerifyReferenceOfByStampTaskResult:
    if data == null:
        return null
    var ret = Gs2InventoryVerifyReferenceOfByStampTaskResult.new()
    ret.item = null if data.get("item") == null else str(data.get("item"))
    ret.item_set = null if data.get("itemSet") == null else Gs2InventoryItemSet.from_dict(data.get("itemSet"))
    ret.item_model = null if data.get("itemModel") == null else Gs2InventoryItemModel.from_dict(data.get("itemModel"))
    ret.inventory = null if data.get("inventory") == null else Gs2InventoryInventory.from_dict(data.get("inventory"))
    ret.new_context_stack = null if data.get("newContextStack") == null else str(data.get("newContextStack"))
    ret.metadata = null if data.get("metadata") == null else Gs2ResultMetadata.from_dict(data.get("metadata"))
    return ret


func to_dict() -> Dictionary:
    var ret = {}
    ret["item"] = item
    ret["itemSet"] = null if item_set == null else item_set.to_dict()
    ret["itemModel"] = null if item_model == null else item_model.to_dict()
    ret["inventory"] = null if inventory == null else inventory.to_dict()
    ret["newContextStack"] = new_context_stack
    ret["metadata"] = null if metadata == null else metadata.to_dict()
    return ret