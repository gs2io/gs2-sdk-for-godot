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
class_name Gs2MissionEzCounter
extends RefCounted


var name = null
var values = []


func with_name(v) -> Gs2MissionEzCounter:
    name = v
    return self


func with_values(v) -> Gs2MissionEzCounter:
    values = v
    return self


func to_model() -> Gs2MissionCounter:
    var ret = Gs2MissionCounter.new()
    ret.name = name
    ret.values = null if values == null else values.map(func(v): return null if v == null else v.to_model())
    return ret


static func from_model(model) -> Gs2MissionEzCounter:
    var ret = Gs2MissionEzCounter.new()
    ret.name = model.name
    ret.values = [] if model.values == null else model.values.map(func(v): return Gs2MissionEzScopedValue.from_model(v))
    return ret