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
class_name Gs2AccountOpenIdConnectSetting
extends RefCounted


var configuration_path = null
var client_id = null
var client_secret = null
var apple_team_id = null
var apple_key_id = null
var apple_private_key_pem = null
var done_endpoint_url = null
var additional_scope_values = null
var additional_return_values = null


func with_configuration_path(v) -> Gs2AccountOpenIdConnectSetting:
    configuration_path = v
    return self


func with_client_id(v) -> Gs2AccountOpenIdConnectSetting:
    client_id = v
    return self


func with_client_secret(v) -> Gs2AccountOpenIdConnectSetting:
    client_secret = v
    return self


func with_apple_team_id(v) -> Gs2AccountOpenIdConnectSetting:
    apple_team_id = v
    return self


func with_apple_key_id(v) -> Gs2AccountOpenIdConnectSetting:
    apple_key_id = v
    return self


func with_apple_private_key_pem(v) -> Gs2AccountOpenIdConnectSetting:
    apple_private_key_pem = v
    return self


func with_done_endpoint_url(v) -> Gs2AccountOpenIdConnectSetting:
    done_endpoint_url = v
    return self


func with_additional_scope_values(v) -> Gs2AccountOpenIdConnectSetting:
    additional_scope_values = v
    return self


func with_additional_return_values(v) -> Gs2AccountOpenIdConnectSetting:
    additional_return_values = v
    return self


static func from_dict(data) -> Gs2AccountOpenIdConnectSetting:
    if data == null:
        return null
    var ret = Gs2AccountOpenIdConnectSetting.new()
    ret.configuration_path = null if data.get("configurationPath") == null else str(data.get("configurationPath"))
    ret.client_id = null if data.get("clientId") == null else str(data.get("clientId"))
    ret.client_secret = null if data.get("clientSecret") == null else str(data.get("clientSecret"))
    ret.apple_team_id = null if data.get("appleTeamId") == null else str(data.get("appleTeamId"))
    ret.apple_key_id = null if data.get("appleKeyId") == null else str(data.get("appleKeyId"))
    ret.apple_private_key_pem = null if data.get("applePrivateKeyPem") == null else str(data.get("applePrivateKeyPem"))
    ret.done_endpoint_url = null if data.get("doneEndpointUrl") == null else str(data.get("doneEndpointUrl"))
    ret.additional_scope_values = null if data.get("additionalScopeValues") == null else data.get("additionalScopeValues").map(func(v): return Gs2AccountScopeValue.from_dict(v))
    ret.additional_return_values = null if data.get("additionalReturnValues") == null else data.get("additionalReturnValues").map(func(v): return str(v))
    return ret


func to_dict() -> Dictionary:
    var ret = {}
    ret["configurationPath"] = configuration_path
    ret["clientId"] = client_id
    ret["clientSecret"] = client_secret
    ret["appleTeamId"] = apple_team_id
    ret["appleKeyId"] = apple_key_id
    ret["applePrivateKeyPem"] = apple_private_key_pem
    ret["doneEndpointUrl"] = done_endpoint_url
    ret["additionalScopeValues"] = null if additional_scope_values == null else additional_scope_values.map(func(v): return null if v == null else v.to_dict())
    ret["additionalReturnValues"] = additional_return_values
    return ret