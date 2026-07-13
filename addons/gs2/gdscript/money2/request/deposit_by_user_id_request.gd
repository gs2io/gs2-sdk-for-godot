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
class_name Gs2Money2DepositByUserIdRequest
extends Gs2Request


var namespace_name = null
var user_id = null
var slot = null
var deposit_transactions = null
var time_offset_token = null
var duplication_avoider = null


func with_namespace_name(v) -> Gs2Money2DepositByUserIdRequest:
    namespace_name = v
    return self


func with_user_id(v) -> Gs2Money2DepositByUserIdRequest:
    user_id = v
    return self


func with_slot(v) -> Gs2Money2DepositByUserIdRequest:
    slot = v
    return self


func with_deposit_transactions(v) -> Gs2Money2DepositByUserIdRequest:
    deposit_transactions = v
    return self


func with_time_offset_token(v) -> Gs2Money2DepositByUserIdRequest:
    time_offset_token = v
    return self


func with_duplication_avoider(v) -> Gs2Money2DepositByUserIdRequest:
    duplication_avoider = v
    return self


static func from_dict(data) -> Gs2Money2DepositByUserIdRequest:
    if data == null:
        return null
    var ret = Gs2Money2DepositByUserIdRequest.new()
    ret.namespace_name = null if data.get("namespaceName") == null else str(data.get("namespaceName"))
    ret.user_id = null if data.get("userId") == null else str(data.get("userId"))
    ret.slot = null if data.get("slot") == null else int(data.get("slot"))
    ret.deposit_transactions = null if data.get("depositTransactions") == null else data.get("depositTransactions").map(func(v): return Gs2Money2DepositTransaction.from_dict(v))
    ret.time_offset_token = null if data.get("timeOffsetToken") == null else str(data.get("timeOffsetToken"))
    return ret


func to_dict() -> Dictionary:
    var ret = {}
    ret["namespaceName"] = namespace_name
    ret["userId"] = user_id
    ret["slot"] = slot
    ret["depositTransactions"] = null if deposit_transactions == null else deposit_transactions.map(func(v): return null if v == null else v.to_dict())
    ret["timeOffsetToken"] = time_offset_token
    return ret