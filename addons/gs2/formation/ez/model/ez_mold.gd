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
class_name Gs2FormationEzMold
extends RefCounted


var name = null
var user_id = null
var capacity = 0


func with_name(v) -> Gs2FormationEzMold:
    name = v
    return self


func with_user_id(v) -> Gs2FormationEzMold:
    user_id = v
    return self


func with_capacity(v) -> Gs2FormationEzMold:
    capacity = v
    return self


func to_model() -> Gs2FormationMold:
    var ret = Gs2FormationMold.new()
    ret.name = name
    ret.user_id = user_id
    ret.capacity = capacity
    return ret


static func from_model(model) -> Gs2FormationEzMold:
    var ret = Gs2FormationEzMold.new()
    ret.name = model.name
    ret.user_id = model.user_id
    ret.capacity = 0 if model.capacity == null else model.capacity
    return ret