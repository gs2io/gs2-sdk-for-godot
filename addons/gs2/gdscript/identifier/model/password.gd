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
class_name Gs2IdentifierPassword
extends RefCounted


var password_id = null
var user_id = null
var user_name = null
var enable_two_factor_authentication = null
var two_factor_authentication_setting = null
var created_at = null
var revision = null


func with_password_id(v) -> Gs2IdentifierPassword:
    password_id = v
    return self


func with_user_id(v) -> Gs2IdentifierPassword:
    user_id = v
    return self


func with_user_name(v) -> Gs2IdentifierPassword:
    user_name = v
    return self


func with_enable_two_factor_authentication(v) -> Gs2IdentifierPassword:
    enable_two_factor_authentication = v
    return self


func with_two_factor_authentication_setting(v) -> Gs2IdentifierPassword:
    two_factor_authentication_setting = v
    return self


func with_created_at(v) -> Gs2IdentifierPassword:
    created_at = v
    return self


func with_revision(v) -> Gs2IdentifierPassword:
    revision = v
    return self


static func get_owner_id_from_grn(grn):
    if grn == null:
        return null
    var regex = RegEx.new()
    regex.compile("grn:gs2::(?<ownerId>.+):identifier:user:(?<userName>.+)")
    var matched = regex.search(grn)
    if matched == null:
        return null
    return matched.get_string("ownerId")


static func get_user_name_from_grn(grn):
    if grn == null:
        return null
    var regex = RegEx.new()
    regex.compile("grn:gs2::(?<ownerId>.+):identifier:user:(?<userName>.+)")
    var matched = regex.search(grn)
    if matched == null:
        return null
    return matched.get_string("userName")


static func from_dict(data) -> Gs2IdentifierPassword:
    if data == null:
        return null
    var ret = Gs2IdentifierPassword.new()
    ret.password_id = null if data.get("passwordId") == null else str(data.get("passwordId"))
    ret.user_id = null if data.get("userId") == null else str(data.get("userId"))
    ret.user_name = null if data.get("userName") == null else str(data.get("userName"))
    ret.enable_two_factor_authentication = null if data.get("enableTwoFactorAuthentication") == null else str(data.get("enableTwoFactorAuthentication"))
    ret.two_factor_authentication_setting = null if data.get("twoFactorAuthenticationSetting") == null else Gs2IdentifierTwoFactorAuthenticationSetting.from_dict(data.get("twoFactorAuthenticationSetting"))
    ret.created_at = null if data.get("createdAt") == null else int(data.get("createdAt"))
    ret.revision = null if data.get("revision") == null else int(data.get("revision"))
    return ret


func to_dict() -> Dictionary:
    var ret = {}
    ret["passwordId"] = password_id
    ret["userId"] = user_id
    ret["userName"] = user_name
    ret["enableTwoFactorAuthentication"] = enable_two_factor_authentication
    ret["twoFactorAuthenticationSetting"] = null if two_factor_authentication_setting == null else two_factor_authentication_setting.to_dict()
    ret["createdAt"] = created_at
    ret["revision"] = revision
    return ret