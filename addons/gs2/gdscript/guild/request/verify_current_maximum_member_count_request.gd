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
class_name Gs2GuildVerifyCurrentMaximumMemberCountRequest
extends Gs2Request


var namespace_name = null
var guild_model_name = null
var access_token = null
var verify_type = null
var value = null
var multiply_value_specifying_quantity = null
var duplication_avoider = null


func with_namespace_name(v) -> Gs2GuildVerifyCurrentMaximumMemberCountRequest:
    namespace_name = v
    return self


func with_guild_model_name(v) -> Gs2GuildVerifyCurrentMaximumMemberCountRequest:
    guild_model_name = v
    return self


func with_access_token(v) -> Gs2GuildVerifyCurrentMaximumMemberCountRequest:
    access_token = v
    return self


func with_verify_type(v) -> Gs2GuildVerifyCurrentMaximumMemberCountRequest:
    verify_type = v
    return self


func with_value(v) -> Gs2GuildVerifyCurrentMaximumMemberCountRequest:
    value = v
    return self


func with_multiply_value_specifying_quantity(v) -> Gs2GuildVerifyCurrentMaximumMemberCountRequest:
    multiply_value_specifying_quantity = v
    return self


func with_duplication_avoider(v) -> Gs2GuildVerifyCurrentMaximumMemberCountRequest:
    duplication_avoider = v
    return self


static func from_dict(data) -> Gs2GuildVerifyCurrentMaximumMemberCountRequest:
    if data == null:
        return null
    var ret = Gs2GuildVerifyCurrentMaximumMemberCountRequest.new()
    ret.namespace_name = null if data.get("namespaceName") == null else str(data.get("namespaceName"))
    ret.guild_model_name = null if data.get("guildModelName") == null else str(data.get("guildModelName"))
    ret.access_token = null if data.get("accessToken") == null else str(data.get("accessToken"))
    ret.verify_type = null if data.get("verifyType") == null else str(data.get("verifyType"))
    ret.value = null if data.get("value") == null else int(data.get("value"))
    ret.multiply_value_specifying_quantity = null if data.get("multiplyValueSpecifyingQuantity") == null else bool(data.get("multiplyValueSpecifyingQuantity"))
    return ret


func to_dict() -> Dictionary:
    var ret = {}
    ret["namespaceName"] = namespace_name
    ret["guildModelName"] = guild_model_name
    ret["accessToken"] = access_token
    ret["verifyType"] = verify_type
    ret["value"] = value
    ret["multiplyValueSpecifyingQuantity"] = multiply_value_specifying_quantity
    return ret