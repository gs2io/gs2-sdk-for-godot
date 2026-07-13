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
class_name Gs2RankingCategoryModelMaster
extends RefCounted


var category_model_id = null
var name = null
var description = null
var metadata = null
var minimum_value = null
var maximum_value = null
var sum = null
var order_direction = null
var scope = null
var global_ranking_setting = null
var entry_period_event_id = null
var access_period_event_id = null
var unique_by_user_id = null
var calculate_fixed_timing_hour = null
var calculate_fixed_timing_minute = null
var calculate_interval_minutes = null
var additional_scopes = null
var ignore_user_ids = null
var generation = null
var created_at = null
var updated_at = null
var revision = null


func with_category_model_id(v) -> Gs2RankingCategoryModelMaster:
    category_model_id = v
    return self


func with_name(v) -> Gs2RankingCategoryModelMaster:
    name = v
    return self


func with_description(v) -> Gs2RankingCategoryModelMaster:
    description = v
    return self


func with_metadata(v) -> Gs2RankingCategoryModelMaster:
    metadata = v
    return self


func with_minimum_value(v) -> Gs2RankingCategoryModelMaster:
    minimum_value = v
    return self


func with_maximum_value(v) -> Gs2RankingCategoryModelMaster:
    maximum_value = v
    return self


func with_sum(v) -> Gs2RankingCategoryModelMaster:
    sum = v
    return self


func with_order_direction(v) -> Gs2RankingCategoryModelMaster:
    order_direction = v
    return self


func with_scope(v) -> Gs2RankingCategoryModelMaster:
    scope = v
    return self


func with_global_ranking_setting(v) -> Gs2RankingCategoryModelMaster:
    global_ranking_setting = v
    return self


func with_entry_period_event_id(v) -> Gs2RankingCategoryModelMaster:
    entry_period_event_id = v
    return self


func with_access_period_event_id(v) -> Gs2RankingCategoryModelMaster:
    access_period_event_id = v
    return self


func with_unique_by_user_id(v) -> Gs2RankingCategoryModelMaster:
    unique_by_user_id = v
    return self


func with_calculate_fixed_timing_hour(v) -> Gs2RankingCategoryModelMaster:
    calculate_fixed_timing_hour = v
    return self


func with_calculate_fixed_timing_minute(v) -> Gs2RankingCategoryModelMaster:
    calculate_fixed_timing_minute = v
    return self


func with_calculate_interval_minutes(v) -> Gs2RankingCategoryModelMaster:
    calculate_interval_minutes = v
    return self


func with_additional_scopes(v) -> Gs2RankingCategoryModelMaster:
    additional_scopes = v
    return self


func with_ignore_user_ids(v) -> Gs2RankingCategoryModelMaster:
    ignore_user_ids = v
    return self


func with_generation(v) -> Gs2RankingCategoryModelMaster:
    generation = v
    return self


func with_created_at(v) -> Gs2RankingCategoryModelMaster:
    created_at = v
    return self


func with_updated_at(v) -> Gs2RankingCategoryModelMaster:
    updated_at = v
    return self


func with_revision(v) -> Gs2RankingCategoryModelMaster:
    revision = v
    return self


static func get_region_from_grn(grn):
    if grn == null:
        return null
    var regex = RegEx.new()
    regex.compile("grn:gs2:(?<region>.+):(?<ownerId>.+):ranking:(?<namespaceName>.+):categoryModelMaster:(?<categoryName>.+)")
    var matched = regex.search(grn)
    if matched == null:
        return null
    return matched.get_string("region")


static func get_owner_id_from_grn(grn):
    if grn == null:
        return null
    var regex = RegEx.new()
    regex.compile("grn:gs2:(?<region>.+):(?<ownerId>.+):ranking:(?<namespaceName>.+):categoryModelMaster:(?<categoryName>.+)")
    var matched = regex.search(grn)
    if matched == null:
        return null
    return matched.get_string("ownerId")


static func get_namespace_name_from_grn(grn):
    if grn == null:
        return null
    var regex = RegEx.new()
    regex.compile("grn:gs2:(?<region>.+):(?<ownerId>.+):ranking:(?<namespaceName>.+):categoryModelMaster:(?<categoryName>.+)")
    var matched = regex.search(grn)
    if matched == null:
        return null
    return matched.get_string("namespaceName")


