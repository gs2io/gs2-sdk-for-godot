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
class_name Gs2StaminaEzStamina
extends RefCounted


var stamina_name = null
var value = 0
var overflow_value = 0
var max_value = 0
var recover_interval_minutes = 0
var recover_value = 0
var next_recover_at = 0


func with_stamina_name(v) -> Gs2StaminaEzStamina:
    stamina_name = v
    return self


func with_value(v) -> Gs2StaminaEzStamina:
    value = v
    return self


func with_overflow_value(v) -> Gs2StaminaEzStamina:
    overflow_value = v
    return self


func with_max_value(v) -> Gs2StaminaEzStamina:
    max_value = v
    return self


func with_recover_interval_minutes(v) -> Gs2StaminaEzStamina:
    recover_interval_minutes = v
    return self


func with_recover_value(v) -> Gs2StaminaEzStamina:
    recover_value = v
    return self


func with_next_recover_at(v) -> Gs2StaminaEzStamina:
    next_recover_at = v
    return self


func to_model() -> Gs2StaminaStamina:
    var ret = Gs2StaminaStamina.new()
    ret.stamina_name = stamina_name
    ret.value = value
    ret.overflow_value = overflow_value
    ret.max_value = max_value
    ret.recover_interval_minutes = recover_interval_minutes
    ret.recover_value = recover_value
    ret.next_recover_at = next_recover_at
    return ret


static func from_model(model) -> Gs2StaminaEzStamina:
    var ret = Gs2StaminaEzStamina.new()
    ret.stamina_name = model.stamina_name
    ret.value = 0 if model.value == null else model.value
    ret.overflow_value = 0 if model.overflow_value == null else model.overflow_value
    ret.max_value = 0 if model.max_value == null else model.max_value
    ret.recover_interval_minutes = 0 if model.recover_interval_minutes == null else model.recover_interval_minutes
    ret.recover_value = 0 if model.recover_value == null else model.recover_value
    ret.next_recover_at = 0 if model.next_recover_at == null else model.next_recover_at
    return ret