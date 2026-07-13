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
class_name Gs2FormationSubMoldCapacityRequest
extends Gs2Request


var namespace_name = null
var access_token = null
var mold_model_name = null
var capacity = null
var duplication_avoider = null


func with_namespace_name(v) -> Gs2FormationSubMoldCapacityRequest:
    namespace_name = v
    return self


func with_access_token(v) -> Gs2FormationSubMoldCapacityRequest:
    access_token = v
    return self


func with_mold_model_name(v) -> Gs2FormationSubMoldCapacityRequest:
    mold_model_name = v
    return self


func with_capacity(v) -> Gs2FormationSubMoldCapacityRequest:
    capacity = v
    return self


func with_duplication_avoider(v) -> Gs2FormationSubMoldCapacityRequest:
    duplication_avoider = v
    return self


static func from_dict(data) -> Gs2FormationSubMoldCapacityRequest:
    if data == null:
        return null
    var ret = Gs2FormationSubMoldCapacityRequest.new()
    ret.namespace_name = null if data.get("namespaceName") == null else str(data.get("namespaceName"))
    ret.access_token = null if data.get("accessToken") == null else str(data.get("accessToken"))
    ret.mold_model_name = null if data.get("moldModelName") == null else str(data.get("moldModelName"))
    ret.capacity = null if data.get("capacity") == null else int(data.get("capacity"))
    return ret


func to_dict() -> Dictionary:
    var ret = {}
    ret["namespaceName"] = namespace_name
    ret["accessToken"] = access_token
    ret["moldModelName"] = mold_model_name
    ret["capacity"] = capacity
    return ret