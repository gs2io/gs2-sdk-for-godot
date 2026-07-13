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
class_name Gs2ChatCategoryModel
extends RefCounted


var category_model_id = null
var category = null
var reject_access_token_post = null


func with_category_model_id(v) -> Gs2ChatCategoryModel:
    category_model_id = v
    return self


func with_category(v) -> Gs2ChatCategoryModel:
    category = v
    return self


func with_reject_access_token_post(v) -> Gs2ChatCategoryModel:
    reject_access_token_post = v
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


static func from_dict(data) -> Gs2ChatCategoryModel:
    if data == null:
        return null
    var ret = Gs2ChatCategoryModel.new()
    ret.category_model_id = null if data.get("categoryModelId") == null else str(data.get("categoryModelId"))
    ret.category = null if data.get("category") == null else int(data.get("category"))
    ret.reject_access_token_post = null if data.get("rejectAccessTokenPost") == null else str(data.get("rejectAccessTokenPost"))
    return ret


func to_dict() -> Dictionary:
    var ret = {}
    ret["categoryModelId"] = category_model_id
    ret["category"] = category
    ret["rejectAccessTokenPost"] = reject_access_token_post
    return ret