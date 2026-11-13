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
class_name Gs2AccountTakeOver
extends RefCounted


var take_over_id = null
var user_id = null
var type = null
var user_identifier = null
var password = null
var created_at = null
var expires_at = null
var failed_attempts = null
var revision = null


func with_take_over_id(v) -> Gs2AccountTakeOver:
    take_over_id = v
    return self


func with_user_id(v) -> Gs2AccountTakeOver:
    user_id = v
    return self


func with_type(v) -> Gs2AccountTakeOver:
    type = v
    return self


func with_user_identifier(v) -> Gs2AccountTakeOver:
    user_identifier = v
    return self


func with_password(v) -> Gs2AccountTakeOver:
    password = v
    return self


func with_created_at(v) -> Gs2AccountTakeOver:
    created_at = v
    return self


func with_expires_at(v) -> Gs2AccountTakeOver:
    expires_at = v
    return self


func with_failed_attempts(v) -> Gs2AccountTakeOver:
    failed_attempts = v
    return self


func with_revision(v) -> Gs2AccountTakeOver:
    revision = v
    return self


static func get_region_from_grn(grn):
    if grn == null:
        return null
    var regex = RegEx.new()
    regex.compile("grn:gs2:(?<region>.+):(?<ownerId>.+):account:(?<namespaceName>.+):takeOver:(?<type>.+):(?<userIdentifier>.+)")
    var matched = regex.search(grn)
    if matched == null:
        return null
    return matched.get_string("region")


static func get_owner_id_from_grn(grn):
    if grn == null:
        return null
    var regex = RegEx.new()
    regex.compile("grn:gs2:(?<region>.+):(?<ownerId>.+):account:(?<namespaceName>.+):takeOver:(?<type>.+):(?<userIdentifier>.+)")
    var matched = regex.search(grn)
    if matched == null:
        return null
    return matched.get_string("ownerId")


static func get_namespace_name_from_grn(grn):
    if grn == null:
        return null
    var regex = RegEx.new()
    regex.compile("grn:gs2:(?<region>.+):(?<ownerId>.+):account:(?<namespaceName>.+):takeOver:(?<type>.+):(?<userIdentifier>.+)")
    var matched = regex.search(grn)
    if matched == null:
        return null
    return matched.get_string("namespaceName")


static func get_type_from_grn(grn):
    if grn == null:
        return null
    var regex = RegEx.new()
    regex.compile("grn:gs2:(?<region>.+):(?<ownerId>.+):account:(?<namespaceName>.+):takeOver:(?<type>.+):(?<userIdentifier>.+)")
    var matched = regex.search(grn)
    if matched == null:
        return null
    return matched.get_string("type")


static func get_user_identifier_from_grn(grn):
    if grn == null:
        return null
    var regex = RegEx.new()
    regex.compile("grn:gs2:(?<region>.+):(?<ownerId>.+):account:(?<namespaceName>.+):takeOver:(?<type>.+):(?<userIdentifier>.+)")
    var matched = regex.search(grn)
    if matched == null:
        return null
    return matched.get_string("userIdentifier")


static func from_dict(data) -> Gs2AccountTakeOver:
    if data == null:
        return null
    var ret = Gs2AccountTakeOver.new()
    ret.take_over_id = null if data.get("takeOverId") == null else str(data.get("takeOverId"))
    ret.user_id = null if data.get("userId") == null else str(data.get("userId"))
    ret.type = null if data.get("type") == null else int(data.get("type"))
    ret.user_identifier = null if data.get("userIdentifier") == null else str(data.get("userIdentifier"))
    ret.password = null if data.get("password") == null else str(data.get("password"))
    ret.created_at = null if data.get("createdAt") == null else int(data.get("createdAt"))
    ret.expires_at = null if data.get("expiresAt") == null else int(data.get("expiresAt"))
    ret.failed_attempts = null if data.get("failedAttempts") == null else int(data.get("failedAttempts"))
    ret.revision = null if data.get("revision") == null else int(data.get("revision"))
    return ret


func to_dict() -> Dictionary:
    var ret = {}
    ret["takeOverId"] = take_over_id
    ret["userId"] = user_id
    ret["type"] = type
    ret["userIdentifier"] = user_identifier
    ret["password"] = password
    ret["createdAt"] = created_at
    ret["expiresAt"] = expires_at
    ret["failedAttempts"] = failed_attempts
    ret["revision"] = revision
    return ret