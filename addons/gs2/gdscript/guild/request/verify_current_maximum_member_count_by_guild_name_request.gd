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
class_name Gs2GuildVerifyCurrentMaximumMemberCountByGuildNameRequest
extends Gs2Request


var namespace_name = null
var guild_model_name = null
var guild_name = null
var verify_type = null
var value = null
var multiply_value_specifying_quantity = null
var duplication_avoider = null


func with_namespace_name(v) -> Gs2GuildVerifyCurrentMaximumMemberCountByGuildNameRequest:
    namespace_name = v
    return self


func with_guild_model_name(v) -> Gs2GuildVerifyCurrentMaximumMemberCountByGuildNameRequest:
    guild_model_name = v
    return self


func with_guild_name(v) -> Gs2GuildVerifyCurrentMaximumMemberCountByGuildNameRequest:
    guild_name = v
    return self


func with_verify_type(v) -> Gs2GuildVerifyCurrentMaximumMemberCountByGuildNameRequest:
    verify_type = v
    return self


func with_value(v) -> Gs2GuildVerifyCurrentMaximumMemberCountByGuildNameRequest:
    value = v
    return self


func with_multiply_value_specifying_quantity(v) -> Gs2GuildVerifyCurrentMaximumMemberCountByGuildNameRequest:
    multiply_value_specifying_quantity = v
    return self


func with_duplication_avoider(v) -> Gs2GuildVerifyCurrentMaximumMemberCountByGuildNameRequest:
    duplication_avoider = v
    return self


static func from_dict(data) -> Gs2GuildVerifyCurrentMaximumMemberCountByGuildNameRequest:
    if data == null:
        return null
    var ret = Gs2GuildVerifyCurrentMaximumMemberCountByGuildNameRequest.new()
    ret.namespace_name = null if data.get("namespaceName") == null else str(data.get("namespaceName"))
    ret.guild_model_name = null if data.get("guildModelName") == null else str(data.get("guildModelName"))
    ret.guild_name = null if data.get("guildName") == null else str(data.get("guildName"))
    ret.verify_type = null if data.get("verifyType") == null else str(data.get("verifyType"))
    ret.value = null if data.get("value") == null else int(data.get("value"))
    ret.multiply_value_specifying_quantity = null if data.get("multiplyValueSpecifyingQuantity") == null else bool(data.get("multiplyValueSpecifyingQuantity"))
    return ret


func to_dict() -> Dictionary:
    var ret = {}
    ret["namespaceName"] = namespace_name
    ret["guildModelName"] = guild_model_name
    ret["guildName"] = guild_name
    ret["verifyType"] = verify_type
    ret["value"] = value
    ret["multiplyValueSpecifyingQuantity"] = multiply_value_specifying_quantity
    return ret