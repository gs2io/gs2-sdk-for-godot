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
class_name Gs2LotteryGetPrizeLimitRequest
extends Gs2Request


var namespace_name = null
var prize_table_name = null
var prize_id = null


func with_namespace_name(v) -> Gs2LotteryGetPrizeLimitRequest:
    namespace_name = v
    return self


func with_prize_table_name(v) -> Gs2LotteryGetPrizeLimitRequest:
    prize_table_name = v
    return self


func with_prize_id(v) -> Gs2LotteryGetPrizeLimitRequest:
    prize_id = v
    return self


static func from_dict(data) -> Gs2LotteryGetPrizeLimitRequest:
    if data == null:
        return null
    var ret = Gs2LotteryGetPrizeLimitRequest.new()
    ret.namespace_name = null if data.get("namespaceName") == null else str(data.get("namespaceName"))
    ret.prize_table_name = null if data.get("prizeTableName") == null else str(data.get("prizeTableName"))
    ret.prize_id = null if data.get("prizeId") == null else str(data.get("prizeId"))
    return ret


func to_dict() -> Dictionary:
    var ret = {}
    ret["namespaceName"] = namespace_name
    ret["prizeTableName"] = prize_table_name
    ret["prizeId"] = prize_id
    return ret