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
class_name Gs2Money2DailyTransactionHistory
extends RefCounted


var daily_transaction_history_id = null
var year = null
var month = null
var day = null
var currency = null
var deposit_amount = null
var withdraw_amount = null
var issue_count = null
var consume_count = null
var updated_at = null
var revision = null


func with_daily_transaction_history_id(v) -> Gs2Money2DailyTransactionHistory:
    daily_transaction_history_id = v
    return self


func with_year(v) -> Gs2Money2DailyTransactionHistory:
    year = v
    return self


func with_month(v) -> Gs2Money2DailyTransactionHistory:
    month = v
    return self


func with_day(v) -> Gs2Money2DailyTransactionHistory:
    day = v
    return self


func with_currency(v) -> Gs2Money2DailyTransactionHistory:
    currency = v
    return self


func with_deposit_amount(v) -> Gs2Money2DailyTransactionHistory:
    deposit_amount = v
    return self


func with_withdraw_amount(v) -> Gs2Money2DailyTransactionHistory:
    withdraw_amount = v
    return self


func with_issue_count(v) -> Gs2Money2DailyTransactionHistory:
    issue_count = v
    return self


func with_consume_count(v) -> Gs2Money2DailyTransactionHistory:
    consume_count = v
    return self


func with_updated_at(v) -> Gs2Money2DailyTransactionHistory:
    updated_at = v
    return self


func with_revision(v) -> Gs2Money2DailyTransactionHistory:
    revision = v
    return self


static func get_region_from_grn(grn):
    if grn == null:
        return null
    var regex = RegEx.new()
    regex.compile("grn:gs2:(?<region>.+):(?<ownerId>.+):money2:(?<namespaceName>.+):transaction:history:daily:(?<year>.+):(?<month>.+):(?<day>.+):currency:(?<currency>.+)")
    var matched = regex.search(grn)
    if matched == null:
        return null
    return matched.get_string("region")


static func get_owner_id_from_grn(grn):
    if grn == null:
        return null
    var regex = RegEx.new()
    regex.compile("grn:gs2:(?<region>.+):(?<ownerId>.+):money2:(?<namespaceName>.+):transaction:history:daily:(?<year>.+):(?<month>.+):(?<day>.+):currency:(?<currency>.+)")
    var matched = regex.search(grn)
    if matched == null:
        return null
    return matched.get_string("ownerId")


static func get_namespace_name_from_grn(grn):
    if grn == null:
        return null
    var regex = RegEx.new()
    regex.compile("grn:gs2:(?<region>.+):(?<ownerId>.+):money2:(?<namespaceName>.+):transaction:history:daily:(?<year>.+):(?<month>.+):(?<day>.+):currency:(?<currency>.+)")
    var matched = regex.search(grn)
    if matched == null:
        return null
    return matched.get_string("namespaceName")


static func get_year_from_grn(grn):
    if grn == null:
        return null
    var regex = RegEx.new()
    regex.compile("grn:gs2:(?<region>.+):(?<ownerId>.+):money2:(?<namespaceName>.+):transaction:history:daily:(?<year>.+):(?<month>.+):(?<day>.+):currency:(?<currency>.+)")
    var matched = regex.search(grn)
    if matched == null:
        return null
    return matched.get_string("year")


static func get_month_from_grn(grn):
    if grn == null:
        return null
    var regex = RegEx.new()
    regex.compile("grn:gs2:(?<region>.+):(?<ownerId>.+):money2:(?<namespaceName>.+):transaction:history:daily:(?<year>.+):(?<month>.+):(?<day>.+):currency:(?<currency>.+)")
    var matched = regex.search(grn)
    if matched == null:
        return null
    return matched.get_string("month")


static func get_day_from_grn(grn):
    if grn == null:
        return null
    var regex = RegEx.new()
    regex.compile("grn:gs2:(?<region>.+):(?<ownerId>.+):money2:(?<namespaceName>.+):transaction:history:daily:(?<year>.+):(?<month>.+):(?<day>.+):currency:(?<currency>.+)")
    var matched = regex.search(grn)
    if matched == null:
        return null
    return matched.get_string("day")


static func get_currency_from_grn(grn):
    if grn == null:
        return null
    var regex = RegEx.new()
    regex.compile("grn:gs2:(?<region>.+):(?<ownerId>.+):money2:(?<namespaceName>.+):transaction:history:daily:(?<year>.+):(?<month>.+):(?<day>.+):currency:(?<currency>.+)")
    var matched = regex.search(grn)
    if matched == null:
        return null
    return matched.get_string("currency")


static func from_dict(data) -> Gs2Money2DailyTransactionHistory:
    if data == null:
        return null
    var ret = Gs2Money2DailyTransactionHistory.new()
    ret.daily_transaction_history_id = null if data.get("dailyTransactionHistoryId") == null else str(data.get("dailyTransactionHistoryId"))
    ret.year = null if data.get("year") == null else int(data.get("year"))
    ret.month = null if data.get("month") == null else int(data.get("month"))
    ret.day = null if data.get("day") == null else int(data.get("day"))
    ret.currency = null if data.get("currency") == null else str(data.get("currency"))
    ret.deposit_amount = null if data.get("depositAmount") == null else float(data.get("depositAmount"))
    ret.withdraw_amount = null if data.get("withdrawAmount") == null else float(data.get("withdrawAmount"))
    ret.issue_count = null if data.get("issueCount") == null else int(data.get("issueCount"))
    ret.consume_count = null if data.get("consumeCount") == null else int(data.get("consumeCount"))
    ret.updated_at = null if data.get("updatedAt") == null else int(data.get("updatedAt"))
    ret.revision = null if data.get("revision") == null else int(data.get("revision"))
    return ret


func to_dict() -> Dictionary:
    var ret = {}
    ret["dailyTransactionHistoryId"] = daily_transaction_history_id
    ret["year"] = year
    ret["month"] = month
    ret["day"] = day
    ret["currency"] = currency
    ret["depositAmount"] = deposit_amount
    ret["withdrawAmount"] = withdraw_amount
    ret["issueCount"] = issue_count
    ret["consumeCount"] = consume_count
    ret["updatedAt"] = updated_at
    ret["revision"] = revision
    return ret