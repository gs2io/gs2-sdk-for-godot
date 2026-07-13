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
class_name Gs2LotteryResetBoxRequest
extends Gs2Request


var namespace_name = null
var prize_table_name = null
var access_token = null
var duplication_avoider = null


func with_namespace_name(v) -> Gs2LotteryResetBoxRequest:
    namespace_name = v
    return self


func with_prize_table_name(v) -> Gs2LotteryResetBoxRequest:
    prize_table_name = v
    return self


func with_access_token(v) -> Gs2LotteryResetBoxRequest:
    access_token = v
    return self


func with_duplication_avoider(v) -> Gs2LotteryResetBoxRequest:
    duplication_avoider = v
    return self


static func from_dict(data) -> Gs2LotteryResetBoxRequest:
    if data == null:
        return null
    var ret = Gs2LotteryResetBoxRequest.new()
    ret.namespace_name = null if data.get("namespaceName") == null else str(data.get("namespaceName"))
    ret.prize_table_name = null if data.get("prizeTableName") == null else str(data.get("prizeTableName"))
    ret.access_token = null if data.get("accessToken") == null else str(data.get("accessToken"))
    return ret


func to_dict() -> Dictionary:
    var ret = {}
    ret["namespaceName"] = namespace_name
    ret["prizeTableName"] = prize_table_name
    ret["accessToken"] = access_token
    return ret