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
class_name Gs2QuestEzReward
extends RefCounted


var action = null
var request = null
var item_id = null
var value = 0


func with_action(v) -> Gs2QuestEzReward:
    action = v
    return self


func with_request(v) -> Gs2QuestEzReward:
    request = v
    return self


func with_item_id(v) -> Gs2QuestEzReward:
    item_id = v
    return self


func with_value(v) -> Gs2QuestEzReward:
    value = v
    return self


func to_model() -> Gs2QuestReward:
    var ret = Gs2QuestReward.new()
    ret.action = action
    ret.request = request
    ret.item_id = item_id
    ret.value = value
    return ret


static func from_model(model) -> Gs2QuestEzReward:
    var ret = Gs2QuestEzReward.new()
    ret.action = model.action
    ret.request = model.request
    ret.item_id = model.item_id
    ret.value = 0 if model.value == null else model.value
    return ret