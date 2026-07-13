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
class_name Gs2ExchangeExchangeByUserIdRequest
extends Gs2Request


var namespace_name = null
var rate_name = null
var user_id = null
var count = null
var config = null
var time_offset_token = null
var duplication_avoider = null


func with_namespace_name(v) -> Gs2ExchangeExchangeByUserIdRequest:
    namespace_name = v
    return self


func with_rate_name(v) -> Gs2ExchangeExchangeByUserIdRequest:
    rate_name = v
    return self


func with_user_id(v) -> Gs2ExchangeExchangeByUserIdRequest:
    user_id = v
    return self


func with_count(v) -> Gs2ExchangeExchangeByUserIdRequest:
    count = v
    return self


func with_config(v) -> Gs2ExchangeExchangeByUserIdRequest:
    config = v
    return self


func with_time_offset_token(v) -> Gs2ExchangeExchangeByUserIdRequest:
    time_offset_token = v
    return self


func with_duplication_avoider(v) -> Gs2ExchangeExchangeByUserIdRequest:
    duplication_avoider = v
    return self


static func from_dict(data) -> Gs2ExchangeExchangeByUserIdRequest:
    if data == null:
        return null
    var ret = Gs2ExchangeExchangeByUserIdRequest.new()
    ret.namespace_name = null if data.get("namespaceName") == null else str(data.get("namespaceName"))
    ret.rate_name = null if data.get("rateName") == null else str(data.get("rateName"))
    ret.user_id = null if data.get("userId") == null else str(data.get("userId"))
    ret.count = null if data.get("count") == null else int(data.get("count"))
    ret.config = null if data.get("config") == null else data.get("config").map(func(v): return Gs2ExchangeConfig.from_dict(v))
    ret.time_offset_token = null if data.get("timeOffsetToken") == null else str(data.get("timeOffsetToken"))
    return ret


func to_dict() -> Dictionary:
    var ret = {}
    ret["namespaceName"] = namespace_name
    ret["rateName"] = rate_name
    ret["userId"] = user_id
    ret["count"] = count
    ret["config"] = null if config == null else config.map(func(v): return null if v == null else v.to_dict())
    ret["timeOffsetToken"] = time_offset_token
    return ret