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
class_name Gs2Money2Event
extends RefCounted


var event_id = null
var transaction_id = null
var user_id = null
var event_type = null
var verify_receipt_event = null
var deposit_event = null
var withdraw_event = null
var refund_event = null
var created_at = null
var revision = null


func with_event_id(v) -> Gs2Money2Event:
    event_id = v
    return self


func with_transaction_id(v) -> Gs2Money2Event:
    transaction_id = v
    return self


func with_user_id(v) -> Gs2Money2Event:
    user_id = v
    return self


func with_event_type(v) -> Gs2Money2Event:
    event_type = v
    return self


func with_verify_receipt_event(v) -> Gs2Money2Event:
    verify_receipt_event = v
    return self


func with_deposit_event(v) -> Gs2Money2Event:
    deposit_event = v
    return self


func with_withdraw_event(v) -> Gs2Money2Event:
    withdraw_event = v
    return self


func with_refund_event(v) -> Gs2Money2Event:
    refund_event = v
    return self


func with_created_at(v) -> Gs2Money2Event:
    created_at = v
    return self


func with_revision(v) -> Gs2Money2Event:
    revision = v
    return self


static func get_region_from_grn(grn):
    if grn == null:
        return null
    var regex = RegEx.new()
    regex.compile("grn:gs2:(?<region>.+):(?<ownerId>.+):money2:(?<namespaceName>.+):event:(?<transactionId>.+)")
    var matched = regex.search(grn)
    if matched == null:
        return null
    return matched.get_string("region")


static func get_owner_id_from_grn(grn):
    if grn == null:
        return null
    var regex = RegEx.new()
    regex.compile("grn:gs2:(?<region>.+):(?<ownerId>.+):money2:(?<namespaceName>.+):event:(?<transactionId>.+)")
    var matched = regex.search(grn)
    if matched == null:
        return null
    return matched.get_string("ownerId")


static func get_namespace_name_from_grn(grn):
    if grn == null:
        return null
    var regex = RegEx.new()
    regex.compile("grn:gs2:(?<region>.+):(?<ownerId>.+):money2:(?<namespaceName>.+):event:(?<transactionId>.+)")
    var matched = regex.search(grn)
    if matched == null:
        return null
    return matched.get_string("namespaceName")


static func get_transaction_id_from_grn(grn):
    if grn == null:
        return null
    var regex = RegEx.new()
    regex.compile("grn:gs2:(?<region>.+):(?<ownerId>.+):money2:(?<namespaceName>.+):event:(?<transactionId>.+)")
    var matched = regex.search(grn)
    if matched == null:
        return null
    return matched.get_string("transactionId")


static func from_dict(data) -> Gs2Money2Event:
    if data == null:
        return null
    var ret = Gs2Money2Event.new()
    ret.event_id = null if data.get("eventId") == null else str(data.get("eventId"))
    ret.transaction_id = null if data.get("transactionId") == null else str(data.get("transactionId"))
    ret.user_id = null if data.get("userId") == null else str(data.get("userId"))
    ret.event_type = null if data.get("eventType") == null else str(data.get("eventType"))
    ret.verify_receipt_event = null if data.get("verifyReceiptEvent") == null else Gs2Money2VerifyReceiptEvent.from_dict(data.get("verifyReceiptEvent"))
    ret.deposit_event = null if data.get("depositEvent") == null else Gs2Money2DepositEvent.from_dict(data.get("depositEvent"))
    ret.withdraw_event = null if data.get("withdrawEvent") == null else Gs2Money2WithdrawEvent.from_dict(data.get("withdrawEvent"))
    ret.refund_event = null if data.get("refundEvent") == null else Gs2Money2RefundEvent.from_dict(data.get("refundEvent"))
    ret.created_at = null if data.get("createdAt") == null else int(data.get("createdAt"))
    ret.revision = null if data.get("revision") == null else int(data.get("revision"))
    return ret


func to_dict() -> Dictionary:
    var ret = {}
    ret["eventId"] = event_id
    ret["transactionId"] = transaction_id
    ret["userId"] = user_id
    ret["eventType"] = event_type
    ret["verifyReceiptEvent"] = null if verify_receipt_event == null else verify_receipt_event.to_dict()
    ret["depositEvent"] = null if deposit_event == null else deposit_event.to_dict()
    ret["withdrawEvent"] = null if withdraw_event == null else withdraw_event.to_dict()
    ret["refundEvent"] = null if refund_event == null else refund_event.to_dict()
    ret["createdAt"] = created_at
    ret["revision"] = revision
    return ret