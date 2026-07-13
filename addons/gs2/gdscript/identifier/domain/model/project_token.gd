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
class_name Gs2IdentifierProjectTokenDomain
extends RefCounted

var _gs2: Gs2Domain
var _client: Gs2IdentifierRestClient
var access_token: Gs2AuthAccessToken
var token_type: Variant = null
var expires_in: Variant = null
var owner_id: Variant = null


func _init(
    gs2: Gs2Domain
):
    _gs2 = gs2
    _client = Gs2IdentifierRestClient.new(gs2.rest_session)


func login(
    request: Gs2IdentifierLoginRequest
) -> Gs2AsyncResult:
    var async_result = await Gs2IdentifierLoginMethodCache.invoke(
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
    self.access_token = null if result == null else result.access_token
    domain.access_token = self.access_token
    self.token_type = null if result == null else result.token_type
    domain.token_type = self.token_type
    self.expires_in = null if result == null else result.expires_in
    domain.expires_in = self.expires_in
    self.owner_id = null if result == null else result.owner_id
    domain.owner_id = self.owner_id
    return Gs2AsyncResult.new(domain, null)


func login_by_user(
    request: Gs2IdentifierLoginByUserRequest
) -> Gs2AsyncResult:
    var async_result = await Gs2IdentifierLoginByUserMethodCache.invoke(
        _gs2.cache,
        null,
        null,
        request,
        func(): return await _client.login_by_user(request)
    )
    if async_result.error != null:
        return async_result
    var result = async_result.result
    var domain = self
    return Gs2AsyncResult.new(domain, null)


func model() -> Gs2AsyncResult:
    var pair = Gs2IdentifierProjectTokenCache.get_cache(
        _gs2.cache,
        null
    )
    if pair[1]:
        return Gs2AsyncResult.new(pair[0], null)
    return Gs2AsyncResult.new(null, null)


func invalidate() -> void:
    Gs2IdentifierProjectTokenCache.delete_cache(
        _gs2.cache,
        null
    )


func subscribe_model(callback: Callable) -> int:
    return _gs2.cache.subscribe(
        "Gs2IdentifierProjectToken",
        Gs2IdentifierProjectTokenCache.cache_parent_key(
            null
        ),
        Gs2IdentifierProjectTokenCache.cache_key(
        ),
        callback,
        func(): await model()
    )


func unsubscribe_model(callback_id: int) -> void:
    _gs2.cache.unsubscribe(
        "Gs2IdentifierProjectToken",
        Gs2IdentifierProjectTokenCache.cache_parent_key(
            null
        ),
        Gs2IdentifierProjectTokenCache.cache_key(
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