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
class_name Gs2EnhanceEzUnleashMaterialSelection
extends RefCounted


var name = null
var item_set_ids = []


func with_name(v) -> Gs2EnhanceEzUnleashMaterialSelection:
    name = v
    return self


func with_item_set_ids(v) -> Gs2EnhanceEzUnleashMaterialSelection:
    item_set_ids = v
    return self


func to_model() -> Gs2EnhanceUnleashMaterialSelection:
    var ret = Gs2EnhanceUnleashMaterialSelection.new()
    ret.name = name
    ret.item_set_ids = null if item_set_ids == null else item_set_ids.map(func(v): return v)
    return ret


static func from_model(model) -> Gs2EnhanceEzUnleashMaterialSelection:
    var ret = Gs2EnhanceEzUnleashMaterialSelection.new()
    ret.name = model.name
    ret.item_set_ids = [] if model.item_set_ids == null else model.item_set_ids.map(func(v): return v)
    return ret