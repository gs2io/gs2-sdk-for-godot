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
class_name Gs2EnhanceUnleashRecipe
extends RefCounted


var name = null
var metadata = null
var target_group_keys = null
var materials = null


func with_name(v) -> Gs2EnhanceUnleashRecipe:
    name = v
    return self


func with_metadata(v) -> Gs2EnhanceUnleashRecipe:
    metadata = v
    return self


func with_target_group_keys(v) -> Gs2EnhanceUnleashRecipe:
    target_group_keys = v
    return self


func with_materials(v) -> Gs2EnhanceUnleashRecipe:
    materials = v
    return self


static func from_dict(data) -> Gs2EnhanceUnleashRecipe:
    if data == null:
        return null
    var ret = Gs2EnhanceUnleashRecipe.new()
    ret.name = null if data.get("name") == null else str(data.get("name"))
    ret.metadata = null if data.get("metadata") == null else str(data.get("metadata"))
    ret.target_group_keys = null if data.get("targetGroupKeys") == null else data.get("targetGroupKeys").map(func(v): return str(v))
    ret.materials = null if data.get("materials") == null else data.get("materials").map(func(v): return Gs2EnhanceUnleashMaterial.from_dict(v))
    return ret


func to_dict() -> Dictionary:
    var ret = {}
    ret["name"] = name
    ret["metadata"] = metadata
    ret["targetGroupKeys"] = target_group_keys
    ret["materials"] = null if materials == null else materials.map(func(v): return null if v == null else v.to_dict())
    return ret