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
class_name Gs2BuffOverrideBuffRate
extends RefCounted


var name = null
var rate = null


func with_name(v) -> Gs2BuffOverrideBuffRate:
    name = v
    return self


func with_rate(v) -> Gs2BuffOverrideBuffRate:
    rate = v
    return self


static func from_dict(data) -> Gs2BuffOverrideBuffRate:
    if data == null:
        return null
    var ret = Gs2BuffOverrideBuffRate.new()
    ret.name = null if data.get("name") == null else str(data.get("name"))
    ret.rate = null if data.get("rate") == null else float(data.get("rate"))
    return ret


func to_dict() -> Dictionary:
    var ret = {}
    ret["name"] = name
    ret["rate"] = rate
    return ret