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
class_name Gs2RankingGlobalRankingSetting
extends RefCounted


var unique_by_user_id = null
var calculate_interval_minutes = null
var calculate_fixed_timing = null
var additional_scopes = null
var ignore_user_ids = null
var generation = null


func with_unique_by_user_id(v) -> Gs2RankingGlobalRankingSetting:
    unique_by_user_id = v
    return self


func with_calculate_interval_minutes(v) -> Gs2RankingGlobalRankingSetting:
    calculate_interval_minutes = v
    return self


func with_calculate_fixed_timing(v) -> Gs2RankingGlobalRankingSetting:
    calculate_fixed_timing = v
    return self


func with_additional_scopes(v) -> Gs2RankingGlobalRankingSetting:
    additional_scopes = v
    return self


func with_ignore_user_ids(v) -> Gs2RankingGlobalRankingSetting:
    ignore_user_ids = v
    return self


func with_generation(v) -> Gs2RankingGlobalRankingSetting:
    generation = v
    return self


static func from_dict(data) -> Gs2RankingGlobalRankingSetting:
    if data == null:
        return null
    var ret = Gs2RankingGlobalRankingSetting.new()
    ret.unique_by_user_id = null if data.get("uniqueByUserId") == null else bool(data.get("uniqueByUserId"))
    ret.calculate_interval_minutes = null if data.get("calculateIntervalMinutes") == null else int(data.get("calculateIntervalMinutes"))
    ret.calculate_fixed_timing = null if data.get("calculateFixedTiming") == null else Gs2RankingFixedTiming.from_dict(data.get("calculateFixedTiming"))
    ret.additional_scopes = null if data.get("additionalScopes") == null else data.get("additionalScopes").map(func(v): return Gs2RankingScope.from_dict(v))
    ret.ignore_user_ids = null if data.get("ignoreUserIds") == null else data.get("ignoreUserIds").map(func(v): return str(v))
    ret.generation = null if data.get("generation") == null else str(data.get("generation"))
    return ret


func to_dict() -> Dictionary:
    var ret = {}
    ret["uniqueByUserId"] = unique_by_user_id
    ret["calculateIntervalMinutes"] = calculate_interval_minutes
    ret["calculateFixedTiming"] = null if calculate_fixed_timing == null else calculate_fixed_timing.to_dict()
    ret["additionalScopes"] = null if additional_scopes == null else additional_scopes.map(func(v): return null if v == null else v.to_dict())
    ret["ignoreUserIds"] = ignore_user_ids
    ret["generation"] = generation
    return ret