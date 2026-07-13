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
class_name Gs2Money2UnusedBalance
extends RefCounted


var unused_balance_id = null
var currency = null
var balance = null
var updated_at = null
var revision = null


func with_unused_balance_id(v) -> Gs2Money2UnusedBalance:
    unused_balance_id = v
    return self


func with_currency(v) -> Gs2Money2UnusedBalance:
    currency = v
    return self


func with_balance(v) -> Gs2Money2UnusedBalance:
    balance = v
    return self


func with_updated_at(v) -> Gs2Money2UnusedBalance:
    updated_at = v
    return self


func with_revision(v) -> Gs2Money2UnusedBalance:
    revision = v
    return self


static func get_region_from_grn(grn):
    if grn == null:
        return null
    var regex = RegEx.new()
    regex.compile("grn:gs2:(?<region>.+):(?<ownerId>.+):money2:(?<namespaceName>.+):unused:(?<currency>.+)")
    var matched = regex.search(grn)
    if matched == null:
        return null
    return matched.get_string("region")


static func get_owner_id_from_grn(grn):
    if grn == null:
        return null
    var regex = RegEx.new()
    regex.compile("grn:gs2:(?<region>.+):(?<ownerId>.+):money2:(?<namespaceName>.+):unused:(?<currency>.+)")
    var matched = regex.search(grn)
    if matched == null:
        return null
    return matched.get_string("ownerId")


static func get_namespace_name_from_grn(grn):
    if grn == null:
        return null
    var regex = RegEx.new()
    regex.compile("grn:gs2:(?<region>.+):(?<ownerId>.+):money2:(?<namespaceName>.+):unused:(?<currency>.+)")
    var matched = regex.search(grn)
    if matched == null:
        return null
    return matched.get_string("namespaceName")


static func get_currency_from_grn(grn):
    if grn == null:
        return null
    var regex = RegEx.new()
    regex.compile("grn:gs2:(?<region>.+):(?<ownerId>.+):money2:(?<namespaceName>.+):unused:(?<currency>.+)")
    var matched = regex.search(grn)
    if matched == null:
        return null
    return matched.get_string("currency")


static func from_dict(data) -> Gs2Money2UnusedBalance:
    if data == null:
        return null
    var ret = Gs2Money2UnusedBalance.new()
    ret.unused_balance_id = null if data.get("unusedBalanceId") == null else str(data.get("unusedBalanceId"))
    ret.currency = null if data.get("currency") == null else str(data.get("currency"))
    ret.balance = null if data.get("balance") == null else float(data.get("balance"))
    ret.updated_at = null if data.get("updatedAt") == null else int(data.get("updatedAt"))
    ret.revision = null if data.get("revision") == null else int(data.get("revision"))
    return ret


func to_dict() -> Dictionary:
    var ret = {}
    ret["unusedBalanceId"] = unused_balance_id
    ret["currency"] = currency
    ret["balance"] = balance
    ret["updatedAt"] = updated_at
    ret["revision"] = revision
    return ret