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
class_name Gs2IdentifierAttachSecurityPolicy
extends RefCounted


var user_id = null
var security_policy_ids = null
var attached_at = null
var revision = null


func with_user_id(v) -> Gs2IdentifierAttachSecurityPolicy:
    user_id = v
    return self


func with_security_policy_ids(v) -> Gs2IdentifierAttachSecurityPolicy:
    security_policy_ids = v
    return self


func with_attached_at(v) -> Gs2IdentifierAttachSecurityPolicy:
    attached_at = v
    return self


func with_revision(v) -> Gs2IdentifierAttachSecurityPolicy:
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


static func from_dict(data) -> Gs2IdentifierAttachSecurityPolicy:
    if data == null:
        return null
    var ret = Gs2IdentifierAttachSecurityPolicy.new()
    ret.user_id = null if data.get("userId") == null else str(data.get("userId"))
    ret.security_policy_ids = null if data.get("securityPolicyIds") == null else data.get("securityPolicyIds").map(func(v): return str(v))
    ret.attached_at = null if data.get("attachedAt") == null else int(data.get("attachedAt"))
    ret.revision = null if data.get("revision") == null else int(data.get("revision"))
    return ret


func to_dict() -> Dictionary:
    var ret = {}
    ret["userId"] = user_id
    ret["securityPolicyIds"] = security_policy_ids
    ret["attachedAt"] = attached_at
    ret["revision"] = revision
    return ret