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
class_name Gs2IdentifierAttachSecurityPolicyDomain
extends RefCounted

var _gs2: Gs2Domain
var _client: Gs2IdentifierRestClient
var user_name: Variant = null


func _init(
    gs2: Gs2Domain,
    user_name_
):
    _gs2 = gs2
    _client = Gs2IdentifierRestClient.new(gs2.rest_session)
    user_name = user_name_


func get_has_security_policy(
    request: Gs2IdentifierGetHasSecurityPolicyRequest
) -> Gs2AsyncResult:
    request = request.with_context_stack(_gs2.default_context_stack if request.context_stack == null or request.context_stack == "" else request.context_stack)
    request = request.with_user_name(user_name)
    var async_result = await Gs2IdentifierGetHasSecurityPolicyMethodCache.invoke(
        _gs2.cache,
        null,
        null,
        request,
        func(): return await _client.get_has_security_policy(request)
    )
    if async_result.error != null:
        return async_result
    var result = async_result.result
    var domain = []
    if result != null and result.items != null:
        for v in result.items:
            domain.append(Gs2IdentifierSecurityPolicyDomain.new(
                _gs2,
                (null if v == null else v.name)
            ))
    return Gs2AsyncResult.new(domain, null)


func attach_security_policy(
    request: Gs2IdentifierAttachSecurityPolicyRequest
) -> Gs2AsyncResult:
    request = request.with_context_stack(_gs2.default_context_stack if request.context_stack == null or request.context_stack == "" else request.context_stack)
    request = request.with_user_name(user_name)
    var async_result = await Gs2IdentifierAttachSecurityPolicyMethodCache.invoke(
        _gs2.cache,
        null,
        null,
        request,
        func(): return await _client.attach_security_policy(request)
    )
    if async_result.error != null:
        return async_result
    var result = async_result.result
    var domain = []
    if result != null and result.items != null:
        for v in result.items:
            domain.append(Gs2IdentifierSecurityPolicyDomain.new(
                _gs2,
                (null if v == null else v.name)
            ))
    return Gs2AsyncResult.new(domain, null)


func detach_security_policy(
    request: Gs2IdentifierDetachSecurityPolicyRequest
) -> Gs2AsyncResult:
    request = request.with_context_stack(_gs2.default_context_stack if request.context_stack == null or request.context_stack == "" else request.context_stack)
    request = request.with_user_name(user_name)
    var async_result = await Gs2IdentifierDetachSecurityPolicyMethodCache.invoke(
        _gs2.cache,
        null,
        null,
        request,
        func(): return await _client.detach_security_policy(request)
    )
    if async_result.error != null:
        return async_result
    var result = async_result.result
    var domain = []
    if result != null and result.items != null:
        for v in result.items:
            domain.append(Gs2IdentifierSecurityPolicyDomain.new(
                _gs2,
                (null if v == null else v.name)
            ))
    return Gs2AsyncResult.new(domain, null)


func model() -> Gs2AsyncResult:
    var pair = Gs2IdentifierAttachSecurityPolicyCache.get_cache(
        _gs2.cache,
        user_name,
        null
    )
    if pair[1]:
        return Gs2AsyncResult.new(pair[0], null)
    return Gs2AsyncResult.new(null, null)


func invalidate() -> void:
    Gs2IdentifierAttachSecurityPolicyCache.delete_cache(
        _gs2.cache,
        user_name,
        null
    )


func subscribe_model(callback: Callable) -> int:
    return _gs2.cache.subscribe(
        "Gs2IdentifierAttachSecurityPolicy",
        Gs2IdentifierAttachSecurityPolicyCache.cache_parent_key(
            user_name,
            null
        ),
        Gs2IdentifierAttachSecurityPolicyCache.cache_key(
        ),
        callback,
        func(): await model()
    )


func unsubscribe_model(callback_id: int) -> void:
    _gs2.cache.unsubscribe(
        "Gs2IdentifierAttachSecurityPolicy",
        Gs2IdentifierAttachSecurityPolicyCache.cache_parent_key(
            user_name,
            null
        ),
        Gs2IdentifierAttachSecurityPolicyCache.cache_key(
        ),
        callback_id
    )


func subscribe_model_with_initial_call(callback: Callable) -> Gs2AsyncResult:
    var model_result = await model()
    if model_result.error != null:
        return model_result
    var callback_id = subscribe_model(callback)
    callback.call(model_result.result)
    return Gs2AsyncResult.new(callback_id, null)