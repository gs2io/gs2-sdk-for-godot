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
class_name Gs2ProjectAccount
extends RefCounted


var account_id = null
var name = null
var email = null
var full_name = null
var company_name = null
var enable_two_factor_authentication = null
var two_factor_authentication_setting = null
var status = null
var created_at = null
var updated_at = null


func with_account_id(v) -> Gs2ProjectAccount:
    account_id = v
    return self


func with_name(v) -> Gs2ProjectAccount:
    name = v
    return self


func with_email(v) -> Gs2ProjectAccount:
    email = v
    return self


func with_full_name(v) -> Gs2ProjectAccount:
    full_name = v
    return self


func with_company_name(v) -> Gs2ProjectAccount:
    company_name = v
    return self


func with_enable_two_factor_authentication(v) -> Gs2ProjectAccount:
    enable_two_factor_authentication = v
    return self


func with_two_factor_authentication_setting(v) -> Gs2ProjectAccount:
    two_factor_authentication_setting = v
    return self


func with_status(v) -> Gs2ProjectAccount:
    status = v
    return self


func with_created_at(v) -> Gs2ProjectAccount:
    created_at = v
    return self


func with_updated_at(v) -> Gs2ProjectAccount:
    updated_at = v
    return self


static func get_account_name_from_grn(grn):
    if grn == null:
        return null
    var regex = RegEx.new()
    regex.compile("grn:gs2:::gs2:account:(?<accountName>.+)")
    var matched = regex.search(grn)
    if matched == null:
        return null
    return matched.get_string("accountName")


static func from_dict(data) -> Gs2ProjectAccount:
    if data == null:
        return null
    var ret = Gs2ProjectAccount.new()
    ret.account_id = null if data.get("accountId") == null else str(data.get("accountId"))
    ret.name = null if data.get("name") == null else str(data.get("name"))
    ret.email = null if data.get("email") == null else str(data.get("email"))
    ret.full_name = null if data.get("fullName") == null else str(data.get("fullName"))
    ret.company_name = null if data.get("companyName") == null else str(data.get("companyName"))
    ret.enable_two_factor_authentication = null if data.get("enableTwoFactorAuthentication") == null else str(data.get("enableTwoFactorAuthentication"))
    ret.two_factor_authentication_setting = null if data.get("twoFactorAuthenticationSetting") == null else Gs2ProjectTwoFactorAuthenticationSetting.from_dict(data.get("twoFactorAuthenticationSetting"))
    ret.status = null if data.get("status") == null else str(data.get("status"))
    ret.created_at = null if data.get("createdAt") == null else int(data.get("createdAt"))
    ret.updated_at = null if data.get("updatedAt") == null else int(data.get("updatedAt"))
    return ret


func to_dict() -> Dictionary:
    var ret = {}
    ret["accountId"] = account_id
    ret["name"] = name
    ret["email"] = email
    ret["fullName"] = full_name
    ret["companyName"] = company_name
    ret["enableTwoFactorAuthentication"] = enable_two_factor_authentication
    ret["twoFactorAuthenticationSetting"] = null if two_factor_authentication_setting == null else two_factor_authentication_setting.to_dict()
    ret["status"] = status
    ret["createdAt"] = created_at
    ret["updatedAt"] = updated_at
    return ret