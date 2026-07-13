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
class_name Gs2ShowcaseShowcaseMaster
extends RefCounted


var showcase_id = null
var name = null
var description = null
var metadata = null
var sales_period_event_id = null
var display_items = null
var created_at = null
var updated_at = null
var revision = null


func with_showcase_id(v) -> Gs2ShowcaseShowcaseMaster:
    showcase_id = v
    return self


func with_name(v) -> Gs2ShowcaseShowcaseMaster:
    name = v
    return self


func with_description(v) -> Gs2ShowcaseShowcaseMaster:
    description = v
    return self


func with_metadata(v) -> Gs2ShowcaseShowcaseMaster:
    metadata = v
    return self


func with_sales_period_event_id(v) -> Gs2ShowcaseShowcaseMaster:
    sales_period_event_id = v
    return self


func with_display_items(v) -> Gs2ShowcaseShowcaseMaster:
    display_items = v
    return self


func with_created_at(v) -> Gs2ShowcaseShowcaseMaster:
    created_at = v
    return self


func with_updated_at(v) -> Gs2ShowcaseShowcaseMaster:
    updated_at = v
    return self


func with_revision(v) -> Gs2ShowcaseShowcaseMaster:
    revision = v
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


static func from_dict(data) -> Gs2ShowcaseShowcaseMaster:
    if data == null:
        return null
    var ret = Gs2ShowcaseShowcaseMaster.new()
    ret.showcase_id = null if data.get("showcaseId") == null else str(data.get("showcaseId"))
    ret.name = null if data.get("name") == null else str(data.get("name"))
    ret.description = null if data.get("description") == null else str(data.get("description"))
    ret.metadata = null if data.get("metadata") == null else str(data.get("metadata"))
    ret.sales_period_event_id = null if data.get("salesPeriodEventId") == null else str(data.get("salesPeriodEventId"))
    ret.display_items = null if data.get("displayItems") == null else data.get("displayItems").map(func(v): return Gs2ShowcaseDisplayItemMaster.from_dict(v))
    ret.created_at = null if data.get("createdAt") == null else int(data.get("createdAt"))
    ret.updated_at = null if data.get("updatedAt") == null else int(data.get("updatedAt"))
    ret.revision = null if data.get("revision") == null else int(data.get("revision"))
    return ret


func to_dict() -> Dictionary:
    var ret = {}
    ret["showcaseId"] = showcase_id
    ret["name"] = name
    ret["description"] = description
    ret["metadata"] = metadata
    ret["salesPeriodEventId"] = sales_period_event_id
    ret["displayItems"] = null if display_items == null else display_items.map(func(v): return null if v == null else v.to_dict())
    ret["createdAt"] = created_at
    ret["updatedAt"] = updated_at
    ret["revision"] = revision
    return ret