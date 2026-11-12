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
class_name Gs2AuthAccessTokenDomain
extends RefCounted

var _gs2: Gs2DomainCore
var _client: Gs2AuthRestClient
var token: Variant = null
var user_id: Variant = null
var expire: Variant = null
var status: Variant = null


func _init(
    gs2: Gs2DomainCore
):
    _gs2 = gs2
    _client = Gs2AuthRestClient.new(gs2.rest_session)


func login(
    request: Gs2AuthLoginRequest
) -> Gs2AsyncResult:
    request = request.with_context_stack(_gs2.default_context_stack if request.context_stack == null or request.context_stack == "" else request.context_stack)
    var async_result = await Gs2AuthLoginMethodCache.invoke(
        _gs2.cache,
        null,
        null,
        request,
        func(): return await _client.login(request)
    )
    if async_result.error != null:
        return async_result
    var result = async_result.result
    var domain = self
    self.token = null if result == null else result.token
    domain.token = self.token
    self.user_id = null if result == null else result.user_id
    domain.user_id = self.user_id
    self.expire = null if result == null else result.expire
    domain.expire = self.expire
    return Gs2AsyncResult.new(domain, null)


func login_by_signature(
    request: Gs2AuthLoginBySignatureRequest
) -> Gs2AsyncResult:
    var async_result = await Gs2AuthLoginBySignatureMethodCache.invoke(
        _gs2.cache,
        null,
        null,
        request,
        func(): return await _client.login_by_signature(request)
    )
    if async_result.error != null:
        return async_result
    var result = async_result.result
    var domain = self
    self.token = null if result == null else result.token
    domain.token = self.token
    self.user_id = null if result == null else result.user_id
    domain.user_id = self.user_id
    self.expire = null if result == null else result.expire
    domain.expire = self.expire
    return Gs2AsyncResult.new(domain, null)


func federation(
    request: Gs2AuthFederationRequest
) -> Gs2AsyncResult:
    request = request.with_context_stack(_gs2.default_context_stack if request.context_stack == null or request.context_stack == "" else request.context_stack)
    var async_result = await Gs2AuthFederationMethodCache.invoke(
        _gs2.cache,
        null,
        null,
        request,
        func(): return await _client.federation(request)
    )
    if async_result.error != null:
        return async_result
    var result = async_result.result
    var domain = self
    self.token = null if result == null else result.token
    domain.token = self.token
    self.user_id = null if result == null else result.user_id
    domain.user_id = self.user_id
    self.expire = null if result == null else result.expire
    domain.expire = self.expire
    return Gs2AsyncResult.new(domain, null)


func issue_time_offset_token(
    request: Gs2AuthIssueTimeOffsetTokenByUserIdRequest
) -> Gs2AsyncResult:
    request = request.with_context_stack(_gs2.default_context_stack if request.context_stack == null or request.context_stack == "" else request.context_stack)
    var async_result = await Gs2AuthIssueTimeOffsetTokenByUserIdMethodCache.invoke(
        _gs2.cache,
        null,
        null,
        request,
        func(): return await _client.issue_time_offset_token_by_user_id(request)
    )
    if async_result.error != null:
        return async_result
    var result = async_result.result
    var domain = self
    self.token = null if result == null else result.token
    domain.token = self.token
    self.user_id = null if result == null else result.user_id
    domain.user_id = self.user_id
    self.expire = null if result == null else result.expire
    domain.expire = self.expire
    return Gs2AsyncResult.new(domain, null)


func model() -> Gs2AsyncResult:
    var pair = Gs2AuthAccessTokenCache.get_cache(
        _gs2.cache,
        null
    )
    if pair[1]:
        return Gs2AsyncResult.new(pair[0], null)
    return Gs2AsyncResult.new(null, null)


func invalidate() -> void:
    Gs2AuthAccessTokenCache.delete_cache(
        _gs2.cache,
        null
    )


func subscribe_model(callback: Callable) -> int:
    return _gs2.cache.subscribe(
        "Gs2AuthAccessToken",
        Gs2AuthAccessTokenCache.cache_parent_key(
            null
        ),
        Gs2AuthAccessTokenCache.cache_key(
        ),
        callback,
        func(): await model()
    )


func unsubscribe_model(callback_id: int) -> void:
    _gs2.cache.unsubscribe(
        "Gs2AuthAccessToken",
        Gs2AuthAccessTokenCache.cache_parent_key(
            null
        ),
        Gs2AuthAccessTokenCache.cache_key(
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