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
class_name Gs2ExchangeRateModel
extends RefCounted


var rate_model_id = null
var name = null
var metadata = null
var verify_actions = null
var consume_actions = null
var timing_type = null
var lock_time = null
var acquire_actions = null


func with_rate_model_id(v) -> Gs2ExchangeRateModel:
    rate_model_id = v
    return self


func with_name(v) -> Gs2ExchangeRateModel:
    name = v
    return self


func with_metadata(v) -> Gs2ExchangeRateModel:
    metadata = v
    return self


func with_verify_actions(v) -> Gs2ExchangeRateModel:
    verify_actions = v
    return self


func with_consume_actions(v) -> Gs2ExchangeRateModel:
    consume_actions = v
    return self


func with_timing_type(v) -> Gs2ExchangeRateModel:
    timing_type = v
    return self


func with_lock_time(v) -> Gs2ExchangeRateModel:
    lock_time = v
    return self


func with_acquire_actions(v) -> Gs2ExchangeRateModel:
    acquire_actions = v
    return self


static func get_region_from_grn(grn):
    if grn == null:
        return null
    var regex = RegEx.new()
    regex.compile("grn:gs2:(?<region>.+):(?<ownerId>.+):exchange:(?<namespaceName>.+):model:(?<rateName>.+)")
    var matched = regex.search(grn)
    if matched == null:
        return null
    return matched.get_string("region")


static func get_owner_id_from_grn(grn):
    if grn == null:
        return null
    var regex = RegEx.new()
    regex.compile("grn:gs2:(?<region>.+):(?<ownerId>.+):exchange:(?<namespaceName>.+):model:(?<rateName>.+)")
    var matched = regex.search(grn)
    if matched == null:
        return null
    return matched.get_string("ownerId")


static func get_namespace_name_from_grn(grn):
    if grn == null:
        return null
    var regex = RegEx.new()
    regex.compile("grn:gs2:(?<region>.+):(?<ownerId>.+):exchange:(?<namespaceName>.+):model:(?<rateName>.+)")
    var matched = regex.search(grn)
    if matched == null:
        return null
    return matched.get_string("namespaceName")


static func get_rate_name_from_grn(grn):
    if grn == null:
        return null
    var regex = RegEx.new()
    regex.compile("grn:gs2:(?<region>.+):(?<ownerId>.+):exchange:(?<namespaceName>.+):model:(?<rateName>.+)")
    var matched = regex.search(grn)
    if matched == null:
        return null
    return matched.get_string("rateName")


static func from_dict(data) -> Gs2ExchangeRateModel:
    if data == null:
        return null
    var ret = Gs2ExchangeRateModel.new()
    ret.rate_model_id = null if data.get("rateModelId") == null else str(data.get("rateModelId"))
    ret.name = null if data.get("name") == null else str(data.get("name"))
    ret.metadata = null if data.get("metadata") == null else str(data.get("metadata"))
    ret.verify_actions = null if data.get("verifyActions") == null else data.get("verifyActions").map(func(v): return Gs2VerifyAction.from_dict(v))
    ret.consume_actions = null if data.get("consumeActions") == null else data.get("consumeActions").map(func(v): return Gs2ConsumeAction.from_dict(v))
    ret.timing_type = null if data.get("timingType") == null else str(data.get("timingType"))
    ret.lock_time = null if data.get("lockTime") == null else int(data.get("lockTime"))
    ret.acquire_actions = null if data.get("acquireActions") == null else data.get("acquireActions").map(func(v): return Gs2AcquireAction.from_dict(v))
    return ret


func to_dict() -> Dictionary:
    var ret = {}
    ret["rateModelId"] = rate_model_id
    ret["name"] = name
    ret["metadata"] = metadata
    ret["verifyActions"] = null if verify_actions == null else verify_actions.map(func(v): return null if v == null else v.to_dict())
    ret["consumeActions"] = null if consume_actions == null else consume_actions.map(func(v): return null if v == null else v.to_dict())
    ret["timingType"] = timing_type
    ret["lockTime"] = lock_time
    ret["acquireActions"] = null if acquire_actions == null else acquire_actions.map(func(v): return null if v == null else v.to_dict())
    return ret