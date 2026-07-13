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
class_name Gs2StaminaVerifyActionSpeculativeExecutorIndex
extends RefCounted


# 戻り値: Gs2AsyncResult (result = コミット用 Callable / null)
static func execute(
    gs2: Gs2Domain,
    access_token,
    verify_action: Gs2VerifyAction,
    rate_value
) -> Gs2AsyncResult:
    var action_string = verify_action.action
    action_string = action_string.replace("{region}", gs2.rest_session.region)
    action_string = action_string.replace("{ownerId}", "" if gs2.rest_session.owner_id == null else gs2.rest_session.owner_id)
    action_string = action_string.replace("{userId}", "" if access_token == null or access_token.user_id == null else access_token.user_id)
    verify_action.action = action_string
    if Gs2StaminaVerifyStaminaValueByUserIdSpeculativeExecutor.action() == verify_action.action:
        var request = Gs2StaminaVerifyStaminaValueByUserIdRequest.from_dict(JSON.parse_string(verify_action.request))
        if rate_value != 1:
            request = Gs2StaminaStaminaVerifyStaminaValueByUserIdExecutable.rate(request, rate_value)
        return await Gs2StaminaVerifyStaminaValueByUserIdSpeculativeExecutor.execute(
            gs2,
            access_token,
            request
        )
    if Gs2StaminaVerifyStaminaMaxValueByUserIdSpeculativeExecutor.action() == verify_action.action:
        var request = Gs2StaminaVerifyStaminaMaxValueByUserIdRequest.from_dict(JSON.parse_string(verify_action.request))
        if rate_value != 1:
            request = Gs2StaminaStaminaVerifyStaminaMaxValueByUserIdExecutable.rate(request, rate_value)
        return await Gs2StaminaVerifyStaminaMaxValueByUserIdSpeculativeExecutor.execute(
            gs2,
            access_token,
            request
        )
    if Gs2StaminaVerifyStaminaRecoverIntervalMinutesByUserIdSpeculativeExecutor.action() == verify_action.action:
        var request = Gs2StaminaVerifyStaminaRecoverIntervalMinutesByUserIdRequest.from_dict(JSON.parse_string(verify_action.request))
        if rate_value != 1:
            request = Gs2StaminaStaminaVerifyStaminaRecoverIntervalMinutesByUserIdExecutable.rate(request, rate_value)
        return await Gs2StaminaVerifyStaminaRecoverIntervalMinutesByUserIdSpeculativeExecutor.execute(
            gs2,
            access_token,
            request
        )
    if Gs2StaminaVerifyStaminaRecoverValueByUserIdSpeculativeExecutor.action() == verify_action.action:
        var request = Gs2StaminaVerifyStaminaRecoverValueByUserIdRequest.from_dict(JSON.parse_string(verify_action.request))
        if rate_value != 1:
            request = Gs2StaminaStaminaVerifyStaminaRecoverValueByUserIdExecutable.rate(request, rate_value)
        return await Gs2StaminaVerifyStaminaRecoverValueByUserIdSpeculativeExecutor.execute(
            gs2,
            access_token,
            request
        )
    if Gs2StaminaVerifyStaminaOverflowValueByUserIdSpeculativeExecutor.action() == verify_action.action:
        var request = Gs2StaminaVerifyStaminaOverflowValueByUserIdRequest.from_dict(JSON.parse_string(verify_action.request))
        if rate_value != 1:
            request = Gs2StaminaStaminaVerifyStaminaOverflowValueByUserIdExecutable.rate(request, rate_value)
        return await Gs2StaminaVerifyStaminaOverflowValueByUserIdSpeculativeExecutor.execute(
            gs2,
            access_token,
            request
        )
    return Gs2AsyncResult.new(null, null)