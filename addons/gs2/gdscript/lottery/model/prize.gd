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
class_name Gs2LotteryPrize
extends RefCounted


var prize_id = null
var type = null
var acquire_actions = null
var drawn_limit = null
var limit_fail_over_prize_id = null
var prize_table_name = null
var weight = null


func with_prize_id(v) -> Gs2LotteryPrize:
    prize_id = v
    return self


func with_type(v) -> Gs2LotteryPrize:
    type = v
    return self


func with_acquire_actions(v) -> Gs2LotteryPrize:
    acquire_actions = v
    return self


func with_drawn_limit(v) -> Gs2LotteryPrize:
    drawn_limit = v
    return self


func with_limit_fail_over_prize_id(v) -> Gs2LotteryPrize:
    limit_fail_over_prize_id = v
    return self


func with_prize_table_name(v) -> Gs2LotteryPrize:
    prize_table_name = v
    return self


func with_weight(v) -> Gs2LotteryPrize:
    weight = v
    return self


static func from_dict(data) -> Gs2LotteryPrize:
    if data == null:
        return null
    var ret = Gs2LotteryPrize.new()
    ret.prize_id = null if data.get("prizeId") == null else str(data.get("prizeId"))
    ret.type = null if data.get("type") == null else str(data.get("type"))
    ret.acquire_actions = null if data.get("acquireActions") == null else data.get("acquireActions").map(func(v): return Gs2AcquireAction.from_dict(v))
    ret.drawn_limit = null if data.get("drawnLimit") == null else int(data.get("drawnLimit"))
    ret.limit_fail_over_prize_id = null if data.get("limitFailOverPrizeId") == null else str(data.get("limitFailOverPrizeId"))
    ret.prize_table_name = null if data.get("prizeTableName") == null else str(data.get("prizeTableName"))
    ret.weight = null if data.get("weight") == null else int(data.get("weight"))
    return ret


func to_dict() -> Dictionary:
    var ret = {}
    ret["prizeId"] = prize_id
    ret["type"] = type
    ret["acquireActions"] = null if acquire_actions == null else acquire_actions.map(func(v): return null if v == null else v.to_dict())
    ret["drawnLimit"] = drawn_limit
    ret["limitFailOverPrizeId"] = limit_fail_over_prize_id
    ret["prizeTableName"] = prize_table_name
    ret["weight"] = weight
    return ret