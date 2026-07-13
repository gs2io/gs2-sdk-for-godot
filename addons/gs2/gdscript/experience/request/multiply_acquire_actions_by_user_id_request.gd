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
class_name Gs2ExperienceMultiplyAcquireActionsByUserIdRequest
extends Gs2Request


var namespace_name = null
var user_id = null
var experience_name = null
var property_id = null
var rate_name = null
var acquire_actions = null
var base_rate = null
var time_offset_token = null
var duplication_avoider = null


func with_namespace_name(v) -> Gs2ExperienceMultiplyAcquireActionsByUserIdRequest:
    namespace_name = v
    return self


func with_user_id(v) -> Gs2ExperienceMultiplyAcquireActionsByUserIdRequest:
    user_id = v
    return self


func with_experience_name(v) -> Gs2ExperienceMultiplyAcquireActionsByUserIdRequest:
    experience_name = v
    return self


func with_property_id(v) -> Gs2ExperienceMultiplyAcquireActionsByUserIdRequest:
    property_id = v
    return self


func with_rate_name(v) -> Gs2ExperienceMultiplyAcquireActionsByUserIdRequest:
    rate_name = v
    return self


func with_acquire_actions(v) -> Gs2ExperienceMultiplyAcquireActionsByUserIdRequest:
    acquire_actions = v
    return self


func with_base_rate(v) -> Gs2ExperienceMultiplyAcquireActionsByUserIdRequest:
    base_rate = v
    return self


func with_time_offset_token(v) -> Gs2ExperienceMultiplyAcquireActionsByUserIdRequest:
    time_offset_token = v
    return self


func with_duplication_avoider(v) -> Gs2ExperienceMultiplyAcquireActionsByUserIdRequest:
    duplication_avoider = v
    return self


static func from_dict(data) -> Gs2ExperienceMultiplyAcquireActionsByUserIdRequest:
    if data == null:
        return null
    var ret = Gs2ExperienceMultiplyAcquireActionsByUserIdRequest.new()
    ret.namespace_name = null if data.get("namespaceName") == null else str(data.get("namespaceName"))
    ret.user_id = null if data.get("userId") == null else str(data.get("userId"))
    ret.experience_name = null if data.get("experienceName") == null else str(data.get("experienceName"))
    ret.property_id = null if data.get("propertyId") == null else str(data.get("propertyId"))
    ret.rate_name = null if data.get("rateName") == null else str(data.get("rateName"))
    ret.acquire_actions = null if data.get("acquireActions") == null else data.get("acquireActions").map(func(v): return Gs2AcquireAction.from_dict(v))
    ret.base_rate = null if data.get("baseRate") == null else float(data.get("baseRate"))
    ret.time_offset_token = null if data.get("timeOffsetToken") == null else str(data.get("timeOffsetToken"))
    return ret


func to_dict() -> Dictionary:
    var ret = {}
    ret["namespaceName"] = namespace_name
    ret["userId"] = user_id
    ret["experienceName"] = experience_name
    ret["propertyId"] = property_id
    ret["rateName"] = rate_name
    ret["acquireActions"] = null if acquire_actions == null else acquire_actions.map(func(v): return null if v == null else v.to_dict())
    ret["baseRate"] = base_rate
    ret["timeOffsetToken"] = time_offset_token
    return ret