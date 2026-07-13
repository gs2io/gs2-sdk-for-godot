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
class_name Gs2ProjectBilling
extends RefCounted


var billing_id = null
var project_name = null
var year = null
var month = null
var region = null
var service = null
var activity_type = null
var unit = null
var unit_name = null
var price = null
var currency = null
var created_at = null
var updated_at = null


func with_billing_id(v) -> Gs2ProjectBilling:
    billing_id = v
    return self


func with_project_name(v) -> Gs2ProjectBilling:
    project_name = v
    return self


func with_year(v) -> Gs2ProjectBilling:
    year = v
    return self


func with_month(v) -> Gs2ProjectBilling:
    month = v
    return self


func with_region(v) -> Gs2ProjectBilling:
    region = v
    return self


func with_service(v) -> Gs2ProjectBilling:
    service = v
    return self


func with_activity_type(v) -> Gs2ProjectBilling:
    activity_type = v
    return self


func with_unit(v) -> Gs2ProjectBilling:
    unit = v
    return self


func with_unit_name(v) -> Gs2ProjectBilling:
    unit_name = v
    return self


func with_price(v) -> Gs2ProjectBilling:
    price = v
    return self


func with_currency(v) -> Gs2ProjectBilling:
    currency = v
    return self


func with_created_at(v) -> Gs2ProjectBilling:
    created_at = v
    return self


func with_updated_at(v) -> Gs2ProjectBilling:
    updated_at = v
    return self


static func get_account_name_from_grn(grn):
    if grn == null:
        return null
    var regex = RegEx.new()
    regex.compile("grn:gs2:::gs2:account:(?<accountName>.+):project:(?<projectName>.+):billing:(?<year>.+):(?<month>.+)")
    var matched = regex.search(grn)
    if matched == null:
        return null
    return matched.get_string("accountName")


static func get_project_name_from_grn(grn):
    if grn == null:
        return null
    var regex = RegEx.new()
    regex.compile("grn:gs2:::gs2:account:(?<accountName>.+):project:(?<projectName>.+):billing:(?<year>.+):(?<month>.+)")
    var matched = regex.search(grn)
    if matched == null:
        return null
    return matched.get_string("projectName")


static func get_year_from_grn(grn):
    if grn == null:
        return null
    var regex = RegEx.new()
    regex.compile("grn:gs2:::gs2:account:(?<accountName>.+):project:(?<projectName>.+):billing:(?<year>.+):(?<month>.+)")
    var matched = regex.search(grn)
    if matched == null:
        return null
    return matched.get_string("year")


static func get_month_from_grn(grn):
    if grn == null:
        return null
    var regex = RegEx.new()
    regex.compile("grn:gs2:::gs2:account:(?<accountName>.+):project:(?<projectName>.+):billing:(?<year>.+):(?<month>.+)")
    var matched = regex.search(grn)
    if matched == null:
        return null
    return matched.get_string("month")


static func from_dict(data) -> Gs2ProjectBilling:
    if data == null:
        return null
    var ret = Gs2ProjectBilling.new()
    ret.billing_id = null if data.get("billingId") == null else str(data.get("billingId"))
    ret.project_name = null if data.get("projectName") == null else str(data.get("projectName"))
    ret.year = null if data.get("year") == null else int(data.get("year"))
    ret.month = null if data.get("month") == null else int(data.get("month"))
    ret.region = null if data.get("region") == null else str(data.get("region"))
    ret.service = null if data.get("service") == null else str(data.get("service"))
    ret.activity_type = null if data.get("activityType") == null else str(data.get("activityType"))
    ret.unit = null if data.get("unit") == null else float(data.get("unit"))
    ret.unit_name = null if data.get("unitName") == null else str(data.get("unitName"))
    ret.price = null if data.get("price") == null else float(data.get("price"))
    ret.currency = null if data.get("currency") == null else str(data.get("currency"))
    ret.created_at = null if data.get("createdAt") == null else int(data.get("createdAt"))
    ret.updated_at = null if data.get("updatedAt") == null else int(data.get("updatedAt"))
    return ret


func to_dict() -> Dictionary:
    var ret = {}
    ret["billingId"] = billing_id
    ret["projectName"] = project_name
    ret["year"] = year
    ret["month"] = month
    ret["region"] = region
    ret["service"] = service
    ret["activityType"] = activity_type
    ret["unit"] = unit
    ret["unitName"] = unit_name
    ret["price"] = price
    ret["currency"] = currency
    ret["createdAt"] = created_at
    ret["updatedAt"] = updated_at
    return ret