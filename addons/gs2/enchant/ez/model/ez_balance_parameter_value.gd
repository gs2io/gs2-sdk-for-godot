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
class_name Gs2EnchantEzBalanceParameterValue
extends RefCounted


var name = null
var value = 0


func with_name(v) -> Gs2EnchantEzBalanceParameterValue:
    name = v
    return self


func with_value(v) -> Gs2EnchantEzBalanceParameterValue:
    value = v
    return self


func to_model() -> Gs2EnchantBalanceParameterValue:
    var ret = Gs2EnchantBalanceParameterValue.new()
    ret.name = name
    ret.value = value
    return ret


static func from_model(model) -> Gs2EnchantEzBalanceParameterValue:
    var ret = Gs2EnchantEzBalanceParameterValue.new()
    ret.name = model.name
    ret.value = 0 if model.value == null else model.value
    return ret