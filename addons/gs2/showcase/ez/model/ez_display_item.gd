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
class_name Gs2ShowcaseEzDisplayItem
extends RefCounted


var display_item_id = null
var type = null
var sales_item = null
var sales_item_group = null


func with_display_item_id(v) -> Gs2ShowcaseEzDisplayItem:
    display_item_id = v
    return self


func with_type(v) -> Gs2ShowcaseEzDisplayItem:
    type = v
    return self


func with_sales_item(v) -> Gs2ShowcaseEzDisplayItem:
    sales_item = v
    return self


func with_sales_item_group(v) -> Gs2ShowcaseEzDisplayItem:
    sales_item_group = v
    return self


func to_model() -> Gs2ShowcaseDisplayItem:
    var ret = Gs2ShowcaseDisplayItem.new()
    ret.display_item_id = display_item_id
    ret.type = type
    ret.sales_item = null if sales_item == null else sales_item.to_model()
    ret.sales_item_group = null if sales_item_group == null else sales_item_group.to_model()
    return ret


static func from_model(model) -> Gs2ShowcaseEzDisplayItem:
    var ret = Gs2ShowcaseEzDisplayItem.new()
    ret.display_item_id = model.display_item_id
    ret.type = model.type
    ret.sales_item = null if model.sales_item == null else Gs2ShowcaseEzSalesItem.from_model(model.sales_item)
    ret.sales_item_group = null if model.sales_item_group == null else Gs2ShowcaseEzSalesItemGroup.from_model(model.sales_item_group)
    return ret