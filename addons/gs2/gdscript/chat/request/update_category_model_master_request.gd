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
class_name Gs2ChatUpdateCategoryModelMasterRequest
extends Gs2Request


var namespace_name = null
var category = null
var description = null
var reject_access_token_post = null


func with_namespace_name(v) -> Gs2ChatUpdateCategoryModelMasterRequest:
    namespace_name = v
    return self


func with_category(v) -> Gs2ChatUpdateCategoryModelMasterRequest:
    category = v
    return self


func with_description(v) -> Gs2ChatUpdateCategoryModelMasterRequest:
    description = v
    return self


func with_reject_access_token_post(v) -> Gs2ChatUpdateCategoryModelMasterRequest:
    reject_access_token_post = v
    return self


static func from_dict(data) -> Gs2ChatUpdateCategoryModelMasterRequest:
    if data == null:
        return null
    var ret = Gs2ChatUpdateCategoryModelMasterRequest.new()
    ret.namespace_name = null if data.get("namespaceName") == null else str(data.get("namespaceName"))
    ret.category = null if data.get("category") == null else int(data.get("category"))
    ret.description = null if data.get("description") == null else str(data.get("description"))
    ret.reject_access_token_post = null if data.get("rejectAccessTokenPost") == null else str(data.get("rejectAccessTokenPost"))
    return ret


func to_dict() -> Dictionary:
    var ret = {}
    ret["namespaceName"] = namespace_name
    ret["category"] = category
    ret["description"] = description
    ret["rejectAccessTokenPost"] = reject_access_token_post
    return ret