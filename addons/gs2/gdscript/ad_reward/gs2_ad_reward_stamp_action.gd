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
class_name Gs2AdRewardStampAction
extends RefCounted


static func consume_action_to_request(action: Gs2ConsumeAction):
    if action.action == "Gs2AdReward:ConsumePointByUserId":
        return Gs2AdRewardConsumePointByUserIdRequest.from_dict(JSON.parse_string(action.request))
    push_error("unknown action %s" % str(action.action))
    return null


static func verify_action_to_request(action: Gs2VerifyAction):
    push_error("unknown action %s" % str(action.action))
    return null


static func acquire_action_to_request(action: Gs2AcquireAction):
    if action.action == "Gs2AdReward:AcquirePointByUserId":
        return Gs2AdRewardAcquirePointByUserIdRequest.from_dict(JSON.parse_string(action.request))
    push_error("unknown action %s" % str(action.action))
    return null