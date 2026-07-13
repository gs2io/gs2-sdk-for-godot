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
class_name Gs2EnchantEzRarityParameterValue
extends RefCounted


var name = null
var resource_name = null
var resource_value = 0


func with_name(v) -> Gs2EnchantEzRarityParameterValue:
    name = v
    return self


func with_resource_name(v) -> Gs2EnchantEzRarityParameterValue:
    resource_name = v
    return self


func with_resource_value(v) -> Gs2EnchantEzRarityParameterValue:
    resource_value = v
    return self


func to_model() -> Gs2EnchantRarityParameterValue:
    var ret = Gs2EnchantRarityParameterValue.new()
    ret.name = name
    ret.resource_name = resource_name
    ret.resource_value = resource_value
    return ret


static func from_model(model) -> Gs2EnchantEzRarityParameterValue:
    var ret = Gs2EnchantEzRarityParameterValue.new()
    ret.name = model.name
    ret.resource_name = model.resource_name
    ret.resource_value = 0 if model.resource_value == null else model.resource_value
    return ret