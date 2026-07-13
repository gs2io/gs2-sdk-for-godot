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
class_name Gs2StaminaEzStaminaModel
extends RefCounted


var name = null
var metadata = null
var recover_interval_minutes = 0
var recover_value = 0
var initial_capacity = 0
var is_overflow = false
var max_capacity = 0
var max_stamina_table = null
var recover_interval_table = null
var recover_value_table = null


func with_name(v) -> Gs2StaminaEzStaminaModel:
    name = v
    return self


func with_metadata(v) -> Gs2StaminaEzStaminaModel:
    metadata = v
    return self


func with_recover_interval_minutes(v) -> Gs2StaminaEzStaminaModel:
    recover_interval_minutes = v
    return self


func with_recover_value(v) -> Gs2StaminaEzStaminaModel:
    recover_value = v
    return self


func with_initial_capacity(v) -> Gs2StaminaEzStaminaModel:
    initial_capacity = v
    return self


func with_is_overflow(v) -> Gs2StaminaEzStaminaModel:
    is_overflow = v
    return self


func with_max_capacity(v) -> Gs2StaminaEzStaminaModel:
    max_capacity = v
    return self


func with_max_stamina_table(v) -> Gs2StaminaEzStaminaModel:
    max_stamina_table = v
    return self


func with_recover_interval_table(v) -> Gs2StaminaEzStaminaModel:
    recover_interval_table = v
    return self


func with_recover_value_table(v) -> Gs2StaminaEzStaminaModel:
    recover_value_table = v
    return self


func to_model() -> Gs2StaminaStaminaModel:
    var ret = Gs2StaminaStaminaModel.new()
    ret.name = name
    ret.metadata = metadata
    ret.recover_interval_minutes = recover_interval_minutes
    ret.recover_value = recover_value
    ret.initial_capacity = initial_capacity
    ret.is_overflow = is_overflow
    ret.max_capacity = max_capacity
    ret.max_stamina_table = null if max_stamina_table == null else max_stamina_table.to_model()
    ret.recover_interval_table = null if recover_interval_table == null else recover_interval_table.to_model()
    ret.recover_value_table = null if recover_value_table == null else recover_value_table.to_model()
    return ret


static func from_model(model) -> Gs2StaminaEzStaminaModel:
    var ret = Gs2StaminaEzStaminaModel.new()
    ret.name = model.name
    ret.metadata = model.metadata
    ret.recover_interval_minutes = 0 if model.recover_interval_minutes == null else model.recover_interval_minutes
    ret.recover_value = 0 if model.recover_value == null else model.recover_value
    ret.initial_capacity = 0 if model.initial_capacity == null else model.initial_capacity
    ret.is_overflow = false if model.is_overflow == null else model.is_overflow
    ret.max_capacity = 0 if model.max_capacity == null else model.max_capacity
    ret.max_stamina_table = null if model.max_stamina_table == null else Gs2StaminaEzMaxStaminaTable.from_model(model.max_stamina_table)
    ret.recover_interval_table = null if model.recover_interval_table == null else Gs2StaminaEzRecoverIntervalTable.from_model(model.recover_interval_table)
    ret.recover_value_table = null if model.recover_value_table == null else Gs2StaminaEzRecoverValueTable.from_model(model.recover_value_table)
    return ret