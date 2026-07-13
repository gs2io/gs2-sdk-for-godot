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
class_name Gs2AuthServiceCache
extends RefCounted


static func _parse(payload):
    if payload == null:
        return null
    if payload is Dictionary:
        return payload
    if payload is String and payload != "":
        return JSON.parse_string(payload)
    return null


static func put_cache(
    cache: Gs2CacheDatabase,
    user_id,
    method: String,
    request_payload,
    result_payload
) -> void:
    if method == "login":
        Gs2AuthLoginMethodCache.put_cache(
            Gs2AuthLoginResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2AuthLoginRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "loginBySignature":
        Gs2AuthLoginBySignatureMethodCache.put_cache(
            Gs2AuthLoginBySignatureResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2AuthLoginBySignatureRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "federation":
        Gs2AuthFederationMethodCache.put_cache(
            Gs2AuthFederationResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2AuthFederationRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "issueTimeOffsetTokenByUserId":
        Gs2AuthIssueTimeOffsetTokenByUserIdMethodCache.put_cache(
            Gs2AuthIssueTimeOffsetTokenByUserIdResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2AuthIssueTimeOffsetTokenByUserIdRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "getServiceVersion":
        Gs2AuthGetServiceVersionMethodCache.put_cache(
            Gs2AuthGetServiceVersionResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2AuthGetServiceVersionRequest.from_dict(_parse(request_payload))
        )
        return
    pass