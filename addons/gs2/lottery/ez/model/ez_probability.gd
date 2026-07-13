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
class_name Gs2LotteryEzProbability
extends RefCounted


var prize = null
var rate = 0


func with_prize(v) -> Gs2LotteryEzProbability:
    prize = v
    return self


func with_rate(v) -> Gs2LotteryEzProbability:
    rate = v
    return self


func to_model() -> Gs2LotteryProbability:
    var ret = Gs2LotteryProbability.new()
    ret.prize = null if prize == null else prize.to_model()
    ret.rate = rate
    return ret


static func from_model(model) -> Gs2LotteryEzProbability:
    var ret = Gs2LotteryEzProbability.new()
    ret.prize = null if model.prize == null else Gs2LotteryEzDrawnPrize.from_model(model.prize)
    ret.rate = 0 if model.rate == null else model.rate
    return ret