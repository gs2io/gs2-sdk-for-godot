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
class_name Gs2AuthFederationRequest
extends Gs2Request


var original_user_id = null
var user_id = null
var policy_document = null
var time_offset = null
var time_offset_token = null


func with_original_user_id(v) -> Gs2AuthFederationRequest:
    original_user_id = v
    return self


func with_user_id(v) -> Gs2AuthFederationRequest:
    user_id = v
    return self


func with_policy_document(v) -> Gs2AuthFederationRequest:
    policy_document = v
    return self


func with_time_offset(v) -> Gs2AuthFederationRequest:
    time_offset = v
    return self


func with_time_offset_token(v) -> Gs2AuthFederationRequest:
    time_offset_token = v
    return self


static func from_dict(data) -> Gs2AuthFederationRequest:
    if data == null:
        return null
    var ret = Gs2AuthFederationRequest.new()
    ret.original_user_id = null if data.get("originalUserId") == null else str(data.get("originalUserId"))
    ret.user_id = null if data.get("userId") == null else str(data.get("userId"))
    ret.policy_document = null if data.get("policyDocument") == null else str(data.get("policyDocument"))
    ret.time_offset = null if data.get("timeOffset") == null else int(data.get("timeOffset"))
    ret.time_offset_token = null if data.get("timeOffsetToken") == null else str(data.get("timeOffsetToken"))
    return ret


func to_dict() -> Dictionary:
    var ret = {}
    ret["originalUserId"] = original_user_id
    ret["userId"] = user_id
    ret["policyDocument"] = policy_document
    ret["timeOffset"] = time_offset
    ret["timeOffsetToken"] = time_offset_token
    return ret