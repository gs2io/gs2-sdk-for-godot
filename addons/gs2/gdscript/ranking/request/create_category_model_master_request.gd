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
class_name Gs2RankingCreateCategoryModelMasterRequest
extends Gs2Request


var namespace_name = null
var name = null
var description = null
var metadata = null
var minimum_value = null
var maximum_value = null
var order_direction = null
var scope = null
var global_ranking_setting = null
var entry_period_event_id = null
var access_period_event_id = null
var unique_by_user_id = null
var sum = null
var calculate_fixed_timing_hour = null
var calculate_fixed_timing_minute = null
var calculate_interval_minutes = null
var additional_scopes = null
var ignore_user_ids = null
var generation = null


func with_namespace_name(v) -> Gs2RankingCreateCategoryModelMasterRequest:
    namespace_name = v
    return self


func with_name(v) -> Gs2RankingCreateCategoryModelMasterRequest:
    name = v
    return self


func with_description(v) -> Gs2RankingCreateCategoryModelMasterRequest:
    description = v
    return self


func with_metadata(v) -> Gs2RankingCreateCategoryModelMasterRequest:
    metadata = v
    return self


func with_minimum_value(v) -> Gs2RankingCreateCategoryModelMasterRequest:
    minimum_value = v
    return self


func with_maximum_value(v) -> Gs2RankingCreateCategoryModelMasterRequest:
    maximum_value = v
    return self


func with_order_direction(v) -> Gs2RankingCreateCategoryModelMasterRequest:
    order_direction = v
    return self


func with_scope(v) -> Gs2RankingCreateCategoryModelMasterRequest:
    scope = v
    return self


func with_global_ranking_setting(v) -> Gs2RankingCreateCategoryModelMasterRequest:
    global_ranking_setting = v
    return self


func with_entry_period_event_id(v) -> Gs2RankingCreateCategoryModelMasterRequest:
    entry_period_event_id = v
    return self


func with_access_period_event_id(v) -> Gs2RankingCreateCategoryModelMasterRequest:
    access_period_event_id = v
    return self


func with_unique_by_user_id(v) -> Gs2RankingCreateCategoryModelMasterRequest:
    unique_by_user_id = v
    return self


func with_sum(v) -> Gs2RankingCreateCategoryModelMasterRequest:
    sum = v
    return self


func with_calculate_fixed_timing_hour(v) -> Gs2RankingCreateCategoryModelMasterRequest:
    calculate_fixed_timing_hour = v
    return self


func with_calculate_fixed_timing_minute(v) -> Gs2RankingCreateCategoryModelMasterRequest:
    calculate_fixed_timing_minute = v
    return self


func with_calculate_interval_minutes(v) -> Gs2RankingCreateCategoryModelMasterRequest:
    calculate_interval_minutes = v
    return self


func with_additional_scopes(v) -> Gs2RankingCreateCategoryModelMasterRequest:
    additional_scopes = v
    return self


func with_ignore_user_ids(v) -> Gs2RankingCreateCategoryModelMasterRequest:
    ignore_user_ids = v
    return self


func with_generation(v) -> Gs2RankingCreateCategoryModelMasterRequest:
    generation = v
    return self


static func from_dict(data) -> Gs2RankingCreateCategoryModelMasterRequest:
    if data == null:
        return null
    var ret = Gs2RankingCreateCategoryModelMasterRequest.new()
    ret.namespace_name = null if data.get("namespaceName") == null else str(data.get("namespaceName"))
    ret.name = null if data.get("name") == null else str(data.get("name"))
    ret.description = null if data.get("description") == null else str(data.get("description"))
    ret.metadata = null if data.get("metadata") == null else str(data.get("metadata"))
    ret.minimum_value = null if data.get("minimumValue") == null else int(data.get("minimumValue"))
    ret.maximum_value = null if data.get("maximumValue") == null else int(data.get("maximumValue"))
    ret.order_direction = null if data.get("orderDirection") == null else str(data.get("orderDirection"))
    ret.scope = null if data.get("scope") == null else str(data.get("scope"))
    ret.global_ranking_setting = null if data.get("globalRankingSetting") == null else Gs2RankingGlobalRankingSetting.from_dict(data.get("globalRankingSetting"))
    ret.entry_period_event_id = null if data.get("entryPeriodEventId") == null else str(data.get("entryPeriodEventId"))
    ret.access_period_event_id = null if data.get("accessPeriodEventId") == null else str(data.get("accessPeriodEventId"))
    ret.unique_by_user_id = null if data.get("uniqueByUserId") == null else bool(data.get("uniqueByUserId"))
    ret.sum = null if data.get("sum") == null else bool(data.get("sum"))
    ret.calculate_fixed_timing_hour = null if data.get("calculateFixedTimingHour") == null else int(data.get("calculateFixedTimingHour"))
    ret.calculate_fixed_timing_minute = null if data.get("calculateFixedTimingMinute") == null else int(data.get("calculateFixedTimingMinute"))
    ret.calculate_interval_minutes = null if data.get("calculateIntervalMinutes") == null else int(data.get("calculateIntervalMinutes"))
    ret.additional_scopes = null if data.get("additionalScopes") == null else data.get("additionalScopes").map(func(v): return Gs2RankingScope.from_dict(v))
    ret.ignore_user_ids = null if data.get("ignoreUserIds") == null else data.get("ignoreUserIds").map(func(v): return str(v))
    ret.generation = null if data.get("generation") == null else str(data.get("generation"))
    return ret


func to_dict() -> Dictionary:
    var ret = {}
    ret["namespaceName"] = namespace_name
    ret["name"] = name
    ret["description"] = description
    ret["metadata"] = metadata
    ret["minimumValue"] = minimum_value
    ret["maximumValue"] = maximum_value
    ret["orderDirection"] = order_direction
    ret["scope"] = scope
    ret["globalRankingSetting"] = null if global_ranking_setting == null else global_ranking_setting.to_dict()
    ret["entryPeriodEventId"] = entry_period_event_id
    ret["accessPeriodEventId"] = access_period_event_id
    ret["uniqueByUserId"] = unique_by_user_id
    ret["sum"] = sum
    ret["calculateFixedTimingHour"] = calculate_fixed_timing_hour
    ret["calculateFixedTimingMinute"] = calculate_fixed_timing_minute
    ret["calculateIntervalMinutes"] = calculate_interval_minutes
    ret["additionalScopes"] = null if additional_scopes == null else additional_scopes.map(func(v): return null if v == null else v.to_dict())
    ret["ignoreUserIds"] = ignore_user_ids
    ret["generation"] = generation
    return ret