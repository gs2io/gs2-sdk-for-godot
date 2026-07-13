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
class_name Gs2InventoryCreateItemModelMasterRequest
extends Gs2Request


var namespace_name = null
var inventory_name = null
var name = null
var description = null
var metadata = null
var stacking_limit = null
var allow_multiple_stacks = null
var sort_value = null


func with_namespace_name(v) -> Gs2InventoryCreateItemModelMasterRequest:
    namespace_name = v
    return self


func with_inventory_name(v) -> Gs2InventoryCreateItemModelMasterRequest:
    inventory_name = v
    return self


func with_name(v) -> Gs2InventoryCreateItemModelMasterRequest:
    name = v
    return self


func with_description(v) -> Gs2InventoryCreateItemModelMasterRequest:
    description = v
    return self


func with_metadata(v) -> Gs2InventoryCreateItemModelMasterRequest:
    metadata = v
    return self


func with_stacking_limit(v) -> Gs2InventoryCreateItemModelMasterRequest:
    stacking_limit = v
    return self


func with_allow_multiple_stacks(v) -> Gs2InventoryCreateItemModelMasterRequest:
    allow_multiple_stacks = v
    return self


func with_sort_value(v) -> Gs2InventoryCreateItemModelMasterRequest:
    sort_value = v
    return self


static func from_dict(data) -> Gs2InventoryCreateItemModelMasterRequest:
    if data == null:
        return null
    var ret = Gs2InventoryCreateItemModelMasterRequest.new()
    ret.namespace_name = null if data.get("namespaceName") == null else str(data.get("namespaceName"))
    ret.inventory_name = null if data.get("inventoryName") == null else str(data.get("inventoryName"))
    ret.name = null if data.get("name") == null else str(data.get("name"))
    ret.description = null if data.get("description") == null else str(data.get("description"))
    ret.metadata = null if data.get("metadata") == null else str(data.get("metadata"))
    ret.stacking_limit = null if data.get("stackingLimit") == null else int(data.get("stackingLimit"))
    ret.allow_multiple_stacks = null if data.get("allowMultipleStacks") == null else bool(data.get("allowMultipleStacks"))
    ret.sort_value = null if data.get("sortValue") == null else int(data.get("sortValue"))
    return ret


func to_dict() -> Dictionary:
    var ret = {}
    ret["namespaceName"] = namespace_name
    ret["inventoryName"] = inventory_name
    ret["name"] = name
    ret["description"] = description
    ret["metadata"] = metadata
    ret["stackingLimit"] = stacking_limit
    ret["allowMultipleStacks"] = allow_multiple_stacks
    ret["sortValue"] = sort_value
    return ret