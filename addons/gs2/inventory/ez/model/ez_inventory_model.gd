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
class_name Gs2InventoryEzInventoryModel
extends RefCounted


var name = null
var metadata = null
var initial_capacity = 0
var max_capacity = 0


func with_name(v) -> Gs2InventoryEzInventoryModel:
    name = v
    return self


func with_metadata(v) -> Gs2InventoryEzInventoryModel:
    metadata = v
    return self


func with_initial_capacity(v) -> Gs2InventoryEzInventoryModel:
    initial_capacity = v
    return self


func with_max_capacity(v) -> Gs2InventoryEzInventoryModel:
    max_capacity = v
    return self


func to_model() -> Gs2InventoryInventoryModel:
    var ret = Gs2InventoryInventoryModel.new()
    ret.name = name
    ret.metadata = metadata
    ret.initial_capacity = initial_capacity
    ret.max_capacity = max_capacity
    return ret


static func from_model(model) -> Gs2InventoryEzInventoryModel:
    var ret = Gs2InventoryEzInventoryModel.new()
    ret.name = model.name
    ret.metadata = model.metadata
    ret.initial_capacity = 0 if model.initial_capacity == null else model.initial_capacity
    ret.max_capacity = 0 if model.max_capacity == null else model.max_capacity
    return ret