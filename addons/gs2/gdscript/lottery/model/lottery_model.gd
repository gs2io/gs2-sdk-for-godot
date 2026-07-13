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
class_name Gs2LotteryLotteryModel
extends RefCounted


var lottery_model_id = null
var name = null
var metadata = null
var mode = null
var method = null
var prize_table_name = null
var choice_prize_table_script_id = null


func with_lottery_model_id(v) -> Gs2LotteryLotteryModel:
    lottery_model_id = v
    return self


func with_name(v) -> Gs2LotteryLotteryModel:
    name = v
    return self


func with_metadata(v) -> Gs2LotteryLotteryModel:
    metadata = v
    return self


func with_mode(v) -> Gs2LotteryLotteryModel:
    mode = v
    return self


func with_method(v) -> Gs2LotteryLotteryModel:
    method = v
    return self


func with_prize_table_name(v) -> Gs2LotteryLotteryModel:
    prize_table_name = v
    return self


func with_choice_prize_table_script_id(v) -> Gs2LotteryLotteryModel:
    choice_prize_table_script_id = v
    return self


static func get_region_from_grn(grn):
    if grn == null:
        return null
    var regex = RegEx.new()
    regex.compile("grn:gs2:(?<region>.+):(?<ownerId>.+):lottery:(?<namespaceName>.+):lotteryModel:(?<lotteryName>.+)")
    var matched = regex.search(grn)
    if matched == null:
        return null
    return matched.get_string("region")


static func get_owner_id_from_grn(grn):
    if grn == null:
        return null
    var regex = RegEx.new()
    regex.compile("grn:gs2:(?<region>.+):(?<ownerId>.+):lottery:(?<namespaceName>.+):lotteryModel:(?<lotteryName>.+)")
    var matched = regex.search(grn)
    if matched == null:
        return null
    return matched.get_string("ownerId")


static func get_namespace_name_from_grn(grn):
    if grn == null:
        return null
    var regex = RegEx.new()
    regex.compile("grn:gs2:(?<region>.+):(?<ownerId>.+):lottery:(?<namespaceName>.+):lotteryModel:(?<lotteryName>.+)")
    var matched = regex.search(grn)
    if matched == null:
        return null
    return matched.get_string("namespaceName")


static func get_lottery_name_from_grn(grn):
    if grn == null:
        return null
    var regex = RegEx.new()
    regex.compile("grn:gs2:(?<region>.+):(?<ownerId>.+):lottery:(?<namespaceName>.+):lotteryModel:(?<lotteryName>.+)")
    var matched = regex.search(grn)
    if matched == null:
        return null
    return matched.get_string("lotteryName")


static func from_dict(data) -> Gs2LotteryLotteryModel:
    if data == null:
        return null
    var ret = Gs2LotteryLotteryModel.new()
    ret.lottery_model_id = null if data.get("lotteryModelId") == null else str(data.get("lotteryModelId"))
    ret.name = null if data.get("name") == null else str(data.get("name"))
    ret.metadata = null if data.get("metadata") == null else str(data.get("metadata"))
    ret.mode = null if data.get("mode") == null else str(data.get("mode"))
    ret.method = null if data.get("method") == null else str(data.get("method"))
    ret.prize_table_name = null if data.get("prizeTableName") == null else str(data.get("prizeTableName"))
    ret.choice_prize_table_script_id = null if data.get("choicePrizeTableScriptId") == null else str(data.get("choicePrizeTableScriptId"))
    return ret


func to_dict() -> Dictionary:
    var ret = {}
    ret["lotteryModelId"] = lottery_model_id
    ret["name"] = name
    ret["metadata"] = metadata
    ret["mode"] = mode
    ret["method"] = method
    ret["prizeTableName"] = prize_table_name
    ret["choicePrizeTableScriptId"] = choice_prize_table_script_id
    return ret