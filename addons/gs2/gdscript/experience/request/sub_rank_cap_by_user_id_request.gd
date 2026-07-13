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
class_name Gs2ExperienceSubRankCapByUserIdRequest
extends Gs2Request


var namespace_name = null
var user_id = null
var experience_name = null
var property_id = null
var rank_cap_value = null
var time_offset_token = null
var duplication_avoider = null


func with_namespace_name(v) -> Gs2ExperienceSubRankCapByUserIdRequest:
    namespace_name = v
    return self


func with_user_id(v) -> Gs2ExperienceSubRankCapByUserIdRequest:
    user_id = v
    return self


func with_experience_name(v) -> Gs2ExperienceSubRankCapByUserIdRequest:
    experience_name = v
    return self


func with_property_id(v) -> Gs2ExperienceSubRankCapByUserIdRequest:
    property_id = v
    return self


func with_rank_cap_value(v) -> Gs2ExperienceSubRankCapByUserIdRequest:
    rank_cap_value = v
    return self


func with_time_offset_token(v) -> Gs2ExperienceSubRankCapByUserIdRequest:
    time_offset_token = v
    return self


func with_duplication_avoider(v) -> Gs2ExperienceSubRankCapByUserIdRequest:
    duplication_avoider = v
    return self


static func from_dict(data) -> Gs2ExperienceSubRankCapByUserIdRequest:
    if data == null:
        return null
    var ret = Gs2ExperienceSubRankCapByUserIdRequest.new()
    ret.namespace_name = null if data.get("namespaceName") == null else str(data.get("namespaceName"))
    ret.user_id = null if data.get("userId") == null else str(data.get("userId"))
    ret.experience_name = null if data.get("experienceName") == null else str(data.get("experienceName"))
    ret.property_id = null if data.get("propertyId") == null else str(data.get("propertyId"))
    ret.rank_cap_value = null if data.get("rankCapValue") == null else int(data.get("rankCapValue"))
    ret.time_offset_token = null if data.get("timeOffsetToken") == null else str(data.get("timeOffsetToken"))
    return ret


func to_dict() -> Dictionary:
    var ret = {}
    ret["namespaceName"] = namespace_name
    ret["userId"] = user_id
    ret["experienceName"] = experience_name
    ret["propertyId"] = property_id
    ret["rankCapValue"] = rank_cap_value
    ret["timeOffsetToken"] = time_offset_token
    return ret