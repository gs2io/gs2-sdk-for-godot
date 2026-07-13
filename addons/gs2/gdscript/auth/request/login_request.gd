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
class_name Gs2AuthLoginRequest
extends Gs2Request


var user_id = null
var time_offset = null
var time_offset_token = null


func with_user_id(v) -> Gs2AuthLoginRequest:
    user_id = v
    return self


func with_time_offset(v) -> Gs2AuthLoginRequest:
    time_offset = v
    return self


func with_time_offset_token(v) -> Gs2AuthLoginRequest:
    time_offset_token = v
    return self


static func from_dict(data) -> Gs2AuthLoginRequest:
    if data == null:
        return null
    var ret = Gs2AuthLoginRequest.new()
    ret.user_id = null if data.get("userId") == null else str(data.get("userId"))
    ret.time_offset = null if data.get("timeOffset") == null else int(data.get("timeOffset"))
    ret.time_offset_token = null if data.get("timeOffsetToken") == null else str(data.get("timeOffsetToken"))
    return ret


func to_dict() -> Dictionary:
    var ret = {}
    ret["userId"] = user_id
    ret["timeOffset"] = time_offset
    ret["timeOffsetToken"] = time_offset_token
    return ret