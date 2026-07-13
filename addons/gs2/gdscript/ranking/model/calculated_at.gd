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
class_name Gs2RankingCalculatedAt
extends RefCounted


var category_name = null
var calculated_at = null


func with_category_name(v) -> Gs2RankingCalculatedAt:
    category_name = v
    return self


func with_calculated_at(v) -> Gs2RankingCalculatedAt:
    calculated_at = v
    return self


static func from_dict(data) -> Gs2RankingCalculatedAt:
    if data == null:
        return null
    var ret = Gs2RankingCalculatedAt.new()
    ret.category_name = null if data.get("categoryName") == null else str(data.get("categoryName"))
    ret.calculated_at = null if data.get("calculatedAt") == null else int(data.get("calculatedAt"))
    return ret


func to_dict() -> Dictionary:
    var ret = {}
    ret["categoryName"] = category_name
    ret["calculatedAt"] = calculated_at
    return ret