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
class_name Gs2Ranking2EzClusterRankingModel
extends RefCounted


var cluster_ranking_model_id = null
var name = null
var metadata = null
var minimum_value = 0
var maximum_value = 0
var sum = false
var order_direction = null
var cluster_type = null
var ranking_rewards = []
var entry_period_event_id = null
var access_period_event_id = null


func with_cluster_ranking_model_id(v) -> Gs2Ranking2EzClusterRankingModel:
    cluster_ranking_model_id = v
    return self


func with_name(v) -> Gs2Ranking2EzClusterRankingModel:
    name = v
    return self


func with_metadata(v) -> Gs2Ranking2EzClusterRankingModel:
    metadata = v
    return self


func with_minimum_value(v) -> Gs2Ranking2EzClusterRankingModel:
    minimum_value = v
    return self


func with_maximum_value(v) -> Gs2Ranking2EzClusterRankingModel:
    maximum_value = v
    return self


func with_sum(v) -> Gs2Ranking2EzClusterRankingModel:
    sum = v
    return self


func with_order_direction(v) -> Gs2Ranking2EzClusterRankingModel:
    order_direction = v
    return self


func with_cluster_type(v) -> Gs2Ranking2EzClusterRankingModel:
    cluster_type = v
    return self


func with_ranking_rewards(v) -> Gs2Ranking2EzClusterRankingModel:
    ranking_rewards = v
    return self


func with_entry_period_event_id(v) -> Gs2Ranking2EzClusterRankingModel:
    entry_period_event_id = v
    return self


func with_access_period_event_id(v) -> Gs2Ranking2EzClusterRankingModel:
    access_period_event_id = v
    return self


func to_model() -> Gs2Ranking2ClusterRankingModel:
    var ret = Gs2Ranking2ClusterRankingModel.new()
    ret.cluster_ranking_model_id = cluster_ranking_model_id
    ret.name = name
    ret.metadata = metadata
    ret.minimum_value = minimum_value
    ret.maximum_value = maximum_value
    ret.sum = sum
    ret.order_direction = order_direction
    ret.cluster_type = cluster_type
    ret.ranking_rewards = null if ranking_rewards == null else ranking_rewards.map(func(v): return null if v == null else v.to_model())
    ret.entry_period_event_id = entry_period_event_id
    ret.access_period_event_id = access_period_event_id
    return ret


static func from_model(model) -> Gs2Ranking2EzClusterRankingModel:
    var ret = Gs2Ranking2EzClusterRankingModel.new()
    ret.cluster_ranking_model_id = model.cluster_ranking_model_id
    ret.name = model.name
    ret.metadata = model.metadata
    ret.minimum_value = 0 if model.minimum_value == null else model.minimum_value
    ret.maximum_value = 0 if model.maximum_value == null else model.maximum_value
    ret.sum = false if model.sum == null else model.sum
    ret.order_direction = model.order_direction
    ret.cluster_type = model.cluster_type
    ret.ranking_rewards = [] if model.ranking_rewards == null else model.ranking_rewards.map(func(v): return Gs2Ranking2EzRankingReward.from_model(v))
    ret.entry_period_event_id = model.entry_period_event_id
    ret.access_period_event_id = model.access_period_event_id
    return ret