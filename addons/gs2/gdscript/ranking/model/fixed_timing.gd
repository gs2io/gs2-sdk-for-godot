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
class_name Gs2RankingFixedTiming
extends RefCounted


var hour = null
var minute = null


func with_hour(v) -> Gs2RankingFixedTiming:
    hour = v
    return self


func with_minute(v) -> Gs2RankingFixedTiming:
    minute = v
    return self


static func from_dict(data) -> Gs2RankingFixedTiming:
    if data == null:
        return null
    var ret = Gs2RankingFixedTiming.new()
    ret.hour = null if data.get("hour") == null else int(data.get("hour"))
    ret.minute = null if data.get("minute") == null else int(data.get("minute"))
    return ret


func to_dict() -> Dictionary:
    var ret = {}
    ret["hour"] = hour
    ret["minute"] = minute
    return ret