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
class_name Gs2IdentifierServiceCache
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
    if method == "describeUsers":
        Gs2IdentifierDescribeUsersMethodCache.put_cache(
            Gs2IdentifierDescribeUsersResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2IdentifierDescribeUsersRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "createUser":
        Gs2IdentifierCreateUserMethodCache.put_cache(
            Gs2IdentifierCreateUserResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2IdentifierCreateUserRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "updateUser":
        Gs2IdentifierUpdateUserMethodCache.put_cache(
            Gs2IdentifierUpdateUserResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2IdentifierUpdateUserRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "getUser":
        Gs2IdentifierGetUserMethodCache.put_cache(
            Gs2IdentifierGetUserResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2IdentifierGetUserRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "deleteUser":
        Gs2IdentifierDeleteUserMethodCache.put_cache(
            Gs2IdentifierDeleteUserResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2IdentifierDeleteUserRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "describeSecurityPolicies":
        Gs2IdentifierDescribeSecurityPoliciesMethodCache.put_cache(
            Gs2IdentifierDescribeSecurityPoliciesResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2IdentifierDescribeSecurityPoliciesRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "describeCommonSecurityPolicies":
        Gs2IdentifierDescribeCommonSecurityPoliciesMethodCache.put_cache(
            Gs2IdentifierDescribeCommonSecurityPoliciesResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2IdentifierDescribeCommonSecurityPoliciesRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "createSecurityPolicy":
        Gs2IdentifierCreateSecurityPolicyMethodCache.put_cache(
            Gs2IdentifierCreateSecurityPolicyResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2IdentifierCreateSecurityPolicyRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "updateSecurityPolicy":
        Gs2IdentifierUpdateSecurityPolicyMethodCache.put_cache(
            Gs2IdentifierUpdateSecurityPolicyResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2IdentifierUpdateSecurityPolicyRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "getSecurityPolicy":
        Gs2IdentifierGetSecurityPolicyMethodCache.put_cache(
            Gs2IdentifierGetSecurityPolicyResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2IdentifierGetSecurityPolicyRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "deleteSecurityPolicy":
        Gs2IdentifierDeleteSecurityPolicyMethodCache.put_cache(
            Gs2IdentifierDeleteSecurityPolicyResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2IdentifierDeleteSecurityPolicyRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "describeIdentifiers":
        Gs2IdentifierDescribeIdentifiersMethodCache.put_cache(
            Gs2IdentifierDescribeIdentifiersResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2IdentifierDescribeIdentifiersRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "createIdentifier":
        Gs2IdentifierCreateIdentifierMethodCache.put_cache(
            Gs2IdentifierCreateIdentifierResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2IdentifierCreateIdentifierRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "getIdentifier":
        Gs2IdentifierGetIdentifierMethodCache.put_cache(
            Gs2IdentifierGetIdentifierResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2IdentifierGetIdentifierRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "deleteIdentifier":
        Gs2IdentifierDeleteIdentifierMethodCache.put_cache(
            Gs2IdentifierDeleteIdentifierResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2IdentifierDeleteIdentifierRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "describeAttachedGuards":
        Gs2IdentifierDescribeAttachedGuardsMethodCache.put_cache(
            Gs2IdentifierDescribeAttachedGuardsResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2IdentifierDescribeAttachedGuardsRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "attachGuard":
        Gs2IdentifierAttachGuardMethodCache.put_cache(
            Gs2IdentifierAttachGuardResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2IdentifierAttachGuardRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "detachGuard":
        Gs2IdentifierDetachGuardMethodCache.put_cache(
            Gs2IdentifierDetachGuardResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2IdentifierDetachGuardRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "getServiceVersion":
        Gs2IdentifierGetServiceVersionMethodCache.put_cache(
            Gs2IdentifierGetServiceVersionResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2IdentifierGetServiceVersionRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "createPassword":
        Gs2IdentifierCreatePasswordMethodCache.put_cache(
            Gs2IdentifierCreatePasswordResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2IdentifierCreatePasswordRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "getPassword":
        Gs2IdentifierGetPasswordMethodCache.put_cache(
            Gs2IdentifierGetPasswordResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2IdentifierGetPasswordRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "enableMfa":
        Gs2IdentifierEnableMfaMethodCache.put_cache(
            Gs2IdentifierEnableMfaResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2IdentifierEnableMfaRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "challengeMfa":
        Gs2IdentifierChallengeMfaMethodCache.put_cache(
            Gs2IdentifierChallengeMfaResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2IdentifierChallengeMfaRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "disableMfa":
        Gs2IdentifierDisableMfaMethodCache.put_cache(
            Gs2IdentifierDisableMfaResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2IdentifierDisableMfaRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "deletePassword":
        Gs2IdentifierDeletePasswordMethodCache.put_cache(
            Gs2IdentifierDeletePasswordResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2IdentifierDeletePasswordRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "getHasSecurityPolicy":
        Gs2IdentifierGetHasSecurityPolicyMethodCache.put_cache(
            Gs2IdentifierGetHasSecurityPolicyResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2IdentifierGetHasSecurityPolicyRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "attachSecurityPolicy":
        Gs2IdentifierAttachSecurityPolicyMethodCache.put_cache(
            Gs2IdentifierAttachSecurityPolicyResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2IdentifierAttachSecurityPolicyRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "detachSecurityPolicy":
        Gs2IdentifierDetachSecurityPolicyMethodCache.put_cache(
            Gs2IdentifierDetachSecurityPolicyResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2IdentifierDetachSecurityPolicyRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "login":
        Gs2IdentifierLoginMethodCache.put_cache(
            Gs2IdentifierLoginResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2IdentifierLoginRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "loginByUser":
        Gs2IdentifierLoginByUserMethodCache.put_cache(
            Gs2IdentifierLoginByUserResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2IdentifierLoginByUserRequest.from_dict(_parse(request_payload))
        )
        return
    pass