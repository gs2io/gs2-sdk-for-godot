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
class_name Gs2FormationCreatePropertyFormModelMasterRequest
extends Gs2Request


var namespace_name = null
var name = null
var description = null
var metadata = null
var slots = null


func with_namespace_name(v) -> Gs2FormationCreatePropertyFormModelMasterRequest:
    namespace_name = v
    return self


func with_name(v) -> Gs2FormationCreatePropertyFormModelMasterRequest:
    name = v
    return self


func with_description(v) -> Gs2FormationCreatePropertyFormModelMasterRequest:
    description = v
    return self


func with_metadata(v) -> Gs2FormationCreatePropertyFormModelMasterRequest:
    metadata = v
    return self


func with_slots(v) -> Gs2FormationCreatePropertyFormModelMasterRequest:
    slots = v
    return self


static func from_dict(data) -> Gs2FormationCreatePropertyFormModelMasterRequest:
    if data == null:
        return null
    var ret = Gs2FormationCreatePropertyFormModelMasterRequest.new()
    ret.namespace_name = null if data.get("namespaceName") == null else str(data.get("namespaceName"))
    ret.name = null if data.get("name") == null else str(data.get("name"))
    ret.description = null if data.get("description") == null else str(data.get("description"))
    ret.metadata = null if data.get("metadata") == null else str(data.get("metadata"))
    ret.slots = null if data.get("slots") == null else data.get("slots").map(func(v): return Gs2FormationSlotModel.from_dict(v))
    return ret


func to_dict() -> Dictionary:
    var ret = {}
    ret["namespaceName"] = namespace_name
    ret["name"] = name
    ret["description"] = description
    ret["metadata"] = metadata
    ret["slots"] = null if slots == null else slots.map(func(v): return null if v == null else v.to_dict())
    return ret