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
class_name Gs2ScriptTransaction
extends RefCounted


var transaction_id = null
var verify_actions = null
var consume_actions = null
var acquire_actions = null


func with_transaction_id(v) -> Gs2ScriptTransaction:
    transaction_id = v
    return self


func with_verify_actions(v) -> Gs2ScriptTransaction:
    verify_actions = v
    return self


func with_consume_actions(v) -> Gs2ScriptTransaction:
    consume_actions = v
    return self


func with_acquire_actions(v) -> Gs2ScriptTransaction:
    acquire_actions = v
    return self


static func from_dict(data) -> Gs2ScriptTransaction:
    if data == null:
        return null
    var ret = Gs2ScriptTransaction.new()
    ret.transaction_id = null if data.get("transactionId") == null else str(data.get("transactionId"))
    ret.verify_actions = null if data.get("verifyActions") == null else data.get("verifyActions").map(func(v): return Gs2VerifyAction.from_dict(v))
    ret.consume_actions = null if data.get("consumeActions") == null else data.get("consumeActions").map(func(v): return Gs2ConsumeAction.from_dict(v))
    ret.acquire_actions = null if data.get("acquireActions") == null else data.get("acquireActions").map(func(v): return Gs2AcquireAction.from_dict(v))
    return ret


func to_dict() -> Dictionary:
    var ret = {}
    ret["transactionId"] = transaction_id
    ret["verifyActions"] = null if verify_actions == null else verify_actions.map(func(v): return null if v == null else v.to_dict())
    ret["consumeActions"] = null if consume_actions == null else consume_actions.map(func(v): return null if v == null else v.to_dict())
    ret["acquireActions"] = null if acquire_actions == null else acquire_actions.map(func(v): return null if v == null else v.to_dict())
    return ret