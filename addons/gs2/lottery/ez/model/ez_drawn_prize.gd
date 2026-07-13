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
class_name Gs2LotteryEzDrawnPrize
extends RefCounted


var prize_id = null
var acquire_actions = []


func with_prize_id(v) -> Gs2LotteryEzDrawnPrize:
    prize_id = v
    return self


func with_acquire_actions(v) -> Gs2LotteryEzDrawnPrize:
    acquire_actions = v
    return self


func to_model() -> Gs2LotteryDrawnPrize:
    var ret = Gs2LotteryDrawnPrize.new()
    ret.prize_id = prize_id
    ret.acquire_actions = null if acquire_actions == null else acquire_actions.map(func(v): return null if v == null else v.to_model())
    return ret


static func from_model(model) -> Gs2LotteryEzDrawnPrize:
    var ret = Gs2LotteryEzDrawnPrize.new()
    ret.prize_id = model.prize_id
    ret.acquire_actions = [] if model.acquire_actions == null else model.acquire_actions.map(func(v): return Gs2EzAcquireAction.from_model(v))
    return ret