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
class_name Gs2EnhanceEzRateModel
extends RefCounted


var name = null
var metadata = null
var target_inventory_model_id = null
var acquire_experience_suffix = null
var material_inventory_model_id = null
var acquire_experience_hierarchy = []
var experience_model_id = null


func with_name(v) -> Gs2EnhanceEzRateModel:
    name = v
    return self


func with_metadata(v) -> Gs2EnhanceEzRateModel:
    metadata = v
    return self


func with_target_inventory_model_id(v) -> Gs2EnhanceEzRateModel:
    target_inventory_model_id = v
    return self


func with_acquire_experience_suffix(v) -> Gs2EnhanceEzRateModel:
    acquire_experience_suffix = v
    return self


func with_material_inventory_model_id(v) -> Gs2EnhanceEzRateModel:
    material_inventory_model_id = v
    return self


func with_acquire_experience_hierarchy(v) -> Gs2EnhanceEzRateModel:
    acquire_experience_hierarchy = v
    return self


func with_experience_model_id(v) -> Gs2EnhanceEzRateModel:
    experience_model_id = v
    return self


func to_model() -> Gs2EnhanceRateModel:
    var ret = Gs2EnhanceRateModel.new()
    ret.name = name
    ret.metadata = metadata
    ret.target_inventory_model_id = target_inventory_model_id
    ret.acquire_experience_suffix = acquire_experience_suffix
    ret.material_inventory_model_id = material_inventory_model_id
    ret.acquire_experience_hierarchy = null if acquire_experience_hierarchy == null else acquire_experience_hierarchy.map(func(v): return v)
    ret.experience_model_id = experience_model_id
    return ret


static func from_model(model) -> Gs2EnhanceEzRateModel:
    var ret = Gs2EnhanceEzRateModel.new()
    ret.name = model.name
    ret.metadata = model.metadata
    ret.target_inventory_model_id = model.target_inventory_model_id
    ret.acquire_experience_suffix = model.acquire_experience_suffix
    ret.material_inventory_model_id = model.material_inventory_model_id
    ret.acquire_experience_hierarchy = [] if model.acquire_experience_hierarchy == null else model.acquire_experience_hierarchy.map(func(v): return v)
    ret.experience_model_id = model.experience_model_id
    return ret