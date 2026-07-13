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
class_name Gs2RankingCalcRankingRequest
extends Gs2Request


var namespace_name = null
var category_name = null
var additional_scope_name = null


func with_namespace_name(v) -> Gs2RankingCalcRankingRequest:
    namespace_name = v
    return self


func with_category_name(v) -> Gs2RankingCalcRankingRequest:
    category_name = v
    return self


func with_additional_scope_name(v) -> Gs2RankingCalcRankingRequest:
    additional_scope_name = v
    return self


static func from_dict(data) -> Gs2RankingCalcRankingRequest:
    if data == null:
        return null
    var ret = Gs2RankingCalcRankingRequest.new()
    ret.namespace_name = null if data.get("namespaceName") == null else str(data.get("namespaceName"))
    ret.category_name = null if data.get("categoryName") == null else str(data.get("categoryName"))
    ret.additional_scope_name = null if data.get("additionalScopeName") == null else str(data.get("additionalScopeName"))
    return ret


func to_dict() -> Dictionary:
    var ret = {}
    ret["namespaceName"] = namespace_name
    ret["categoryName"] = category_name
    ret["additionalScopeName"] = additional_scope_name
    return ret