static func get_category_name_from_grn(grn):
    if grn == null:
        return null
    var regex = RegEx.new()
    regex.compile("grn:gs2:(?<region>.+):(?<ownerId>.+):ranking:(?<namespaceName>.+):categoryModelMaster:(?<categoryName>.+)")
    var matched = regex.search(grn)
    if matched == null:
        return null
    return matched.get_string("categoryName")


static func from_dict(data) -> Gs2RankingCategoryModelMaster:
    if data == null:
        return null
    var ret = Gs2RankingCategoryModelMaster.new()
    ret.category_model_id = null if data.get("categoryModelId") == null else str(data.get("categoryModelId"))
    ret.name = null if data.get("name") == null else str(data.get("name"))
    ret.description = null if data.get("description") == null else str(data.get("description"))
    ret.metadata = null if data.get("metadata") == null else str(data.get("metadata"))
    ret.minimum_value = null if data.get("minimumValue") == null else int(data.get("minimumValue"))
    ret.maximum_value = null if data.get("maximumValue") == null else int(data.get("maximumValue"))
    ret.sum = null if data.get("sum") == null else bool(data.get("sum"))
    ret.order_direction = null if data.get("orderDirection") == null else str(data.get("orderDirection"))
    ret.scope = null if data.get("scope") == null else str(data.get("scope"))
    ret.global_ranking_setting = null if data.get("globalRankingSetting") == null else Gs2RankingGlobalRankingSetting.from_dict(data.get("globalRankingSetting"))
    ret.entry_period_event_id = null if data.get("entryPeriodEventId") == null else str(data.get("entryPeriodEventId"))
    ret.access_period_event_id = null if data.get("accessPeriodEventId") == null else str(data.get("accessPeriodEventId"))
    ret.unique_by_user_id = null if data.get("uniqueByUserId") == null else bool(data.get("uniqueByUserId"))
    ret.calculate_fixed_timing_hour = null if data.get("calculateFixedTimingHour") == null else int(data.get("calculateFixedTimingHour"))
    ret.calculate_fixed_timing_minute = null if data.get("calculateFixedTimingMinute") == null else int(data.get("calculateFixedTimingMinute"))
    ret.calculate_interval_minutes = null if data.get("calculateIntervalMinutes") == null else int(data.get("calculateIntervalMinutes"))
    ret.additional_scopes = null if data.get("additionalScopes") == null else data.get("additionalScopes").map(func(v): return Gs2RankingScope.from_dict(v))
    ret.ignore_user_ids = null if data.get("ignoreUserIds") == null else data.get("ignoreUserIds").map(func(v): return str(v))
    ret.generation = null if data.get("generation") == null else str(data.get("generation"))
    ret.created_at = null if data.get("createdAt") == null else int(data.get("createdAt"))
    ret.updated_at = null if data.get("updatedAt") == null else int(data.get("updatedAt"))
    ret.revision = null if data.get("revision") == null else int(data.get("revision"))
    return ret


func to_dict() -> Dictionary:
    var ret = {}
    ret["categoryModelId"] = category_model_id
    ret["name"] = name
    ret["description"] = description
    ret["metadata"] = metadata
    ret["minimumValue"] = minimum_value
    ret["maximumValue"] = maximum_value
    ret["sum"] = sum
    ret["orderDirection"] = order_direction
    ret["scope"] = scope
    ret["globalRankingSetting"] = null if global_ranking_setting == null else global_ranking_setting.to_dict()
    ret["entryPeriodEventId"] = entry_period_event_id
    ret["accessPeriodEventId"] = access_period_event_id
    ret["uniqueByUserId"] = unique_by_user_id
    ret["calculateFixedTimingHour"] = calculate_fixed_timing_hour
    ret["calculateFixedTimingMinute"] = calculate_fixed_timing_minute
    ret["calculateIntervalMinutes"] = calculate_interval_minutes
    ret["additionalScopes"] = null if additional_scopes == null else additional_scopes.map(func(v): return null if v == null else v.to_dict())
    ret["ignoreUserIds"] = ignore_user_ids
    ret["generation"] = generation
    ret["createdAt"] = created_at
    ret["updatedAt"] = updated_at
    ret["revision"] = revision
    return ret