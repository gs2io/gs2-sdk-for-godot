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
class_name Gs2ChatEzCategoryModel
extends RefCounted


var category = 0
var reject_access_token_post = null


func with_category(v) -> Gs2ChatEzCategoryModel:
    category = v
    return self


func with_reject_access_token_post(v) -> Gs2ChatEzCategoryModel:
    reject_access_token_post = v
    return self


func to_model() -> Gs2ChatCategoryModel:
    var ret = Gs2ChatCategoryModel.new()
    ret.category = category
    ret.reject_access_token_post = reject_access_token_post
    return ret


static func from_model(model) -> Gs2ChatEzCategoryModel:
    var ret = Gs2ChatEzCategoryModel.new()
    ret.category = 0 if model.category == null else model.category
    ret.reject_access_token_post = model.reject_access_token_post
    return ret