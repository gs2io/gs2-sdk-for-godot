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
class_name Gs2ShowcaseCreateShowcaseMasterRequest
extends Gs2Request


var namespace_name = null
var name = null
var description = null
var metadata = null
var display_items = null
var sales_period_event_id = null


func with_namespace_name(v) -> Gs2ShowcaseCreateShowcaseMasterRequest:
    namespace_name = v
    return self


func with_name(v) -> Gs2ShowcaseCreateShowcaseMasterRequest:
    name = v
    return self


func with_description(v) -> Gs2ShowcaseCreateShowcaseMasterRequest:
    description = v
    return self


func with_metadata(v) -> Gs2ShowcaseCreateShowcaseMasterRequest:
    metadata = v
    return self


func with_display_items(v) -> Gs2ShowcaseCreateShowcaseMasterRequest:
    display_items = v
    return self


func with_sales_period_event_id(v) -> Gs2ShowcaseCreateShowcaseMasterRequest:
    sales_period_event_id = v
    return self


static func from_dict(data) -> Gs2ShowcaseCreateShowcaseMasterRequest:
    if data == null:
        return null
    var ret = Gs2ShowcaseCreateShowcaseMasterRequest.new()
    ret.namespace_name = null if data.get("namespaceName") == null else str(data.get("namespaceName"))
    ret.name = null if data.get("name") == null else str(data.get("name"))
    ret.description = null if data.get("description") == null else str(data.get("description"))
    ret.metadata = null if data.get("metadata") == null else str(data.get("metadata"))
    ret.display_items = null if data.get("displayItems") == null else data.get("displayItems").map(func(v): return Gs2ShowcaseDisplayItemMaster.from_dict(v))
    ret.sales_period_event_id = null if data.get("salesPeriodEventId") == null else str(data.get("salesPeriodEventId"))
    return ret


func to_dict() -> Dictionary:
    var ret = {}
    ret["namespaceName"] = namespace_name
    ret["name"] = name
    ret["description"] = description
    ret["metadata"] = metadata
    ret["displayItems"] = null if display_items == null else display_items.map(func(v): return null if v == null else v.to_dict())
    ret["salesPeriodEventId"] = sales_period_event_id
    return ret