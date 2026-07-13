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
class_name Gs2LimitStampAction
extends RefCounted


static func consume_action_to_request(action: Gs2ConsumeAction):
    if action.action == "Gs2Limit:CountUpByUserId":
        return Gs2LimitCountUpByUserIdRequest.from_dict(JSON.parse_string(action.request))
    if action.action == "Gs2Limit:VerifyCounterByUserId":
        return Gs2LimitVerifyCounterByUserIdRequest.from_dict(JSON.parse_string(action.request))
    push_error("unknown action %s" % str(action.action))
    return null


static func verify_action_to_request(action: Gs2VerifyAction):
    if action.action == "Gs2Limit:VerifyCounterByUserId":
        return Gs2LimitVerifyCounterByUserIdRequest.from_dict(JSON.parse_string(action.request))
    push_error("unknown action %s" % str(action.action))
    return null


static func acquire_action_to_request(action: Gs2AcquireAction):
    if action.action == "Gs2Limit:CountDownByUserId":
        return Gs2LimitCountDownByUserIdRequest.from_dict(JSON.parse_string(action.request))
    if action.action == "Gs2Limit:DeleteCounterByUserId":
        return Gs2LimitDeleteCounterByUserIdRequest.from_dict(JSON.parse_string(action.request))
    push_error("unknown action %s" % str(action.action))
    return null