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
class_name Gs2EnchantRarityParameterValue
extends RefCounted


var name = null
var resource_name = null
var resource_value = null


func with_name(v) -> Gs2EnchantRarityParameterValue:
    name = v
    return self


func with_resource_name(v) -> Gs2EnchantRarityParameterValue:
    resource_name = v
    return self


func with_resource_value(v) -> Gs2EnchantRarityParameterValue:
    resource_value = v
    return self


static func from_dict(data) -> Gs2EnchantRarityParameterValue:
    if data == null:
        return null
    var ret = Gs2EnchantRarityParameterValue.new()
    ret.name = null if data.get("name") == null else str(data.get("name"))
    ret.resource_name = null if data.get("resourceName") == null else str(data.get("resourceName"))
    ret.resource_value = null if data.get("resourceValue") == null else int(data.get("resourceValue"))
    return ret


func to_dict() -> Dictionary:
    var ret = {}
    ret["name"] = name
    ret["resourceName"] = resource_name
    ret["resourceValue"] = resource_value
    return ret