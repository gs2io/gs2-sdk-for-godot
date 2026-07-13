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
class_name Gs2InventoryVerifyItemSetRequest
extends Gs2Request


var namespace_name = null
var access_token = null
var inventory_name = null
var item_name = null
var verify_type = null
var item_set_name = null
var count = null
var multiply_value_specifying_quantity = null
var duplication_avoider = null


func with_namespace_name(v) -> Gs2InventoryVerifyItemSetRequest:
    namespace_name = v
    return self


func with_access_token(v) -> Gs2InventoryVerifyItemSetRequest:
    access_token = v
    return self


func with_inventory_name(v) -> Gs2InventoryVerifyItemSetRequest:
    inventory_name = v
    return self


func with_item_name(v) -> Gs2InventoryVerifyItemSetRequest:
    item_name = v
    return self


func with_verify_type(v) -> Gs2InventoryVerifyItemSetRequest:
    verify_type = v
    return self


func with_item_set_name(v) -> Gs2InventoryVerifyItemSetRequest:
    item_set_name = v
    return self


func with_count(v) -> Gs2InventoryVerifyItemSetRequest:
    count = v
    return self


func with_multiply_value_specifying_quantity(v) -> Gs2InventoryVerifyItemSetRequest:
    multiply_value_specifying_quantity = v
    return self


func with_duplication_avoider(v) -> Gs2InventoryVerifyItemSetRequest:
    duplication_avoider = v
    return self


static func from_dict(data) -> Gs2InventoryVerifyItemSetRequest:
    if data == null:
        return null
    var ret = Gs2InventoryVerifyItemSetRequest.new()
    ret.namespace_name = null if data.get("namespaceName") == null else str(data.get("namespaceName"))
    ret.access_token = null if data.get("accessToken") == null else str(data.get("accessToken"))
    ret.inventory_name = null if data.get("inventoryName") == null else str(data.get("inventoryName"))
    ret.item_name = null if data.get("itemName") == null else str(data.get("itemName"))
    ret.verify_type = null if data.get("verifyType") == null else str(data.get("verifyType"))
    ret.item_set_name = null if data.get("itemSetName") == null else str(data.get("itemSetName"))
    ret.count = null if data.get("count") == null else int(data.get("count"))
    ret.multiply_value_specifying_quantity = null if data.get("multiplyValueSpecifyingQuantity") == null else bool(data.get("multiplyValueSpecifyingQuantity"))
    return ret


func to_dict() -> Dictionary:
    var ret = {}
    ret["namespaceName"] = namespace_name
    ret["accessToken"] = access_token
    ret["inventoryName"] = inventory_name
    ret["itemName"] = item_name
    ret["verifyType"] = verify_type
    ret["itemSetName"] = item_set_name
    ret["count"] = count
    ret["multiplyValueSpecifyingQuantity"] = multiply_value_specifying_quantity
    return ret