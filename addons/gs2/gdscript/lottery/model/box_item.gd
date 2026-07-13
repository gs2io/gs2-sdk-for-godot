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
class_name Gs2LotteryBoxItem
extends RefCounted


var prize_id = null
var acquire_actions = null
var remaining = null
var initial = null


func with_prize_id(v) -> Gs2LotteryBoxItem:
    prize_id = v
    return self


func with_acquire_actions(v) -> Gs2LotteryBoxItem:
    acquire_actions = v
    return self


func with_remaining(v) -> Gs2LotteryBoxItem:
    remaining = v
    return self


func with_initial(v) -> Gs2LotteryBoxItem:
    initial = v
    return self


static func from_dict(data) -> Gs2LotteryBoxItem:
    if data == null:
        return null
    var ret = Gs2LotteryBoxItem.new()
    ret.prize_id = null if data.get("prizeId") == null else str(data.get("prizeId"))
    ret.acquire_actions = null if data.get("acquireActions") == null else data.get("acquireActions").map(func(v): return Gs2AcquireAction.from_dict(v))
    ret.remaining = null if data.get("remaining") == null else int(data.get("remaining"))
    ret.initial = null if data.get("initial") == null else int(data.get("initial"))
    return ret


func to_dict() -> Dictionary:
    var ret = {}
    ret["prizeId"] = prize_id
    ret["acquireActions"] = null if acquire_actions == null else acquire_actions.map(func(v): return null if v == null else v.to_dict())
    ret["remaining"] = remaining
    ret["initial"] = initial
    return ret