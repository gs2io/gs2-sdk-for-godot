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
class_name Gs2ProjectBillingMethod
extends RefCounted


var billing_method_id = null
var account_name = null
var name = null
var description = null
var method_type = null
var card_signature_name = null
var card_brand = null
var card_last4 = null
var partner_id = null
var created_at = null
var updated_at = null


func with_billing_method_id(v) -> Gs2ProjectBillingMethod:
    billing_method_id = v
    return self


func with_account_name(v) -> Gs2ProjectBillingMethod:
    account_name = v
    return self


func with_name(v) -> Gs2ProjectBillingMethod:
    name = v
    return self


func with_description(v) -> Gs2ProjectBillingMethod:
    description = v
    return self


func with_method_type(v) -> Gs2ProjectBillingMethod:
    method_type = v
    return self


func with_card_signature_name(v) -> Gs2ProjectBillingMethod:
    card_signature_name = v
    return self


func with_card_brand(v) -> Gs2ProjectBillingMethod:
    card_brand = v
    return self


func with_card_last4(v) -> Gs2ProjectBillingMethod:
    card_last4 = v
    return self


func with_partner_id(v) -> Gs2ProjectBillingMethod:
    partner_id = v
    return self


func with_created_at(v) -> Gs2ProjectBillingMethod:
    created_at = v
    return self


func with_updated_at(v) -> Gs2ProjectBillingMethod:
    updated_at = v
    return self


static func get_account_name_from_grn(grn):
    if grn == null:
        return null
    var regex = RegEx.new()
    regex.compile("grn:gs2:::gs2:account:(?<accountName>.+):billingMethod:(?<billingMethodName>.+)")
    var matched = regex.search(grn)
    if matched == null:
        return null
    return matched.get_string("accountName")


static func get_billing_method_name_from_grn(grn):
    if grn == null:
        return null
    var regex = RegEx.new()
    regex.compile("grn:gs2:::gs2:account:(?<accountName>.+):billingMethod:(?<billingMethodName>.+)")
    var matched = regex.search(grn)
    if matched == null:
        return null
    return matched.get_string("billingMethodName")


static func from_dict(data) -> Gs2ProjectBillingMethod:
    if data == null:
        return null
    var ret = Gs2ProjectBillingMethod.new()
    ret.billing_method_id = null if data.get("billingMethodId") == null else str(data.get("billingMethodId"))
    ret.account_name = null if data.get("accountName") == null else str(data.get("accountName"))
    ret.name = null if data.get("name") == null else str(data.get("name"))
    ret.description = null if data.get("description") == null else str(data.get("description"))
    ret.method_type = null if data.get("methodType") == null else str(data.get("methodType"))
    ret.card_signature_name = null if data.get("cardSignatureName") == null else str(data.get("cardSignatureName"))
    ret.card_brand = null if data.get("cardBrand") == null else str(data.get("cardBrand"))
    ret.card_last4 = null if data.get("cardLast4") == null else str(data.get("cardLast4"))
    ret.partner_id = null if data.get("partnerId") == null else str(data.get("partnerId"))
    ret.created_at = null if data.get("createdAt") == null else int(data.get("createdAt"))
    ret.updated_at = null if data.get("updatedAt") == null else int(data.get("updatedAt"))
    return ret


func to_dict() -> Dictionary:
    var ret = {}
    ret["billingMethodId"] = billing_method_id
    ret["accountName"] = account_name
    ret["name"] = name
    ret["description"] = description
    ret["methodType"] = method_type
    ret["cardSignatureName"] = card_signature_name
    ret["cardBrand"] = card_brand
    ret["cardLast4"] = card_last4
    ret["partnerId"] = partner_id
    ret["createdAt"] = created_at
    ret["updatedAt"] = updated_at
    return ret