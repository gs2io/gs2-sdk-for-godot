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
class_name Gs2RankingEzCategoryModel
extends RefCounted


var name = null
var metadata = null
var scope = null
var global_ranking_setting = null
var entry_period_event_id = null
var access_period_event_id = null


func with_name(v) -> Gs2RankingEzCategoryModel:
    name = v
    return self


func with_metadata(v) -> Gs2RankingEzCategoryModel:
    metadata = v
    return self


func with_scope(v) -> Gs2RankingEzCategoryModel:
    scope = v
    return self


func with_global_ranking_setting(v) -> Gs2RankingEzCategoryModel:
    global_ranking_setting = v
    return self


func with_entry_period_event_id(v) -> Gs2RankingEzCategoryModel:
    entry_period_event_id = v
    return self


func with_access_period_event_id(v) -> Gs2RankingEzCategoryModel:
    access_period_event_id = v
    return self


func to_model() -> Gs2RankingCategoryModel:
    var ret = Gs2RankingCategoryModel.new()
    ret.name = name
    ret.metadata = metadata
    ret.scope = scope
    ret.global_ranking_setting = null if global_ranking_setting == null else global_ranking_setting.to_model()
    ret.entry_period_event_id = entry_period_event_id
    ret.access_period_event_id = access_period_event_id
    return ret


static func from_model(model) -> Gs2RankingEzCategoryModel:
    var ret = Gs2RankingEzCategoryModel.new()
    ret.name = model.name
    ret.metadata = model.metadata
    ret.scope = model.scope
    ret.global_ranking_setting = null if model.global_ranking_setting == null else Gs2RankingEzGlobalRankingSetting.from_model(model.global_ranking_setting)
    ret.entry_period_event_id = model.entry_period_event_id
    ret.access_period_event_id = model.access_period_event_id
    return ret