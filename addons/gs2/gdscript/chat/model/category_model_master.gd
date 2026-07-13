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
class_name Gs2ChatCategoryModelMaster
extends RefCounted


var category_model_id = null
var category = null
var description = null
var reject_access_token_post = null
var created_at = null
var updated_at = null
var revision = null


func with_category_model_id(v) -> Gs2ChatCategoryModelMaster:
    category_model_id = v
    return self


func with_category(v) -> Gs2ChatCategoryModelMaster:
    category = v
    return self


func with_description(v) -> Gs2ChatCategoryModelMaster:
    description = v
    return self


func with_reject_access_token_post(v) -> Gs2ChatCategoryModelMaster:
    reject_access_token_post = v
    return self


func with_created_at(v) -> Gs2ChatCategoryModelMaster:
    created_at = v
    return self


func with_updated_at(v) -> Gs2ChatCategoryModelMaster:
    updated_at = v
    return self


func with_revision(v) -> Gs2ChatCategoryModelMaster:
    revision = v
    return self


static func get_region_from_grn(grn):
    if grn == null:
        return null
    var regex = RegEx.new()
    regex.compile("grn:gs2:(?<region>.+):(?<ownerId>.+):chat:(?<namespaceName>.+):model:(?<category>.+)")
    var matched = regex.search(grn)
    if matched == null:
        return null
    return matched.get_string("region")


static func get_owner_id_from_grn(grn):
    if grn == null:
        return null
    var regex = RegEx.new()
    regex.compile("grn:gs2:(?<region>.+):(?<ownerId>.+):chat:(?<namespaceName>.+):model:(?<category>.+)")
    var matched = regex.search(grn)
    if matched == null:
        return null
    return matched.get_string("ownerId")


static func get_namespace_name_from_grn(grn):
    if grn == null:
        return null
    var regex = RegEx.new()
    regex.compile("grn:gs2:(?<region>.+):(?<ownerId>.+):chat:(?<namespaceName>.+):model:(?<category>.+)")
    var matched = regex.search(grn)
    if matched == null:
        return null
    return matched.get_string("namespaceName")


static func get_category_from_grn(grn):
    if grn == null:
        return null
    var regex = RegEx.new()
    regex.compile("grn:gs2:(?<region>.+):(?<ownerId>.+):chat:(?<namespaceName>.+):model:(?<category>.+)")
    var matched = regex.search(grn)
    if matched == null:
        return null
    return matched.get_string("category")


static func from_dict(data) -> Gs2ChatCategoryModelMaster:
    if data == null:
        return null
    var ret = Gs2ChatCategoryModelMaster.new()
    ret.category_model_id = null if data.get("categoryModelId") == null else str(data.get("categoryModelId"))
    ret.category = null if data.get("category") == null else int(data.get("category"))
    ret.description = null if data.get("description") == null else str(data.get("description"))
    ret.reject_access_token_post = null if data.get("rejectAccessTokenPost") == null else str(data.get("rejectAccessTokenPost"))
    ret.created_at = null if data.get("createdAt") == null else int(data.get("createdAt"))
    ret.updated_at = null if data.get("updatedAt") == null else int(data.get("updatedAt"))
    ret.revision = null if data.get("revision") == null else int(data.get("revision"))
    return ret


func to_dict() -> Dictionary:
    var ret = {}
    ret["categoryModelId"] = category_model_id
    ret["category"] = category
    ret["description"] = description
    ret["rejectAccessTokenPost"] = reject_access_token_post
    ret["createdAt"] = created_at
    ret["updatedAt"] = updated_at
    ret["revision"] = revision
    return ret