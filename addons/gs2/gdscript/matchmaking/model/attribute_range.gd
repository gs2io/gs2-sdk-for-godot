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
class_name Gs2MatchmakingAttributeRange
extends RefCounted


var name = null
var min = null
var max = null


func with_name(v) -> Gs2MatchmakingAttributeRange:
    name = v
    return self


func with_min(v) -> Gs2MatchmakingAttributeRange:
    min = v
    return self


func with_max(v) -> Gs2MatchmakingAttributeRange:
    max = v
    return self


static func from_dict(data) -> Gs2MatchmakingAttributeRange:
    if data == null:
        return null
    var ret = Gs2MatchmakingAttributeRange.new()
    ret.name = null if data.get("name") == null else str(data.get("name"))
    ret.min = null if data.get("min") == null else int(data.get("min"))
    ret.max = null if data.get("max") == null else int(data.get("max"))
    return ret


func to_dict() -> Dictionary:
    var ret = {}
    ret["name"] = name
    ret["min"] = min
    ret["max"] = max
    return ret