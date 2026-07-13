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
# deny overwrite
class_name Gs2InventoryReferenceOfAccessTokenDomain
extends RefCounted

var _gs2: Gs2Domain
var _client: Gs2InventoryRestClient
var namespace_name: Variant = null
var access_token: Gs2AuthAccessToken
var user_id: Variant:
    get:
        return null if access_token == null else access_token.user_id
var inventory_name: Variant = null
var item_name: Variant = null
var item_set_name: Variant = null
var reference_of: Variant = null


func _init(
    gs2: Gs2Domain,
    namespace_name_,
    access_token_,
    inventory_name_,
    item_name_,
    item_set_name_,
    reference_of_
):
    _gs2 = gs2
    _client = Gs2InventoryRestClient.new(gs2.rest_session)
    namespace_name = namespace_name_
    access_token = access_token_
    inventory_name = inventory_name_
    item_name = item_name_
    item_set_name = item_set_name_
    reference_of = reference_of_


func get_(
    request: Gs2InventoryGetReferenceOfRequest
) -> Gs2AsyncResult:
    request = request.with_context_stack(_gs2.default_context_stack if request.context_stack == null or request.context_stack == "" else request.context_stack)
    request = request.with_namespace_name(namespace_name)
    request = request.with_inventory_name(inventory_name)
    request = request.with_access_token(null if access_token == null else access_token.token)
    request = request.with_item_name(item_name)
    request = request.with_item_set_name(item_set_name)
    request = request.with_reference_of(reference_of)
    var async_result = await Gs2InventoryGetReferenceOfMethodCache.invoke(
        _gs2.cache,
        user_id,
        (null if access_token == null else access_token.time_offset),
        request,
        func(): return await _client.get_reference_of(request)
    )
    if async_result.error != null:
        return async_result
    var result = async_result.result
    return Gs2AsyncResult.new(null if result == null else result.item, null)


func verify(
    request: Gs2InventoryVerifyReferenceOfRequest
) -> Gs2AsyncResult:
    request = request.with_context_stack(_gs2.default_context_stack if request.context_stack == null or request.context_stack == "" else request.context_stack)
    request = request.with_namespace_name(namespace_name)
    request = request.with_inventory_name(inventory_name)
    request = request.with_access_token(null if access_token == null else access_token.token)
    request = request.with_item_name(item_name)
    request = request.with_item_set_name(item_set_name)
    request = request.with_reference_of(reference_of)
    var async_result = await Gs2InventoryVerifyReferenceOfMethodCache.invoke(
        _gs2.cache,
        user_id,
        (null if access_token == null else access_token.time_offset),
        request,
        func(): return await _client.verify_reference_of(request)
    )
    if async_result.error != null:
        return async_result
    var result = async_result.result
    var ref = null if result == null else result.item
    var domain = Gs2InventoryReferenceOfAccessTokenDomain.new(
        _gs2,
        namespace_name,
        access_token,
        inventory_name,
        item_name,
        item_set_name,
        (null if ref == null else ref)  # diff +++ (C# deny: result?.Item — ReferenceOf は文字列)
    )
    return Gs2AsyncResult.new(domain, null)


func delete(
    request: Gs2InventoryDeleteReferenceOfRequest
) -> Gs2AsyncResult:
    request = request.with_context_stack(_gs2.default_context_stack if request.context_stack == null or request.context_stack == "" else request.context_stack)
    request = request.with_namespace_name(namespace_name)
    request = request.with_inventory_name(inventory_name)
    request = request.with_access_token(null if access_token == null else access_token.token)
    request = request.with_item_name(item_name)
    request = request.with_item_set_name(item_set_name)
    request = request.with_reference_of(reference_of)
    var async_result = await Gs2InventoryDeleteReferenceOfMethodCache.invoke(
        _gs2.cache,
        user_id,
        (null if access_token == null else access_token.time_offset),
        request,
        func(): return await _client.delete_reference_of(request)
    )
    if async_result.error != null and not (async_result.error is Gs2NotFoundException):
        return async_result
    var result = async_result.result
    var ref = null if result == null else result.item
    var domain = Gs2InventoryReferenceOfAccessTokenDomain.new(
        _gs2,
        namespace_name,
        access_token,
        inventory_name,
        item_name,
        item_set_name,
        (null if ref == null else ref)  # diff +++ (C# deny: result?.Item — ReferenceOf は文字列)
    )
    return Gs2AsyncResult.new(domain, null)


func model() -> Gs2AsyncResult:
    var pair = Gs2InventoryReferenceOfCache.get_cache(
        _gs2.cache,
        namespace_name,
        user_id,
        inventory_name,
        item_name,
        item_set_name,
        reference_of,
        (null if access_token == null else access_token.time_offset)
    )
    if pair[1]:
        return Gs2AsyncResult.new(pair[0], null)
    return await Gs2InventoryReferenceOfCache.fetch(
        _gs2.cache,
        namespace_name,
        user_id,
        inventory_name,
        item_name,
        item_set_name,
        reference_of,
        (null if access_token == null else access_token.time_offset),
        func():
            var get_result = await get_(Gs2InventoryGetReferenceOfRequest.new())
            return get_result
    )


func invalidate() -> void:
    Gs2InventoryReferenceOfCache.delete_cache(
        _gs2.cache,
        namespace_name,
        user_id,
        inventory_name,
        item_name,
        item_set_name,
        reference_of,
        (null if access_token == null else access_token.time_offset)
    )


func subscribe_model(callback: Callable) -> int:
    return _gs2.cache.subscribe(
        "String",
        Gs2InventoryReferenceOfCache.cache_parent_key(
            namespace_name,
            user_id,
            inventory_name,
            item_name,
            item_set_name,
            (null if access_token == null else access_token.time_offset)
        ),
        Gs2InventoryReferenceOfCache.cache_key(
            reference_of
        ),
        callback,
        func(): await model()
    )


func unsubscribe_model(callback_id: int) -> void:
    _gs2.cache.unsubscribe(
        "String",
        Gs2InventoryReferenceOfCache.cache_parent_key(
            namespace_name,
            user_id,
            inventory_name,
            item_name,
            item_set_name,
            (null if access_token == null else access_token.time_offset)
        ),
        Gs2InventoryReferenceOfCache.cache_key(
            reference_of
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