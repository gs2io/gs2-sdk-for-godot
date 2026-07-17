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
class_name Gs2EnchantAcquireActionSpeculativeExecutorIndex
extends RefCounted


# 戻り値: Gs2AsyncResult (result = コミット用 Callable / null)
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
    if Gs2EnchantReDrawBalanceParameterStatusByUserIdSpeculativeExecutor.action() == acquire_action.action:
        var request = Gs2EnchantReDrawBalanceParameterStatusByUserIdRequest.from_dict(JSON.parse_string(acquire_action.request))
        if rate_value != 1:
            request = Gs2EnchantBalanceParameterStatusReDrawBalanceParameterStatusByUserIdExecutable.rate(request, rate_value)
        return await Gs2EnchantReDrawBalanceParameterStatusByUserIdSpeculativeExecutor.execute(
            gs2,
            access_token,
            request
        )
    if Gs2EnchantSetBalanceParameterStatusByUserIdSpeculativeExecutor.action() == acquire_action.action:
        var request = Gs2EnchantSetBalanceParameterStatusByUserIdRequest.from_dict(JSON.parse_string(acquire_action.request))
        if rate_value != 1:
            request = Gs2EnchantBalanceParameterStatusSetBalanceParameterStatusByUserIdExecutable.rate(request, rate_value)
        return await Gs2EnchantSetBalanceParameterStatusByUserIdSpeculativeExecutor.execute(
            gs2,
            access_token,
            request
        )
    if Gs2EnchantReDrawRarityParameterStatusByUserIdSpeculativeExecutor.action() == acquire_action.action:
        var request = Gs2EnchantReDrawRarityParameterStatusByUserIdRequest.from_dict(JSON.parse_string(acquire_action.request))
        if rate_value != 1:
            request = Gs2EnchantRarityParameterStatusReDrawRarityParameterStatusByUserIdExecutable.rate(request, rate_value)
        return await Gs2EnchantReDrawRarityParameterStatusByUserIdSpeculativeExecutor.execute(
            gs2,
            access_token,
            request
        )
    if Gs2EnchantAddRarityParameterStatusByUserIdSpeculativeExecutor.action() == acquire_action.action:
        var request = Gs2EnchantAddRarityParameterStatusByUserIdRequest.from_dict(JSON.parse_string(acquire_action.request))
        if rate_value != 1:
            request = Gs2EnchantRarityParameterStatusAddRarityParameterStatusByUserIdExecutable.rate(request, rate_value)
        return await Gs2EnchantAddRarityParameterStatusByUserIdSpeculativeExecutor.execute(
            gs2,
            access_token,
            request
        )
    if Gs2EnchantSetRarityParameterStatusByUserIdSpeculativeExecutor.action() == acquire_action.action:
        var request = Gs2EnchantSetRarityParameterStatusByUserIdRequest.from_dict(JSON.parse_string(acquire_action.request))
        if rate_value != 1:
            request = Gs2EnchantRarityParameterStatusSetRarityParameterStatusByUserIdExecutable.rate(request, rate_value)
        return await Gs2EnchantSetRarityParameterStatusByUserIdSpeculativeExecutor.execute(
            gs2,
            access_token,
            request
        )
    return Gs2AsyncResult.new(null, null)