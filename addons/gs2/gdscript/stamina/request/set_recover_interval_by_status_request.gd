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
class_name Gs2StaminaSetRecoverIntervalByStatusRequest
extends Gs2Request


var namespace_name = null
var stamina_name = null
var access_token = null
var key_id = null
var signed_status_body = null
var signed_status_signature = null
var duplication_avoider = null


func with_namespace_name(v) -> Gs2StaminaSetRecoverIntervalByStatusRequest:
    namespace_name = v
    return self


func with_stamina_name(v) -> Gs2StaminaSetRecoverIntervalByStatusRequest:
    stamina_name = v
    return self


func with_access_token(v) -> Gs2StaminaSetRecoverIntervalByStatusRequest:
    access_token = v
    return self


func with_key_id(v) -> Gs2StaminaSetRecoverIntervalByStatusRequest:
    key_id = v
    return self


func with_signed_status_body(v) -> Gs2StaminaSetRecoverIntervalByStatusRequest:
    signed_status_body = v
    return self


func with_signed_status_signature(v) -> Gs2StaminaSetRecoverIntervalByStatusRequest:
    signed_status_signature = v
    return self


func with_duplication_avoider(v) -> Gs2StaminaSetRecoverIntervalByStatusRequest:
    duplication_avoider = v
    return self


static func from_dict(data) -> Gs2StaminaSetRecoverIntervalByStatusRequest:
    if data == null:
        return null
    var ret = Gs2StaminaSetRecoverIntervalByStatusRequest.new()
    ret.namespace_name = null if data.get("namespaceName") == null else str(data.get("namespaceName"))
    ret.stamina_name = null if data.get("staminaName") == null else str(data.get("staminaName"))
    ret.access_token = null if data.get("accessToken") == null else str(data.get("accessToken"))
    ret.key_id = null if data.get("keyId") == null else str(data.get("keyId"))
    ret.signed_status_body = null if data.get("signedStatusBody") == null else str(data.get("signedStatusBody"))
    ret.signed_status_signature = null if data.get("signedStatusSignature") == null else str(data.get("signedStatusSignature"))
    return ret


func to_dict() -> Dictionary:
    var ret = {}
    ret["namespaceName"] = namespace_name
    ret["staminaName"] = stamina_name
    ret["accessToken"] = access_token
    ret["keyId"] = key_id
    ret["signedStatusBody"] = signed_status_body
    ret["signedStatusSignature"] = signed_status_signature
    return ret