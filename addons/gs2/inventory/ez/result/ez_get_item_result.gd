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
class_name Gs2InventoryEzGetItemResult
extends RefCounted


var items = []
var item_model = null
var inventory = null


static func from_model(model) -> Gs2InventoryEzGetItemResult:
    var ret = Gs2InventoryEzGetItemResult.new()
    ret.items = [] if model.items == null else model.items.map(func(v): return Gs2InventoryEzItemSet.from_model(v))
    ret.item_model = null if model.item_model == null else Gs2InventoryEzItemModel.from_model(model.item_model)
    ret.inventory = null if model.inventory == null else Gs2InventoryEzInventory.from_model(model.inventory)
    return ret