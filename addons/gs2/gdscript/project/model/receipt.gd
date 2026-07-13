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
class_name Gs2ProjectReceipt
extends RefCounted


var receipt_id = null
var account_name = null
var name = null
var date = null
var amount = null
var pdf_url = null
var created_at = null
var updated_at = null


func with_receipt_id(v) -> Gs2ProjectReceipt:
    receipt_id = v
    return self


func with_account_name(v) -> Gs2ProjectReceipt:
    account_name = v
    return self


func with_name(v) -> Gs2ProjectReceipt:
    name = v
    return self


func with_date(v) -> Gs2ProjectReceipt:
    date = v
    return self


func with_amount(v) -> Gs2ProjectReceipt:
    amount = v
    return self


func with_pdf_url(v) -> Gs2ProjectReceipt:
    pdf_url = v
    return self


func with_created_at(v) -> Gs2ProjectReceipt:
    created_at = v
    return self


func with_updated_at(v) -> Gs2ProjectReceipt:
    updated_at = v
    return self


static func get_account_name_from_grn(grn):
    if grn == null:
        return null
    var regex = RegEx.new()
    regex.compile("grn:gs2:::gs2:account:(?<accountName>.+):receipt:(?<receiptName>.+)")
    var matched = regex.search(grn)
    if matched == null:
        return null
    return matched.get_string("accountName")


static func get_receipt_name_from_grn(grn):
    if grn == null:
        return null
    var regex = RegEx.new()
    regex.compile("grn:gs2:::gs2:account:(?<accountName>.+):receipt:(?<receiptName>.+)")
    var matched = regex.search(grn)
    if matched == null:
        return null
    return matched.get_string("receiptName")


static func from_dict(data) -> Gs2ProjectReceipt:
    if data == null:
        return null
    var ret = Gs2ProjectReceipt.new()
    ret.receipt_id = null if data.get("receiptId") == null else str(data.get("receiptId"))
    ret.account_name = null if data.get("accountName") == null else str(data.get("accountName"))
    ret.name = null if data.get("name") == null else str(data.get("name"))
    ret.date = null if data.get("date") == null else int(data.get("date"))
    ret.amount = null if data.get("amount") == null else str(data.get("amount"))
    ret.pdf_url = null if data.get("pdfUrl") == null else str(data.get("pdfUrl"))
    ret.created_at = null if data.get("createdAt") == null else int(data.get("createdAt"))
    ret.updated_at = null if data.get("updatedAt") == null else int(data.get("updatedAt"))
    return ret


func to_dict() -> Dictionary:
    var ret = {}
    ret["receiptId"] = receipt_id
    ret["accountName"] = account_name
    ret["name"] = name
    ret["date"] = date
    ret["amount"] = amount
    ret["pdfUrl"] = pdf_url
    ret["createdAt"] = created_at
    ret["updatedAt"] = updated_at
    return ret