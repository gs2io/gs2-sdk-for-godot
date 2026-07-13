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
class_name Gs2SeasonRatingGameResult
extends RefCounted


var rank = null
var user_id = null


func with_rank(v) -> Gs2SeasonRatingGameResult:
    rank = v
    return self


func with_user_id(v) -> Gs2SeasonRatingGameResult:
    user_id = v
    return self


static func from_dict(data) -> Gs2SeasonRatingGameResult:
    if data == null:
        return null
    var ret = Gs2SeasonRatingGameResult.new()
    ret.rank = null if data.get("rank") == null else int(data.get("rank"))
    ret.user_id = null if data.get("userId") == null else str(data.get("userId"))
    return ret


func to_dict() -> Dictionary:
    var ret = {}
    ret["rank"] = rank
    ret["userId"] = user_id
    return ret