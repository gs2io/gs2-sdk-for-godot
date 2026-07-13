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
class_name Gs2ExperienceAcquireActionSpeculativeExecutorIndex
extends RefCounted


# 戻り値: Gs2AsyncResult (result = コミット用 Callable / null)
static func execute(
    gs2: Gs2Domain,
    access_token,
    acquire_action: Gs2AcquireAction,
    rate_value
) -> Gs2AsyncResult:
    var action_string = acquire_action.action
    action_string = action_string.replace("{region}", gs2.rest_session.region)
    action_string = action_string.replace("{ownerId}", "" if gs2.rest_session.owner_id == null else gs2.rest_session.owner_id)
    action_string = action_string.replace("{userId}", "" if access_token == null or access_token.user_id == null else access_token.user_id)
    acquire_action.action = action_string
    if Gs2ExperienceAddExperienceByUserIdSpeculativeExecutor.action() == acquire_action.action:
        var request = Gs2ExperienceAddExperienceByUserIdRequest.from_dict(JSON.parse_string(acquire_action.request))
        if rate_value != 1:
            request = Gs2ExperienceStatusAddExperienceByUserIdExecutable.rate(request, rate_value)
        return await Gs2ExperienceAddExperienceByUserIdSpeculativeExecutor.execute(
            gs2,
            access_token,
            request
        )
    if Gs2ExperienceSetExperienceByUserIdSpeculativeExecutor.action() == acquire_action.action:
        var request = Gs2ExperienceSetExperienceByUserIdRequest.from_dict(JSON.parse_string(acquire_action.request))
        if rate_value != 1:
            request = Gs2ExperienceStatusSetExperienceByUserIdExecutable.rate(request, rate_value)
        return await Gs2ExperienceSetExperienceByUserIdSpeculativeExecutor.execute(
            gs2,
            access_token,
            request
        )
    if Gs2ExperienceAddRankCapByUserIdSpeculativeExecutor.action() == acquire_action.action:
        var request = Gs2ExperienceAddRankCapByUserIdRequest.from_dict(JSON.parse_string(acquire_action.request))
        if rate_value != 1:
            request = Gs2ExperienceStatusAddRankCapByUserIdExecutable.rate(request, rate_value)
        return await Gs2ExperienceAddRankCapByUserIdSpeculativeExecutor.execute(
            gs2,
            access_token,
            request
        )
    if Gs2ExperienceSetRankCapByUserIdSpeculativeExecutor.action() == acquire_action.action:
        var request = Gs2ExperienceSetRankCapByUserIdRequest.from_dict(JSON.parse_string(acquire_action.request))
        if rate_value != 1:
            request = Gs2ExperienceStatusSetRankCapByUserIdExecutable.rate(request, rate_value)
        return await Gs2ExperienceSetRankCapByUserIdSpeculativeExecutor.execute(
            gs2,
            access_token,
            request
        )
    if Gs2ExperienceMultiplyAcquireActionsByUserIdSpeculativeExecutor.action() == acquire_action.action:
        var request = Gs2ExperienceMultiplyAcquireActionsByUserIdRequest.from_dict(JSON.parse_string(acquire_action.request))
        if rate_value != 1:
            request = Gs2ExperienceStatusMultiplyAcquireActionsByUserIdExecutable.rate(request, rate_value)
        return await Gs2ExperienceMultiplyAcquireActionsByUserIdSpeculativeExecutor.execute(
            gs2,
            access_token,
            request
        )
    return Gs2AsyncResult.new(null, null)