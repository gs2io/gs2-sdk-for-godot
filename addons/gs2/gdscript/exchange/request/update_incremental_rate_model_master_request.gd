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
class_name Gs2ExchangeUpdateIncrementalRateModelMasterRequest
extends Gs2Request


var namespace_name = null
var rate_name = null
var description = null
var metadata = null
var consume_action = null
var calculate_type = null
var base_value = null
var coefficient_value = null
var calculate_script_id = null
var exchange_count_id = null
var maximum_exchange_count = null
var acquire_actions = null


func with_namespace_name(v) -> Gs2ExchangeUpdateIncrementalRateModelMasterRequest:
    namespace_name = v
    return self


func with_rate_name(v) -> Gs2ExchangeUpdateIncrementalRateModelMasterRequest:
    rate_name = v
    return self


func with_description(v) -> Gs2ExchangeUpdateIncrementalRateModelMasterRequest:
    description = v
    return self


func with_metadata(v) -> Gs2ExchangeUpdateIncrementalRateModelMasterRequest:
    metadata = v
    return self


func with_consume_action(v) -> Gs2ExchangeUpdateIncrementalRateModelMasterRequest:
    consume_action = v
    return self


func with_calculate_type(v) -> Gs2ExchangeUpdateIncrementalRateModelMasterRequest:
    calculate_type = v
    return self


func with_base_value(v) -> Gs2ExchangeUpdateIncrementalRateModelMasterRequest:
    base_value = v
    return self


func with_coefficient_value(v) -> Gs2ExchangeUpdateIncrementalRateModelMasterRequest:
    coefficient_value = v
    return self


func with_calculate_script_id(v) -> Gs2ExchangeUpdateIncrementalRateModelMasterRequest:
    calculate_script_id = v
    return self


func with_exchange_count_id(v) -> Gs2ExchangeUpdateIncrementalRateModelMasterRequest:
    exchange_count_id = v
    return self


func with_maximum_exchange_count(v) -> Gs2ExchangeUpdateIncrementalRateModelMasterRequest:
    maximum_exchange_count = v
    return self


func with_acquire_actions(v) -> Gs2ExchangeUpdateIncrementalRateModelMasterRequest:
    acquire_actions = v
    return self


static func from_dict(data) -> Gs2ExchangeUpdateIncrementalRateModelMasterRequest:
    if data == null:
        return null
    var ret = Gs2ExchangeUpdateIncrementalRateModelMasterRequest.new()
    ret.namespace_name = null if data.get("namespaceName") == null else str(data.get("namespaceName"))
    ret.rate_name = null if data.get("rateName") == null else str(data.get("rateName"))
    ret.description = null if data.get("description") == null else str(data.get("description"))
    ret.metadata = null if data.get("metadata") == null else str(data.get("metadata"))
    ret.consume_action = null if data.get("consumeAction") == null else Gs2ConsumeAction.from_dict(data.get("consumeAction"))
    ret.calculate_type = null if data.get("calculateType") == null else str(data.get("calculateType"))
    ret.base_value = null if data.get("baseValue") == null else int(data.get("baseValue"))
    ret.coefficient_value = null if data.get("coefficientValue") == null else int(data.get("coefficientValue"))
    ret.calculate_script_id = null if data.get("calculateScriptId") == null else str(data.get("calculateScriptId"))
    ret.exchange_count_id = null if data.get("exchangeCountId") == null else str(data.get("exchangeCountId"))
    ret.maximum_exchange_count = null if data.get("maximumExchangeCount") == null else int(data.get("maximumExchangeCount"))
    ret.acquire_actions = null if data.get("acquireActions") == null else data.get("acquireActions").map(func(v): return Gs2AcquireAction.from_dict(v))
    return ret


func to_dict() -> Dictionary:
    var ret = {}
    ret["namespaceName"] = namespace_name
    ret["rateName"] = rate_name
    ret["description"] = description
    ret["metadata"] = metadata
    ret["consumeAction"] = null if consume_action == null else consume_action.to_dict()
    ret["calculateType"] = calculate_type
    ret["baseValue"] = base_value
    ret["coefficientValue"] = coefficient_value
    ret["calculateScriptId"] = calculate_script_id
    ret["exchangeCountId"] = exchange_count_id
    ret["maximumExchangeCount"] = maximum_exchange_count
    ret["acquireActions"] = null if acquire_actions == null else acquire_actions.map(func(v): return null if v == null else v.to_dict())
    return ret