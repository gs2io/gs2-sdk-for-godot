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
# deny overwrite
class_name Gs2InventoryEzBigItem
extends RefCounted


var item_id = null
var item_name = null
# diff --- start
# var count = 0
# diff --- end
var count = "0"  # diff +++


func with_item_id(v) -> Gs2InventoryEzBigItem:
    item_id = v
    return self


func with_item_name(v) -> Gs2InventoryEzBigItem:
    item_name = v
    return self


func with_count(v) -> Gs2InventoryEzBigItem:
    count = v
    return self


func to_model() -> Gs2InventoryBigItem:
    var ret = Gs2InventoryBigItem.new()
    ret.item_id = item_id
    ret.item_name = item_name
    ret.count = str(count)
    return ret


static func from_model(model) -> Gs2InventoryEzBigItem:
    var ret = Gs2InventoryEzBigItem.new()
    ret.item_id = model.item_id
    ret.item_name = model.item_name
    # diff --- start
    # ret.count = 0 if model.count == null else int(model.count)
    # diff --- end
    ret.count = "0" if model.count == null else str(model.count)  # diff +++
    return ret
