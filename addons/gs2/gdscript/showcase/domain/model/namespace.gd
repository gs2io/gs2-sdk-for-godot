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
class_name Gs2ShowcaseNamespaceDomain
extends RefCounted

var _gs2: Gs2DomainCore
var _client: Gs2ShowcaseRestClient
var namespace_name: Variant = null
var status: Variant = null
var url: Variant = null
var upload_token: Variant = null
var upload_url: Variant = null
var next_page_token: Variant = null


func _init(
    gs2: Gs2DomainCore,
    namespace_name_
):
    _gs2 = gs2
    _client = Gs2ShowcaseRestClient.new(gs2.rest_session)
    namespace_name = namespace_name_


func get_status(
    request: Gs2ShowcaseGetNamespaceStatusRequest
) -> Gs2AsyncResult:
    request = request.with_context_stack(_gs2.default_context_stack if request.context_stack == null or request.context_stack == "" else request.context_stack)
    request = request.with_namespace_name(namespace_name)
    var async_result = await Gs2ShowcaseGetNamespaceStatusMethodCache.invoke(
        _gs2.cache,
        null,
        null,
        request,
        func(): return await _client.get_namespace_status(request)
    )
    if async_result.error != null:
        return async_result
    var result = async_result.result
    var domain = self
    self.status = null if result == null else result.status
    domain.status = self.status
    return Gs2AsyncResult.new(domain, null)


func get_(
    request: Gs2ShowcaseGetNamespaceRequest
) -> Gs2AsyncResult:
    request = request.with_context_stack(_gs2.default_context_stack if request.context_stack == null or request.context_stack == "" else request.context_stack)
    request = request.with_namespace_name(namespace_name)
    var async_result = await Gs2ShowcaseGetNamespaceMethodCache.invoke(
        _gs2.cache,
        null,
        null,
        request,
        func(): return await _client.get_namespace(request)
    )
    if async_result.error != null:
        return async_result
    var result = async_result.result
    return Gs2AsyncResult.new(null if result == null else result.item, null)


func update(
    request: Gs2ShowcaseUpdateNamespaceRequest
) -> Gs2AsyncResult:
    request = request.with_context_stack(_gs2.default_context_stack if request.context_stack == null or request.context_stack == "" else request.context_stack)
    request = request.with_namespace_name(namespace_name)
    var async_result = await Gs2ShowcaseUpdateNamespaceMethodCache.invoke(
        _gs2.cache,
        null,
        null,
        request,
        func(): return await _client.update_namespace(request)
    )
    if async_result.error != null:
        return async_result
    var result = async_result.result
    var domain = self
    return Gs2AsyncResult.new(domain, null)


func delete(
    request: Gs2ShowcaseDeleteNamespaceRequest
) -> Gs2AsyncResult:
    request = request.with_context_stack(_gs2.default_context_stack if request.context_stack == null or request.context_stack == "" else request.context_stack)
    request = request.with_namespace_name(namespace_name)
    var async_result = await Gs2ShowcaseDeleteNamespaceMethodCache.invoke(
        _gs2.cache,
        null,
        null,
        request,
        func(): return await _client.delete_namespace(request)
    )
    if async_result.error != null and not (async_result.error is Gs2NotFoundException):
        return async_result
    var result = async_result.result
    var domain = self
    return Gs2AsyncResult.new(domain, null)


func create_sales_item_master(
    request: Gs2ShowcaseCreateSalesItemMasterRequest
) -> Gs2AsyncResult:
    request = request.with_context_stack(_gs2.default_context_stack if request.context_stack == null or request.context_stack == "" else request.context_stack)
    request = request.with_namespace_name(namespace_name)
    var async_result = await Gs2ShowcaseCreateSalesItemMasterMethodCache.invoke(
        _gs2.cache,
        null,
        null,
        request,
        func(): return await _client.create_sales_item_master(request)
    )
    if async_result.error != null:
        return async_result
    var result = async_result.result
    var ref = null if result == null else result.item
    var domain = Gs2ShowcaseSalesItemMasterDomain.new(
        _gs2,
        namespace_name,
        (null if ref == null else ref.name)
    )
    return Gs2AsyncResult.new(domain, null)


func create_sales_item_group_master(
    request: Gs2ShowcaseCreateSalesItemGroupMasterRequest
) -> Gs2AsyncResult:
    request = request.with_context_stack(_gs2.default_context_stack if request.context_stack == null or request.context_stack == "" else request.context_stack)
    request = request.with_namespace_name(namespace_name)
    var async_result = await Gs2ShowcaseCreateSalesItemGroupMasterMethodCache.invoke(
        _gs2.cache,
        null,
        null,
        request,
        func(): return await _client.create_sales_item_group_master(request)
    )
    if async_result.error != null:
        return async_result
    var result = async_result.result
    var ref = null if result == null else result.item
    var domain = Gs2ShowcaseSalesItemGroupMasterDomain.new(
        _gs2,
        namespace_name,
        (null if ref == null else ref.name)
    )
    return Gs2AsyncResult.new(domain, null)


