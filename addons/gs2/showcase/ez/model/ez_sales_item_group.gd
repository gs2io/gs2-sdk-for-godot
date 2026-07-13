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
class_name Gs2ShowcaseEzSalesItemGroup
extends RefCounted


var name = null
var metadata = null
var sales_items = []


func with_name(v) -> Gs2ShowcaseEzSalesItemGroup:
    name = v
    return self


func with_metadata(v) -> Gs2ShowcaseEzSalesItemGroup:
    metadata = v
    return self


func with_sales_items(v) -> Gs2ShowcaseEzSalesItemGroup:
    sales_items = v
    return self


func to_model() -> Gs2ShowcaseSalesItemGroup:
    var ret = Gs2ShowcaseSalesItemGroup.new()
    ret.name = name
    ret.metadata = metadata
    ret.sales_items = null if sales_items == null else sales_items.map(func(v): return null if v == null else v.to_model())
    return ret


static func from_model(model) -> Gs2ShowcaseEzSalesItemGroup:
    var ret = Gs2ShowcaseEzSalesItemGroup.new()
    ret.name = model.name
    ret.metadata = model.metadata
    ret.sales_items = [] if model.sales_items == null else model.sales_items.map(func(v): return Gs2ShowcaseEzSalesItem.from_model(v))
    return ret