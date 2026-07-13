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
class_name Gs2LotteryEzBoxItems
extends RefCounted


var box_id = null
var prize_table_name = null
var items = []


func with_box_id(v) -> Gs2LotteryEzBoxItems:
    box_id = v
    return self


func with_prize_table_name(v) -> Gs2LotteryEzBoxItems:
    prize_table_name = v
    return self


func with_items(v) -> Gs2LotteryEzBoxItems:
    items = v
    return self


func to_model() -> Gs2LotteryBoxItems:
    var ret = Gs2LotteryBoxItems.new()
    ret.box_id = box_id
    ret.prize_table_name = prize_table_name
    ret.items = null if items == null else items.map(func(v): return null if v == null else v.to_model())
    return ret


static func from_model(model) -> Gs2LotteryEzBoxItems:
    var ret = Gs2LotteryEzBoxItems.new()
    ret.box_id = model.box_id
    ret.prize_table_name = model.prize_table_name
    ret.items = [] if model.items == null else model.items.map(func(v): return Gs2LotteryEzBoxItem.from_model(v))
    return ret