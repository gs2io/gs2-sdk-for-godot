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
class_name Gs2InventoryConsumeBigItemRequest
extends Gs2Request


var namespace_name = null
var inventory_name = null
var access_token = null
var item_name = null
var consume_count = null
var duplication_avoider = null


func with_namespace_name(v) -> Gs2InventoryConsumeBigItemRequest:
    namespace_name = v
    return self


func with_inventory_name(v) -> Gs2InventoryConsumeBigItemRequest:
    inventory_name = v
    return self


func with_access_token(v) -> Gs2InventoryConsumeBigItemRequest:
    access_token = v
    return self


func with_item_name(v) -> Gs2InventoryConsumeBigItemRequest:
    item_name = v
    return self


func with_consume_count(v) -> Gs2InventoryConsumeBigItemRequest:
    consume_count = v
    return self


func with_duplication_avoider(v) -> Gs2InventoryConsumeBigItemRequest:
    duplication_avoider = v
    return self


static func from_dict(data) -> Gs2InventoryConsumeBigItemRequest:
    if data == null:
        return null
    var ret = Gs2InventoryConsumeBigItemRequest.new()
    ret.namespace_name = null if data.get("namespaceName") == null else str(data.get("namespaceName"))
    ret.inventory_name = null if data.get("inventoryName") == null else str(data.get("inventoryName"))
    ret.access_token = null if data.get("accessToken") == null else str(data.get("accessToken"))
    ret.item_name = null if data.get("itemName") == null else str(data.get("itemName"))
    ret.consume_count = null if data.get("consumeCount") == null else str(data.get("consumeCount"))
    return ret


func to_dict() -> Dictionary:
    var ret = {}
    ret["namespaceName"] = namespace_name
    ret["inventoryName"] = inventory_name
    ret["accessToken"] = access_token
    ret["itemName"] = item_name
    ret["consumeCount"] = consume_count
    return ret