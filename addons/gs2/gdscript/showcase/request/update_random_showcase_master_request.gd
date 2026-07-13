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
class_name Gs2ShowcaseUpdateRandomShowcaseMasterRequest
extends Gs2Request


var namespace_name = null
var showcase_name = null
var description = null
var metadata = null
var maximum_number_of_choice = null
var display_items = null
var base_timestamp = null
var reset_interval_hours = null
var sales_period_event_id = null


func with_namespace_name(v) -> Gs2ShowcaseUpdateRandomShowcaseMasterRequest:
    namespace_name = v
    return self


func with_showcase_name(v) -> Gs2ShowcaseUpdateRandomShowcaseMasterRequest:
    showcase_name = v
    return self


func with_description(v) -> Gs2ShowcaseUpdateRandomShowcaseMasterRequest:
    description = v
    return self


func with_metadata(v) -> Gs2ShowcaseUpdateRandomShowcaseMasterRequest:
    metadata = v
    return self


func with_maximum_number_of_choice(v) -> Gs2ShowcaseUpdateRandomShowcaseMasterRequest:
    maximum_number_of_choice = v
    return self


func with_display_items(v) -> Gs2ShowcaseUpdateRandomShowcaseMasterRequest:
    display_items = v
    return self


func with_base_timestamp(v) -> Gs2ShowcaseUpdateRandomShowcaseMasterRequest:
    base_timestamp = v
    return self


func with_reset_interval_hours(v) -> Gs2ShowcaseUpdateRandomShowcaseMasterRequest:
    reset_interval_hours = v
    return self


func with_sales_period_event_id(v) -> Gs2ShowcaseUpdateRandomShowcaseMasterRequest:
    sales_period_event_id = v
    return self


static func from_dict(data) -> Gs2ShowcaseUpdateRandomShowcaseMasterRequest:
    if data == null:
        return null
    var ret = Gs2ShowcaseUpdateRandomShowcaseMasterRequest.new()
    ret.namespace_name = null if data.get("namespaceName") == null else str(data.get("namespaceName"))
    ret.showcase_name = null if data.get("showcaseName") == null else str(data.get("showcaseName"))
    ret.description = null if data.get("description") == null else str(data.get("description"))
    ret.metadata = null if data.get("metadata") == null else str(data.get("metadata"))
    ret.maximum_number_of_choice = null if data.get("maximumNumberOfChoice") == null else int(data.get("maximumNumberOfChoice"))
    ret.display_items = null if data.get("displayItems") == null else data.get("displayItems").map(func(v): return Gs2ShowcaseRandomDisplayItemModel.from_dict(v))
    ret.base_timestamp = null if data.get("baseTimestamp") == null else int(data.get("baseTimestamp"))
    ret.reset_interval_hours = null if data.get("resetIntervalHours") == null else int(data.get("resetIntervalHours"))
    ret.sales_period_event_id = null if data.get("salesPeriodEventId") == null else str(data.get("salesPeriodEventId"))
    return ret


func to_dict() -> Dictionary:
    var ret = {}
    ret["namespaceName"] = namespace_name
    ret["showcaseName"] = showcase_name
    ret["description"] = description
    ret["metadata"] = metadata
    ret["maximumNumberOfChoice"] = maximum_number_of_choice
    ret["displayItems"] = null if display_items == null else display_items.map(func(v): return null if v == null else v.to_dict())
    ret["baseTimestamp"] = base_timestamp
    ret["resetIntervalHours"] = reset_interval_hours
    ret["salesPeriodEventId"] = sales_period_event_id
    return ret