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
class_name Gs2LogNumericRange
extends RefCounted


var min = null
var max = null


func with_min(v) -> Gs2LogNumericRange:
    min = v
    return self


func with_max(v) -> Gs2LogNumericRange:
    max = v
    return self


static func from_dict(data) -> Gs2LogNumericRange:
    if data == null:
        return null
    var ret = Gs2LogNumericRange.new()
    ret.min = null if data.get("min") == null else float(data.get("min"))
    ret.max = null if data.get("max") == null else float(data.get("max"))
    return ret


func to_dict() -> Dictionary:
    var ret = {}
    ret["min"] = min
    ret["max"] = max
    return ret