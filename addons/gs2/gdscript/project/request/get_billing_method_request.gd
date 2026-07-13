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
class_name Gs2ProjectGetBillingMethodRequest
extends Gs2Request


var account_token = null
var billing_method_name = null


func with_account_token(v) -> Gs2ProjectGetBillingMethodRequest:
    account_token = v
    return self


func with_billing_method_name(v) -> Gs2ProjectGetBillingMethodRequest:
    billing_method_name = v
    return self


static func from_dict(data) -> Gs2ProjectGetBillingMethodRequest:
    if data == null:
        return null
    var ret = Gs2ProjectGetBillingMethodRequest.new()
    ret.account_token = null if data.get("accountToken") == null else str(data.get("accountToken"))
    ret.billing_method_name = null if data.get("billingMethodName") == null else str(data.get("billingMethodName"))
    return ret


func to_dict() -> Dictionary:
    var ret = {}
    ret["accountToken"] = account_token
    ret["billingMethodName"] = billing_method_name
    return ret