func create_showcase_master(
    request: Gs2ShowcaseCreateShowcaseMasterRequest
) -> Gs2AsyncResult:
    request = request.with_context_stack(_gs2.default_context_stack if request.context_stack == null or request.context_stack == "" else request.context_stack)
    request = request.with_namespace_name(namespace_name)
    var async_result = await Gs2ShowcaseCreateShowcaseMasterMethodCache.invoke(
        _gs2.cache,
        null,
        null,
        request,
        func(): return await _client.create_showcase_master(request)
    )
    if async_result.error != null:
        return async_result
    var result = async_result.result
    var ref = null if result == null else result.item
    var domain = Gs2ShowcaseShowcaseMasterDomain.new(
        _gs2,
        namespace_name,
        (null if ref == null else ref.name)
    )
    return Gs2AsyncResult.new(domain, null)


func create_random_showcase_master(
    request: Gs2ShowcaseCreateRandomShowcaseMasterRequest
) -> Gs2AsyncResult:
    request = request.with_context_stack(_gs2.default_context_stack if request.context_stack == null or request.context_stack == "" else request.context_stack)
    request = request.with_namespace_name(namespace_name)
    var async_result = await Gs2ShowcaseCreateRandomShowcaseMasterMethodCache.invoke(
        _gs2.cache,
        null,
        null,
        request,
        func(): return await _client.create_random_showcase_master(request)
    )
    if async_result.error != null:
        return async_result
    var result = async_result.result
    var ref = null if result == null else result.item
    var domain = Gs2ShowcaseRandomShowcaseMasterDomain.new(
        _gs2,
        namespace_name,
        (null if ref == null else ref.name)
    )
    return Gs2AsyncResult.new(domain, null)
func current_showcase_master(
) -> Gs2ShowcaseCurrentShowcaseMasterDomain:
    return Gs2ShowcaseCurrentShowcaseMasterDomain.new(
        _gs2,
        namespace_name
    )


func sales_item_masters(
    name_prefix = null
) -> Gs2ShowcaseDescribeSalesItemMastersIterator:
    return Gs2ShowcaseDescribeSalesItemMastersIterator.new(
        _gs2,
        _client,
        namespace_name,
        name_prefix
    )


func subscribe_sales_item_masters(
    callback: Callable,
    name_prefix = null
) -> int:
    return _gs2.cache.list_subscribe(
        "Gs2ShowcaseSalesItemMaster",
        Gs2ShowcaseSalesItemMasterCache.cache_parent_key(
            namespace_name,
            null
        ),
        callback
    )


func unsubscribe_sales_item_masters(
    callback_id: int,
    name_prefix = null
) -> void:
    _gs2.cache.list_unsubscribe(
        "Gs2ShowcaseSalesItemMaster",
        Gs2ShowcaseSalesItemMasterCache.cache_parent_key(
            namespace_name,
            null
        ),
        callback_id
    )


func invalidate_sales_item_masters(
    name_prefix = null
) -> void:
    _gs2.cache.clear_list_cache(
        "Gs2ShowcaseSalesItemMaster",
        Gs2ShowcaseSalesItemMasterCache.cache_parent_key(
            namespace_name,
            null
        )
    )
func sales_item_master(
    sales_item_name
) -> Gs2ShowcaseSalesItemMasterDomain:
    return Gs2ShowcaseSalesItemMasterDomain.new(
        _gs2,
        namespace_name,
        sales_item_name
    )


func sales_item_group_masters(
    name_prefix = null
) -> Gs2ShowcaseDescribeSalesItemGroupMastersIterator:
    return Gs2ShowcaseDescribeSalesItemGroupMastersIterator.new(
        _gs2,
        _client,
        namespace_name,
        name_prefix
    )


func subscribe_sales_item_group_masters(
    callback: Callable,
    name_prefix = null
) -> int:
    return _gs2.cache.list_subscribe(
        "Gs2ShowcaseSalesItemGroupMaster",
        Gs2ShowcaseSalesItemGroupMasterCache.cache_parent_key(
            namespace_name,
            null
        ),
        callback
    )


func unsubscribe_sales_item_group_masters(
    callback_id: int,
    name_prefix = null
) -> void:
    _gs2.cache.list_unsubscribe(
        "Gs2ShowcaseSalesItemGroupMaster",
        Gs2ShowcaseSalesItemGroupMasterCache.cache_parent_key(
            namespace_name,
            null
        ),
        callback_id
    )


func invalidate_sales_item_group_masters(
    name_prefix = null
) -> void:
    _gs2.cache.clear_list_cache(
        "Gs2ShowcaseSalesItemGroupMaster",
        Gs2ShowcaseSalesItemGroupMasterCache.cache_parent_key(
            namespace_name,
            null
        )
    )
