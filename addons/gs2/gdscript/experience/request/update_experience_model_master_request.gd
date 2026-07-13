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
class_name Gs2ExperienceUpdateExperienceModelMasterRequest
extends Gs2Request


var namespace_name = null
var experience_name = null
var description = null
var metadata = null
var default_experience = null
var default_rank_cap = null
var max_rank_cap = null
var rank_threshold_name = null
var acquire_action_rates = null


func with_namespace_name(v) -> Gs2ExperienceUpdateExperienceModelMasterRequest:
    namespace_name = v
    return self


func with_experience_name(v) -> Gs2ExperienceUpdateExperienceModelMasterRequest:
    experience_name = v
    return self


func with_description(v) -> Gs2ExperienceUpdateExperienceModelMasterRequest:
    description = v
    return self


func with_metadata(v) -> Gs2ExperienceUpdateExperienceModelMasterRequest:
    metadata = v
    return self


func with_default_experience(v) -> Gs2ExperienceUpdateExperienceModelMasterRequest:
    default_experience = v
    return self


func with_default_rank_cap(v) -> Gs2ExperienceUpdateExperienceModelMasterRequest:
    default_rank_cap = v
    return self


func with_max_rank_cap(v) -> Gs2ExperienceUpdateExperienceModelMasterRequest:
    max_rank_cap = v
    return self


func with_rank_threshold_name(v) -> Gs2ExperienceUpdateExperienceModelMasterRequest:
    rank_threshold_name = v
    return self


func with_acquire_action_rates(v) -> Gs2ExperienceUpdateExperienceModelMasterRequest:
    acquire_action_rates = v
    return self


static func from_dict(data) -> Gs2ExperienceUpdateExperienceModelMasterRequest:
    if data == null:
        return null
    var ret = Gs2ExperienceUpdateExperienceModelMasterRequest.new()
    ret.namespace_name = null if data.get("namespaceName") == null else str(data.get("namespaceName"))
    ret.experience_name = null if data.get("experienceName") == null else str(data.get("experienceName"))
    ret.description = null if data.get("description") == null else str(data.get("description"))
    ret.metadata = null if data.get("metadata") == null else str(data.get("metadata"))
    ret.default_experience = null if data.get("defaultExperience") == null else int(data.get("defaultExperience"))
    ret.default_rank_cap = null if data.get("defaultRankCap") == null else int(data.get("defaultRankCap"))
    ret.max_rank_cap = null if data.get("maxRankCap") == null else int(data.get("maxRankCap"))
    ret.rank_threshold_name = null if data.get("rankThresholdName") == null else str(data.get("rankThresholdName"))
    ret.acquire_action_rates = null if data.get("acquireActionRates") == null else data.get("acquireActionRates").map(func(v): return Gs2ExperienceAcquireActionRate.from_dict(v))
    return ret


func to_dict() -> Dictionary:
    var ret = {}
    ret["namespaceName"] = namespace_name
    ret["experienceName"] = experience_name
    ret["description"] = description
    ret["metadata"] = metadata
    ret["defaultExperience"] = default_experience
    ret["defaultRankCap"] = default_rank_cap
    ret["maxRankCap"] = max_rank_cap
    ret["rankThresholdName"] = rank_threshold_name
    ret["acquireActionRates"] = null if acquire_action_rates == null else acquire_action_rates.map(func(v): return null if v == null else v.to_dict())
    return ret