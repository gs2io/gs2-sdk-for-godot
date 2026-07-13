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
class_name Gs2InventoryAcquireItemSetByUserIdRequest
extends Gs2Request


var namespace_name = null
var inventory_name = null
var item_name = null
var user_id = null
var acquire_count = null
var expires_at = null
var create_new_item_set = null
var item_set_name = null
var time_offset_token = null
var duplication_avoider = null


func with_namespace_name(v) -> Gs2InventoryAcquireItemSetByUserIdRequest:
    namespace_name = v
    return self


func with_inventory_name(v) -> Gs2InventoryAcquireItemSetByUserIdRequest:
    inventory_name = v
    return self


func with_item_name(v) -> Gs2InventoryAcquireItemSetByUserIdRequest:
    item_name = v
    return self


func with_user_id(v) -> Gs2InventoryAcquireItemSetByUserIdRequest:
    user_id = v
    return self


func with_acquire_count(v) -> Gs2InventoryAcquireItemSetByUserIdRequest:
    acquire_count = v
    return self


func with_expires_at(v) -> Gs2InventoryAcquireItemSetByUserIdRequest:
    expires_at = v
    return self


func with_create_new_item_set(v) -> Gs2InventoryAcquireItemSetByUserIdRequest:
    create_new_item_set = v
    return self


func with_item_set_name(v) -> Gs2InventoryAcquireItemSetByUserIdRequest:
    item_set_name = v
    return self


func with_time_offset_token(v) -> Gs2InventoryAcquireItemSetByUserIdRequest:
    time_offset_token = v
    return self


func with_duplication_avoider(v) -> Gs2InventoryAcquireItemSetByUserIdRequest:
    duplication_avoider = v
    return self


static func from_dict(data) -> Gs2InventoryAcquireItemSetByUserIdRequest:
    if data == null:
        return null
    var ret = Gs2InventoryAcquireItemSetByUserIdRequest.new()
    ret.namespace_name = null if data.get("namespaceName") == null else str(data.get("namespaceName"))
    ret.inventory_name = null if data.get("inventoryName") == null else str(data.get("inventoryName"))
    ret.item_name = null if data.get("itemName") == null else str(data.get("itemName"))
    ret.user_id = null if data.get("userId") == null else str(data.get("userId"))
    ret.acquire_count = null if data.get("acquireCount") == null else int(data.get("acquireCount"))
    ret.expires_at = null if data.get("expiresAt") == null else int(data.get("expiresAt"))
    ret.create_new_item_set = null if data.get("createNewItemSet") == null else bool(data.get("createNewItemSet"))
    ret.item_set_name = null if data.get("itemSetName") == null else str(data.get("itemSetName"))
    ret.time_offset_token = null if data.get("timeOffsetToken") == null else str(data.get("timeOffsetToken"))
    return ret


func to_dict() -> Dictionary:
    var ret = {}
    ret["namespaceName"] = namespace_name
    ret["inventoryName"] = inventory_name
    ret["itemName"] = item_name
    ret["userId"] = user_id
    ret["acquireCount"] = acquire_count
    ret["expiresAt"] = expires_at
    ret["createNewItemSet"] = create_new_item_set
    ret["itemSetName"] = item_set_name
    ret["timeOffsetToken"] = time_offset_token
    return ret