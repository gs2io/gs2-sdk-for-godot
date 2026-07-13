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
class_name Gs2GradeAcquireActionRate
extends RefCounted


var name = null
var mode = null
var rates = null
var big_rates = null


func with_name(v) -> Gs2GradeAcquireActionRate:
    name = v
    return self


func with_mode(v) -> Gs2GradeAcquireActionRate:
    mode = v
    return self


func with_rates(v) -> Gs2GradeAcquireActionRate:
    rates = v
    return self


func with_big_rates(v) -> Gs2GradeAcquireActionRate:
    big_rates = v
    return self


static func from_dict(data) -> Gs2GradeAcquireActionRate:
    if data == null:
        return null
    var ret = Gs2GradeAcquireActionRate.new()
    ret.name = null if data.get("name") == null else str(data.get("name"))
    ret.mode = null if data.get("mode") == null else str(data.get("mode"))
    ret.rates = null if data.get("rates") == null else data.get("rates").map(func(v): return float(v))
    ret.big_rates = null if data.get("bigRates") == null else data.get("bigRates").map(func(v): return str(v))
    return ret


func to_dict() -> Dictionary:
    var ret = {}
    ret["name"] = name
    ret["mode"] = mode
    ret["rates"] = rates
    ret["bigRates"] = big_rates
    return ret