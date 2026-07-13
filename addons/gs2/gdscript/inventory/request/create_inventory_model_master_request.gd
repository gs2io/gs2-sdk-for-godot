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
class_name Gs2InventoryCreateInventoryModelMasterRequest
extends Gs2Request


var namespace_name = null
var name = null
var description = null
var metadata = null
var initial_capacity = null
var max_capacity = null
var protect_referenced_item = null


func with_namespace_name(v) -> Gs2InventoryCreateInventoryModelMasterRequest:
    namespace_name = v
    return self


func with_name(v) -> Gs2InventoryCreateInventoryModelMasterRequest:
    name = v
    return self


func with_description(v) -> Gs2InventoryCreateInventoryModelMasterRequest:
    description = v
    return self


func with_metadata(v) -> Gs2InventoryCreateInventoryModelMasterRequest:
    metadata = v
    return self


func with_initial_capacity(v) -> Gs2InventoryCreateInventoryModelMasterRequest:
    initial_capacity = v
    return self


func with_max_capacity(v) -> Gs2InventoryCreateInventoryModelMasterRequest:
    max_capacity = v
    return self


func with_protect_referenced_item(v) -> Gs2InventoryCreateInventoryModelMasterRequest:
    protect_referenced_item = v
    return self


static func from_dict(data) -> Gs2InventoryCreateInventoryModelMasterRequest:
    if data == null:
        return null
    var ret = Gs2InventoryCreateInventoryModelMasterRequest.new()
    ret.namespace_name = null if data.get("namespaceName") == null else str(data.get("namespaceName"))
    ret.name = null if data.get("name") == null else str(data.get("name"))
    ret.description = null if data.get("description") == null else str(data.get("description"))
    ret.metadata = null if data.get("metadata") == null else str(data.get("metadata"))
    ret.initial_capacity = null if data.get("initialCapacity") == null else int(data.get("initialCapacity"))
    ret.max_capacity = null if data.get("maxCapacity") == null else int(data.get("maxCapacity"))
    ret.protect_referenced_item = null if data.get("protectReferencedItem") == null else bool(data.get("protectReferencedItem"))
    return ret


func to_dict() -> Dictionary:
    var ret = {}
    ret["namespaceName"] = namespace_name
    ret["name"] = name
    ret["description"] = description
    ret["metadata"] = metadata
    ret["initialCapacity"] = initial_capacity
    ret["maxCapacity"] = max_capacity
    ret["protectReferencedItem"] = protect_referenced_item
    return ret