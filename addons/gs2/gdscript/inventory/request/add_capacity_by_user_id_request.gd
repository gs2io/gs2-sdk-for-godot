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
class_name Gs2InventoryAddCapacityByUserIdRequest
extends Gs2Request


var namespace_name = null
var inventory_name = null
var user_id = null
var add_capacity_value = null
var time_offset_token = null
var duplication_avoider = null


func with_namespace_name(v) -> Gs2InventoryAddCapacityByUserIdRequest:
    namespace_name = v
    return self


func with_inventory_name(v) -> Gs2InventoryAddCapacityByUserIdRequest:
    inventory_name = v
    return self


func with_user_id(v) -> Gs2InventoryAddCapacityByUserIdRequest:
    user_id = v
    return self


func with_add_capacity_value(v) -> Gs2InventoryAddCapacityByUserIdRequest:
    add_capacity_value = v
    return self


func with_time_offset_token(v) -> Gs2InventoryAddCapacityByUserIdRequest:
    time_offset_token = v
    return self


func with_duplication_avoider(v) -> Gs2InventoryAddCapacityByUserIdRequest:
    duplication_avoider = v
    return self


static func from_dict(data) -> Gs2InventoryAddCapacityByUserIdRequest:
    if data == null:
        return null
    var ret = Gs2InventoryAddCapacityByUserIdRequest.new()
    ret.namespace_name = null if data.get("namespaceName") == null else str(data.get("namespaceName"))
    ret.inventory_name = null if data.get("inventoryName") == null else str(data.get("inventoryName"))
    ret.user_id = null if data.get("userId") == null else str(data.get("userId"))
    ret.add_capacity_value = null if data.get("addCapacityValue") == null else int(data.get("addCapacityValue"))
    ret.time_offset_token = null if data.get("timeOffsetToken") == null else str(data.get("timeOffsetToken"))
    return ret


func to_dict() -> Dictionary:
    var ret = {}
    ret["namespaceName"] = namespace_name
    ret["inventoryName"] = inventory_name
    ret["userId"] = user_id
    ret["addCapacityValue"] = add_capacity_value
    ret["timeOffsetToken"] = time_offset_token
    return ret