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
class_name Gs2LotteryPredictionRequest
extends Gs2Request


var namespace_name = null
var lottery_name = null
var access_token = null
var random_seed = null
var count = null
var duplication_avoider = null


func with_namespace_name(v) -> Gs2LotteryPredictionRequest:
    namespace_name = v
    return self


func with_lottery_name(v) -> Gs2LotteryPredictionRequest:
    lottery_name = v
    return self


func with_access_token(v) -> Gs2LotteryPredictionRequest:
    access_token = v
    return self


func with_random_seed(v) -> Gs2LotteryPredictionRequest:
    random_seed = v
    return self


func with_count(v) -> Gs2LotteryPredictionRequest:
    count = v
    return self


func with_duplication_avoider(v) -> Gs2LotteryPredictionRequest:
    duplication_avoider = v
    return self


static func from_dict(data) -> Gs2LotteryPredictionRequest:
    if data == null:
        return null
    var ret = Gs2LotteryPredictionRequest.new()
    ret.namespace_name = null if data.get("namespaceName") == null else str(data.get("namespaceName"))
    ret.lottery_name = null if data.get("lotteryName") == null else str(data.get("lotteryName"))
    ret.access_token = null if data.get("accessToken") == null else str(data.get("accessToken"))
    ret.random_seed = null if data.get("randomSeed") == null else int(data.get("randomSeed"))
    ret.count = null if data.get("count") == null else int(data.get("count"))
    return ret


func to_dict() -> Dictionary:
    var ret = {}
    ret["namespaceName"] = namespace_name
    ret["lotteryName"] = lottery_name
    ret["accessToken"] = access_token
    ret["randomSeed"] = random_seed
    ret["count"] = count
    return ret