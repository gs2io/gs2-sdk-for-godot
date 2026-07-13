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
class_name Gs2AccountPlatformId
extends RefCounted


var platform_id = null
var user_id = null
var type = null
var user_identifier = null
var created_at = null
var revision = null


func with_platform_id(v) -> Gs2AccountPlatformId:
    platform_id = v
    return self


func with_user_id(v) -> Gs2AccountPlatformId:
    user_id = v
    return self


func with_type(v) -> Gs2AccountPlatformId:
    type = v
    return self


func with_user_identifier(v) -> Gs2AccountPlatformId:
    user_identifier = v
    return self


func with_created_at(v) -> Gs2AccountPlatformId:
    created_at = v
    return self


func with_revision(v) -> Gs2AccountPlatformId:
    revision = v
    return self


static func get_region_from_grn(grn):
    if grn == null:
        return null
    var regex = RegEx.new()
    regex.compile("grn:gs2:(?<region>.+):(?<ownerId>.+):account:(?<namespaceName>.+):platformId:(?<type>.+):(?<userIdentifier>.+)")
    var matched = regex.search(grn)
    if matched == null:
        return null
    return matched.get_string("region")


static func get_owner_id_from_grn(grn):
    if grn == null:
        return null
    var regex = RegEx.new()
    regex.compile("grn:gs2:(?<region>.+):(?<ownerId>.+):account:(?<namespaceName>.+):platformId:(?<type>.+):(?<userIdentifier>.+)")
    var matched = regex.search(grn)
    if matched == null:
        return null
    return matched.get_string("ownerId")


static func get_namespace_name_from_grn(grn):
    if grn == null:
        return null
    var regex = RegEx.new()
    regex.compile("grn:gs2:(?<region>.+):(?<ownerId>.+):account:(?<namespaceName>.+):platformId:(?<type>.+):(?<userIdentifier>.+)")
    var matched = regex.search(grn)
    if matched == null:
        return null
    return matched.get_string("namespaceName")


static func get_type_from_grn(grn):
    if grn == null:
        return null
    var regex = RegEx.new()
    regex.compile("grn:gs2:(?<region>.+):(?<ownerId>.+):account:(?<namespaceName>.+):platformId:(?<type>.+):(?<userIdentifier>.+)")
    var matched = regex.search(grn)
    if matched == null:
        return null
    return matched.get_string("type")


static func get_user_identifier_from_grn(grn):
    if grn == null:
        return null
    var regex = RegEx.new()
    regex.compile("grn:gs2:(?<region>.+):(?<ownerId>.+):account:(?<namespaceName>.+):platformId:(?<type>.+):(?<userIdentifier>.+)")
    var matched = regex.search(grn)
    if matched == null:
        return null
    return matched.get_string("userIdentifier")


static func from_dict(data) -> Gs2AccountPlatformId:
    if data == null:
        return null
    var ret = Gs2AccountPlatformId.new()
    ret.platform_id = null if data.get("platformId") == null else str(data.get("platformId"))
    ret.user_id = null if data.get("userId") == null else str(data.get("userId"))
    ret.type = null if data.get("type") == null else int(data.get("type"))
    ret.user_identifier = null if data.get("userIdentifier") == null else str(data.get("userIdentifier"))
    ret.created_at = null if data.get("createdAt") == null else int(data.get("createdAt"))
    ret.revision = null if data.get("revision") == null else int(data.get("revision"))
    return ret


func to_dict() -> Dictionary:
    var ret = {}
    ret["platformId"] = platform_id
    ret["userId"] = user_id
    ret["type"] = type
    ret["userIdentifier"] = user_identifier
    ret["createdAt"] = created_at
    ret["revision"] = revision
    return ret