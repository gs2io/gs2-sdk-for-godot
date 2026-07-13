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
class_name Gs2InventoryEzSimpleItem
extends RefCounted


var item_id = null
var item_name = null
var count = 0


func with_item_id(v) -> Gs2InventoryEzSimpleItem:
    item_id = v
    return self


func with_item_name(v) -> Gs2InventoryEzSimpleItem:
    item_name = v
    return self


func with_count(v) -> Gs2InventoryEzSimpleItem:
    count = v
    return self


func to_model() -> Gs2InventorySimpleItem:
    var ret = Gs2InventorySimpleItem.new()
    ret.item_id = item_id
    ret.item_name = item_name
    ret.count = count
    return ret


static func from_model(model) -> Gs2InventoryEzSimpleItem:
    var ret = Gs2InventoryEzSimpleItem.new()
    ret.item_id = model.item_id
    ret.item_name = model.item_name
    ret.count = 0 if model.count == null else model.count
    return ret