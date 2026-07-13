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
class_name Gs2Ranking2GlobalRankingModel
extends RefCounted


var global_ranking_model_id = null
var name = null
var metadata = null
var minimum_value = null
var maximum_value = null
var sum = null
var order_direction = null
var entry_period_event_id = null
var ranking_rewards = null
var access_period_event_id = null
var reward_calculation_index = null


func with_global_ranking_model_id(v) -> Gs2Ranking2GlobalRankingModel:
    global_ranking_model_id = v
    return self


func with_name(v) -> Gs2Ranking2GlobalRankingModel:
    name = v
    return self


func with_metadata(v) -> Gs2Ranking2GlobalRankingModel:
    metadata = v
    return self


func with_minimum_value(v) -> Gs2Ranking2GlobalRankingModel:
    minimum_value = v
    return self


func with_maximum_value(v) -> Gs2Ranking2GlobalRankingModel:
    maximum_value = v
    return self


func with_sum(v) -> Gs2Ranking2GlobalRankingModel:
    sum = v
    return self


func with_order_direction(v) -> Gs2Ranking2GlobalRankingModel:
    order_direction = v
    return self


func with_entry_period_event_id(v) -> Gs2Ranking2GlobalRankingModel:
    entry_period_event_id = v
    return self


func with_ranking_rewards(v) -> Gs2Ranking2GlobalRankingModel:
    ranking_rewards = v
    return self


func with_access_period_event_id(v) -> Gs2Ranking2GlobalRankingModel:
    access_period_event_id = v
    return self


func with_reward_calculation_index(v) -> Gs2Ranking2GlobalRankingModel:
    reward_calculation_index = v
    return self


static func get_region_from_grn(grn):
    if grn == null:
        return null
    var regex = RegEx.new()
    regex.compile("grn:gs2:(?<region>.+):(?<ownerId>.+):ranking2:(?<namespaceName>.+):global:(?<rankingName>.+)")
    var matched = regex.search(grn)
    if matched == null:
        return null
    return matched.get_string("region")


static func get_owner_id_from_grn(grn):
    if grn == null:
        return null
    var regex = RegEx.new()
    regex.compile("grn:gs2:(?<region>.+):(?<ownerId>.+):ranking2:(?<namespaceName>.+):global:(?<rankingName>.+)")
    var matched = regex.search(grn)
    if matched == null:
        return null
    return matched.get_string("ownerId")


static func get_namespace_name_from_grn(grn):
    if grn == null:
        return null
    var regex = RegEx.new()
    regex.compile("grn:gs2:(?<region>.+):(?<ownerId>.+):ranking2:(?<namespaceName>.+):global:(?<rankingName>.+)")
    var matched = regex.search(grn)
    if matched == null:
        return null
    return matched.get_string("namespaceName")


static func get_ranking_name_from_grn(grn):
    if grn == null:
        return null
    var regex = RegEx.new()
    regex.compile("grn:gs2:(?<region>.+):(?<ownerId>.+):ranking2:(?<namespaceName>.+):global:(?<rankingName>.+)")
    var matched = regex.search(grn)
    if matched == null:
        return null
    return matched.get_string("rankingName")


static func from_dict(data) -> Gs2Ranking2GlobalRankingModel:
    if data == null:
        return null
    var ret = Gs2Ranking2GlobalRankingModel.new()
    ret.global_ranking_model_id = null if data.get("globalRankingModelId") == null else str(data.get("globalRankingModelId"))
    ret.name = null if data.get("name") == null else str(data.get("name"))
    ret.metadata = null if data.get("metadata") == null else str(data.get("metadata"))
    ret.minimum_value = null if data.get("minimumValue") == null else int(data.get("minimumValue"))
    ret.maximum_value = null if data.get("maximumValue") == null else int(data.get("maximumValue"))
    ret.sum = null if data.get("sum") == null else bool(data.get("sum"))
    ret.order_direction = null if data.get("orderDirection") == null else str(data.get("orderDirection"))
    ret.entry_period_event_id = null if data.get("entryPeriodEventId") == null else str(data.get("entryPeriodEventId"))
    ret.ranking_rewards = null if data.get("rankingRewards") == null else data.get("rankingRewards").map(func(v): return Gs2Ranking2RankingReward.from_dict(v))
    ret.access_period_event_id = null if data.get("accessPeriodEventId") == null else str(data.get("accessPeriodEventId"))
    ret.reward_calculation_index = null if data.get("rewardCalculationIndex") == null else str(data.get("rewardCalculationIndex"))
    return ret


func to_dict() -> Dictionary:
    var ret = {}
    ret["globalRankingModelId"] = global_ranking_model_id
    ret["name"] = name
    ret["metadata"] = metadata
    ret["minimumValue"] = minimum_value
    ret["maximumValue"] = maximum_value
    ret["sum"] = sum
    ret["orderDirection"] = order_direction
    ret["entryPeriodEventId"] = entry_period_event_id
    ret["rankingRewards"] = null if ranking_rewards == null else ranking_rewards.map(func(v): return null if v == null else v.to_dict())
    ret["accessPeriodEventId"] = access_period_event_id
    ret["rewardCalculationIndex"] = reward_calculation_index
    return ret