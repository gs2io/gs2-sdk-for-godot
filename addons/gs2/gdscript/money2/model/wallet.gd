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
class_name Gs2Money2Wallet
extends RefCounted


var wallet_id = null
var user_id = null
var slot = null
var summary = null
var deposit_transactions = null
var shared_free_currency = null
var created_at = null
var updated_at = null
var revision = null


func with_wallet_id(v) -> Gs2Money2Wallet:
    wallet_id = v
    return self


func with_user_id(v) -> Gs2Money2Wallet:
    user_id = v
    return self


func with_slot(v) -> Gs2Money2Wallet:
    slot = v
    return self


func with_summary(v) -> Gs2Money2Wallet:
    summary = v
    return self


func with_deposit_transactions(v) -> Gs2Money2Wallet:
    deposit_transactions = v
    return self


func with_shared_free_currency(v) -> Gs2Money2Wallet:
    shared_free_currency = v
    return self


func with_created_at(v) -> Gs2Money2Wallet:
    created_at = v
    return self


func with_updated_at(v) -> Gs2Money2Wallet:
    updated_at = v
    return self


func with_revision(v) -> Gs2Money2Wallet:
    revision = v
    return self


static func get_region_from_grn(grn):
    if grn == null:
        return null
    var regex = RegEx.new()
    regex.compile("grn:gs2:(?<region>.+):(?<ownerId>.+):money2:(?<namespaceName>.+):user:(?<userId>.+):wallet:(?<slot>.+)")
    var matched = regex.search(grn)
    if matched == null:
        return null
    return matched.get_string("region")


static func get_owner_id_from_grn(grn):
    if grn == null:
        return null
    var regex = RegEx.new()
    regex.compile("grn:gs2:(?<region>.+):(?<ownerId>.+):money2:(?<namespaceName>.+):user:(?<userId>.+):wallet:(?<slot>.+)")
    var matched = regex.search(grn)
    if matched == null:
        return null
    return matched.get_string("ownerId")


static func get_namespace_name_from_grn(grn):
    if grn == null:
        return null
    var regex = RegEx.new()
    regex.compile("grn:gs2:(?<region>.+):(?<ownerId>.+):money2:(?<namespaceName>.+):user:(?<userId>.+):wallet:(?<slot>.+)")
    var matched = regex.search(grn)
    if matched == null:
        return null
    return matched.get_string("namespaceName")


static func get_user_id_from_grn(grn):
    if grn == null:
        return null
    var regex = RegEx.new()
    regex.compile("grn:gs2:(?<region>.+):(?<ownerId>.+):money2:(?<namespaceName>.+):user:(?<userId>.+):wallet:(?<slot>.+)")
    var matched = regex.search(grn)
    if matched == null:
        return null
    return matched.get_string("userId")


static func get_slot_from_grn(grn):
    if grn == null:
        return null
    var regex = RegEx.new()
    regex.compile("grn:gs2:(?<region>.+):(?<ownerId>.+):money2:(?<namespaceName>.+):user:(?<userId>.+):wallet:(?<slot>.+)")
    var matched = regex.search(grn)
    if matched == null:
        return null
    return matched.get_string("slot")


static func from_dict(data) -> Gs2Money2Wallet:
    if data == null:
        return null
    var ret = Gs2Money2Wallet.new()
    ret.wallet_id = null if data.get("walletId") == null else str(data.get("walletId"))
    ret.user_id = null if data.get("userId") == null else str(data.get("userId"))
    ret.slot = null if data.get("slot") == null else int(data.get("slot"))
    ret.summary = null if data.get("summary") == null else Gs2Money2WalletSummary.from_dict(data.get("summary"))
    ret.deposit_transactions = null if data.get("depositTransactions") == null else data.get("depositTransactions").map(func(v): return Gs2Money2DepositTransaction.from_dict(v))
    ret.shared_free_currency = null if data.get("sharedFreeCurrency") == null else bool(data.get("sharedFreeCurrency"))
    ret.created_at = null if data.get("createdAt") == null else int(data.get("createdAt"))
    ret.updated_at = null if data.get("updatedAt") == null else int(data.get("updatedAt"))
    ret.revision = null if data.get("revision") == null else int(data.get("revision"))
    return ret


func to_dict() -> Dictionary:
    var ret = {}
    ret["walletId"] = wallet_id
    ret["userId"] = user_id
    ret["slot"] = slot
    ret["summary"] = null if summary == null else summary.to_dict()
    ret["depositTransactions"] = null if deposit_transactions == null else deposit_transactions.map(func(v): return null if v == null else v.to_dict())
    ret["sharedFreeCurrency"] = shared_free_currency
    ret["createdAt"] = created_at
    ret["updatedAt"] = updated_at
    ret["revision"] = revision
    return ret