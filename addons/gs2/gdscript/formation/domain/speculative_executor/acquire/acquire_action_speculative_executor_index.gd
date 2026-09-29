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
class_name Gs2FormationAcquireActionSpeculativeExecutorIndex
extends RefCounted


static func execute(
    gs2,
    access_token,
    acquire_action: Gs2AcquireAction,
    rate_value
) -> Gs2AsyncResult:
    var action_string = acquire_action.action
    action_string = action_string.replace("{region}", gs2.rest_session.region)
    action_string = action_string.replace("{ownerId}", "" if gs2.rest_session.owner_id == null else gs2.rest_session.owner_id)
    action_string = action_string.replace("{userId}", "" if access_token == null or access_token.user_id == null else access_token.user_id)
    acquire_action.action = action_string
    if Gs2FormationAddMoldCapacityByUserIdSpeculativeExecutor.action() == acquire_action.action:
        var request = Gs2FormationAddMoldCapacityByUserIdRequest.from_dict(JSON.parse_string(acquire_action.request))
        if rate_value != 1:
            request = Gs2FormationMoldAddMoldCapacityByUserIdExecutable.rate(request, rate_value)
        return await Gs2FormationAddMoldCapacityByUserIdSpeculativeExecutor.execute(
            gs2,
            access_token,
            request
        )
    if Gs2FormationSetMoldCapacityByUserIdSpeculativeExecutor.action() == acquire_action.action:
        var request = Gs2FormationSetMoldCapacityByUserIdRequest.from_dict(JSON.parse_string(acquire_action.request))
        if rate_value != 1:
            request = Gs2FormationMoldSetMoldCapacityByUserIdExecutable.rate(request, rate_value)
        return await Gs2FormationSetMoldCapacityByUserIdSpeculativeExecutor.execute(
            gs2,
            access_token,
            request
        )
    if Gs2FormationAcquireActionsToFormPropertiesSpeculativeExecutor.action() == acquire_action.action:
        var request = Gs2FormationAcquireActionsToFormPropertiesRequest.from_dict(JSON.parse_string(acquire_action.request))
        if rate_value != 1:
            request = Gs2FormationFormAcquireActionsToFormPropertiesExecutable.rate(request, rate_value)
        return await Gs2FormationAcquireActionsToFormPropertiesSpeculativeExecutor.execute(
            gs2,
            access_token,
            request
        )
    if Gs2FormationSetFormByUserIdSpeculativeExecutor.action() == acquire_action.action:
        var request = Gs2FormationSetFormByUserIdRequest.from_dict(JSON.parse_string(acquire_action.request))
        if rate_value != 1:
            request = Gs2FormationFormSetFormByUserIdExecutable.rate(request, rate_value)
        return await Gs2FormationSetFormByUserIdSpeculativeExecutor.execute(
            gs2,
            access_token,
            request
        )
    if Gs2FormationAcquireActionsToPropertyFormPropertiesSpeculativeExecutor.action() == acquire_action.action:
        var request = Gs2FormationAcquireActionsToPropertyFormPropertiesRequest.from_dict(JSON.parse_string(acquire_action.request))
        if rate_value != 1:
            request = Gs2FormationPropertyFormAcquireActionsToPropertyFormPropertiesExecutable.rate(request, rate_value)
        return await Gs2FormationAcquireActionsToPropertyFormPropertiesSpeculativeExecutor.execute(
            gs2,
            access_token,
            request
        )
    return Gs2AsyncResult.new(null, null)