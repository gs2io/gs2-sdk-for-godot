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
class_name Gs2ShowcaseRandomShowcase
extends RefCounted


var random_showcase_id = null
var name = null
var metadata = null
var maximum_number_of_choice = null
var display_items = null
var base_timestamp = null
var reset_interval_hours = null
var sales_period_event_id = null


func with_random_showcase_id(v) -> Gs2ShowcaseRandomShowcase:
    random_showcase_id = v
    return self


func with_name(v) -> Gs2ShowcaseRandomShowcase:
    name = v
    return self


func with_metadata(v) -> Gs2ShowcaseRandomShowcase:
    metadata = v
    return self


func with_maximum_number_of_choice(v) -> Gs2ShowcaseRandomShowcase:
    maximum_number_of_choice = v
    return self


func with_display_items(v) -> Gs2ShowcaseRandomShowcase:
    display_items = v
    return self


func with_base_timestamp(v) -> Gs2ShowcaseRandomShowcase:
    base_timestamp = v
    return self


func with_reset_interval_hours(v) -> Gs2ShowcaseRandomShowcase:
    reset_interval_hours = v
    return self


func with_sales_period_event_id(v) -> Gs2ShowcaseRandomShowcase:
    sales_period_event_id = v
    return self


static func get_region_from_grn(grn):
    if grn == null:
        return null
    var regex = RegEx.new()
    regex.compile("grn:gs2:(?<region>.+):(?<ownerId>.+):showcase:(?<namespaceName>.+):random:showcase:(?<showcaseName>.+)")
    var matched = regex.search(grn)
    if matched == null:
        return null
    return matched.get_string("region")


static func get_owner_id_from_grn(grn):
    if grn == null:
        return null
    var regex = RegEx.new()
    regex.compile("grn:gs2:(?<region>.+):(?<ownerId>.+):showcase:(?<namespaceName>.+):random:showcase:(?<showcaseName>.+)")
    var matched = regex.search(grn)
    if matched == null:
        return null
    return matched.get_string("ownerId")


static func get_namespace_name_from_grn(grn):
    if grn == null:
        return null
    var regex = RegEx.new()
    regex.compile("grn:gs2:(?<region>.+):(?<ownerId>.+):showcase:(?<namespaceName>.+):random:showcase:(?<showcaseName>.+)")
    var matched = regex.search(grn)
    if matched == null:
        return null
    return matched.get_string("namespaceName")


static func get_showcase_name_from_grn(grn):
    if grn == null:
        return null
    var regex = RegEx.new()
    regex.compile("grn:gs2:(?<region>.+):(?<ownerId>.+):showcase:(?<namespaceName>.+):random:showcase:(?<showcaseName>.+)")
    var matched = regex.search(grn)
    if matched == null:
        return null
    return matched.get_string("showcaseName")


static func from_dict(data) -> Gs2ShowcaseRandomShowcase:
    if data == null:
        return null
    var ret = Gs2ShowcaseRandomShowcase.new()
    ret.random_showcase_id = null if data.get("randomShowcaseId") == null else str(data.get("randomShowcaseId"))
    ret.name = null if data.get("name") == null else str(data.get("name"))
    ret.metadata = null if data.get("metadata") == null else str(data.get("metadata"))
    ret.maximum_number_of_choice = null if data.get("maximumNumberOfChoice") == null else int(data.get("maximumNumberOfChoice"))
    ret.display_items = null if data.get("displayItems") == null else data.get("displayItems").map(func(v): return Gs2ShowcaseRandomDisplayItemModel.from_dict(v))
    ret.base_timestamp = null if data.get("baseTimestamp") == null else int(data.get("baseTimestamp"))
    ret.reset_interval_hours = null if data.get("resetIntervalHours") == null else int(data.get("resetIntervalHours"))
    ret.sales_period_event_id = null if data.get("salesPeriodEventId") == null else str(data.get("salesPeriodEventId"))
    return ret


func to_dict() -> Dictionary:
    var ret = {}
    ret["randomShowcaseId"] = random_showcase_id
    ret["name"] = name
    ret["metadata"] = metadata
    ret["maximumNumberOfChoice"] = maximum_number_of_choice
    ret["displayItems"] = null if display_items == null else display_items.map(func(v): return null if v == null else v.to_dict())
    ret["baseTimestamp"] = base_timestamp
    ret["resetIntervalHours"] = reset_interval_hours
    ret["salesPeriodEventId"] = sales_period_event_id
    return ret