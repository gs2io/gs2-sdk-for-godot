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
class_name Gs2MatchmakingEzAttributeRange
extends RefCounted


var name = null
var min = 0
var max = 0


func with_name(v) -> Gs2MatchmakingEzAttributeRange:
    name = v
    return self


func with_min(v) -> Gs2MatchmakingEzAttributeRange:
    min = v
    return self


func with_max(v) -> Gs2MatchmakingEzAttributeRange:
    max = v
    return self


func to_model() -> Gs2MatchmakingAttributeRange:
    var ret = Gs2MatchmakingAttributeRange.new()
    ret.name = name
    ret.min = min
    ret.max = max
    return ret


static func from_model(model) -> Gs2MatchmakingEzAttributeRange:
    var ret = Gs2MatchmakingEzAttributeRange.new()
    ret.name = model.name
    ret.min = 0 if model.min == null else model.min
    ret.max = 0 if model.max == null else model.max
    return ret