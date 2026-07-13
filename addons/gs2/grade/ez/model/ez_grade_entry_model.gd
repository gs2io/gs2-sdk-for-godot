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
class_name Gs2GradeEzGradeEntryModel
extends RefCounted


var metadata = null
var rank_cap_value = 0


func with_metadata(v) -> Gs2GradeEzGradeEntryModel:
    metadata = v
    return self


func with_rank_cap_value(v) -> Gs2GradeEzGradeEntryModel:
    rank_cap_value = v
    return self


func to_model() -> Gs2GradeGradeEntryModel:
    var ret = Gs2GradeGradeEntryModel.new()
    ret.metadata = metadata
    ret.rank_cap_value = rank_cap_value
    return ret


static func from_model(model) -> Gs2GradeEzGradeEntryModel:
    var ret = Gs2GradeEzGradeEntryModel.new()
    ret.metadata = model.metadata
    ret.rank_cap_value = 0 if model.rank_cap_value == null else model.rank_cap_value
    return ret