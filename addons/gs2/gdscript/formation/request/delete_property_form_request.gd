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
class_name Gs2FormationDeletePropertyFormRequest
extends Gs2Request


var namespace_name = null
var access_token = null
var property_form_model_name = null
var property_id = null
var duplication_avoider = null


func with_namespace_name(v) -> Gs2FormationDeletePropertyFormRequest:
    namespace_name = v
    return self


func with_access_token(v) -> Gs2FormationDeletePropertyFormRequest:
    access_token = v
    return self


func with_property_form_model_name(v) -> Gs2FormationDeletePropertyFormRequest:
    property_form_model_name = v
    return self


func with_property_id(v) -> Gs2FormationDeletePropertyFormRequest:
    property_id = v
    return self


func with_duplication_avoider(v) -> Gs2FormationDeletePropertyFormRequest:
    duplication_avoider = v
    return self


static func from_dict(data) -> Gs2FormationDeletePropertyFormRequest:
    if data == null:
        return null
    var ret = Gs2FormationDeletePropertyFormRequest.new()
    ret.namespace_name = null if data.get("namespaceName") == null else str(data.get("namespaceName"))
    ret.access_token = null if data.get("accessToken") == null else str(data.get("accessToken"))
    ret.property_form_model_name = null if data.get("propertyFormModelName") == null else str(data.get("propertyFormModelName"))
    ret.property_id = null if data.get("propertyId") == null else str(data.get("propertyId"))
    return ret


func to_dict() -> Dictionary:
    var ret = {}
    ret["namespaceName"] = namespace_name
    ret["accessToken"] = access_token
    ret["propertyFormModelName"] = property_form_model_name
    ret["propertyId"] = property_id
    return ret