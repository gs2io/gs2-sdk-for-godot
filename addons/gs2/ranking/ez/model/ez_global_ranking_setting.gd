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
class_name Gs2RankingEzGlobalRankingSetting
extends RefCounted


var calculate_interval_minutes = 0
var additional_scopes = []


func with_calculate_interval_minutes(v) -> Gs2RankingEzGlobalRankingSetting:
    calculate_interval_minutes = v
    return self


func with_additional_scopes(v) -> Gs2RankingEzGlobalRankingSetting:
    additional_scopes = v
    return self


func to_model() -> Gs2RankingGlobalRankingSetting:
    var ret = Gs2RankingGlobalRankingSetting.new()
    ret.calculate_interval_minutes = calculate_interval_minutes
    ret.additional_scopes = null if additional_scopes == null else additional_scopes.map(func(v): return null if v == null else v.to_model())
    return ret


static func from_model(model) -> Gs2RankingEzGlobalRankingSetting:
    var ret = Gs2RankingEzGlobalRankingSetting.new()
    ret.calculate_interval_minutes = 0 if model.calculate_interval_minutes == null else model.calculate_interval_minutes
    ret.additional_scopes = [] if model.additional_scopes == null else model.additional_scopes.map(func(v): return Gs2RankingEzScope.from_model(v))
    return ret