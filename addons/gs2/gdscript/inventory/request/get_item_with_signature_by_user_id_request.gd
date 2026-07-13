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
class_name Gs2InventoryGetItemWithSignatureByUserIdRequest
extends Gs2Request


var namespace_name = null
var inventory_name = null
var user_id = null
var item_name = null
var item_set_name = null
var key_id = null
var time_offset_token = null


func with_namespace_name(v) -> Gs2InventoryGetItemWithSignatureByUserIdRequest:
    namespace_name = v
    return self


func with_inventory_name(v) -> Gs2InventoryGetItemWithSignatureByUserIdRequest:
    inventory_name = v
    return self


func with_user_id(v) -> Gs2InventoryGetItemWithSignatureByUserIdRequest:
    user_id = v
    return self


func with_item_name(v) -> Gs2InventoryGetItemWithSignatureByUserIdRequest:
    item_name = v
    return self


func with_item_set_name(v) -> Gs2InventoryGetItemWithSignatureByUserIdRequest:
    item_set_name = v
    return self


func with_key_id(v) -> Gs2InventoryGetItemWithSignatureByUserIdRequest:
    key_id = v
    return self


func with_time_offset_token(v) -> Gs2InventoryGetItemWithSignatureByUserIdRequest:
    time_offset_token = v
    return self


static func from_dict(data) -> Gs2InventoryGetItemWithSignatureByUserIdRequest:
    if data == null:
        return null
    var ret = Gs2InventoryGetItemWithSignatureByUserIdRequest.new()
    ret.namespace_name = null if data.get("namespaceName") == null else str(data.get("namespaceName"))
    ret.inventory_name = null if data.get("inventoryName") == null else str(data.get("inventoryName"))
    ret.user_id = null if data.get("userId") == null else str(data.get("userId"))
    ret.item_name = null if data.get("itemName") == null else str(data.get("itemName"))
    ret.item_set_name = null if data.get("itemSetName") == null else str(data.get("itemSetName"))
    ret.key_id = null if data.get("keyId") == null else str(data.get("keyId"))
    ret.time_offset_token = null if data.get("timeOffsetToken") == null else str(data.get("timeOffsetToken"))
    return ret


func to_dict() -> Dictionary:
    var ret = {}
    ret["namespaceName"] = namespace_name
    ret["inventoryName"] = inventory_name
    ret["userId"] = user_id
    ret["itemName"] = item_name
    ret["itemSetName"] = item_set_name
    ret["keyId"] = key_id
    ret["timeOffsetToken"] = time_offset_token
    return ret