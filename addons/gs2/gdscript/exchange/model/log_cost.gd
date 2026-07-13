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
class_name Gs2ExchangeLogCost
extends RefCounted


var base = null
var adds = null
var subs = null


func with_base(v) -> Gs2ExchangeLogCost:
    base = v
    return self


func with_adds(v) -> Gs2ExchangeLogCost:
    adds = v
    return self


func with_subs(v) -> Gs2ExchangeLogCost:
    subs = v
    return self


static func from_dict(data) -> Gs2ExchangeLogCost:
    if data == null:
        return null
    var ret = Gs2ExchangeLogCost.new()
    ret.base = null if data.get("base") == null else float(data.get("base"))
    ret.adds = null if data.get("adds") == null else data.get("adds").map(func(v): return float(v))
    ret.subs = null if data.get("subs") == null else data.get("subs").map(func(v): return float(v))
    return ret


func to_dict() -> Dictionary:
    var ret = {}
    ret["base"] = base
    ret["adds"] = adds
    ret["subs"] = subs
    return ret