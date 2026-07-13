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
class_name Gs2QuestReward
extends RefCounted


var action = null
var request = null
var item_id = null
var value = null


func with_action(v) -> Gs2QuestReward:
    action = v
    return self


func with_request(v) -> Gs2QuestReward:
    request = v
    return self


func with_item_id(v) -> Gs2QuestReward:
    item_id = v
    return self


func with_value(v) -> Gs2QuestReward:
    value = v
    return self


static func from_dict(data) -> Gs2QuestReward:
    if data == null:
        return null
    var ret = Gs2QuestReward.new()
    ret.action = null if data.get("action") == null else str(data.get("action"))
    ret.request = null if data.get("request") == null else str(data.get("request"))
    ret.item_id = null if data.get("itemId") == null else str(data.get("itemId"))
    ret.value = null if data.get("value") == null else int(data.get("value"))
    return ret


func to_dict() -> Dictionary:
    var ret = {}
    ret["action"] = action
    ret["request"] = request
    ret["itemId"] = item_id
    ret["value"] = value
    return ret