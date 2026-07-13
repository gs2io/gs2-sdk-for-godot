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
class_name Gs2EnhanceUnleashRateEntryModel
extends RefCounted


var grade_value = null
var need_count = null


func with_grade_value(v) -> Gs2EnhanceUnleashRateEntryModel:
    grade_value = v
    return self


func with_need_count(v) -> Gs2EnhanceUnleashRateEntryModel:
    need_count = v
    return self


static func from_dict(data) -> Gs2EnhanceUnleashRateEntryModel:
    if data == null:
        return null
    var ret = Gs2EnhanceUnleashRateEntryModel.new()
    ret.grade_value = null if data.get("gradeValue") == null else int(data.get("gradeValue"))
    ret.need_count = null if data.get("needCount") == null else int(data.get("needCount"))
    return ret


func to_dict() -> Dictionary:
    var ret = {}
    ret["gradeValue"] = grade_value
    ret["needCount"] = need_count
    return ret