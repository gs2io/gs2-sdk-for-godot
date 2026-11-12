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
class_name Gs2Identifier
extends RefCounted



var _gs2: Gs2DomainCore
var _client: Gs2IdentifierRestClient


func _init(
    gs2: Gs2DomainCore
):
    _gs2 = gs2
    _client = Gs2IdentifierRestClient.new(gs2.rest_session)


func create_user(
    request: Gs2IdentifierCreateUserRequest
) -> Gs2AsyncResult:
    var async_result = await Gs2IdentifierCreateUserMethodCache.invoke(
        _gs2.cache,
        null,
        null,
        request,
        func(): return await _client.create_user(request)
    )
    if async_result.error != null:
        return async_result
    var result = async_result.result
    var ref = null if result == null else result.item
    var domain = Gs2IdentifierUserDomain.new(
        _gs2,
        (null if ref == null else ref.name)
    )
    return Gs2AsyncResult.new(domain, null)


func create_security_policy(
    request: Gs2IdentifierCreateSecurityPolicyRequest
) -> Gs2AsyncResult:
    var async_result = await Gs2IdentifierCreateSecurityPolicyMethodCache.invoke(
        _gs2.cache,
        null,
        null,
        request,
        func(): return await _client.create_security_policy(request)
    )
    if async_result.error != null:
        return async_result
    var result = async_result.result
    var ref = null if result == null else result.item
    var domain = Gs2IdentifierSecurityPolicyDomain.new(
        _gs2,
        (null if ref == null else ref.name)
    )
    return Gs2AsyncResult.new(domain, null)


func users(
) -> Gs2IdentifierDescribeUsersIterator:
    return Gs2IdentifierDescribeUsersIterator.new(
        _gs2,
        _client
    )


func subscribe_users(
    callback: Callable
) -> int:
    return _gs2.cache.list_subscribe(
        "Gs2IdentifierUser",
        Gs2IdentifierUserCache.cache_parent_key(
            null
        ),
        callback
    )


func unsubscribe_users(
    callback_id: int
) -> void:
    _gs2.cache.list_unsubscribe(
        "Gs2IdentifierUser",
        Gs2IdentifierUserCache.cache_parent_key(
            null
        ),
        callback_id
    )


func invalidate_users(
) -> void:
    _gs2.cache.clear_list_cache(
        "Gs2IdentifierUser",
        Gs2IdentifierUserCache.cache_parent_key(
            null
        )
    )
func user(
    user_name
) -> Gs2IdentifierUserDomain:
    return Gs2IdentifierUserDomain.new(
        _gs2,
        user_name
    )


func security_policies(
) -> Gs2IdentifierDescribeSecurityPoliciesIterator:
    return Gs2IdentifierDescribeSecurityPoliciesIterator.new(
        _gs2,
        _client
    )


func subscribe_security_policies(
    callback: Callable
) -> int:
    return _gs2.cache.list_subscribe(
        "Gs2IdentifierSecurityPolicy",
        Gs2IdentifierSecurityPolicyCache.cache_parent_key(
            null
        ),
        callback
    )


func unsubscribe_security_policies(
    callback_id: int
) -> void:
    _gs2.cache.list_unsubscribe(
        "Gs2IdentifierSecurityPolicy",
        Gs2IdentifierSecurityPolicyCache.cache_parent_key(
            null
        ),
        callback_id
    )


func invalidate_security_policies(
) -> void:
    _gs2.cache.clear_list_cache(
        "Gs2IdentifierSecurityPolicy",
        Gs2IdentifierSecurityPolicyCache.cache_parent_key(
            null
        )
    )


func common_security_policies(
) -> Gs2IdentifierDescribeCommonSecurityPoliciesIterator:
    return Gs2IdentifierDescribeCommonSecurityPoliciesIterator.new(
        _gs2,
        _client
    )


func subscribe_common_security_policies(
    callback: Callable
) -> int:
    return _gs2.cache.list_subscribe(
        "Gs2IdentifierSecurityPolicy",
        Gs2IdentifierSecurityPolicyCache.cache_parent_key(
            null
        ),
        callback
    )


func unsubscribe_common_security_policies(
    callback_id: int
) -> void:
    _gs2.cache.list_unsubscribe(
        "Gs2IdentifierSecurityPolicy",
        Gs2IdentifierSecurityPolicyCache.cache_parent_key(
            null
        ),
        callback_id
    )


func invalidate_common_security_policies(
) -> void:
    _gs2.cache.clear_list_cache(
        "Gs2IdentifierSecurityPolicy",
        Gs2IdentifierSecurityPolicyCache.cache_parent_key(
            null
        )
    )
func security_policy(
    security_policy_name
) -> Gs2IdentifierSecurityPolicyDomain:
    return Gs2IdentifierSecurityPolicyDomain.new(
        _gs2,
        security_policy_name
    )


func update_cache_from_stamp_sheet(
    transaction_id,
    time_offset,
    method: String,
    request,
    result
) -> void:
    pass


func update_cache_from_stamp_task(
    task_id,
    time_offset,
    method: String,
    request,
    result
) -> void:
    pass


func update_cache_from_job_result(
    method: String,
    time_offset,
    job,
    result
) -> void:
    pass


func handle_notification(
    action: String,
    payload
) -> void:
    var data = JSON.parse_string(payload) if payload is String else payload
    pass