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
class_name Gs2InventoryConsumeSimpleItemsRequest
extends Gs2Request


var namespace_name = null
var inventory_name = null
var access_token = null
var consume_counts = null
var duplication_avoider = null


func with_namespace_name(v) -> Gs2InventoryConsumeSimpleItemsRequest:
    namespace_name = v
    return self


func with_inventory_name(v) -> Gs2InventoryConsumeSimpleItemsRequest:
    inventory_name = v
    return self


func with_access_token(v) -> Gs2InventoryConsumeSimpleItemsRequest:
    access_token = v
    return self


func with_consume_counts(v) -> Gs2InventoryConsumeSimpleItemsRequest:
    consume_counts = v
    return self


func with_duplication_avoider(v) -> Gs2InventoryConsumeSimpleItemsRequest:
    duplication_avoider = v
    return self


static func from_dict(data) -> Gs2InventoryConsumeSimpleItemsRequest:
    if data == null:
        return null
    var ret = Gs2InventoryConsumeSimpleItemsRequest.new()
    ret.namespace_name = null if data.get("namespaceName") == null else str(data.get("namespaceName"))
    ret.inventory_name = null if data.get("inventoryName") == null else str(data.get("inventoryName"))
    ret.access_token = null if data.get("accessToken") == null else str(data.get("accessToken"))
    ret.consume_counts = null if data.get("consumeCounts") == null else data.get("consumeCounts").map(func(v): return Gs2InventoryConsumeCount.from_dict(v))
    return ret


func to_dict() -> Dictionary:
    var ret = {}
    ret["namespaceName"] = namespace_name
    ret["inventoryName"] = inventory_name
    ret["accessToken"] = access_token
    ret["consumeCounts"] = null if consume_counts == null else consume_counts.map(func(v): return null if v == null else v.to_dict())
    return ret