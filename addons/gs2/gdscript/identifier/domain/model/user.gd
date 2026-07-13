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
class_name Gs2IdentifierUserDomain
extends RefCounted

var _gs2: Gs2Domain
var _client: Gs2IdentifierRestClient
var user_name: Variant = null
var client_secret: Variant = null
var next_page_token: Variant = null


func _init(
    gs2: Gs2Domain,
    user_name_
):
    _gs2 = gs2
    _client = Gs2IdentifierRestClient.new(gs2.rest_session)
    user_name = user_name_


func update(
    request: Gs2IdentifierUpdateUserRequest
) -> Gs2AsyncResult:
    request = request.with_context_stack(_gs2.default_context_stack if request.context_stack == null or request.context_stack == "" else request.context_stack)
    request = request.with_user_name(user_name)
    var async_result = await Gs2IdentifierUpdateUserMethodCache.invoke(
        _gs2.cache,
        null,
        null,
        request,
        func(): return await _client.update_user(request)
    )
    if async_result.error != null:
        return async_result
    var result = async_result.result
    var domain = self
    return Gs2AsyncResult.new(domain, null)


func get_(
    request: Gs2IdentifierGetUserRequest
) -> Gs2AsyncResult:
    request = request.with_context_stack(_gs2.default_context_stack if request.context_stack == null or request.context_stack == "" else request.context_stack)
    request = request.with_user_name(user_name)
    var async_result = await Gs2IdentifierGetUserMethodCache.invoke(
        _gs2.cache,
        null,
        null,
        request,
        func(): return await _client.get_user(request)
    )
    if async_result.error != null:
        return async_result
    var result = async_result.result
    return Gs2AsyncResult.new(null if result == null else result.item, null)


func delete(
    request: Gs2IdentifierDeleteUserRequest
) -> Gs2AsyncResult:
    request = request.with_context_stack(_gs2.default_context_stack if request.context_stack == null or request.context_stack == "" else request.context_stack)
    request = request.with_user_name(user_name)
    var async_result = await Gs2IdentifierDeleteUserMethodCache.invoke(
        _gs2.cache,
        null,
        null,
        request,
        func(): return await _client.delete_user(request)
    )
    if async_result.error != null and not (async_result.error is Gs2NotFoundException):
        return async_result
    var result = async_result.result
    var domain = self
    return Gs2AsyncResult.new(domain, null)


func create_identifier(
    request: Gs2IdentifierCreateIdentifierRequest
) -> Gs2AsyncResult:
    request = request.with_context_stack(_gs2.default_context_stack if request.context_stack == null or request.context_stack == "" else request.context_stack)
    request = request.with_user_name(user_name)
    var async_result = await Gs2IdentifierCreateIdentifierMethodCache.invoke(
        _gs2.cache,
        null,
        null,
        request,
        func(): return await _client.create_identifier(request)
    )
    if async_result.error != null:
        return async_result
    var result = async_result.result
    var ref = null if result == null else result.item
    var domain = Gs2IdentifierIdentifierDomain.new(
        _gs2,
        (null if ref == null else ref.user_name),
        (null if ref == null else ref.client_id)
    )
    domain.client_secret = null if result == null else result.client_secret
    return Gs2AsyncResult.new(domain, null)


func identifiers(
) -> Gs2IdentifierDescribeIdentifiersIterator:
    return Gs2IdentifierDescribeIdentifiersIterator.new(
        _gs2,
        _client,
        user_name
    )


func subscribe_identifiers(
    callback: Callable
) -> int:
    return _gs2.cache.list_subscribe(
        "Gs2IdentifierIdentifier",
        Gs2IdentifierIdentifierCache.cache_parent_key(
            user_name,
            null
        ),
        callback
    )


func unsubscribe_identifiers(
    callback_id: int
) -> void:
    _gs2.cache.list_unsubscribe(
        "Gs2IdentifierIdentifier",
        Gs2IdentifierIdentifierCache.cache_parent_key(
            user_name,
            null
        ),
        callback_id
    )


func invalidate_identifiers(
) -> void:
    _gs2.cache.clear_list_cache(
        "Gs2IdentifierIdentifier",
        Gs2IdentifierIdentifierCache.cache_parent_key(
            user_name,
            null
        )
    )


func attached_guards(
    client_id = null
) -> Gs2IdentifierDescribeAttachedGuardsIterator:
    return Gs2IdentifierDescribeAttachedGuardsIterator.new(
        _gs2,
        _client,
        user_name,
        client_id
    )
func identifier(
    client_id
) -> Gs2IdentifierIdentifierDomain:
    return Gs2IdentifierIdentifierDomain.new(
        _gs2,
        user_name,
        client_id
    )
func password(
) -> Gs2IdentifierPasswordDomain:
    return Gs2IdentifierPasswordDomain.new(
        _gs2,
        user_name
    )
func attach_security_policy(
) -> Gs2IdentifierAttachSecurityPolicyDomain:
    return Gs2IdentifierAttachSecurityPolicyDomain.new(
        _gs2,
        user_name
    )


func model() -> Gs2AsyncResult:
    var pair = Gs2IdentifierUserCache.get_cache(
        _gs2.cache,
        user_name,
        null
    )
    if pair[1]:
        return Gs2AsyncResult.new(pair[0], null)
    return await Gs2IdentifierUserCache.fetch(
        _gs2.cache,
        user_name,
        null,
        func():
            var get_result = await get_(Gs2IdentifierGetUserRequest.new())
            return get_result
    )


func invalidate() -> void:
    Gs2IdentifierUserCache.delete_cache(
        _gs2.cache,
        user_name,
        null
    )


func subscribe_model(callback: Callable) -> int:
    return _gs2.cache.subscribe(
        "Gs2IdentifierUser",
        Gs2IdentifierUserCache.cache_parent_key(
            null
        ),
        Gs2IdentifierUserCache.cache_key(
            user_name
        ),
        callback,
        func(): await model()
    )


func unsubscribe_model(callback_id: int) -> void:
    _gs2.cache.unsubscribe(
        "Gs2IdentifierUser",
        Gs2IdentifierUserCache.cache_parent_key(
            null
        ),
        Gs2IdentifierUserCache.cache_key(
            user_name
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