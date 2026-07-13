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
class_name Gs2LotteryEzLotteryModel
extends RefCounted


var name = null
var metadata = null
var mode = null
var prize_table_name = null


func with_name(v) -> Gs2LotteryEzLotteryModel:
    name = v
    return self


func with_metadata(v) -> Gs2LotteryEzLotteryModel:
    metadata = v
    return self


func with_mode(v) -> Gs2LotteryEzLotteryModel:
    mode = v
    return self


func with_prize_table_name(v) -> Gs2LotteryEzLotteryModel:
    prize_table_name = v
    return self


func to_model() -> Gs2LotteryLotteryModel:
    var ret = Gs2LotteryLotteryModel.new()
    ret.name = name
    ret.metadata = metadata
    ret.mode = mode
    ret.prize_table_name = prize_table_name
    return ret


static func from_model(model) -> Gs2LotteryEzLotteryModel:
    var ret = Gs2LotteryEzLotteryModel.new()
    ret.name = model.name
    ret.metadata = model.metadata
    ret.mode = model.mode
    ret.prize_table_name = model.prize_table_name
    return ret