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
class_name Gs2KeyGitHubApiKey
extends RefCounted


var api_key_id = null
var name = null
var description = null
var api_key = null
var encryption_key_name = null
var created_at = null
var updated_at = null
var revision = null


func with_api_key_id(v) -> Gs2KeyGitHubApiKey:
    api_key_id = v
    return self


func with_name(v) -> Gs2KeyGitHubApiKey:
    name = v
    return self


func with_description(v) -> Gs2KeyGitHubApiKey:
    description = v
    return self


func with_api_key(v) -> Gs2KeyGitHubApiKey:
    api_key = v
    return self


func with_encryption_key_name(v) -> Gs2KeyGitHubApiKey:
    encryption_key_name = v
    return self


func with_created_at(v) -> Gs2KeyGitHubApiKey:
    created_at = v
    return self


func with_updated_at(v) -> Gs2KeyGitHubApiKey:
    updated_at = v
    return self


func with_revision(v) -> Gs2KeyGitHubApiKey:
    revision = v
    return self


static func get_region_from_grn(grn):
    if grn == null:
        return null
    var regex = RegEx.new()
    regex.compile("grn:gs2:(?<region>.+):(?<ownerId>.+):key:(?<namespaceName>.+):github:(?<apiKeyName>.+)")
    var matched = regex.search(grn)
    if matched == null:
        return null
    return matched.get_string("region")


static func get_owner_id_from_grn(grn):
    if grn == null:
        return null
    var regex = RegEx.new()
    regex.compile("grn:gs2:(?<region>.+):(?<ownerId>.+):key:(?<namespaceName>.+):github:(?<apiKeyName>.+)")
    var matched = regex.search(grn)
    if matched == null:
        return null
    return matched.get_string("ownerId")


static func get_namespace_name_from_grn(grn):
    if grn == null:
        return null
    var regex = RegEx.new()
    regex.compile("grn:gs2:(?<region>.+):(?<ownerId>.+):key:(?<namespaceName>.+):github:(?<apiKeyName>.+)")
    var matched = regex.search(grn)
    if matched == null:
        return null
    return matched.get_string("namespaceName")


static func get_api_key_name_from_grn(grn):
    if grn == null:
        return null
    var regex = RegEx.new()
    regex.compile("grn:gs2:(?<region>.+):(?<ownerId>.+):key:(?<namespaceName>.+):github:(?<apiKeyName>.+)")
    var matched = regex.search(grn)
    if matched == null:
        return null
    return matched.get_string("apiKeyName")


static func from_dict(data) -> Gs2KeyGitHubApiKey:
    if data == null:
        return null
    var ret = Gs2KeyGitHubApiKey.new()
    ret.api_key_id = null if data.get("apiKeyId") == null else str(data.get("apiKeyId"))
    ret.name = null if data.get("name") == null else str(data.get("name"))
    ret.description = null if data.get("description") == null else str(data.get("description"))
    ret.api_key = null if data.get("apiKey") == null else str(data.get("apiKey"))
    ret.encryption_key_name = null if data.get("encryptionKeyName") == null else str(data.get("encryptionKeyName"))
    ret.created_at = null if data.get("createdAt") == null else int(data.get("createdAt"))
    ret.updated_at = null if data.get("updatedAt") == null else int(data.get("updatedAt"))
    ret.revision = null if data.get("revision") == null else int(data.get("revision"))
    return ret


func to_dict() -> Dictionary:
    var ret = {}
    ret["apiKeyId"] = api_key_id
    ret["name"] = name
    ret["description"] = description
    ret["apiKey"] = api_key
    ret["encryptionKeyName"] = encryption_key_name
    ret["createdAt"] = created_at
    ret["updatedAt"] = updated_at
    ret["revision"] = revision
    return ret