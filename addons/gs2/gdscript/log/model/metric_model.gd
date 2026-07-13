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
class_name Gs2LogMetricModel
extends RefCounted


var name = null
var type = null
var labels = null


func with_name(v) -> Gs2LogMetricModel:
    name = v
    return self


func with_type(v) -> Gs2LogMetricModel:
    type = v
    return self


func with_labels(v) -> Gs2LogMetricModel:
    labels = v
    return self


static func from_dict(data) -> Gs2LogMetricModel:
    if data == null:
        return null
    var ret = Gs2LogMetricModel.new()
    ret.name = null if data.get("name") == null else str(data.get("name"))
    ret.type = null if data.get("type") == null else str(data.get("type"))
    ret.labels = null if data.get("labels") == null else data.get("labels").map(func(v): return str(v))
    return ret


func to_dict() -> Dictionary:
    var ret = {}
    ret["name"] = name
    ret["type"] = type
    ret["labels"] = labels
    return ret