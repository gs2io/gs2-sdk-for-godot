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
class_name Gs2ExperienceGetStatusWithSignatureRequest
extends Gs2Request


var namespace_name = null
var access_token = null
var experience_name = null
var property_id = null
var key_id = null


func with_namespace_name(v) -> Gs2ExperienceGetStatusWithSignatureRequest:
    namespace_name = v
    return self


func with_access_token(v) -> Gs2ExperienceGetStatusWithSignatureRequest:
    access_token = v
    return self


func with_experience_name(v) -> Gs2ExperienceGetStatusWithSignatureRequest:
    experience_name = v
    return self


func with_property_id(v) -> Gs2ExperienceGetStatusWithSignatureRequest:
    property_id = v
    return self


func with_key_id(v) -> Gs2ExperienceGetStatusWithSignatureRequest:
    key_id = v
    return self


static func from_dict(data) -> Gs2ExperienceGetStatusWithSignatureRequest:
    if data == null:
        return null
    var ret = Gs2ExperienceGetStatusWithSignatureRequest.new()
    ret.namespace_name = null if data.get("namespaceName") == null else str(data.get("namespaceName"))
    ret.access_token = null if data.get("accessToken") == null else str(data.get("accessToken"))
    ret.experience_name = null if data.get("experienceName") == null else str(data.get("experienceName"))
    ret.property_id = null if data.get("propertyId") == null else str(data.get("propertyId"))
    ret.key_id = null if data.get("keyId") == null else str(data.get("keyId"))
    return ret


func to_dict() -> Dictionary:
    var ret = {}
    ret["namespaceName"] = namespace_name
    ret["accessToken"] = access_token
    ret["experienceName"] = experience_name
    ret["propertyId"] = property_id
    ret["keyId"] = key_id
    return ret