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
class_name Gs2InventoryAcquireActionSpeculativeExecutorIndex
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
    if Gs2InventoryAddCapacityByUserIdSpeculativeExecutor.action() == acquire_action.action:
        var request = Gs2InventoryAddCapacityByUserIdRequest.from_dict(JSON.parse_string(acquire_action.request))
        if rate_value != 1:
            request = Gs2InventoryInventoryAddCapacityByUserIdExecutable.rate(request, rate_value)
        return await Gs2InventoryAddCapacityByUserIdSpeculativeExecutor.execute(
            gs2,
            access_token,
            request
        )
    if Gs2InventorySetCapacityByUserIdSpeculativeExecutor.action() == acquire_action.action:
        var request = Gs2InventorySetCapacityByUserIdRequest.from_dict(JSON.parse_string(acquire_action.request))
        if rate_value != 1:
            request = Gs2InventoryInventorySetCapacityByUserIdExecutable.rate(request, rate_value)
        return await Gs2InventorySetCapacityByUserIdSpeculativeExecutor.execute(
            gs2,
            access_token,
            request
        )
    if Gs2InventoryAcquireItemSetByUserIdSpeculativeExecutor.action() == acquire_action.action:
        var request = Gs2InventoryAcquireItemSetByUserIdRequest.from_dict(JSON.parse_string(acquire_action.request))
        if rate_value != 1:
            request = Gs2InventoryItemSetAcquireItemSetByUserIdExecutable.rate(request, rate_value)
        return await Gs2InventoryAcquireItemSetByUserIdSpeculativeExecutor.execute(
            gs2,
            access_token,
            request
        )
    if Gs2InventoryAcquireItemSetWithGradeByUserIdSpeculativeExecutor.action() == acquire_action.action:
        var request = Gs2InventoryAcquireItemSetWithGradeByUserIdRequest.from_dict(JSON.parse_string(acquire_action.request))
        if rate_value != 1:
            request = Gs2InventoryItemSetAcquireItemSetWithGradeByUserIdExecutable.rate(request, rate_value)
        return await Gs2InventoryAcquireItemSetWithGradeByUserIdSpeculativeExecutor.execute(
            gs2,
            access_token,
            request
        )
    if Gs2InventoryAddReferenceOfByUserIdSpeculativeExecutor.action() == acquire_action.action:
        var request = Gs2InventoryAddReferenceOfByUserIdRequest.from_dict(JSON.parse_string(acquire_action.request))
        if rate_value != 1:
            request = Gs2InventoryReferenceOfAddReferenceOfByUserIdExecutable.rate(request, rate_value)
        return await Gs2InventoryAddReferenceOfByUserIdSpeculativeExecutor.execute(
            gs2,
            access_token,
            request
        )
    if Gs2InventoryDeleteReferenceOfByUserIdSpeculativeExecutor.action() == acquire_action.action:
        var request = Gs2InventoryDeleteReferenceOfByUserIdRequest.from_dict(JSON.parse_string(acquire_action.request))
        if rate_value != 1:
            request = Gs2InventoryReferenceOfDeleteReferenceOfByUserIdExecutable.rate(request, rate_value)
        return await Gs2InventoryDeleteReferenceOfByUserIdSpeculativeExecutor.execute(
            gs2,
            access_token,
            request
        )
    if Gs2InventoryAcquireSimpleItemsByUserIdSpeculativeExecutor.action() == acquire_action.action:
        var request = Gs2InventoryAcquireSimpleItemsByUserIdRequest.from_dict(JSON.parse_string(acquire_action.request))
        if rate_value != 1:
            request = Gs2InventorySimpleItemAcquireSimpleItemsByUserIdExecutable.rate(request, rate_value)
        return await Gs2InventoryAcquireSimpleItemsByUserIdSpeculativeExecutor.execute(
            gs2,
            access_token,
            request
        )
    if Gs2InventorySetSimpleItemsByUserIdSpeculativeExecutor.action() == acquire_action.action:
        var request = Gs2InventorySetSimpleItemsByUserIdRequest.from_dict(JSON.parse_string(acquire_action.request))
        if rate_value != 1:
            request = Gs2InventorySimpleItemSetSimpleItemsByUserIdExecutable.rate(request, rate_value)
        return await Gs2InventorySetSimpleItemsByUserIdSpeculativeExecutor.execute(
            gs2,
            access_token,
            request
        )
    if Gs2InventoryAcquireBigItemByUserIdSpeculativeExecutor.action() == acquire_action.action:
        var request = Gs2InventoryAcquireBigItemByUserIdRequest.from_dict(JSON.parse_string(acquire_action.request))
        if rate_value != 1:
            request = Gs2InventoryBigItemAcquireBigItemByUserIdExecutable.rate(request, rate_value)
        return await Gs2InventoryAcquireBigItemByUserIdSpeculativeExecutor.execute(
            gs2,
            access_token,
            request
        )
    if Gs2InventorySetBigItemByUserIdSpeculativeExecutor.action() == acquire_action.action:
        var request = Gs2InventorySetBigItemByUserIdRequest.from_dict(JSON.parse_string(acquire_action.request))
        if rate_value != 1:
            request = Gs2InventoryBigItemSetBigItemByUserIdExecutable.rate(request, rate_value)
        return await Gs2InventorySetBigItemByUserIdSpeculativeExecutor.execute(
            gs2,
            access_token,
            request
        )
    return Gs2AsyncResult.new(null, null)