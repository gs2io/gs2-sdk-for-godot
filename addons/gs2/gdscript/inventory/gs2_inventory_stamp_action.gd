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
class_name Gs2InventoryStampAction
extends RefCounted


static func consume_action_to_request(action: Gs2ConsumeAction):
    if action.action == "Gs2Inventory:VerifyInventoryCurrentMaxCapacityByUserId":
        return Gs2InventoryVerifyInventoryCurrentMaxCapacityByUserIdRequest.from_dict(JSON.parse_string(action.request))
    if action.action == "Gs2Inventory:ConsumeItemSetByUserId":
        return Gs2InventoryConsumeItemSetByUserIdRequest.from_dict(JSON.parse_string(action.request))
    if action.action == "Gs2Inventory:VerifyItemSetByUserId":
        return Gs2InventoryVerifyItemSetByUserIdRequest.from_dict(JSON.parse_string(action.request))
    if action.action == "Gs2Inventory:VerifyReferenceOfByUserId":
        return Gs2InventoryVerifyReferenceOfByUserIdRequest.from_dict(JSON.parse_string(action.request))
    if action.action == "Gs2Inventory:ConsumeSimpleItemsByUserId":
        return Gs2InventoryConsumeSimpleItemsByUserIdRequest.from_dict(JSON.parse_string(action.request))
    if action.action == "Gs2Inventory:VerifySimpleItemByUserId":
        return Gs2InventoryVerifySimpleItemByUserIdRequest.from_dict(JSON.parse_string(action.request))
    if action.action == "Gs2Inventory:ConsumeBigItemByUserId":
        return Gs2InventoryConsumeBigItemByUserIdRequest.from_dict(JSON.parse_string(action.request))
    if action.action == "Gs2Inventory:VerifyBigItemByUserId":
        return Gs2InventoryVerifyBigItemByUserIdRequest.from_dict(JSON.parse_string(action.request))
    push_error("unknown action %s" % str(action.action))
    return null


static func verify_action_to_request(action: Gs2VerifyAction):
    if action.action == "Gs2Inventory:VerifyInventoryCurrentMaxCapacityByUserId":
        return Gs2InventoryVerifyInventoryCurrentMaxCapacityByUserIdRequest.from_dict(JSON.parse_string(action.request))
    if action.action == "Gs2Inventory:VerifyItemSetByUserId":
        return Gs2InventoryVerifyItemSetByUserIdRequest.from_dict(JSON.parse_string(action.request))
    if action.action == "Gs2Inventory:VerifyReferenceOfByUserId":
        return Gs2InventoryVerifyReferenceOfByUserIdRequest.from_dict(JSON.parse_string(action.request))
    if action.action == "Gs2Inventory:VerifySimpleItemByUserId":
        return Gs2InventoryVerifySimpleItemByUserIdRequest.from_dict(JSON.parse_string(action.request))
    if action.action == "Gs2Inventory:VerifyBigItemByUserId":
        return Gs2InventoryVerifyBigItemByUserIdRequest.from_dict(JSON.parse_string(action.request))
    push_error("unknown action %s" % str(action.action))
    return null


static func acquire_action_to_request(action: Gs2AcquireAction):
    if action.action == "Gs2Inventory:AddCapacityByUserId":
        return Gs2InventoryAddCapacityByUserIdRequest.from_dict(JSON.parse_string(action.request))
    if action.action == "Gs2Inventory:SetCapacityByUserId":
        return Gs2InventorySetCapacityByUserIdRequest.from_dict(JSON.parse_string(action.request))
    if action.action == "Gs2Inventory:AcquireItemSetByUserId":
        return Gs2InventoryAcquireItemSetByUserIdRequest.from_dict(JSON.parse_string(action.request))
    if action.action == "Gs2Inventory:AcquireItemSetWithGradeByUserId":
        return Gs2InventoryAcquireItemSetWithGradeByUserIdRequest.from_dict(JSON.parse_string(action.request))
    if action.action == "Gs2Inventory:AddReferenceOfByUserId":
        return Gs2InventoryAddReferenceOfByUserIdRequest.from_dict(JSON.parse_string(action.request))
    if action.action == "Gs2Inventory:DeleteReferenceOfByUserId":
        return Gs2InventoryDeleteReferenceOfByUserIdRequest.from_dict(JSON.parse_string(action.request))
    if action.action == "Gs2Inventory:AcquireSimpleItemsByUserId":
        return Gs2InventoryAcquireSimpleItemsByUserIdRequest.from_dict(JSON.parse_string(action.request))
    if action.action == "Gs2Inventory:SetSimpleItemsByUserId":
        return Gs2InventorySetSimpleItemsByUserIdRequest.from_dict(JSON.parse_string(action.request))
    if action.action == "Gs2Inventory:AcquireBigItemByUserId":
        return Gs2InventoryAcquireBigItemByUserIdRequest.from_dict(JSON.parse_string(action.request))
    if action.action == "Gs2Inventory:SetBigItemByUserId":
        return Gs2InventorySetBigItemByUserIdRequest.from_dict(JSON.parse_string(action.request))
    push_error("unknown action %s" % str(action.action))
    return null