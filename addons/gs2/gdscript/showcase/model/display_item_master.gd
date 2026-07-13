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
class_name Gs2ShowcaseDisplayItemMaster
extends RefCounted


var display_item_id = null
var type = null
var sales_item_name = null
var sales_item_group_name = null
var sales_period_event_id = null
var revision = null


func with_display_item_id(v) -> Gs2ShowcaseDisplayItemMaster:
    display_item_id = v
    return self


func with_type(v) -> Gs2ShowcaseDisplayItemMaster:
    type = v
    return self


func with_sales_item_name(v) -> Gs2ShowcaseDisplayItemMaster:
    sales_item_name = v
    return self


func with_sales_item_group_name(v) -> Gs2ShowcaseDisplayItemMaster:
    sales_item_group_name = v
    return self


func with_sales_period_event_id(v) -> Gs2ShowcaseDisplayItemMaster:
    sales_period_event_id = v
    return self


func with_revision(v) -> Gs2ShowcaseDisplayItemMaster:
    revision = v
    return self


static func from_dict(data) -> Gs2ShowcaseDisplayItemMaster:
    if data == null:
        return null
    var ret = Gs2ShowcaseDisplayItemMaster.new()
    ret.display_item_id = null if data.get("displayItemId") == null else str(data.get("displayItemId"))
    ret.type = null if data.get("type") == null else str(data.get("type"))
    ret.sales_item_name = null if data.get("salesItemName") == null else str(data.get("salesItemName"))
    ret.sales_item_group_name = null if data.get("salesItemGroupName") == null else str(data.get("salesItemGroupName"))
    ret.sales_period_event_id = null if data.get("salesPeriodEventId") == null else str(data.get("salesPeriodEventId"))
    ret.revision = null if data.get("revision") == null else int(data.get("revision"))
    return ret


func to_dict() -> Dictionary:
    var ret = {}
    ret["displayItemId"] = display_item_id
    ret["type"] = type
    ret["salesItemName"] = sales_item_name
    ret["salesItemGroupName"] = sales_item_group_name
    ret["salesPeriodEventId"] = sales_period_event_id
    ret["revision"] = revision
    return ret