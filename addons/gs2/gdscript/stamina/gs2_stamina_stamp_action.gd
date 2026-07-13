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
class_name Gs2StaminaStampAction
extends RefCounted


static func consume_action_to_request(action: Gs2ConsumeAction):
    if action.action == "Gs2Stamina:DecreaseMaxValueByUserId":
        return Gs2StaminaDecreaseMaxValueByUserIdRequest.from_dict(JSON.parse_string(action.request))
    if action.action == "Gs2Stamina:ConsumeStaminaByUserId":
        return Gs2StaminaConsumeStaminaByUserIdRequest.from_dict(JSON.parse_string(action.request))
    if action.action == "Gs2Stamina:VerifyStaminaValueByUserId":
        return Gs2StaminaVerifyStaminaValueByUserIdRequest.from_dict(JSON.parse_string(action.request))
    if action.action == "Gs2Stamina:VerifyStaminaMaxValueByUserId":
        return Gs2StaminaVerifyStaminaMaxValueByUserIdRequest.from_dict(JSON.parse_string(action.request))
    if action.action == "Gs2Stamina:VerifyStaminaRecoverIntervalMinutesByUserId":
        return Gs2StaminaVerifyStaminaRecoverIntervalMinutesByUserIdRequest.from_dict(JSON.parse_string(action.request))
    if action.action == "Gs2Stamina:VerifyStaminaRecoverValueByUserId":
        return Gs2StaminaVerifyStaminaRecoverValueByUserIdRequest.from_dict(JSON.parse_string(action.request))
    if action.action == "Gs2Stamina:VerifyStaminaOverflowValueByUserId":
        return Gs2StaminaVerifyStaminaOverflowValueByUserIdRequest.from_dict(JSON.parse_string(action.request))
    push_error("unknown action %s" % str(action.action))
    return null


static func verify_action_to_request(action: Gs2VerifyAction):
    if action.action == "Gs2Stamina:VerifyStaminaValueByUserId":
        return Gs2StaminaVerifyStaminaValueByUserIdRequest.from_dict(JSON.parse_string(action.request))
    if action.action == "Gs2Stamina:VerifyStaminaMaxValueByUserId":
        return Gs2StaminaVerifyStaminaMaxValueByUserIdRequest.from_dict(JSON.parse_string(action.request))
    if action.action == "Gs2Stamina:VerifyStaminaRecoverIntervalMinutesByUserId":
        return Gs2StaminaVerifyStaminaRecoverIntervalMinutesByUserIdRequest.from_dict(JSON.parse_string(action.request))
    if action.action == "Gs2Stamina:VerifyStaminaRecoverValueByUserId":
        return Gs2StaminaVerifyStaminaRecoverValueByUserIdRequest.from_dict(JSON.parse_string(action.request))
    if action.action == "Gs2Stamina:VerifyStaminaOverflowValueByUserId":
        return Gs2StaminaVerifyStaminaOverflowValueByUserIdRequest.from_dict(JSON.parse_string(action.request))
    push_error("unknown action %s" % str(action.action))
    return null


static func acquire_action_to_request(action: Gs2AcquireAction):
    if action.action == "Gs2Stamina:RecoverStaminaByUserId":
        return Gs2StaminaRecoverStaminaByUserIdRequest.from_dict(JSON.parse_string(action.request))
    if action.action == "Gs2Stamina:RaiseMaxValueByUserId":
        return Gs2StaminaRaiseMaxValueByUserIdRequest.from_dict(JSON.parse_string(action.request))
    if action.action == "Gs2Stamina:SetMaxValueByUserId":
        return Gs2StaminaSetMaxValueByUserIdRequest.from_dict(JSON.parse_string(action.request))
    if action.action == "Gs2Stamina:SetRecoverIntervalByUserId":
        return Gs2StaminaSetRecoverIntervalByUserIdRequest.from_dict(JSON.parse_string(action.request))
    if action.action == "Gs2Stamina:SetRecoverValueByUserId":
        return Gs2StaminaSetRecoverValueByUserIdRequest.from_dict(JSON.parse_string(action.request))
    push_error("unknown action %s" % str(action.action))
    return null