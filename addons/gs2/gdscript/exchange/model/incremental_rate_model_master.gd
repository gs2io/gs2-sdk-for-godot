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
class_name Gs2ExchangeIncrementalRateModelMaster
extends RefCounted


var incremental_rate_model_id = null
var name = null
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
var created_at = null
var updated_at = null
var revision = null


func with_incremental_rate_model_id(v) -> Gs2ExchangeIncrementalRateModelMaster:
    incremental_rate_model_id = v
    return self


func with_name(v) -> Gs2ExchangeIncrementalRateModelMaster:
    name = v
    return self


func with_description(v) -> Gs2ExchangeIncrementalRateModelMaster:
    description = v
    return self


func with_metadata(v) -> Gs2ExchangeIncrementalRateModelMaster:
    metadata = v
    return self


func with_consume_action(v) -> Gs2ExchangeIncrementalRateModelMaster:
    consume_action = v
    return self


func with_calculate_type(v) -> Gs2ExchangeIncrementalRateModelMaster:
    calculate_type = v
    return self


func with_base_value(v) -> Gs2ExchangeIncrementalRateModelMaster:
    base_value = v
    return self


func with_coefficient_value(v) -> Gs2ExchangeIncrementalRateModelMaster:
    coefficient_value = v
    return self


func with_calculate_script_id(v) -> Gs2ExchangeIncrementalRateModelMaster:
    calculate_script_id = v
    return self


func with_exchange_count_id(v) -> Gs2ExchangeIncrementalRateModelMaster:
    exchange_count_id = v
    return self


func with_maximum_exchange_count(v) -> Gs2ExchangeIncrementalRateModelMaster:
    maximum_exchange_count = v
    return self


func with_acquire_actions(v) -> Gs2ExchangeIncrementalRateModelMaster:
    acquire_actions = v
    return self


func with_created_at(v) -> Gs2ExchangeIncrementalRateModelMaster:
    created_at = v
    return self


func with_updated_at(v) -> Gs2ExchangeIncrementalRateModelMaster:
    updated_at = v
    return self


func with_revision(v) -> Gs2ExchangeIncrementalRateModelMaster:
    revision = v
    return self


static func get_region_from_grn(grn):
    if grn == null:
        return null
    var regex = RegEx.new()
    regex.compile("grn:gs2:(?<region>.+):(?<ownerId>.+):exchange:(?<namespaceName>.+):incremental:model:(?<rateName>.+)")
    var matched = regex.search(grn)
    if matched == null:
        return null
    return matched.get_string("region")


static func get_owner_id_from_grn(grn):
    if grn == null:
        return null
    var regex = RegEx.new()
    regex.compile("grn:gs2:(?<region>.+):(?<ownerId>.+):exchange:(?<namespaceName>.+):incremental:model:(?<rateName>.+)")
    var matched = regex.search(grn)
    if matched == null:
        return null
    return matched.get_string("ownerId")


static func get_namespace_name_from_grn(grn):
    if grn == null:
        return null
    var regex = RegEx.new()
    regex.compile("grn:gs2:(?<region>.+):(?<ownerId>.+):exchange:(?<namespaceName>.+):incremental:model:(?<rateName>.+)")
    var matched = regex.search(grn)
    if matched == null:
        return null
    return matched.get_string("namespaceName")


static func get_rate_name_from_grn(grn):
    if grn == null:
        return null
    var regex = RegEx.new()
    regex.compile("grn:gs2:(?<region>.+):(?<ownerId>.+):exchange:(?<namespaceName>.+):incremental:model:(?<rateName>.+)")
    var matched = regex.search(grn)
    if matched == null:
        return null
    return matched.get_string("rateName")


static func from_dict(data) -> Gs2ExchangeIncrementalRateModelMaster:
    if data == null:
        return null
    var ret = Gs2ExchangeIncrementalRateModelMaster.new()
    ret.incremental_rate_model_id = null if data.get("incrementalRateModelId") == null else str(data.get("incrementalRateModelId"))
    ret.name = null if data.get("name") == null else str(data.get("name"))
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
    ret.created_at = null if data.get("createdAt") == null else int(data.get("createdAt"))
    ret.updated_at = null if data.get("updatedAt") == null else int(data.get("updatedAt"))
    ret.revision = null if data.get("revision") == null else int(data.get("revision"))
    return ret


func to_dict() -> Dictionary:
    var ret = {}
    ret["incrementalRateModelId"] = incremental_rate_model_id
    ret["name"] = name
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
    ret["createdAt"] = created_at
    ret["updatedAt"] = updated_at
    ret["revision"] = revision
    return ret