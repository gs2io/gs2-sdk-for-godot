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
class_name Gs2ShowcaseShowcase
extends RefCounted


var showcase_id = null
var name = null
var metadata = null
var sales_period_event_id = null
var display_items = null


func with_showcase_id(v) -> Gs2ShowcaseShowcase:
    showcase_id = v
    return self


func with_name(v) -> Gs2ShowcaseShowcase:
    name = v
    return self


func with_metadata(v) -> Gs2ShowcaseShowcase:
    metadata = v
    return self


func with_sales_period_event_id(v) -> Gs2ShowcaseShowcase:
    sales_period_event_id = v
    return self


func with_display_items(v) -> Gs2ShowcaseShowcase:
    display_items = v
    return self


static func get_region_from_grn(grn):
    if grn == null:
        return null
    var regex = RegEx.new()
    regex.compile("grn:gs2:(?<region>.+):(?<ownerId>.+):showcase:(?<namespaceName>.+):showcase:(?<showcaseName>.+)")
    var matched = regex.search(grn)
    if matched == null:
        return null
    return matched.get_string("region")


static func get_owner_id_from_grn(grn):
    if grn == null:
        return null
    var regex = RegEx.new()
    regex.compile("grn:gs2:(?<region>.+):(?<ownerId>.+):showcase:(?<namespaceName>.+):showcase:(?<showcaseName>.+)")
    var matched = regex.search(grn)
    if matched == null:
        return null
    return matched.get_string("ownerId")


static func get_namespace_name_from_grn(grn):
    if grn == null:
        return null
    var regex = RegEx.new()
    regex.compile("grn:gs2:(?<region>.+):(?<ownerId>.+):showcase:(?<namespaceName>.+):showcase:(?<showcaseName>.+)")
    var matched = regex.search(grn)
    if matched == null:
        return null
    return matched.get_string("namespaceName")


static func get_showcase_name_from_grn(grn):
    if grn == null:
        return null
    var regex = RegEx.new()
    regex.compile("grn:gs2:(?<region>.+):(?<ownerId>.+):showcase:(?<namespaceName>.+):showcase:(?<showcaseName>.+)")
    var matched = regex.search(grn)
    if matched == null:
        return null
    return matched.get_string("showcaseName")


static func from_dict(data) -> Gs2ShowcaseShowcase:
    if data == null:
        return null
    var ret = Gs2ShowcaseShowcase.new()
    ret.showcase_id = null if data.get("showcaseId") == null else str(data.get("showcaseId"))
    ret.name = null if data.get("name") == null else str(data.get("name"))
    ret.metadata = null if data.get("metadata") == null else str(data.get("metadata"))
    ret.sales_period_event_id = null if data.get("salesPeriodEventId") == null else str(data.get("salesPeriodEventId"))
    ret.display_items = null if data.get("displayItems") == null else data.get("displayItems").map(func(v): return Gs2ShowcaseDisplayItem.from_dict(v))
    return ret


func to_dict() -> Dictionary:
    var ret = {}
    ret["showcaseId"] = showcase_id
    ret["name"] = name
    ret["metadata"] = metadata
    ret["salesPeriodEventId"] = sales_period_event_id
    ret["displayItems"] = null if display_items == null else display_items.map(func(v): return null if v == null else v.to_dict())
    return ret