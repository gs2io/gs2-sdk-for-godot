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
class_name Gs2LotteryUpdateLotteryModelMasterRequest
extends Gs2Request


var namespace_name = null
var lottery_name = null
var description = null
var metadata = null
var mode = null
var method = null
var prize_table_name = null
var choice_prize_table_script_id = null


func with_namespace_name(v) -> Gs2LotteryUpdateLotteryModelMasterRequest:
    namespace_name = v
    return self


func with_lottery_name(v) -> Gs2LotteryUpdateLotteryModelMasterRequest:
    lottery_name = v
    return self


func with_description(v) -> Gs2LotteryUpdateLotteryModelMasterRequest:
    description = v
    return self


func with_metadata(v) -> Gs2LotteryUpdateLotteryModelMasterRequest:
    metadata = v
    return self


func with_mode(v) -> Gs2LotteryUpdateLotteryModelMasterRequest:
    mode = v
    return self


func with_method(v) -> Gs2LotteryUpdateLotteryModelMasterRequest:
    method = v
    return self


func with_prize_table_name(v) -> Gs2LotteryUpdateLotteryModelMasterRequest:
    prize_table_name = v
    return self


func with_choice_prize_table_script_id(v) -> Gs2LotteryUpdateLotteryModelMasterRequest:
    choice_prize_table_script_id = v
    return self


static func from_dict(data) -> Gs2LotteryUpdateLotteryModelMasterRequest:
    if data == null:
        return null
    var ret = Gs2LotteryUpdateLotteryModelMasterRequest.new()
    ret.namespace_name = null if data.get("namespaceName") == null else str(data.get("namespaceName"))
    ret.lottery_name = null if data.get("lotteryName") == null else str(data.get("lotteryName"))
    ret.description = null if data.get("description") == null else str(data.get("description"))
    ret.metadata = null if data.get("metadata") == null else str(data.get("metadata"))
    ret.mode = null if data.get("mode") == null else str(data.get("mode"))
    ret.method = null if data.get("method") == null else str(data.get("method"))
    ret.prize_table_name = null if data.get("prizeTableName") == null else str(data.get("prizeTableName"))
    ret.choice_prize_table_script_id = null if data.get("choicePrizeTableScriptId") == null else str(data.get("choicePrizeTableScriptId"))
    return ret


func to_dict() -> Dictionary:
    var ret = {}
    ret["namespaceName"] = namespace_name
    ret["lotteryName"] = lottery_name
    ret["description"] = description
    ret["metadata"] = metadata
    ret["mode"] = mode
    ret["method"] = method
    ret["prizeTableName"] = prize_table_name
    ret["choicePrizeTableScriptId"] = choice_prize_table_script_id
    return ret