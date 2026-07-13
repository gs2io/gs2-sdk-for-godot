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
class_name Gs2ExperienceUpdateThresholdMasterRequest
extends Gs2Request


var namespace_name = null
var threshold_name = null
var description = null
var metadata = null
var values = null


func with_namespace_name(v) -> Gs2ExperienceUpdateThresholdMasterRequest:
    namespace_name = v
    return self


func with_threshold_name(v) -> Gs2ExperienceUpdateThresholdMasterRequest:
    threshold_name = v
    return self


func with_description(v) -> Gs2ExperienceUpdateThresholdMasterRequest:
    description = v
    return self


func with_metadata(v) -> Gs2ExperienceUpdateThresholdMasterRequest:
    metadata = v
    return self


func with_values(v) -> Gs2ExperienceUpdateThresholdMasterRequest:
    values = v
    return self


static func from_dict(data) -> Gs2ExperienceUpdateThresholdMasterRequest:
    if data == null:
        return null
    var ret = Gs2ExperienceUpdateThresholdMasterRequest.new()
    ret.namespace_name = null if data.get("namespaceName") == null else str(data.get("namespaceName"))
    ret.threshold_name = null if data.get("thresholdName") == null else str(data.get("thresholdName"))
    ret.description = null if data.get("description") == null else str(data.get("description"))
    ret.metadata = null if data.get("metadata") == null else str(data.get("metadata"))
    ret.values = null if data.get("values") == null else data.get("values").map(func(v): return int(v))
    return ret


func to_dict() -> Dictionary:
    var ret = {}
    ret["namespaceName"] = namespace_name
    ret["thresholdName"] = threshold_name
    ret["description"] = description
    ret["metadata"] = metadata
    ret["values"] = values
    return ret