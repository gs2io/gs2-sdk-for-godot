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
class_name Gs2EnhanceBonusRate
extends RefCounted


var rate = null
var weight = null


func with_rate(v) -> Gs2EnhanceBonusRate:
    rate = v
    return self


func with_weight(v) -> Gs2EnhanceBonusRate:
    weight = v
    return self


static func from_dict(data) -> Gs2EnhanceBonusRate:
    if data == null:
        return null
    var ret = Gs2EnhanceBonusRate.new()
    ret.rate = null if data.get("rate") == null else float(data.get("rate"))
    ret.weight = null if data.get("weight") == null else int(data.get("weight"))
    return ret


func to_dict() -> Dictionary:
    var ret = {}
    ret["rate"] = rate
    ret["weight"] = weight
    return ret