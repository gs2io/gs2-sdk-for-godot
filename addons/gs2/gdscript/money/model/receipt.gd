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
class_name Gs2MoneyReceipt
extends RefCounted


var receipt_id = null
var transaction_id = null
var purchase_token = null
var user_id = null
var type = null
var slot = null
var price = null
var paid = null
var free_ = null
var total = null
var contents_id = null
var created_at = null
var revision = null


func with_receipt_id(v) -> Gs2MoneyReceipt:
    receipt_id = v
    return self


func with_transaction_id(v) -> Gs2MoneyReceipt:
    transaction_id = v
    return self


func with_purchase_token(v) -> Gs2MoneyReceipt:
    purchase_token = v
    return self


func with_user_id(v) -> Gs2MoneyReceipt:
    user_id = v
    return self


func with_type(v) -> Gs2MoneyReceipt:
    type = v
    return self


func with_slot(v) -> Gs2MoneyReceipt:
    slot = v
    return self


func with_price(v) -> Gs2MoneyReceipt:
    price = v
    return self


func with_paid(v) -> Gs2MoneyReceipt:
    paid = v
    return self


func with_free(v) -> Gs2MoneyReceipt:
    free_ = v
    return self


func with_total(v) -> Gs2MoneyReceipt:
    total = v
    return self


func with_contents_id(v) -> Gs2MoneyReceipt:
    contents_id = v
    return self


func with_created_at(v) -> Gs2MoneyReceipt:
    created_at = v
    return self


func with_revision(v) -> Gs2MoneyReceipt:
    revision = v
    return self


static func get_region_from_grn(grn):
    if grn == null:
        return null
    var regex = RegEx.new()
    regex.compile("grn:gs2:(?<region>.+):(?<ownerId>.+):money:(?<namespaceName>.+):user:(?<userId>.+):receipt:(?<transactionId>.+)")
    var matched = regex.search(grn)
    if matched == null:
        return null
    return matched.get_string("region")


static func get_owner_id_from_grn(grn):
    if grn == null:
        return null
    var regex = RegEx.new()
    regex.compile("grn:gs2:(?<region>.+):(?<ownerId>.+):money:(?<namespaceName>.+):user:(?<userId>.+):receipt:(?<transactionId>.+)")
    var matched = regex.search(grn)
    if matched == null:
        return null
    return matched.get_string("ownerId")


static func get_namespace_name_from_grn(grn):
    if grn == null:
        return null
    var regex = RegEx.new()
    regex.compile("grn:gs2:(?<region>.+):(?<ownerId>.+):money:(?<namespaceName>.+):user:(?<userId>.+):receipt:(?<transactionId>.+)")
    var matched = regex.search(grn)
    if matched == null:
        return null
    return matched.get_string("namespaceName")


static func get_user_id_from_grn(grn):
    if grn == null:
        return null
    var regex = RegEx.new()
    regex.compile("grn:gs2:(?<region>.+):(?<ownerId>.+):money:(?<namespaceName>.+):user:(?<userId>.+):receipt:(?<transactionId>.+)")
    var matched = regex.search(grn)
    if matched == null:
        return null
    return matched.get_string("userId")


static func get_transaction_id_from_grn(grn):
    if grn == null:
        return null
    var regex = RegEx.new()
    regex.compile("grn:gs2:(?<region>.+):(?<ownerId>.+):money:(?<namespaceName>.+):user:(?<userId>.+):receipt:(?<transactionId>.+)")
    var matched = regex.search(grn)
    if matched == null:
        return null
    return matched.get_string("transactionId")


static func from_dict(data) -> Gs2MoneyReceipt:
    if data == null:
        return null
    var ret = Gs2MoneyReceipt.new()
    ret.receipt_id = null if data.get("receiptId") == null else str(data.get("receiptId"))
    ret.transaction_id = null if data.get("transactionId") == null else str(data.get("transactionId"))
    ret.purchase_token = null if data.get("purchaseToken") == null else str(data.get("purchaseToken"))
    ret.user_id = null if data.get("userId") == null else str(data.get("userId"))
    ret.type = null if data.get("type") == null else str(data.get("type"))
    ret.slot = null if data.get("slot") == null else int(data.get("slot"))
    ret.price = null if data.get("price") == null else float(data.get("price"))
    ret.paid = null if data.get("paid") == null else int(data.get("paid"))
    ret.free_ = null if data.get("free") == null else int(data.get("free"))
    ret.total = null if data.get("total") == null else int(data.get("total"))
    ret.contents_id = null if data.get("contentsId") == null else str(data.get("contentsId"))
    ret.created_at = null if data.get("createdAt") == null else int(data.get("createdAt"))
    ret.revision = null if data.get("revision") == null else int(data.get("revision"))
    return ret


func to_dict() -> Dictionary:
    var ret = {}
    ret["receiptId"] = receipt_id
    ret["transactionId"] = transaction_id
    ret["purchaseToken"] = purchase_token
    ret["userId"] = user_id
    ret["type"] = type
    ret["slot"] = slot
    ret["price"] = price
    ret["paid"] = paid
    ret["free"] = free_
    ret["total"] = total
    ret["contentsId"] = contents_id
    ret["createdAt"] = created_at
    ret["revision"] = revision
    return ret