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
class_name Gs2InventoryItemSetDomain
extends RefCounted

var _gs2: Gs2DomainCore
var _client: Gs2InventoryRestClient
var namespace_name: Variant = null
var user_id: Variant = null
var inventory_name: Variant = null
var item_name: Variant = null
var item_set_name: Variant = null
var body: Variant = null
var signature: Variant = null
var overflow_count: Variant = null


func _init(
    gs2: Gs2DomainCore,
    namespace_name_,
    user_id_,
    inventory_name_,
    item_name_,
    item_set_name_
):
    _gs2 = gs2
    _client = Gs2InventoryRestClient.new(gs2.rest_session)
    namespace_name = namespace_name_
    user_id = user_id_
    inventory_name = inventory_name_
    item_name = item_name_
    item_set_name = item_set_name_


func get_(
    request: Gs2InventoryGetItemSetByUserIdRequest
) -> Gs2AsyncResult:
    request = request.with_context_stack(_gs2.default_context_stack if request.context_stack == null or request.context_stack == "" else request.context_stack)
    request = request.with_namespace_name(namespace_name)
    request = request.with_inventory_name(inventory_name)
    request = request.with_user_id(user_id)
    request = request.with_item_name(item_name)
    request = request.with_item_set_name(item_set_name)
    var async_result = await Gs2InventoryGetItemSetByUserIdMethodCache.invoke(
        _gs2.cache,
        user_id,
        null,
        request,
        func(): return await _client.get_item_set_by_user_id(request)
    )
    if async_result.error != null:
        return async_result
    var result = async_result.result
    return Gs2AsyncResult.new(null if result == null else result.items, null)


func get_item_with_signature(
    request: Gs2InventoryGetItemWithSignatureByUserIdRequest
) -> Gs2AsyncResult:
    request = request.with_context_stack(_gs2.default_context_stack if request.context_stack == null or request.context_stack == "" else request.context_stack)
    request = request.with_namespace_name(namespace_name)
    request = request.with_inventory_name(inventory_name)
    request = request.with_user_id(user_id)
    request = request.with_item_name(item_name)
    request = request.with_item_set_name(item_set_name)
    var async_result = await Gs2InventoryGetItemWithSignatureByUserIdMethodCache.invoke(
        _gs2.cache,
        user_id,
        null,
        request,
        func(): return await _client.get_item_with_signature_by_user_id(request)
    )
    if async_result.error != null:
        return async_result
    var result = async_result.result
    var domain = self
    self.body = null if result == null else result.body
    self.signature = null if result == null else result.signature
    return Gs2AsyncResult.new(domain, null)


func acquire(
    request: Gs2InventoryAcquireItemSetByUserIdRequest
) -> Gs2AsyncResult:
    request = request.with_context_stack(_gs2.default_context_stack if request.context_stack == null or request.context_stack == "" else request.context_stack)
    request = request.with_namespace_name(namespace_name)
    request = request.with_inventory_name(inventory_name)
    request = request.with_item_name(item_name)
    request = request.with_user_id(user_id)
    request = request.with_item_set_name(item_set_name)
    var async_result = await Gs2InventoryAcquireItemSetByUserIdMethodCache.invoke(
        _gs2.cache,
        user_id,
        null,
        request,
        func(): return await _client.acquire_item_set_by_user_id(request)
    )
    if async_result.error != null:
        return async_result
    var result = async_result.result
    var domain = self
    self.overflow_count = null if result == null else result.overflow_count
    return Gs2AsyncResult.new(domain, null)


func consume(
    request: Gs2InventoryConsumeItemSetByUserIdRequest
) -> Gs2AsyncResult:
    request = request.with_context_stack(_gs2.default_context_stack if request.context_stack == null or request.context_stack == "" else request.context_stack)
    request = request.with_namespace_name(namespace_name)
    request = request.with_inventory_name(inventory_name)
    request = request.with_user_id(user_id)
    request = request.with_item_name(item_name)
    request = request.with_item_set_name(item_set_name)
    var async_result = await Gs2InventoryConsumeItemSetByUserIdMethodCache.invoke(
        _gs2.cache,
        user_id,
        null,
        request,
        func(): return await _client.consume_item_set_by_user_id(request)
    )
    if async_result.error != null:
        return async_result
    var result = async_result.result
    var domain = self
    return Gs2AsyncResult.new(domain, null)


