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
class_name Gs2SerialKeyVerifyCodeRequest
extends Gs2Request


var namespace_name = null
var access_token = null
var code = null
var campaign_model_name = null
var verify_type = null
var duplication_avoider = null


func with_namespace_name(v) -> Gs2SerialKeyVerifyCodeRequest:
    namespace_name = v
    return self


func with_access_token(v) -> Gs2SerialKeyVerifyCodeRequest:
    access_token = v
    return self


func with_code(v) -> Gs2SerialKeyVerifyCodeRequest:
    code = v
    return self


func with_campaign_model_name(v) -> Gs2SerialKeyVerifyCodeRequest:
    campaign_model_name = v
    return self


func with_verify_type(v) -> Gs2SerialKeyVerifyCodeRequest:
    verify_type = v
    return self


func with_duplication_avoider(v) -> Gs2SerialKeyVerifyCodeRequest:
    duplication_avoider = v
    return self


static func from_dict(data) -> Gs2SerialKeyVerifyCodeRequest:
    if data == null:
        return null
    var ret = Gs2SerialKeyVerifyCodeRequest.new()
    ret.namespace_name = null if data.get("namespaceName") == null else str(data.get("namespaceName"))
    ret.access_token = null if data.get("accessToken") == null else str(data.get("accessToken"))
    ret.code = null if data.get("code") == null else str(data.get("code"))
    ret.campaign_model_name = null if data.get("campaignModelName") == null else str(data.get("campaignModelName"))
    ret.verify_type = null if data.get("verifyType") == null else str(data.get("verifyType"))
    return ret


func to_dict() -> Dictionary:
    var ret = {}
    ret["namespaceName"] = namespace_name
    ret["accessToken"] = access_token
    ret["code"] = code
    ret["campaignModelName"] = campaign_model_name
    ret["verifyType"] = verify_type
    return ret