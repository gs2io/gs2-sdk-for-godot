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
class_name Gs2EnchantRarityParameterValueModel
extends RefCounted


var name = null
var metadata = null
var resource_name = null
var resource_value = null
var weight = null


func with_name(v) -> Gs2EnchantRarityParameterValueModel:
    name = v
    return self


func with_metadata(v) -> Gs2EnchantRarityParameterValueModel:
    metadata = v
    return self


func with_resource_name(v) -> Gs2EnchantRarityParameterValueModel:
    resource_name = v
    return self


func with_resource_value(v) -> Gs2EnchantRarityParameterValueModel:
    resource_value = v
    return self


func with_weight(v) -> Gs2EnchantRarityParameterValueModel:
    weight = v
    return self


static func from_dict(data) -> Gs2EnchantRarityParameterValueModel:
    if data == null:
        return null
    var ret = Gs2EnchantRarityParameterValueModel.new()
    ret.name = null if data.get("name") == null else str(data.get("name"))
    ret.metadata = null if data.get("metadata") == null else str(data.get("metadata"))
    ret.resource_name = null if data.get("resourceName") == null else str(data.get("resourceName"))
    ret.resource_value = null if data.get("resourceValue") == null else int(data.get("resourceValue"))
    ret.weight = null if data.get("weight") == null else int(data.get("weight"))
    return ret


func to_dict() -> Dictionary:
    var ret = {}
    ret["name"] = name
    ret["metadata"] = metadata
    ret["resourceName"] = resource_name
    ret["resourceValue"] = resource_value
    ret["weight"] = weight
    return ret