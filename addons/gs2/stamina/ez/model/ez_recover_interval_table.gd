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
class_name Gs2StaminaEzRecoverIntervalTable
extends RefCounted


var name = null
var metadata = null
var experience_model_id = null
var values = []


func with_name(v) -> Gs2StaminaEzRecoverIntervalTable:
    name = v
    return self


func with_metadata(v) -> Gs2StaminaEzRecoverIntervalTable:
    metadata = v
    return self


func with_experience_model_id(v) -> Gs2StaminaEzRecoverIntervalTable:
    experience_model_id = v
    return self


func with_values(v) -> Gs2StaminaEzRecoverIntervalTable:
    values = v
    return self


func to_model() -> Gs2StaminaRecoverIntervalTable:
    var ret = Gs2StaminaRecoverIntervalTable.new()
    ret.name = name
    ret.metadata = metadata
    ret.experience_model_id = experience_model_id
    ret.values = null if values == null else values.map(func(v): return v)
    return ret


static func from_model(model) -> Gs2StaminaEzRecoverIntervalTable:
    var ret = Gs2StaminaEzRecoverIntervalTable.new()
    ret.name = model.name
    ret.metadata = model.metadata
    ret.experience_model_id = model.experience_model_id
    ret.values = [] if model.values == null else model.values.map(func(v): return v)
    return ret