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
class_name Gs2ProjectCreateBillingMethodRequest
extends Gs2Request


var account_token = null
var description = null
var method_type = null
var card_customer_id = null
var partner_id = null


func with_account_token(v) -> Gs2ProjectCreateBillingMethodRequest:
    account_token = v
    return self


func with_description(v) -> Gs2ProjectCreateBillingMethodRequest:
    description = v
    return self


func with_method_type(v) -> Gs2ProjectCreateBillingMethodRequest:
    method_type = v
    return self


func with_card_customer_id(v) -> Gs2ProjectCreateBillingMethodRequest:
    card_customer_id = v
    return self


func with_partner_id(v) -> Gs2ProjectCreateBillingMethodRequest:
    partner_id = v
    return self


static func from_dict(data) -> Gs2ProjectCreateBillingMethodRequest:
    if data == null:
        return null
    var ret = Gs2ProjectCreateBillingMethodRequest.new()
    ret.account_token = null if data.get("accountToken") == null else str(data.get("accountToken"))
    ret.description = null if data.get("description") == null else str(data.get("description"))
    ret.method_type = null if data.get("methodType") == null else str(data.get("methodType"))
    ret.card_customer_id = null if data.get("cardCustomerId") == null else str(data.get("cardCustomerId"))
    ret.partner_id = null if data.get("partnerId") == null else str(data.get("partnerId"))
    return ret


func to_dict() -> Dictionary:
    var ret = {}
    ret["accountToken"] = account_token
    ret["description"] = description
    ret["methodType"] = method_type
    ret["cardCustomerId"] = card_customer_id
    ret["partnerId"] = partner_id
    return ret