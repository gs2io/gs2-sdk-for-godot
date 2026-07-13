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
class_name Gs2Money2RefundHistory
extends RefCounted


var refund_history_id = null
var transaction_id = null
var year = null
var month = null
var day = null
var user_id = null
var detail = null
var created_at = null


func with_refund_history_id(v) -> Gs2Money2RefundHistory:
    refund_history_id = v
    return self


func with_transaction_id(v) -> Gs2Money2RefundHistory:
    transaction_id = v
    return self


func with_year(v) -> Gs2Money2RefundHistory:
    year = v
    return self


func with_month(v) -> Gs2Money2RefundHistory:
    month = v
    return self


func with_day(v) -> Gs2Money2RefundHistory:
    day = v
    return self


func with_user_id(v) -> Gs2Money2RefundHistory:
    user_id = v
    return self


func with_detail(v) -> Gs2Money2RefundHistory:
    detail = v
    return self


func with_created_at(v) -> Gs2Money2RefundHistory:
    created_at = v
    return self


static func get_region_from_grn(grn):
    if grn == null:
        return null
    var regex = RegEx.new()
    regex.compile("grn:gs2:(?<region>.+):(?<ownerId>.+):money2:(?<namespaceName>.+):refundHistory:(?<transactionId>.+)")
    var matched = regex.search(grn)
    if matched == null:
        return null
    return matched.get_string("region")


static func get_owner_id_from_grn(grn):
    if grn == null:
        return null
    var regex = RegEx.new()
    regex.compile("grn:gs2:(?<region>.+):(?<ownerId>.+):money2:(?<namespaceName>.+):refundHistory:(?<transactionId>.+)")
    var matched = regex.search(grn)
    if matched == null:
        return null
    return matched.get_string("ownerId")


static func get_namespace_name_from_grn(grn):
    if grn == null:
        return null
    var regex = RegEx.new()
    regex.compile("grn:gs2:(?<region>.+):(?<ownerId>.+):money2:(?<namespaceName>.+):refundHistory:(?<transactionId>.+)")
    var matched = regex.search(grn)
    if matched == null:
        return null
    return matched.get_string("namespaceName")


static func get_transaction_id_from_grn(grn):
    if grn == null:
        return null
    var regex = RegEx.new()
    regex.compile("grn:gs2:(?<region>.+):(?<ownerId>.+):money2:(?<namespaceName>.+):refundHistory:(?<transactionId>.+)")
    var matched = regex.search(grn)
    if matched == null:
        return null
    return matched.get_string("transactionId")


static func from_dict(data) -> Gs2Money2RefundHistory:
    if data == null:
        return null
    var ret = Gs2Money2RefundHistory.new()
    ret.refund_history_id = null if data.get("refundHistoryId") == null else str(data.get("refundHistoryId"))
    ret.transaction_id = null if data.get("transactionId") == null else str(data.get("transactionId"))
    ret.year = null if data.get("year") == null else int(data.get("year"))
    ret.month = null if data.get("month") == null else int(data.get("month"))
    ret.day = null if data.get("day") == null else int(data.get("day"))
    ret.user_id = null if data.get("userId") == null else str(data.get("userId"))
    ret.detail = null if data.get("detail") == null else Gs2Money2RefundEvent.from_dict(data.get("detail"))
    ret.created_at = null if data.get("createdAt") == null else int(data.get("createdAt"))
    return ret


func to_dict() -> Dictionary:
    var ret = {}
    ret["refundHistoryId"] = refund_history_id
    ret["transactionId"] = transaction_id
    ret["year"] = year
    ret["month"] = month
    ret["day"] = day
    ret["userId"] = user_id
    ret["detail"] = null if detail == null else detail.to_dict()
    ret["createdAt"] = created_at
    return ret