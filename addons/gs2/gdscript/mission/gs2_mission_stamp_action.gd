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
class_name Gs2MissionStampAction
extends RefCounted


static func consume_action_to_request(action: Gs2ConsumeAction):
    if action.action == "Gs2Mission:ReceiveByUserId":
        return Gs2MissionReceiveByUserIdRequest.from_dict(JSON.parse_string(action.request))
    if action.action == "Gs2Mission:BatchReceiveByUserId":
        return Gs2MissionBatchReceiveByUserIdRequest.from_dict(JSON.parse_string(action.request))
    if action.action == "Gs2Mission:VerifyCompleteByUserId":
        return Gs2MissionVerifyCompleteByUserIdRequest.from_dict(JSON.parse_string(action.request))
    if action.action == "Gs2Mission:DecreaseCounterByUserId":
        return Gs2MissionDecreaseCounterByUserIdRequest.from_dict(JSON.parse_string(action.request))
    if action.action == "Gs2Mission:ResetCounterByUserId":
        return Gs2MissionResetCounterByUserIdRequest.from_dict(JSON.parse_string(action.request))
    if action.action == "Gs2Mission:VerifyCounterValueByUserId":
        return Gs2MissionVerifyCounterValueByUserIdRequest.from_dict(JSON.parse_string(action.request))
    push_error("unknown action %s" % str(action.action))
    return null


static func verify_action_to_request(action: Gs2VerifyAction):
    if action.action == "Gs2Mission:VerifyCompleteByUserId":
        return Gs2MissionVerifyCompleteByUserIdRequest.from_dict(JSON.parse_string(action.request))
    if action.action == "Gs2Mission:VerifyCounterValueByUserId":
        return Gs2MissionVerifyCounterValueByUserIdRequest.from_dict(JSON.parse_string(action.request))
    push_error("unknown action %s" % str(action.action))
    return null


static func acquire_action_to_request(action: Gs2AcquireAction):
    if action.action == "Gs2Mission:RevertReceiveByUserId":
        return Gs2MissionRevertReceiveByUserIdRequest.from_dict(JSON.parse_string(action.request))
    if action.action == "Gs2Mission:IncreaseCounterByUserId":
        return Gs2MissionIncreaseCounterByUserIdRequest.from_dict(JSON.parse_string(action.request))
    if action.action == "Gs2Mission:SetCounterByUserId":
        return Gs2MissionSetCounterByUserIdRequest.from_dict(JSON.parse_string(action.request))
    push_error("unknown action %s" % str(action.action))
    return null