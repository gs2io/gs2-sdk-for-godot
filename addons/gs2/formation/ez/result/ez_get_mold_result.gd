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
class_name Gs2FormationEzGetMoldResult
extends RefCounted


var item = null
var mold_model = null


static func from_model(model) -> Gs2FormationEzGetMoldResult:
    var ret = Gs2FormationEzGetMoldResult.new()
    ret.item = null if model.item == null else Gs2FormationEzMold.from_model(model.item)
    ret.mold_model = null if model.mold_model == null else Gs2FormationEzMoldModel.from_model(model.mold_model)
    return ret