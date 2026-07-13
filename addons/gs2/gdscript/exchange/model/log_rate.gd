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
class_name Gs2ExchangeLogRate
extends RefCounted


var base = null
var logs = null


func with_base(v) -> Gs2ExchangeLogRate:
    base = v
    return self


func with_logs(v) -> Gs2ExchangeLogRate:
    logs = v
    return self


static func from_dict(data) -> Gs2ExchangeLogRate:
    if data == null:
        return null
    var ret = Gs2ExchangeLogRate.new()
    ret.base = null if data.get("base") == null else float(data.get("base"))
    ret.logs = null if data.get("logs") == null else data.get("logs").map(func(v): return float(v))
    return ret


func to_dict() -> Dictionary:
    var ret = {}
    ret["base"] = base
    ret["logs"] = logs
    return ret