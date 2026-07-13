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
class_name Gs2MatchmakingTimeSpan
extends RefCounted


var days = null
var hours = null
var minutes = null


func with_days(v) -> Gs2MatchmakingTimeSpan:
    days = v
    return self


func with_hours(v) -> Gs2MatchmakingTimeSpan:
    hours = v
    return self


func with_minutes(v) -> Gs2MatchmakingTimeSpan:
    minutes = v
    return self


static func from_dict(data) -> Gs2MatchmakingTimeSpan:
    if data == null:
        return null
    var ret = Gs2MatchmakingTimeSpan.new()
    ret.days = null if data.get("days") == null else int(data.get("days"))
    ret.hours = null if data.get("hours") == null else int(data.get("hours"))
    ret.minutes = null if data.get("minutes") == null else int(data.get("minutes"))
    return ret


func to_dict() -> Dictionary:
    var ret = {}
    ret["days"] = days
    ret["hours"] = hours
    ret["minutes"] = minutes
    return ret