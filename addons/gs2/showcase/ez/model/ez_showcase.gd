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
class_name Gs2ShowcaseEzShowcase
extends RefCounted


var name = null
var metadata = null
var display_items = []
var sales_period_event_id = null


func with_name(v) -> Gs2ShowcaseEzShowcase:
    name = v
    return self


func with_metadata(v) -> Gs2ShowcaseEzShowcase:
    metadata = v
    return self


func with_display_items(v) -> Gs2ShowcaseEzShowcase:
    display_items = v
    return self


func with_sales_period_event_id(v) -> Gs2ShowcaseEzShowcase:
    sales_period_event_id = v
    return self


func to_model() -> Gs2ShowcaseShowcase:
    var ret = Gs2ShowcaseShowcase.new()
    ret.name = name
    ret.metadata = metadata
    ret.display_items = null if display_items == null else display_items.map(func(v): return null if v == null else v.to_model())
    ret.sales_period_event_id = sales_period_event_id
    return ret


static func from_model(model) -> Gs2ShowcaseEzShowcase:
    var ret = Gs2ShowcaseEzShowcase.new()
    ret.name = model.name
    ret.metadata = model.metadata
    ret.display_items = [] if model.display_items == null else model.display_items.map(func(v): return Gs2ShowcaseEzDisplayItem.from_model(v))
    ret.sales_period_event_id = model.sales_period_event_id
    return ret