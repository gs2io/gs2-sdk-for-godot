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
class_name Gs2FormationAcquireActionsToPropertyFormPropertiesRequest
extends Gs2Request


var namespace_name = null
var user_id = null
var property_form_model_name = null
var property_id = null
var acquire_action = null
var config = null
var time_offset_token = null
var duplication_avoider = null


func with_namespace_name(v) -> Gs2FormationAcquireActionsToPropertyFormPropertiesRequest:
    namespace_name = v
    return self


func with_user_id(v) -> Gs2FormationAcquireActionsToPropertyFormPropertiesRequest:
    user_id = v
    return self


func with_property_form_model_name(v) -> Gs2FormationAcquireActionsToPropertyFormPropertiesRequest:
    property_form_model_name = v
    return self


func with_property_id(v) -> Gs2FormationAcquireActionsToPropertyFormPropertiesRequest:
    property_id = v
    return self


func with_acquire_action(v) -> Gs2FormationAcquireActionsToPropertyFormPropertiesRequest:
    acquire_action = v
    return self


func with_config(v) -> Gs2FormationAcquireActionsToPropertyFormPropertiesRequest:
    config = v
    return self


func with_time_offset_token(v) -> Gs2FormationAcquireActionsToPropertyFormPropertiesRequest:
    time_offset_token = v
    return self


func with_duplication_avoider(v) -> Gs2FormationAcquireActionsToPropertyFormPropertiesRequest:
    duplication_avoider = v
    return self


static func from_dict(data) -> Gs2FormationAcquireActionsToPropertyFormPropertiesRequest:
    if data == null:
        return null
    var ret = Gs2FormationAcquireActionsToPropertyFormPropertiesRequest.new()
    ret.namespace_name = null if data.get("namespaceName") == null else str(data.get("namespaceName"))
    ret.user_id = null if data.get("userId") == null else str(data.get("userId"))
    ret.property_form_model_name = null if data.get("propertyFormModelName") == null else str(data.get("propertyFormModelName"))
    ret.property_id = null if data.get("propertyId") == null else str(data.get("propertyId"))
    ret.acquire_action = null if data.get("acquireAction") == null else Gs2AcquireAction.from_dict(data.get("acquireAction"))
    ret.config = null if data.get("config") == null else data.get("config").map(func(v): return Gs2FormationConfig.from_dict(v))
    ret.time_offset_token = null if data.get("timeOffsetToken") == null else str(data.get("timeOffsetToken"))
    return ret


func to_dict() -> Dictionary:
    var ret = {}
    ret["namespaceName"] = namespace_name
    ret["userId"] = user_id
    ret["propertyFormModelName"] = property_form_model_name
    ret["propertyId"] = property_id
    ret["acquireAction"] = null if acquire_action == null else acquire_action.to_dict()
    ret["config"] = null if config == null else config.map(func(v): return null if v == null else v.to_dict())
    ret["timeOffsetToken"] = time_offset_token
    return ret