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
class_name Gs2EnhanceUnleashByUserIdRequest
extends Gs2Request


var namespace_name = null
var rate_name = null
var user_id = null
var target_item_set_id = null
var materials = null
var recipe_name = null
var recipe_materials = null
var config = null
var time_offset_token = null
var duplication_avoider = null


func with_namespace_name(v) -> Gs2EnhanceUnleashByUserIdRequest:
    namespace_name = v
    return self


func with_rate_name(v) -> Gs2EnhanceUnleashByUserIdRequest:
    rate_name = v
    return self


func with_user_id(v) -> Gs2EnhanceUnleashByUserIdRequest:
    user_id = v
    return self


func with_target_item_set_id(v) -> Gs2EnhanceUnleashByUserIdRequest:
    target_item_set_id = v
    return self


func with_materials(v) -> Gs2EnhanceUnleashByUserIdRequest:
    materials = v
    return self


func with_recipe_name(v) -> Gs2EnhanceUnleashByUserIdRequest:
    recipe_name = v
    return self


func with_recipe_materials(v) -> Gs2EnhanceUnleashByUserIdRequest:
    recipe_materials = v
    return self


func with_config(v) -> Gs2EnhanceUnleashByUserIdRequest:
    config = v
    return self


func with_time_offset_token(v) -> Gs2EnhanceUnleashByUserIdRequest:
    time_offset_token = v
    return self


func with_duplication_avoider(v) -> Gs2EnhanceUnleashByUserIdRequest:
    duplication_avoider = v
    return self


static func from_dict(data) -> Gs2EnhanceUnleashByUserIdRequest:
    if data == null:
        return null
    var ret = Gs2EnhanceUnleashByUserIdRequest.new()
    ret.namespace_name = null if data.get("namespaceName") == null else str(data.get("namespaceName"))
    ret.rate_name = null if data.get("rateName") == null else str(data.get("rateName"))
    ret.user_id = null if data.get("userId") == null else str(data.get("userId"))
    ret.target_item_set_id = null if data.get("targetItemSetId") == null else str(data.get("targetItemSetId"))
    ret.materials = null if data.get("materials") == null else data.get("materials").map(func(v): return str(v))
    ret.recipe_name = null if data.get("recipeName") == null else str(data.get("recipeName"))
    ret.recipe_materials = null if data.get("recipeMaterials") == null else data.get("recipeMaterials").map(func(v): return Gs2EnhanceUnleashMaterialSelection.from_dict(v))
    ret.config = null if data.get("config") == null else data.get("config").map(func(v): return Gs2EnhanceConfig.from_dict(v))
    ret.time_offset_token = null if data.get("timeOffsetToken") == null else str(data.get("timeOffsetToken"))
    return ret


func to_dict() -> Dictionary:
    var ret = {}
    ret["namespaceName"] = namespace_name
    ret["rateName"] = rate_name
    ret["userId"] = user_id
    ret["targetItemSetId"] = target_item_set_id
    ret["materials"] = materials
    ret["recipeName"] = recipe_name
    ret["recipeMaterials"] = null if recipe_materials == null else recipe_materials.map(func(v): return null if v == null else v.to_dict())
    ret["config"] = null if config == null else config.map(func(v): return null if v == null else v.to_dict())
    ret["timeOffsetToken"] = time_offset_token
    return ret