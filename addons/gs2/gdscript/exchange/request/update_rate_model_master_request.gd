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
class_name Gs2ExchangeUpdateRateModelMasterRequest
extends Gs2Request


var namespace_name = null
var rate_name = null
var description = null
var metadata = null
var timing_type = null
var lock_time = null
var acquire_actions = null
var verify_actions = null
var consume_actions = null


func with_namespace_name(v) -> Gs2ExchangeUpdateRateModelMasterRequest:
    namespace_name = v
    return self


func with_rate_name(v) -> Gs2ExchangeUpdateRateModelMasterRequest:
    rate_name = v
    return self


func with_description(v) -> Gs2ExchangeUpdateRateModelMasterRequest:
    description = v
    return self


func with_metadata(v) -> Gs2ExchangeUpdateRateModelMasterRequest:
    metadata = v
    return self


func with_timing_type(v) -> Gs2ExchangeUpdateRateModelMasterRequest:
    timing_type = v
    return self


func with_lock_time(v) -> Gs2ExchangeUpdateRateModelMasterRequest:
    lock_time = v
    return self


func with_acquire_actions(v) -> Gs2ExchangeUpdateRateModelMasterRequest:
    acquire_actions = v
    return self


func with_verify_actions(v) -> Gs2ExchangeUpdateRateModelMasterRequest:
    verify_actions = v
    return self


func with_consume_actions(v) -> Gs2ExchangeUpdateRateModelMasterRequest:
    consume_actions = v
    return self


static func from_dict(data) -> Gs2ExchangeUpdateRateModelMasterRequest:
    if data == null:
        return null
    var ret = Gs2ExchangeUpdateRateModelMasterRequest.new()
    ret.namespace_name = null if data.get("namespaceName") == null else str(data.get("namespaceName"))
    ret.rate_name = null if data.get("rateName") == null else str(data.get("rateName"))
    ret.description = null if data.get("description") == null else str(data.get("description"))
    ret.metadata = null if data.get("metadata") == null else str(data.get("metadata"))
    ret.timing_type = null if data.get("timingType") == null else str(data.get("timingType"))
    ret.lock_time = null if data.get("lockTime") == null else int(data.get("lockTime"))
    ret.acquire_actions = null if data.get("acquireActions") == null else data.get("acquireActions").map(func(v): return Gs2AcquireAction.from_dict(v))
    ret.verify_actions = null if data.get("verifyActions") == null else data.get("verifyActions").map(func(v): return Gs2VerifyAction.from_dict(v))
    ret.consume_actions = null if data.get("consumeActions") == null else data.get("consumeActions").map(func(v): return Gs2ConsumeAction.from_dict(v))
    return ret


func to_dict() -> Dictionary:
    var ret = {}
    ret["namespaceName"] = namespace_name
    ret["rateName"] = rate_name
    ret["description"] = description
    ret["metadata"] = metadata
    ret["timingType"] = timing_type
    ret["lockTime"] = lock_time
    ret["acquireActions"] = null if acquire_actions == null else acquire_actions.map(func(v): return null if v == null else v.to_dict())
    ret["verifyActions"] = null if verify_actions == null else verify_actions.map(func(v): return null if v == null else v.to_dict())
    ret["consumeActions"] = null if consume_actions == null else consume_actions.map(func(v): return null if v == null else v.to_dict())
    return ret