func delete(
    request: Gs2InventoryDeleteItemSetByUserIdRequest
) -> Gs2AsyncResult:
    request = request.with_context_stack(_gs2.default_context_stack if request.context_stack == null or request.context_stack == "" else request.context_stack)
    request = request.with_namespace_name(namespace_name)
    request = request.with_inventory_name(inventory_name)
    request = request.with_user_id(user_id)
    request = request.with_item_name(item_name)
    request = request.with_item_set_name(item_set_name)
    var async_result = await Gs2InventoryDeleteItemSetByUserIdMethodCache.invoke(
        _gs2.cache,
        user_id,
        null,
        request,
        func(): return await _client.delete_item_set_by_user_id(request)
    )
    if async_result.error != null and not (async_result.error is Gs2NotFoundException):
        return async_result
    var result = async_result.result
    var domain = self
    return Gs2AsyncResult.new(domain, null)


func verify(
    request: Gs2InventoryVerifyItemSetByUserIdRequest
) -> Gs2AsyncResult:
    request = request.with_context_stack(_gs2.default_context_stack if request.context_stack == null or request.context_stack == "" else request.context_stack)
    request = request.with_namespace_name(namespace_name)
    request = request.with_user_id(user_id)
    request = request.with_inventory_name(inventory_name)
    request = request.with_item_name(item_name)
    request = request.with_item_set_name(item_set_name)
    var async_result = await Gs2InventoryVerifyItemSetByUserIdMethodCache.invoke(
        _gs2.cache,
        user_id,
        null,
        request,
        func(): return await _client.verify_item_set_by_user_id(request)
    )
    if async_result.error != null:
        return async_result
    var result = async_result.result
    var domain = self
    return Gs2AsyncResult.new(domain, null)


func add_reference_of(
    request: Gs2InventoryAddReferenceOfByUserIdRequest
) -> Gs2AsyncResult:
    request = request.with_context_stack(_gs2.default_context_stack if request.context_stack == null or request.context_stack == "" else request.context_stack)
    request = request.with_namespace_name(namespace_name)
    request = request.with_inventory_name(inventory_name)
    request = request.with_user_id(user_id)
    request = request.with_item_name(item_name)
    request = request.with_item_set_name(item_set_name)
    var async_result = await Gs2InventoryAddReferenceOfByUserIdMethodCache.invoke(
        _gs2.cache,
        user_id,
        null,
        request,
        func(): return await _client.add_reference_of_by_user_id(request)
    )
    if async_result.error != null:
        return async_result
    var result = async_result.result
# diff --- start
#    var ref = null if result == null else result.item
#    var domain = Gs2InventoryItemSetDomain.new(
#        _gs2,
#        namespace_name,
#        (null if ref == null else ref.user_id),
#        (null if ref == null else ref.inventory_name),
#        (null if ref == null else ref.item_name),
#        (null if ref == null else ref.name)
#    )
# diff --- end
# diff +++ start
    var domain = Gs2InventoryReferenceOfDomain.new(
        _gs2,
        namespace_name,
        user_id,
        inventory_name,
        item_name,
        item_set_name,
        request.reference_of
    )
# diff +++ end
    return Gs2AsyncResult.new(domain, null)


func reference_oves(
    time_offset_token = null
) -> Gs2InventoryDescribeReferenceOfByUserIdIterator:
    return Gs2InventoryDescribeReferenceOfByUserIdIterator.new(
        _gs2,
        _client,
        namespace_name,
        inventory_name,
        user_id,
        item_name,
        item_set_name,
        time_offset_token
    )
func reference_of(
    reference_of
) -> Gs2InventoryReferenceOfDomain:
    return Gs2InventoryReferenceOfDomain.new(
        _gs2,
        namespace_name,
        user_id,
        inventory_name,
        item_name,
        item_set_name,
        reference_of
    )


