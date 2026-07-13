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
class_name Gs2ProjectUpdateAccountRequest
extends Gs2Request


var email = null
var full_name = null
var company_name = null
var password = null
var account_token = null


func with_email(v) -> Gs2ProjectUpdateAccountRequest:
    email = v
    return self


func with_full_name(v) -> Gs2ProjectUpdateAccountRequest:
    full_name = v
    return self


func with_company_name(v) -> Gs2ProjectUpdateAccountRequest:
    company_name = v
    return self


func with_password(v) -> Gs2ProjectUpdateAccountRequest:
    password = v
    return self


func with_account_token(v) -> Gs2ProjectUpdateAccountRequest:
    account_token = v
    return self


static func from_dict(data) -> Gs2ProjectUpdateAccountRequest:
    if data == null:
        return null
    var ret = Gs2ProjectUpdateAccountRequest.new()
    ret.email = null if data.get("email") == null else str(data.get("email"))
    ret.full_name = null if data.get("fullName") == null else str(data.get("fullName"))
    ret.company_name = null if data.get("companyName") == null else str(data.get("companyName"))
    ret.password = null if data.get("password") == null else str(data.get("password"))
    ret.account_token = null if data.get("accountToken") == null else str(data.get("accountToken"))
    return ret


func to_dict() -> Dictionary:
    var ret = {}
    ret["email"] = email
    ret["fullName"] = full_name
    ret["companyName"] = company_name
    ret["password"] = password
    ret["accountToken"] = account_token
    return ret