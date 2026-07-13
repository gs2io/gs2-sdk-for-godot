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
class_name Gs2RankingScope
extends RefCounted


var name = null
var target_days = null


func with_name(v) -> Gs2RankingScope:
    name = v
    return self


func with_target_days(v) -> Gs2RankingScope:
    target_days = v
    return self


static func from_dict(data) -> Gs2RankingScope:
    if data == null:
        return null
    var ret = Gs2RankingScope.new()
    ret.name = null if data.get("name") == null else str(data.get("name"))
    ret.target_days = null if data.get("targetDays") == null else int(data.get("targetDays"))
    return ret


func to_dict() -> Dictionary:
    var ret = {}
    ret["name"] = name
    ret["targetDays"] = target_days
    return ret