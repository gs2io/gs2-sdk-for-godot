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
class_name Gs2EnchantEzBalanceParameterModel
extends RefCounted


var name = null
var metadata = null
var total_value = 0
var initial_value_strategy = null
var parameters = []


func with_name(v) -> Gs2EnchantEzBalanceParameterModel:
    name = v
    return self


func with_metadata(v) -> Gs2EnchantEzBalanceParameterModel:
    metadata = v
    return self


func with_total_value(v) -> Gs2EnchantEzBalanceParameterModel:
    total_value = v
    return self


func with_initial_value_strategy(v) -> Gs2EnchantEzBalanceParameterModel:
    initial_value_strategy = v
    return self


func with_parameters(v) -> Gs2EnchantEzBalanceParameterModel:
    parameters = v
    return self


func to_model() -> Gs2EnchantBalanceParameterModel:
    var ret = Gs2EnchantBalanceParameterModel.new()
    ret.name = name
    ret.metadata = metadata
    ret.total_value = total_value
    ret.initial_value_strategy = initial_value_strategy
    ret.parameters = null if parameters == null else parameters.map(func(v): return null if v == null else v.to_model())
    return ret


static func from_model(model) -> Gs2EnchantEzBalanceParameterModel:
    var ret = Gs2EnchantEzBalanceParameterModel.new()
    ret.name = model.name
    ret.metadata = model.metadata
    ret.total_value = 0 if model.total_value == null else model.total_value
    ret.initial_value_strategy = model.initial_value_strategy
    ret.parameters = [] if model.parameters == null else model.parameters.map(func(v): return Gs2EnchantEzBalanceParameterValueModel.from_model(v))
    return ret