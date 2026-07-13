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
class_name Gs2FormationEzMoldModel
extends RefCounted


var name = null
var metadata = null
var form_model = null
var initial_max_capacity = 0
var max_capacity = 0


func with_name(v) -> Gs2FormationEzMoldModel:
    name = v
    return self


func with_metadata(v) -> Gs2FormationEzMoldModel:
    metadata = v
    return self


func with_form_model(v) -> Gs2FormationEzMoldModel:
    form_model = v
    return self


func with_initial_max_capacity(v) -> Gs2FormationEzMoldModel:
    initial_max_capacity = v
    return self


func with_max_capacity(v) -> Gs2FormationEzMoldModel:
    max_capacity = v
    return self


func to_model() -> Gs2FormationMoldModel:
    var ret = Gs2FormationMoldModel.new()
    ret.name = name
    ret.metadata = metadata
    ret.form_model = null if form_model == null else form_model.to_model()
    ret.initial_max_capacity = initial_max_capacity
    ret.max_capacity = max_capacity
    return ret


static func from_model(model) -> Gs2FormationEzMoldModel:
    var ret = Gs2FormationEzMoldModel.new()
    ret.name = model.name
    ret.metadata = model.metadata
    ret.form_model = null if model.form_model == null else Gs2FormationEzFormModel.from_model(model.form_model)
    ret.initial_max_capacity = 0 if model.initial_max_capacity == null else model.initial_max_capacity
    ret.max_capacity = 0 if model.max_capacity == null else model.max_capacity
    return ret