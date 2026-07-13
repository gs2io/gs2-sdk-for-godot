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
class_name Gs2ExchangeEzIncrementalRateModel
extends RefCounted


var name = null
var metadata = null
var calculate_type = null
var consume_action = null
var base_value = 0
var coefficient_value = 0
var exchange_count_id = null
var maximum_exchange_count = 0
var acquire_actions = []


func with_name(v) -> Gs2ExchangeEzIncrementalRateModel:
    name = v
    return self


func with_metadata(v) -> Gs2ExchangeEzIncrementalRateModel:
    metadata = v
    return self


func with_calculate_type(v) -> Gs2ExchangeEzIncrementalRateModel:
    calculate_type = v
    return self


func with_consume_action(v) -> Gs2ExchangeEzIncrementalRateModel:
    consume_action = v
    return self


func with_base_value(v) -> Gs2ExchangeEzIncrementalRateModel:
    base_value = v
    return self


func with_coefficient_value(v) -> Gs2ExchangeEzIncrementalRateModel:
    coefficient_value = v
    return self


func with_exchange_count_id(v) -> Gs2ExchangeEzIncrementalRateModel:
    exchange_count_id = v
    return self


func with_maximum_exchange_count(v) -> Gs2ExchangeEzIncrementalRateModel:
    maximum_exchange_count = v
    return self


func with_acquire_actions(v) -> Gs2ExchangeEzIncrementalRateModel:
    acquire_actions = v
    return self


func to_model() -> Gs2ExchangeIncrementalRateModel:
    var ret = Gs2ExchangeIncrementalRateModel.new()
    ret.name = name
    ret.metadata = metadata
    ret.calculate_type = calculate_type
    ret.consume_action = null if consume_action == null else consume_action.to_model()
    ret.base_value = base_value
    ret.coefficient_value = coefficient_value
    ret.exchange_count_id = exchange_count_id
    ret.maximum_exchange_count = maximum_exchange_count
    ret.acquire_actions = null if acquire_actions == null else acquire_actions.map(func(v): return null if v == null else v.to_model())
    return ret


static func from_model(model) -> Gs2ExchangeEzIncrementalRateModel:
    var ret = Gs2ExchangeEzIncrementalRateModel.new()
    ret.name = model.name
    ret.metadata = model.metadata
    ret.calculate_type = model.calculate_type
    ret.consume_action = null if model.consume_action == null else Gs2EzConsumeAction.from_model(model.consume_action)
    ret.base_value = 0 if model.base_value == null else model.base_value
    ret.coefficient_value = 0 if model.coefficient_value == null else model.coefficient_value
    ret.exchange_count_id = model.exchange_count_id
    ret.maximum_exchange_count = 0 if model.maximum_exchange_count == null else model.maximum_exchange_count
    ret.acquire_actions = [] if model.acquire_actions == null else model.acquire_actions.map(func(v): return Gs2EzAcquireAction.from_model(v))
    return ret