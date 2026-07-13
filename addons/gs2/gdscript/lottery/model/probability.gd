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
class_name Gs2LotteryProbability
extends RefCounted


var prize = null
var rate = null


func with_prize(v) -> Gs2LotteryProbability:
    prize = v
    return self


func with_rate(v) -> Gs2LotteryProbability:
    rate = v
    return self


static func from_dict(data) -> Gs2LotteryProbability:
    if data == null:
        return null
    var ret = Gs2LotteryProbability.new()
    ret.prize = null if data.get("prize") == null else Gs2LotteryDrawnPrize.from_dict(data.get("prize"))
    ret.rate = null if data.get("rate") == null else float(data.get("rate"))
    return ret


func to_dict() -> Dictionary:
    var ret = {}
    ret["prize"] = null if prize == null else prize.to_dict()
    ret["rate"] = rate
    return ret