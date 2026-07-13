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
class_name Gs2InventoryVerifyBigItemRequest
extends Gs2Request


var namespace_name = null
var access_token = null
var inventory_name = null
var item_name = null
var verify_type = null
var count = null
var multiply_value_specifying_quantity = null
var duplication_avoider = null


func with_namespace_name(v) -> Gs2InventoryVerifyBigItemRequest:
    namespace_name = v
    return self


func with_access_token(v) -> Gs2InventoryVerifyBigItemRequest:
    access_token = v
    return self


func with_inventory_name(v) -> Gs2InventoryVerifyBigItemRequest:
    inventory_name = v
    return self


func with_item_name(v) -> Gs2InventoryVerifyBigItemRequest:
    item_name = v
    return self


func with_verify_type(v) -> Gs2InventoryVerifyBigItemRequest:
    verify_type = v
    return self


func with_count(v) -> Gs2InventoryVerifyBigItemRequest:
    count = v
    return self


func with_multiply_value_specifying_quantity(v) -> Gs2InventoryVerifyBigItemRequest:
    multiply_value_specifying_quantity = v
    return self


func with_duplication_avoider(v) -> Gs2InventoryVerifyBigItemRequest:
    duplication_avoider = v
    return self


static func from_dict(data) -> Gs2InventoryVerifyBigItemRequest:
    if data == null:
        return null
    var ret = Gs2InventoryVerifyBigItemRequest.new()
    ret.namespace_name = null if data.get("namespaceName") == null else str(data.get("namespaceName"))
    ret.access_token = null if data.get("accessToken") == null else str(data.get("accessToken"))
    ret.inventory_name = null if data.get("inventoryName") == null else str(data.get("inventoryName"))
    ret.item_name = null if data.get("itemName") == null else str(data.get("itemName"))
    ret.verify_type = null if data.get("verifyType") == null else str(data.get("verifyType"))
    ret.count = null if data.get("count") == null else str(data.get("count"))
    ret.multiply_value_specifying_quantity = null if data.get("multiplyValueSpecifyingQuantity") == null else bool(data.get("multiplyValueSpecifyingQuantity"))
    return ret


func to_dict() -> Dictionary:
    var ret = {}
    ret["namespaceName"] = namespace_name
    ret["accessToken"] = access_token
    ret["inventoryName"] = inventory_name
    ret["itemName"] = item_name
    ret["verifyType"] = verify_type
    ret["count"] = count
    ret["multiplyValueSpecifyingQuantity"] = multiply_value_specifying_quantity
    return ret