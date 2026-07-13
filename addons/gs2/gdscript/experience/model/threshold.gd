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
class_name Gs2ExperienceThreshold
extends RefCounted


var metadata = null
var values = null


func with_metadata(v) -> Gs2ExperienceThreshold:
    metadata = v
    return self


func with_values(v) -> Gs2ExperienceThreshold:
    values = v
    return self


static func from_dict(data) -> Gs2ExperienceThreshold:
    if data == null:
        return null
    var ret = Gs2ExperienceThreshold.new()
    ret.metadata = null if data.get("metadata") == null else str(data.get("metadata"))
    ret.values = null if data.get("values") == null else data.get("values").map(func(v): return int(v))
    return ret


func to_dict() -> Dictionary:
    var ret = {}
    ret["metadata"] = metadata
    ret["values"] = values
    return ret