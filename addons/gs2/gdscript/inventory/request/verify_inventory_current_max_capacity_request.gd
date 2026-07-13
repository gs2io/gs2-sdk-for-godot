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
class_name Gs2InventoryVerifyInventoryCurrentMaxCapacityRequest
extends Gs2Request


var namespace_name = null
var access_token = null
var inventory_name = null
var verify_type = null
var current_inventory_max_capacity = null
var multiply_value_specifying_quantity = null
var duplication_avoider = null


func with_namespace_name(v) -> Gs2InventoryVerifyInventoryCurrentMaxCapacityRequest:
    namespace_name = v
    return self


func with_access_token(v) -> Gs2InventoryVerifyInventoryCurrentMaxCapacityRequest:
    access_token = v
    return self


func with_inventory_name(v) -> Gs2InventoryVerifyInventoryCurrentMaxCapacityRequest:
    inventory_name = v
    return self


func with_verify_type(v) -> Gs2InventoryVerifyInventoryCurrentMaxCapacityRequest:
    verify_type = v
    return self


func with_current_inventory_max_capacity(v) -> Gs2InventoryVerifyInventoryCurrentMaxCapacityRequest:
    current_inventory_max_capacity = v
    return self


func with_multiply_value_specifying_quantity(v) -> Gs2InventoryVerifyInventoryCurrentMaxCapacityRequest:
    multiply_value_specifying_quantity = v
    return self


func with_duplication_avoider(v) -> Gs2InventoryVerifyInventoryCurrentMaxCapacityRequest:
    duplication_avoider = v
    return self


static func from_dict(data) -> Gs2InventoryVerifyInventoryCurrentMaxCapacityRequest:
    if data == null:
        return null
    var ret = Gs2InventoryVerifyInventoryCurrentMaxCapacityRequest.new()
    ret.namespace_name = null if data.get("namespaceName") == null else str(data.get("namespaceName"))
    ret.access_token = null if data.get("accessToken") == null else str(data.get("accessToken"))
    ret.inventory_name = null if data.get("inventoryName") == null else str(data.get("inventoryName"))
    ret.verify_type = null if data.get("verifyType") == null else str(data.get("verifyType"))
    ret.current_inventory_max_capacity = null if data.get("currentInventoryMaxCapacity") == null else int(data.get("currentInventoryMaxCapacity"))
    ret.multiply_value_specifying_quantity = null if data.get("multiplyValueSpecifyingQuantity") == null else bool(data.get("multiplyValueSpecifyingQuantity"))
    return ret


func to_dict() -> Dictionary:
    var ret = {}
    ret["namespaceName"] = namespace_name
    ret["accessToken"] = access_token
    ret["inventoryName"] = inventory_name
    ret["verifyType"] = verify_type
    ret["currentInventoryMaxCapacity"] = current_inventory_max_capacity
    ret["multiplyValueSpecifyingQuantity"] = multiply_value_specifying_quantity
    return ret