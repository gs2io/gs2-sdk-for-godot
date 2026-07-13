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
class_name Gs2InventoryAcquireCount
extends RefCounted


var item_name = null
var count = null


func with_item_name(v) -> Gs2InventoryAcquireCount:
    item_name = v
    return self


func with_count(v) -> Gs2InventoryAcquireCount:
    count = v
    return self


static func from_dict(data) -> Gs2InventoryAcquireCount:
    if data == null:
        return null
    var ret = Gs2InventoryAcquireCount.new()
    ret.item_name = null if data.get("itemName") == null else str(data.get("itemName"))
    ret.count = null if data.get("count") == null else int(data.get("count"))
    return ret


func to_dict() -> Dictionary:
    var ret = {}
    ret["itemName"] = item_name
    ret["count"] = count
    return ret