func sales_item_group_master(
    sales_item_group_name
) -> Gs2ShowcaseSalesItemGroupMasterDomain:
    return Gs2ShowcaseSalesItemGroupMasterDomain.new(
        _gs2,
        namespace_name,
        sales_item_group_name
    )
func user(
    user_id
) -> Gs2ShowcaseUserDomain:
    return Gs2ShowcaseUserDomain.new(
        _gs2,
        namespace_name,
        user_id
    )


func access_token(
    access_token_
) -> Gs2ShowcaseUserAccessTokenDomain:
    return Gs2ShowcaseUserAccessTokenDomain.new(
        _gs2,
        namespace_name,
        access_token_
    )


func showcase_masters(
    name_prefix = null
) -> Gs2ShowcaseDescribeShowcaseMastersIterator:
    return Gs2ShowcaseDescribeShowcaseMastersIterator.new(
        _gs2,
        _client,
        namespace_name,
        name_prefix
    )


func subscribe_showcase_masters(
    callback: Callable,
    name_prefix = null
) -> int:
    return _gs2.cache.list_subscribe(
        "Gs2ShowcaseShowcaseMaster",
        Gs2ShowcaseShowcaseMasterCache.cache_parent_key(
            namespace_name,
            null
        ),
        callback
    )


func unsubscribe_showcase_masters(
    callback_id: int,
    name_prefix = null
) -> void:
    _gs2.cache.list_unsubscribe(
        "Gs2ShowcaseShowcaseMaster",
        Gs2ShowcaseShowcaseMasterCache.cache_parent_key(
            namespace_name,
            null
        ),
        callback_id
    )


func invalidate_showcase_masters(
    name_prefix = null
) -> void:
    _gs2.cache.clear_list_cache(
        "Gs2ShowcaseShowcaseMaster",
        Gs2ShowcaseShowcaseMasterCache.cache_parent_key(
            namespace_name,
            null
        )
    )
func showcase_master(
    showcase_name
) -> Gs2ShowcaseShowcaseMasterDomain:
    return Gs2ShowcaseShowcaseMasterDomain.new(
        _gs2,
        namespace_name,
        showcase_name
    )


func random_showcase_masters(
    name_prefix = null
) -> Gs2ShowcaseDescribeRandomShowcaseMastersIterator:
    return Gs2ShowcaseDescribeRandomShowcaseMastersIterator.new(
        _gs2,
        _client,
        namespace_name,
        name_prefix
    )


func subscribe_random_showcase_masters(
    callback: Callable,
    name_prefix = null
) -> int:
    return _gs2.cache.list_subscribe(
        "Gs2ShowcaseRandomShowcaseMaster",
        Gs2ShowcaseRandomShowcaseMasterCache.cache_parent_key(
            namespace_name,
            null
        ),
        callback
    )


func unsubscribe_random_showcase_masters(
    callback_id: int,
    name_prefix = null
) -> void:
    _gs2.cache.list_unsubscribe(
        "Gs2ShowcaseRandomShowcaseMaster",
        Gs2ShowcaseRandomShowcaseMasterCache.cache_parent_key(
            namespace_name,
            null
        ),
        callback_id
    )


func invalidate_random_showcase_masters(
    name_prefix = null
) -> void:
    _gs2.cache.clear_list_cache(
        "Gs2ShowcaseRandomShowcaseMaster",
        Gs2ShowcaseRandomShowcaseMasterCache.cache_parent_key(
            namespace_name,
            null
        )
    )
func random_showcase_master(
    showcase_name
) -> Gs2ShowcaseRandomShowcaseMasterDomain:
    return Gs2ShowcaseRandomShowcaseMasterDomain.new(
        _gs2,
        namespace_name,
        showcase_name
    )


func model() -> Gs2AsyncResult:
    var pair = Gs2ShowcaseNamespaceCache.get_cache(
        _gs2.cache,
        namespace_name,
        null
    )
    if pair[1]:
        return Gs2AsyncResult.new(pair[0], null)
    return await Gs2ShowcaseNamespaceCache.fetch(
        _gs2.cache,
        namespace_name,
        null,
        func():
            var get_result = await get_(Gs2ShowcaseGetNamespaceRequest.new())
            return get_result
    )


func invalidate() -> void:
    Gs2ShowcaseNamespaceCache.delete_cache(
        _gs2.cache,
        namespace_name,
        null
    )


func subscribe_model(callback: Callable) -> int:
    return _gs2.cache.subscribe(
        "Gs2ShowcaseNamespace",
        Gs2ShowcaseNamespaceCache.cache_parent_key(
            null
        ),
        Gs2ShowcaseNamespaceCache.cache_key(
            namespace_name
        ),
        callback,
        func(): await model()
    )


func unsubscribe_model(callback_id: int) -> void:
    _gs2.cache.unsubscribe(
        "Gs2ShowcaseNamespace",
        Gs2ShowcaseNamespaceCache.cache_parent_key(
            null
        ),
        Gs2ShowcaseNamespaceCache.cache_key(
            namespace_name
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