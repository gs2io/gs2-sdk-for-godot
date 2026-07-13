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
class_name Gs2ShowcaseDisplayItem
extends RefCounted


var display_item_id = null
var type = null
var sales_item = null
var sales_item_group = null
var sales_period_event_id = null


func with_display_item_id(v) -> Gs2ShowcaseDisplayItem:
    display_item_id = v
    return self


func with_type(v) -> Gs2ShowcaseDisplayItem:
    type = v
    return self


func with_sales_item(v) -> Gs2ShowcaseDisplayItem:
    sales_item = v
    return self


func with_sales_item_group(v) -> Gs2ShowcaseDisplayItem:
    sales_item_group = v
    return self


func with_sales_period_event_id(v) -> Gs2ShowcaseDisplayItem:
    sales_period_event_id = v
    return self


static func from_dict(data) -> Gs2ShowcaseDisplayItem:
    if data == null:
        return null
    var ret = Gs2ShowcaseDisplayItem.new()
    ret.display_item_id = null if data.get("displayItemId") == null else str(data.get("displayItemId"))
    ret.type = null if data.get("type") == null else str(data.get("type"))
    ret.sales_item = null if data.get("salesItem") == null else Gs2ShowcaseSalesItem.from_dict(data.get("salesItem"))
    ret.sales_item_group = null if data.get("salesItemGroup") == null else Gs2ShowcaseSalesItemGroup.from_dict(data.get("salesItemGroup"))
    ret.sales_period_event_id = null if data.get("salesPeriodEventId") == null else str(data.get("salesPeriodEventId"))
    return ret


func to_dict() -> Dictionary:
    var ret = {}
    ret["displayItemId"] = display_item_id
    ret["type"] = type
    ret["salesItem"] = null if sales_item == null else sales_item.to_dict()
    ret["salesItemGroup"] = null if sales_item_group == null else sales_item_group.to_dict()
    ret["salesPeriodEventId"] = sales_period_event_id
    return ret