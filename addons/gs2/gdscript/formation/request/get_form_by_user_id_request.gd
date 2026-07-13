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
class_name Gs2FormationGetFormByUserIdRequest
extends Gs2Request


var namespace_name = null
var user_id = null
var mold_model_name = null
var index = null
var time_offset_token = null


func with_namespace_name(v) -> Gs2FormationGetFormByUserIdRequest:
    namespace_name = v
    return self


func with_user_id(v) -> Gs2FormationGetFormByUserIdRequest:
    user_id = v
    return self


func with_mold_model_name(v) -> Gs2FormationGetFormByUserIdRequest:
    mold_model_name = v
    return self


func with_index(v) -> Gs2FormationGetFormByUserIdRequest:
    index = v
    return self


func with_time_offset_token(v) -> Gs2FormationGetFormByUserIdRequest:
    time_offset_token = v
    return self


static func from_dict(data) -> Gs2FormationGetFormByUserIdRequest:
    if data == null:
        return null
    var ret = Gs2FormationGetFormByUserIdRequest.new()
    ret.namespace_name = null if data.get("namespaceName") == null else str(data.get("namespaceName"))
    ret.user_id = null if data.get("userId") == null else str(data.get("userId"))
    ret.mold_model_name = null if data.get("moldModelName") == null else str(data.get("moldModelName"))
    ret.index = null if data.get("index") == null else int(data.get("index"))
    ret.time_offset_token = null if data.get("timeOffsetToken") == null else str(data.get("timeOffsetToken"))
    return ret


func to_dict() -> Dictionary:
    var ret = {}
    ret["namespaceName"] = namespace_name
    ret["userId"] = user_id
    ret["moldModelName"] = mold_model_name
    ret["index"] = index
    ret["timeOffsetToken"] = time_offset_token
    return ret