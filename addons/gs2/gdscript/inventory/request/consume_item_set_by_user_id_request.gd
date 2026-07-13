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
class_name Gs2InventoryConsumeItemSetByUserIdRequest
extends Gs2Request


var namespace_name = null
var inventory_name = null
var user_id = null
var item_name = null
var consume_count = null
var item_set_name = null
var time_offset_token = null
var duplication_avoider = null


func with_namespace_name(v) -> Gs2InventoryConsumeItemSetByUserIdRequest:
    namespace_name = v
    return self


func with_inventory_name(v) -> Gs2InventoryConsumeItemSetByUserIdRequest:
    inventory_name = v
    return self


func with_user_id(v) -> Gs2InventoryConsumeItemSetByUserIdRequest:
    user_id = v
    return self


func with_item_name(v) -> Gs2InventoryConsumeItemSetByUserIdRequest:
    item_name = v
    return self


func with_consume_count(v) -> Gs2InventoryConsumeItemSetByUserIdRequest:
    consume_count = v
    return self


func with_item_set_name(v) -> Gs2InventoryConsumeItemSetByUserIdRequest:
    item_set_name = v
    return self


func with_time_offset_token(v) -> Gs2InventoryConsumeItemSetByUserIdRequest:
    time_offset_token = v
    return self


func with_duplication_avoider(v) -> Gs2InventoryConsumeItemSetByUserIdRequest:
    duplication_avoider = v
    return self


static func from_dict(data) -> Gs2InventoryConsumeItemSetByUserIdRequest:
    if data == null:
        return null
    var ret = Gs2InventoryConsumeItemSetByUserIdRequest.new()
    ret.namespace_name = null if data.get("namespaceName") == null else str(data.get("namespaceName"))
    ret.inventory_name = null if data.get("inventoryName") == null else str(data.get("inventoryName"))
    ret.user_id = null if data.get("userId") == null else str(data.get("userId"))
    ret.item_name = null if data.get("itemName") == null else str(data.get("itemName"))
    ret.consume_count = null if data.get("consumeCount") == null else int(data.get("consumeCount"))
    ret.item_set_name = null if data.get("itemSetName") == null else str(data.get("itemSetName"))
    ret.time_offset_token = null if data.get("timeOffsetToken") == null else str(data.get("timeOffsetToken"))
    return ret


func to_dict() -> Dictionary:
    var ret = {}
    ret["namespaceName"] = namespace_name
    ret["inventoryName"] = inventory_name
    ret["userId"] = user_id
    ret["itemName"] = item_name
    ret["consumeCount"] = consume_count
    ret["itemSetName"] = item_set_name
    ret["timeOffsetToken"] = time_offset_token
    return ret