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
class_name Gs2MatchmakingEzTimeSpan
extends RefCounted


var days = 0
var hours = 0
var minutes = 0


func with_days(v) -> Gs2MatchmakingEzTimeSpan:
    days = v
    return self


func with_hours(v) -> Gs2MatchmakingEzTimeSpan:
    hours = v
    return self


func with_minutes(v) -> Gs2MatchmakingEzTimeSpan:
    minutes = v
    return self


func to_model() -> Gs2MatchmakingTimeSpan:
    var ret = Gs2MatchmakingTimeSpan.new()
    ret.days = days
    ret.hours = hours
    ret.minutes = minutes
    return ret


static func from_model(model) -> Gs2MatchmakingEzTimeSpan:
    var ret = Gs2MatchmakingEzTimeSpan.new()
    ret.days = 0 if model.days == null else model.days
    ret.hours = 0 if model.hours == null else model.hours
    ret.minutes = 0 if model.minutes == null else model.minutes
    return ret