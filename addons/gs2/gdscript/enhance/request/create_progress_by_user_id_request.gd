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
class_name Gs2EnhanceCreateProgressByUserIdRequest
extends Gs2Request


var namespace_name = null
var user_id = null
var rate_name = null
var target_item_set_id = null
var materials = null
var force = null
var time_offset_token = null
var duplication_avoider = null


func with_namespace_name(v) -> Gs2EnhanceCreateProgressByUserIdRequest:
    namespace_name = v
    return self


func with_user_id(v) -> Gs2EnhanceCreateProgressByUserIdRequest:
    user_id = v
    return self


func with_rate_name(v) -> Gs2EnhanceCreateProgressByUserIdRequest:
    rate_name = v
    return self


func with_target_item_set_id(v) -> Gs2EnhanceCreateProgressByUserIdRequest:
    target_item_set_id = v
    return self


func with_materials(v) -> Gs2EnhanceCreateProgressByUserIdRequest:
    materials = v
    return self


func with_force(v) -> Gs2EnhanceCreateProgressByUserIdRequest:
    force = v
    return self


func with_time_offset_token(v) -> Gs2EnhanceCreateProgressByUserIdRequest:
    time_offset_token = v
    return self


func with_duplication_avoider(v) -> Gs2EnhanceCreateProgressByUserIdRequest:
    duplication_avoider = v
    return self


static func from_dict(data) -> Gs2EnhanceCreateProgressByUserIdRequest:
    if data == null:
        return null
    var ret = Gs2EnhanceCreateProgressByUserIdRequest.new()
    ret.namespace_name = null if data.get("namespaceName") == null else str(data.get("namespaceName"))
    ret.user_id = null if data.get("userId") == null else str(data.get("userId"))
    ret.rate_name = null if data.get("rateName") == null else str(data.get("rateName"))
    ret.target_item_set_id = null if data.get("targetItemSetId") == null else str(data.get("targetItemSetId"))
    ret.materials = null if data.get("materials") == null else data.get("materials").map(func(v): return Gs2EnhanceMaterial.from_dict(v))
    ret.force = null if data.get("force") == null else bool(data.get("force"))
    ret.time_offset_token = null if data.get("timeOffsetToken") == null else str(data.get("timeOffsetToken"))
    return ret


func to_dict() -> Dictionary:
    var ret = {}
    ret["namespaceName"] = namespace_name
    ret["userId"] = user_id
    ret["rateName"] = rate_name
    ret["targetItemSetId"] = target_item_set_id
    ret["materials"] = null if materials == null else materials.map(func(v): return null if v == null else v.to_dict())
    ret["force"] = force
    ret["timeOffsetToken"] = time_offset_token
    return ret