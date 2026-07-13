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
class_name Gs2MoneyWallet
extends RefCounted


var wallet_id = null
var user_id = null
var slot = null
var paid = null
var free_ = null
var detail = null
var share_free = null
var created_at = null
var updated_at = null
var revision = null


func with_wallet_id(v) -> Gs2MoneyWallet:
    wallet_id = v
    return self


func with_user_id(v) -> Gs2MoneyWallet:
    user_id = v
    return self


func with_slot(v) -> Gs2MoneyWallet:
    slot = v
    return self


func with_paid(v) -> Gs2MoneyWallet:
    paid = v
    return self


func with_free(v) -> Gs2MoneyWallet:
    free_ = v
    return self


func with_detail(v) -> Gs2MoneyWallet:
    detail = v
    return self


func with_share_free(v) -> Gs2MoneyWallet:
    share_free = v
    return self


func with_created_at(v) -> Gs2MoneyWallet:
    created_at = v
    return self


func with_updated_at(v) -> Gs2MoneyWallet:
    updated_at = v
    return self


func with_revision(v) -> Gs2MoneyWallet:
    revision = v
    return self


static func get_region_from_grn(grn):
    if grn == null:
        return null
    var regex = RegEx.new()
    regex.compile("grn:gs2:(?<region>.+):(?<ownerId>.+):money:(?<namespaceName>.+):user:(?<userId>.+):wallet:(?<slot>.+)")
    var matched = regex.search(grn)
    if matched == null:
        return null
    return matched.get_string("region")


static func get_owner_id_from_grn(grn):
    if grn == null:
        return null
    var regex = RegEx.new()
    regex.compile("grn:gs2:(?<region>.+):(?<ownerId>.+):money:(?<namespaceName>.+):user:(?<userId>.+):wallet:(?<slot>.+)")
    var matched = regex.search(grn)
    if matched == null:
        return null
    return matched.get_string("ownerId")


static func get_namespace_name_from_grn(grn):
    if grn == null:
        return null
    var regex = RegEx.new()
    regex.compile("grn:gs2:(?<region>.+):(?<ownerId>.+):money:(?<namespaceName>.+):user:(?<userId>.+):wallet:(?<slot>.+)")
    var matched = regex.search(grn)
    if matched == null:
        return null
    return matched.get_string("namespaceName")


static func get_user_id_from_grn(grn):
    if grn == null:
        return null
    var regex = RegEx.new()
    regex.compile("grn:gs2:(?<region>.+):(?<ownerId>.+):money:(?<namespaceName>.+):user:(?<userId>.+):wallet:(?<slot>.+)")
    var matched = regex.search(grn)
    if matched == null:
        return null
    return matched.get_string("userId")


static func get_slot_from_grn(grn):
    if grn == null:
        return null
    var regex = RegEx.new()
    regex.compile("grn:gs2:(?<region>.+):(?<ownerId>.+):money:(?<namespaceName>.+):user:(?<userId>.+):wallet:(?<slot>.+)")
    var matched = regex.search(grn)
    if matched == null:
        return null
    return matched.get_string("slot")


static func from_dict(data) -> Gs2MoneyWallet:
    if data == null:
        return null
    var ret = Gs2MoneyWallet.new()
    ret.wallet_id = null if data.get("walletId") == null else str(data.get("walletId"))
    ret.user_id = null if data.get("userId") == null else str(data.get("userId"))
    ret.slot = null if data.get("slot") == null else int(data.get("slot"))
    ret.paid = null if data.get("paid") == null else int(data.get("paid"))
    ret.free_ = null if data.get("free") == null else int(data.get("free"))
    ret.detail = null if data.get("detail") == null else data.get("detail").map(func(v): return Gs2MoneyWalletDetail.from_dict(v))
    ret.share_free = null if data.get("shareFree") == null else bool(data.get("shareFree"))
    ret.created_at = null if data.get("createdAt") == null else int(data.get("createdAt"))
    ret.updated_at = null if data.get("updatedAt") == null else int(data.get("updatedAt"))
    ret.revision = null if data.get("revision") == null else int(data.get("revision"))
    return ret


func to_dict() -> Dictionary:
    var ret = {}
    ret["walletId"] = wallet_id
    ret["userId"] = user_id
    ret["slot"] = slot
    ret["paid"] = paid
    ret["free"] = free_
    ret["detail"] = null if detail == null else detail.map(func(v): return null if v == null else v.to_dict())
    ret["shareFree"] = share_free
    ret["createdAt"] = created_at
    ret["updatedAt"] = updated_at
    ret["revision"] = revision
    return ret