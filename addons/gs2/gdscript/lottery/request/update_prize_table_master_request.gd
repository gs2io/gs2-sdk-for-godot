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
class_name Gs2LotteryUpdatePrizeTableMasterRequest
extends Gs2Request


var namespace_name = null
var prize_table_name = null
var description = null
var metadata = null
var prizes = null


func with_namespace_name(v) -> Gs2LotteryUpdatePrizeTableMasterRequest:
    namespace_name = v
    return self


func with_prize_table_name(v) -> Gs2LotteryUpdatePrizeTableMasterRequest:
    prize_table_name = v
    return self


func with_description(v) -> Gs2LotteryUpdatePrizeTableMasterRequest:
    description = v
    return self


func with_metadata(v) -> Gs2LotteryUpdatePrizeTableMasterRequest:
    metadata = v
    return self


func with_prizes(v) -> Gs2LotteryUpdatePrizeTableMasterRequest:
    prizes = v
    return self


static func from_dict(data) -> Gs2LotteryUpdatePrizeTableMasterRequest:
    if data == null:
        return null
    var ret = Gs2LotteryUpdatePrizeTableMasterRequest.new()
    ret.namespace_name = null if data.get("namespaceName") == null else str(data.get("namespaceName"))
    ret.prize_table_name = null if data.get("prizeTableName") == null else str(data.get("prizeTableName"))
    ret.description = null if data.get("description") == null else str(data.get("description"))
    ret.metadata = null if data.get("metadata") == null else str(data.get("metadata"))
    ret.prizes = null if data.get("prizes") == null else data.get("prizes").map(func(v): return Gs2LotteryPrize.from_dict(v))
    return ret


func to_dict() -> Dictionary:
    var ret = {}
    ret["namespaceName"] = namespace_name
    ret["prizeTableName"] = prize_table_name
    ret["description"] = description
    ret["metadata"] = metadata
    ret["prizes"] = null if prizes == null else prizes.map(func(v): return null if v == null else v.to_dict())
    return ret