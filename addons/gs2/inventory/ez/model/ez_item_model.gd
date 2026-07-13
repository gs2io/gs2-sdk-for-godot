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
class_name Gs2InventoryEzItemModel
extends RefCounted


var name = null
var metadata = null
var stacking_limit = 0
var allow_multiple_stacks = false
var sort_value = 0


func with_name(v) -> Gs2InventoryEzItemModel:
    name = v
    return self


func with_metadata(v) -> Gs2InventoryEzItemModel:
    metadata = v
    return self


func with_stacking_limit(v) -> Gs2InventoryEzItemModel:
    stacking_limit = v
    return self


func with_allow_multiple_stacks(v) -> Gs2InventoryEzItemModel:
    allow_multiple_stacks = v
    return self


func with_sort_value(v) -> Gs2InventoryEzItemModel:
    sort_value = v
    return self


func to_model() -> Gs2InventoryItemModel:
    var ret = Gs2InventoryItemModel.new()
    ret.name = name
    ret.metadata = metadata
    ret.stacking_limit = stacking_limit
    ret.allow_multiple_stacks = allow_multiple_stacks
    ret.sort_value = sort_value
    return ret


static func from_model(model) -> Gs2InventoryEzItemModel:
    var ret = Gs2InventoryEzItemModel.new()
    ret.name = model.name
    ret.metadata = model.metadata
    ret.stacking_limit = 0 if model.stacking_limit == null else model.stacking_limit
    ret.allow_multiple_stacks = false if model.allow_multiple_stacks == null else model.allow_multiple_stacks
    ret.sort_value = 0 if model.sort_value == null else model.sort_value
    return ret