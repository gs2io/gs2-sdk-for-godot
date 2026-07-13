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
class_name Gs2EnchantEzRarityParameterModel
extends RefCounted


var name = null
var metadata = null
var maximum_parameter_count = 0
var parameter_counts = []
var parameters = []


func with_name(v) -> Gs2EnchantEzRarityParameterModel:
    name = v
    return self


func with_metadata(v) -> Gs2EnchantEzRarityParameterModel:
    metadata = v
    return self


func with_maximum_parameter_count(v) -> Gs2EnchantEzRarityParameterModel:
    maximum_parameter_count = v
    return self


func with_parameter_counts(v) -> Gs2EnchantEzRarityParameterModel:
    parameter_counts = v
    return self


func with_parameters(v) -> Gs2EnchantEzRarityParameterModel:
    parameters = v
    return self


func to_model() -> Gs2EnchantRarityParameterModel:
    var ret = Gs2EnchantRarityParameterModel.new()
    ret.name = name
    ret.metadata = metadata
    ret.maximum_parameter_count = maximum_parameter_count
    ret.parameter_counts = null if parameter_counts == null else parameter_counts.map(func(v): return null if v == null else v.to_model())
    ret.parameters = null if parameters == null else parameters.map(func(v): return null if v == null else v.to_model())
    return ret


static func from_model(model) -> Gs2EnchantEzRarityParameterModel:
    var ret = Gs2EnchantEzRarityParameterModel.new()
    ret.name = model.name
    ret.metadata = model.metadata
    ret.maximum_parameter_count = 0 if model.maximum_parameter_count == null else model.maximum_parameter_count
    ret.parameter_counts = [] if model.parameter_counts == null else model.parameter_counts.map(func(v): return Gs2EnchantEzRarityParameterCountModel.from_model(v))
    ret.parameters = [] if model.parameters == null else model.parameters.map(func(v): return Gs2EnchantEzRarityParameterValueModel.from_model(v))
    return ret