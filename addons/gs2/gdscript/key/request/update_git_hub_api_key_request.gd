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
class_name Gs2KeyUpdateGitHubApiKeyRequest
extends Gs2Request


var namespace_name = null
var api_key_name = null
var description = null
var api_key = null
var encryption_key_name = null


func with_namespace_name(v) -> Gs2KeyUpdateGitHubApiKeyRequest:
    namespace_name = v
    return self


func with_api_key_name(v) -> Gs2KeyUpdateGitHubApiKeyRequest:
    api_key_name = v
    return self


func with_description(v) -> Gs2KeyUpdateGitHubApiKeyRequest:
    description = v
    return self


func with_api_key(v) -> Gs2KeyUpdateGitHubApiKeyRequest:
    api_key = v
    return self


func with_encryption_key_name(v) -> Gs2KeyUpdateGitHubApiKeyRequest:
    encryption_key_name = v
    return self


static func from_dict(data) -> Gs2KeyUpdateGitHubApiKeyRequest:
    if data == null:
        return null
    var ret = Gs2KeyUpdateGitHubApiKeyRequest.new()
    ret.namespace_name = null if data.get("namespaceName") == null else str(data.get("namespaceName"))
    ret.api_key_name = null if data.get("apiKeyName") == null else str(data.get("apiKeyName"))
    ret.description = null if data.get("description") == null else str(data.get("description"))
    ret.api_key = null if data.get("apiKey") == null else str(data.get("apiKey"))
    ret.encryption_key_name = null if data.get("encryptionKeyName") == null else str(data.get("encryptionKeyName"))
    return ret


func to_dict() -> Dictionary:
    var ret = {}
    ret["namespaceName"] = namespace_name
    ret["apiKeyName"] = api_key_name
    ret["description"] = description
    ret["apiKey"] = api_key
    ret["encryptionKeyName"] = encryption_key_name
    return ret