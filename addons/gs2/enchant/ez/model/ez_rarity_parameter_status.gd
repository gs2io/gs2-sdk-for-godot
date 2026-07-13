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
class_name Gs2EnchantEzRarityParameterStatus
extends RefCounted


var parameter_name = null
var property_id = null
var parameter_values = []


func with_parameter_name(v) -> Gs2EnchantEzRarityParameterStatus:
    parameter_name = v
    return self


func with_property_id(v) -> Gs2EnchantEzRarityParameterStatus:
    property_id = v
    return self


func with_parameter_values(v) -> Gs2EnchantEzRarityParameterStatus:
    parameter_values = v
    return self


func to_model() -> Gs2EnchantRarityParameterStatus:
    var ret = Gs2EnchantRarityParameterStatus.new()
    ret.parameter_name = parameter_name
    ret.property_id = property_id
    ret.parameter_values = null if parameter_values == null else parameter_values.map(func(v): return null if v == null else v.to_model())
    return ret


static func from_model(model) -> Gs2EnchantEzRarityParameterStatus:
    var ret = Gs2EnchantEzRarityParameterStatus.new()
    ret.parameter_name = model.parameter_name
    ret.property_id = model.property_id
    ret.parameter_values = [] if model.parameter_values == null else model.parameter_values.map(func(v): return Gs2EnchantEzRarityParameterValue.from_model(v))
    return ret