func model() -> Gs2AsyncResult:
# diff --- start
#    return Gs2AsyncResult.new(null, null)
# diff --- end
# diff +++ start
    if item_set_name == null:
        var pair = Gs2InventoryItemSetCache.get_cache_list(
            _gs2.cache,
            namespace_name,
            user_id,
            inventory_name,
            item_name,
            null
        )
        if pair[1]:
            return Gs2AsyncResult.new(pair[0], null)
        return await Gs2InventoryItemSetCache.fetch_list(
            _gs2.cache,
            namespace_name,
            user_id,
            inventory_name,
            item_name,
            null,
            func():
                var get_result = await get_(Gs2InventoryGetItemSetByUserIdRequest.new())
                return get_result
        )
    else:
        var pair = Gs2InventoryItemSetCache.get_cache(
            _gs2.cache,
            namespace_name,
            user_id,
            inventory_name,
            item_name,
            item_set_name,
            null
        )
        if pair[1]:
            return Gs2AsyncResult.new([pair[0]] if pair[0] != null else [], null)
        var get_result = await get_(Gs2InventoryGetItemSetByUserIdRequest.new())
        if get_result.error != null:
            if get_result.error is Gs2NotFoundException:
                Gs2InventoryItemSetCache.put_cache(
                    null,
                    _gs2.cache,
                    namespace_name,
                    user_id,
                    inventory_name,
                    item_name,
                    item_set_name,
                    null
                )
                if get_result.error.errors.size() != 0 and get_result.error.errors[0].component == "itemSet":
                    return Gs2AsyncResult.new([], null)
            return get_result
        var items_ = get_result.result
        for v in (items_ if items_ != null else []):
            Gs2InventoryItemSetCache.put_cache(
                v,
                _gs2.cache,
                namespace_name,
                user_id,
                inventory_name,
                item_name,
                item_set_name,
                null
            )
        return Gs2AsyncResult.new(items_, null)
# diff +++ end


func invalidate() -> void:
# diff --- start
#    pass
# diff --- end
# diff +++ start
    if item_set_name == null:
        Gs2InventoryItemSetCache.delete_cache(
            _gs2.cache,
            namespace_name,
            user_id,
            inventory_name,
            item_name,
            item_set_name,
            null
        )
    else:
        Gs2InventoryItemSetCache.delete_cache_list(
            _gs2.cache,
            namespace_name,
            user_id,
            inventory_name,
            item_name,
            null
        )
# diff +++ end


func subscribe_model(callback: Callable) -> int:
# diff --- start
#    return _gs2.cache.subscribe(
#        "Array",
#        Gs2InventoryItemSetCache.cache_parent_key(
#            namespace_name,
#            user_id,
#            inventory_name,
#            null
#        ),
#        Gs2InventoryItemSetCache.cache_key(
#            item_name,
#            item_set_name
#        ),
#        callback,
#        func(): await model()
#    )
# diff --- end
# diff +++ start
    if item_set_name == null:
        return _gs2.cache.subscribe(
            "Gs2InventoryItemSet[]",
            Gs2InventoryItemSetCache.cache_parent_key(
                namespace_name,
                user_id,
                inventory_name,
                null
            ),
            Gs2InventoryItemSetCache.cache_key_list(
                item_name
            ),
            callback,
            func(): await model()
        )
    return _gs2.cache.subscribe(
        "Gs2InventoryItemSet",
        Gs2InventoryItemSetCache.cache_parent_key(
            namespace_name,
            user_id,
            inventory_name,
            null
        ),
        Gs2InventoryItemSetCache.cache_key(
            item_name,
            item_set_name
        ),
        callback,
        func(): await model()
    )
# diff +++ end


func unsubscribe_model(callback_id: int) -> void:
# diff --- start
#    _gs2.cache.unsubscribe(
#        "Array",
#        Gs2InventoryItemSetCache.cache_parent_key(
#            namespace_name,
#            user_id,
#            inventory_name,
#            null
#        ),
#        Gs2InventoryItemSetCache.cache_key(
#            item_name,
#            item_set_name
#        ),
#        callback_id
#    )
# diff --- end
# diff +++ start
    if item_set_name == null:
        _gs2.cache.unsubscribe(
            "Gs2InventoryItemSet[]",
            Gs2InventoryItemSetCache.cache_parent_key(
                namespace_name,
                user_id,
                inventory_name,
                null
            ),
            Gs2InventoryItemSetCache.cache_key_list(
                item_name
            ),
            callback_id
        )
        return
    _gs2.cache.unsubscribe(
        "Gs2InventoryItemSet",
        Gs2InventoryItemSetCache.cache_parent_key(
            namespace_name,
            user_id,
            inventory_name,
            null
        ),
        Gs2InventoryItemSetCache.cache_key(
            item_name,
            item_set_name
        ),
        callback_id
    )
# diff +++ end


func subscribe_model_with_initial_call(callback: Callable) -> Gs2AsyncResult:
    var model_result = await model()
    if model_result.error != null:
        return model_result
    var callback_id = subscribe_model(callback)
    callback.call(model_result.result)
    return Gs2AsyncResult.new(callback_id, null)