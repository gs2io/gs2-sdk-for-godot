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
class_name Gs2Money2DepositEvent
extends RefCounted


var slot = null
var deposit_transactions = null
var status = null


func with_slot(v) -> Gs2Money2DepositEvent:
    slot = v
    return self


func with_deposit_transactions(v) -> Gs2Money2DepositEvent:
    deposit_transactions = v
    return self


func with_status(v) -> Gs2Money2DepositEvent:
    status = v
    return self


static func from_dict(data) -> Gs2Money2DepositEvent:
    if data == null:
        return null
    var ret = Gs2Money2DepositEvent.new()
    ret.slot = null if data.get("slot") == null else int(data.get("slot"))
    ret.deposit_transactions = null if data.get("depositTransactions") == null else data.get("depositTransactions").map(func(v): return Gs2Money2DepositTransaction.from_dict(v))
    ret.status = null if data.get("status") == null else Gs2Money2WalletSummary.from_dict(data.get("status"))
    return ret


func to_dict() -> Dictionary:
    var ret = {}
    ret["slot"] = slot
    ret["depositTransactions"] = null if deposit_transactions == null else deposit_transactions.map(func(v): return null if v == null else v.to_dict())
    ret["status"] = null if status == null else status.to_dict()
    return ret