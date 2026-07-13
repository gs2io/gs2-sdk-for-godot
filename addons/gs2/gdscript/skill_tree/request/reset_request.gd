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
class_name Gs2SkillTreeResetRequest
extends Gs2Request


var namespace_name = null
var access_token = null
var property_id = null
var config = null
var duplication_avoider = null


func with_namespace_name(v) -> Gs2SkillTreeResetRequest:
    namespace_name = v
    return self


func with_access_token(v) -> Gs2SkillTreeResetRequest:
    access_token = v
    return self


func with_property_id(v) -> Gs2SkillTreeResetRequest:
    property_id = v
    return self


func with_config(v) -> Gs2SkillTreeResetRequest:
    config = v
    return self


func with_duplication_avoider(v) -> Gs2SkillTreeResetRequest:
    duplication_avoider = v
    return self


static func from_dict(data) -> Gs2SkillTreeResetRequest:
    if data == null:
        return null
    var ret = Gs2SkillTreeResetRequest.new()
    ret.namespace_name = null if data.get("namespaceName") == null else str(data.get("namespaceName"))
    ret.access_token = null if data.get("accessToken") == null else str(data.get("accessToken"))
    ret.property_id = null if data.get("propertyId") == null else str(data.get("propertyId"))
    ret.config = null if data.get("config") == null else data.get("config").map(func(v): return Gs2SkillTreeConfig.from_dict(v))
    return ret


func to_dict() -> Dictionary:
    var ret = {}
    ret["namespaceName"] = namespace_name
    ret["accessToken"] = access_token
    ret["propertyId"] = property_id
    ret["config"] = null if config == null else config.map(func(v): return null if v == null else v.to_dict())
    return ret