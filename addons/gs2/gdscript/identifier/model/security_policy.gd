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
class_name Gs2IdentifierSecurityPolicy
extends RefCounted


var security_policy_id = null
var name = null
var description = null
var policy = null
var created_at = null
var updated_at = null


func with_security_policy_id(v) -> Gs2IdentifierSecurityPolicy:
    security_policy_id = v
    return self


func with_name(v) -> Gs2IdentifierSecurityPolicy:
    name = v
    return self


func with_description(v) -> Gs2IdentifierSecurityPolicy:
    description = v
    return self


func with_policy(v) -> Gs2IdentifierSecurityPolicy:
    policy = v
    return self


func with_created_at(v) -> Gs2IdentifierSecurityPolicy:
    created_at = v
    return self


func with_updated_at(v) -> Gs2IdentifierSecurityPolicy:
    updated_at = v
    return self


static func get_owner_id_from_grn(grn):
    if grn == null:
        return null
    var regex = RegEx.new()
    regex.compile("grn:gs2::(?<ownerId>.+):identifier:securityPolicy:(?<securityPolicyName>.+)")
    var matched = regex.search(grn)
    if matched == null:
        return null
    return matched.get_string("ownerId")


static func get_security_policy_name_from_grn(grn):
    if grn == null:
        return null
    var regex = RegEx.new()
    regex.compile("grn:gs2::(?<ownerId>.+):identifier:securityPolicy:(?<securityPolicyName>.+)")
    var matched = regex.search(grn)
    if matched == null:
        return null
    return matched.get_string("securityPolicyName")


static func from_dict(data) -> Gs2IdentifierSecurityPolicy:
    if data == null:
        return null
    var ret = Gs2IdentifierSecurityPolicy.new()
    ret.security_policy_id = null if data.get("securityPolicyId") == null else str(data.get("securityPolicyId"))
    ret.name = null if data.get("name") == null else str(data.get("name"))
    ret.description = null if data.get("description") == null else str(data.get("description"))
    ret.policy = null if data.get("policy") == null else str(data.get("policy"))
    ret.created_at = null if data.get("createdAt") == null else int(data.get("createdAt"))
    ret.updated_at = null if data.get("updatedAt") == null else int(data.get("updatedAt"))
    return ret


func to_dict() -> Dictionary:
    var ret = {}
    ret["securityPolicyId"] = security_policy_id
    ret["name"] = name
    ret["description"] = description
    ret["policy"] = policy
    ret["createdAt"] = created_at
    ret["updatedAt"] = updated_at
    return ret