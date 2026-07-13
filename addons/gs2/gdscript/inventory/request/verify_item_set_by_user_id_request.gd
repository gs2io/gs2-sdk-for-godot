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
class_name Gs2InventoryVerifyItemSetByUserIdRequest
extends Gs2Request


var namespace_name = null
var user_id = null
var inventory_name = null
var item_name = null
var verify_type = null
var item_set_name = null
var count = null
var multiply_value_specifying_quantity = null
var time_offset_token = null
var duplication_avoider = null


func with_namespace_name(v) -> Gs2InventoryVerifyItemSetByUserIdRequest:
    namespace_name = v
    return self


func with_user_id(v) -> Gs2InventoryVerifyItemSetByUserIdRequest:
    user_id = v
    return self


func with_inventory_name(v) -> Gs2InventoryVerifyItemSetByUserIdRequest:
    inventory_name = v
    return self


func with_item_name(v) -> Gs2InventoryVerifyItemSetByUserIdRequest:
    item_name = v
    return self


func with_verify_type(v) -> Gs2InventoryVerifyItemSetByUserIdRequest:
    verify_type = v
    return self


func with_item_set_name(v) -> Gs2InventoryVerifyItemSetByUserIdRequest:
    item_set_name = v
    return self


func with_count(v) -> Gs2InventoryVerifyItemSetByUserIdRequest:
    count = v
    return self


func with_multiply_value_specifying_quantity(v) -> Gs2InventoryVerifyItemSetByUserIdRequest:
    multiply_value_specifying_quantity = v
    return self


func with_time_offset_token(v) -> Gs2InventoryVerifyItemSetByUserIdRequest:
    time_offset_token = v
    return self


func with_duplication_avoider(v) -> Gs2InventoryVerifyItemSetByUserIdRequest:
    duplication_avoider = v
    return self


static func from_dict(data) -> Gs2InventoryVerifyItemSetByUserIdRequest:
    if data == null:
        return null
    var ret = Gs2InventoryVerifyItemSetByUserIdRequest.new()
    ret.namespace_name = null if data.get("namespaceName") == null else str(data.get("namespaceName"))
    ret.user_id = null if data.get("userId") == null else str(data.get("userId"))
    ret.inventory_name = null if data.get("inventoryName") == null else str(data.get("inventoryName"))
    ret.item_name = null if data.get("itemName") == null else str(data.get("itemName"))
    ret.verify_type = null if data.get("verifyType") == null else str(data.get("verifyType"))
    ret.item_set_name = null if data.get("itemSetName") == null else str(data.get("itemSetName"))
    ret.count = null if data.get("count") == null else int(data.get("count"))
    ret.multiply_value_specifying_quantity = null if data.get("multiplyValueSpecifyingQuantity") == null else bool(data.get("multiplyValueSpecifyingQuantity"))
    ret.time_offset_token = null if data.get("timeOffsetToken") == null else str(data.get("timeOffsetToken"))
    return ret


func to_dict() -> Dictionary:
    var ret = {}
    ret["namespaceName"] = namespace_name
    ret["userId"] = user_id
    ret["inventoryName"] = inventory_name
    ret["itemName"] = item_name
    ret["verifyType"] = verify_type
    ret["itemSetName"] = item_set_name
    ret["count"] = count
    ret["multiplyValueSpecifyingQuantity"] = multiply_value_specifying_quantity
    ret["timeOffsetToken"] = time_offset_token
    return ret