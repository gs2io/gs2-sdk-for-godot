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
class_name Gs2AccountAccount
extends RefCounted


var account_id = null
var user_id = null
var password = null
var time_offset = null
var ban_statuses = null
var banned = null
var last_authenticated_at = null
var created_at = null
var revision = null


func with_account_id(v) -> Gs2AccountAccount:
    account_id = v
    return self


func with_user_id(v) -> Gs2AccountAccount:
    user_id = v
    return self


func with_password(v) -> Gs2AccountAccount:
    password = v
    return self


func with_time_offset(v) -> Gs2AccountAccount:
    time_offset = v
    return self


func with_ban_statuses(v) -> Gs2AccountAccount:
    ban_statuses = v
    return self


func with_banned(v) -> Gs2AccountAccount:
    banned = v
    return self


func with_last_authenticated_at(v) -> Gs2AccountAccount:
    last_authenticated_at = v
    return self


func with_created_at(v) -> Gs2AccountAccount:
    created_at = v
    return self


func with_revision(v) -> Gs2AccountAccount:
    revision = v
    return self


static func get_region_from_grn(grn):
    if grn == null:
        return null
    var regex = RegEx.new()
    regex.compile("grn:gs2:(?<region>.+):(?<ownerId>.+):account:(?<namespaceName>.+):account:(?<userId>.+)")
    var matched = regex.search(grn)
    if matched == null:
        return null
    return matched.get_string("region")


static func get_owner_id_from_grn(grn):
    if grn == null:
        return null
    var regex = RegEx.new()
    regex.compile("grn:gs2:(?<region>.+):(?<ownerId>.+):account:(?<namespaceName>.+):account:(?<userId>.+)")
    var matched = regex.search(grn)
    if matched == null:
        return null
    return matched.get_string("ownerId")


static func get_namespace_name_from_grn(grn):
    if grn == null:
        return null
    var regex = RegEx.new()
    regex.compile("grn:gs2:(?<region>.+):(?<ownerId>.+):account:(?<namespaceName>.+):account:(?<userId>.+)")
    var matched = regex.search(grn)
    if matched == null:
        return null
    return matched.get_string("namespaceName")


static func get_user_id_from_grn(grn):
    if grn == null:
        return null
    var regex = RegEx.new()
    regex.compile("grn:gs2:(?<region>.+):(?<ownerId>.+):account:(?<namespaceName>.+):account:(?<userId>.+)")
    var matched = regex.search(grn)
    if matched == null:
        return null
    return matched.get_string("userId")


static func from_dict(data) -> Gs2AccountAccount:
    if data == null:
        return null
    var ret = Gs2AccountAccount.new()
    ret.account_id = null if data.get("accountId") == null else str(data.get("accountId"))
    ret.user_id = null if data.get("userId") == null else str(data.get("userId"))
    ret.password = null if data.get("password") == null else str(data.get("password"))
    ret.time_offset = null if data.get("timeOffset") == null else int(data.get("timeOffset"))
    ret.ban_statuses = null if data.get("banStatuses") == null else data.get("banStatuses").map(func(v): return Gs2AccountBanStatus.from_dict(v))
    ret.banned = null if data.get("banned") == null else bool(data.get("banned"))
    ret.last_authenticated_at = null if data.get("lastAuthenticatedAt") == null else int(data.get("lastAuthenticatedAt"))
    ret.created_at = null if data.get("createdAt") == null else int(data.get("createdAt"))
    ret.revision = null if data.get("revision") == null else int(data.get("revision"))
    return ret


func to_dict() -> Dictionary:
    var ret = {}
    ret["accountId"] = account_id
    ret["userId"] = user_id
    ret["password"] = password
    ret["timeOffset"] = time_offset
    ret["banStatuses"] = null if ban_statuses == null else ban_statuses.map(func(v): return null if v == null else v.to_dict())
    ret["banned"] = banned
    ret["lastAuthenticatedAt"] = last_authenticated_at
    ret["createdAt"] = created_at
    ret["revision"] = revision
    return ret