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
class_name Gs2RankingEzScope
extends RefCounted


var name = null
var target_days = 0


func with_name(v) -> Gs2RankingEzScope:
    name = v
    return self


func with_target_days(v) -> Gs2RankingEzScope:
    target_days = v
    return self


func to_model() -> Gs2RankingScope:
    var ret = Gs2RankingScope.new()
    ret.name = name
    ret.target_days = target_days
    return ret


static func from_model(model) -> Gs2RankingEzScope:
    var ret = Gs2RankingEzScope.new()
    ret.name = model.name
    ret.target_days = 0 if model.target_days == null else model.target_days
    return ret