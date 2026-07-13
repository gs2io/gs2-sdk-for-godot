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
class_name Gs2FormationSetFormWithSignatureRequest
extends Gs2Request


var namespace_name = null
var access_token = null
var mold_model_name = null
var index = null
var slots = null
var key_id = null
var duplication_avoider = null


func with_namespace_name(v) -> Gs2FormationSetFormWithSignatureRequest:
    namespace_name = v
    return self


func with_access_token(v) -> Gs2FormationSetFormWithSignatureRequest:
    access_token = v
    return self


func with_mold_model_name(v) -> Gs2FormationSetFormWithSignatureRequest:
    mold_model_name = v
    return self


func with_index(v) -> Gs2FormationSetFormWithSignatureRequest:
    index = v
    return self


func with_slots(v) -> Gs2FormationSetFormWithSignatureRequest:
    slots = v
    return self


func with_key_id(v) -> Gs2FormationSetFormWithSignatureRequest:
    key_id = v
    return self


func with_duplication_avoider(v) -> Gs2FormationSetFormWithSignatureRequest:
    duplication_avoider = v
    return self


static func from_dict(data) -> Gs2FormationSetFormWithSignatureRequest:
    if data == null:
        return null
    var ret = Gs2FormationSetFormWithSignatureRequest.new()
    ret.namespace_name = null if data.get("namespaceName") == null else str(data.get("namespaceName"))
    ret.access_token = null if data.get("accessToken") == null else str(data.get("accessToken"))
    ret.mold_model_name = null if data.get("moldModelName") == null else str(data.get("moldModelName"))
    ret.index = null if data.get("index") == null else int(data.get("index"))
    ret.slots = null if data.get("slots") == null else data.get("slots").map(func(v): return Gs2FormationSlotWithSignature.from_dict(v))
    ret.key_id = null if data.get("keyId") == null else str(data.get("keyId"))
    return ret


func to_dict() -> Dictionary:
    var ret = {}
    ret["namespaceName"] = namespace_name
    ret["accessToken"] = access_token
    ret["moldModelName"] = mold_model_name
    ret["index"] = index
    ret["slots"] = null if slots == null else slots.map(func(v): return null if v == null else v.to_dict())
    ret["keyId"] = key_id
    return ret