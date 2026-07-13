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
class_name Gs2Money2NamespaceDomain
extends RefCounted

var _gs2: Gs2Domain
var _client: Gs2Money2RestClient
var namespace_name: Variant = null
var status: Variant = null
var url: Variant = null
var upload_token: Variant = null
var upload_url: Variant = null
var next_page_token: Variant = null


func _init(
    gs2: Gs2Domain,
    namespace_name_
):
    _gs2 = gs2
    _client = Gs2Money2RestClient.new(gs2.rest_session)
    namespace_name = namespace_name_


func get_status(
    request: Gs2Money2GetNamespaceStatusRequest
) -> Gs2AsyncResult:
    request = request.with_context_stack(_gs2.default_context_stack if request.context_stack == null or request.context_stack == "" else request.context_stack)
    request = request.with_namespace_name(namespace_name)
    var async_result = await Gs2Money2GetNamespaceStatusMethodCache.invoke(
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
    request: Gs2Money2GetNamespaceRequest
) -> Gs2AsyncResult:
    request = request.with_context_stack(_gs2.default_context_stack if request.context_stack == null or request.context_stack == "" else request.context_stack)
    request = request.with_namespace_name(namespace_name)
    var async_result = await Gs2Money2GetNamespaceMethodCache.invoke(
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
    request: Gs2Money2UpdateNamespaceRequest
) -> Gs2AsyncResult:
    request = request.with_context_stack(_gs2.default_context_stack if request.context_stack == null or request.context_stack == "" else request.context_stack)
    request = request.with_namespace_name(namespace_name)
    var async_result = await Gs2Money2UpdateNamespaceMethodCache.invoke(
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
    request: Gs2Money2DeleteNamespaceRequest
) -> Gs2AsyncResult:
    request = request.with_context_stack(_gs2.default_context_stack if request.context_stack == null or request.context_stack == "" else request.context_stack)
    request = request.with_namespace_name(namespace_name)
    var async_result = await Gs2Money2DeleteNamespaceMethodCache.invoke(
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


func create_store_content_model_master(
    request: Gs2Money2CreateStoreContentModelMasterRequest
) -> Gs2AsyncResult:
    request = request.with_context_stack(_gs2.default_context_stack if request.context_stack == null or request.context_stack == "" else request.context_stack)
    request = request.with_namespace_name(namespace_name)
    var async_result = await Gs2Money2CreateStoreContentModelMasterMethodCache.invoke(
        _gs2.cache,
        null,
        null,
        request,
        func(): return await _client.create_store_content_model_master(request)
    )
    if async_result.error != null:
        return async_result
    var result = async_result.result
    var ref = null if result == null else result.item
    var domain = Gs2Money2StoreContentModelMasterDomain.new(
        _gs2,
        namespace_name,
        (null if ref == null else ref.name)
    )
    return Gs2AsyncResult.new(domain, null)


func create_store_subscription_content_model_master(
    request: Gs2Money2CreateStoreSubscriptionContentModelMasterRequest
) -> Gs2AsyncResult:
    request = request.with_context_stack(_gs2.default_context_stack if request.context_stack == null or request.context_stack == "" else request.context_stack)
    request = request.with_namespace_name(namespace_name)
    var async_result = await Gs2Money2CreateStoreSubscriptionContentModelMasterMethodCache.invoke(
        _gs2.cache,
        null,
        null,
        request,
        func(): return await _client.create_store_subscription_content_model_master(request)
    )
    if async_result.error != null:
        return async_result
    var result = async_result.result
    var ref = null if result == null else result.item
    var domain = Gs2Money2StoreSubscriptionContentModelMasterDomain.new(
        _gs2,
        namespace_name,
        (null if ref == null else ref.name)
    )
    return Gs2AsyncResult.new(domain, null)


func daily_transaction_histories_by_currency(
    currency,
    year,
    month = null
) -> Gs2Money2DescribeDailyTransactionHistoriesByCurrencyIterator:
    return Gs2Money2DescribeDailyTransactionHistoriesByCurrencyIterator.new(
        _gs2,
        _client,
        namespace_name,
        currency,
        year,
        month
    )


func subscribe_daily_transaction_histories_by_currency(
    callback: Callable,
    currency,
    year,
    month = null
) -> int:
    return _gs2.cache.list_subscribe(
        "Gs2Money2DailyTransactionHistory",
        Gs2Money2DailyTransactionHistoryCache.cache_parent_key(
            namespace_name,
            null
        ),
        callback
    )


func unsubscribe_daily_transaction_histories_by_currency(
    callback_id: int,
    currency,
    year,
    month = null
) -> void:
    _gs2.cache.list_unsubscribe(
        "Gs2Money2DailyTransactionHistory",
        Gs2Money2DailyTransactionHistoryCache.cache_parent_key(
            namespace_name,
            null
        ),
        callback_id
    )


func invalidate_daily_transaction_histories_by_currency(
    currency,
    year,
    month = null
) -> void:
    _gs2.cache.clear_list_cache(
        "Gs2Money2DailyTransactionHistory",
        Gs2Money2DailyTransactionHistoryCache.cache_parent_key(
            namespace_name,
            null
        )
    )


func daily_transaction_histories(
    year,
    month = null,
    day = null
) -> Gs2Money2DescribeDailyTransactionHistoriesIterator:
    return Gs2Money2DescribeDailyTransactionHistoriesIterator.new(
        _gs2,
        _client,
        namespace_name,
        year,
        month,
        day
    )


func subscribe_daily_transaction_histories(
    callback: Callable,
    year,
    month = null,
    day = null
) -> int:
    return _gs2.cache.list_subscribe(
        "Gs2Money2DailyTransactionHistory",
        Gs2Money2DailyTransactionHistoryCache.cache_parent_key(
            namespace_name,
            null
        ),
        callback
    )


func unsubscribe_daily_transaction_histories(
    callback_id: int,
    year,
    month = null,
    day = null
) -> void:
    _gs2.cache.list_unsubscribe(
        "Gs2Money2DailyTransactionHistory",
        Gs2Money2DailyTransactionHistoryCache.cache_parent_key(
            namespace_name,
            null
        ),
        callback_id
    )


func invalidate_daily_transaction_histories(
    year,
    month = null,
    day = null
) -> void:
    _gs2.cache.clear_list_cache(
        "Gs2Money2DailyTransactionHistory",
        Gs2Money2DailyTransactionHistoryCache.cache_parent_key(
            namespace_name,
            null
        )
    )
func daily_transaction_history(
    year,
    month,
    day,
    currency
) -> Gs2Money2DailyTransactionHistoryDomain:
    return Gs2Money2DailyTransactionHistoryDomain.new(
        _gs2,
        namespace_name,
        year,
        month,
        day,
        currency
    )
func user(
    user_id
) -> Gs2Money2UserDomain:
    return Gs2Money2UserDomain.new(
        _gs2,
        namespace_name,
        user_id
    )


func access_token(
    access_token_
) -> Gs2Money2UserAccessTokenDomain:
    return Gs2Money2UserAccessTokenDomain.new(
        _gs2,
        namespace_name,
        access_token_
    )
func current_model_master(
) -> Gs2Money2CurrentModelMasterDomain:
    return Gs2Money2CurrentModelMasterDomain.new(
        _gs2,
        namespace_name
    )


func store_content_models(
) -> Gs2Money2DescribeStoreContentModelsIterator:
    return Gs2Money2DescribeStoreContentModelsIterator.new(
        _gs2,
        _client,
        namespace_name
    )


func subscribe_store_content_models(
    callback: Callable
) -> int:
    return _gs2.cache.list_subscribe(
        "Gs2Money2StoreContentModel",
        Gs2Money2StoreContentModelCache.cache_parent_key(
            namespace_name,
            null
        ),
        callback
    )


func unsubscribe_store_content_models(
    callback_id: int
) -> void:
    _gs2.cache.list_unsubscribe(
        "Gs2Money2StoreContentModel",
        Gs2Money2StoreContentModelCache.cache_parent_key(
            namespace_name,
            null
        ),
        callback_id
    )


func invalidate_store_content_models(
) -> void:
    _gs2.cache.clear_list_cache(
        "Gs2Money2StoreContentModel",
        Gs2Money2StoreContentModelCache.cache_parent_key(
            namespace_name,
            null
        )
    )
func store_content_model(
    content_name
) -> Gs2Money2StoreContentModelDomain:
    return Gs2Money2StoreContentModelDomain.new(
        _gs2,
        namespace_name,
        content_name
    )


func unused_balances(
) -> Gs2Money2DescribeUnusedBalancesIterator:
    return Gs2Money2DescribeUnusedBalancesIterator.new(
        _gs2,
        _client,
        namespace_name
    )


func subscribe_unused_balances(
    callback: Callable
) -> int:
    return _gs2.cache.list_subscribe(
        "Gs2Money2UnusedBalance",
        Gs2Money2UnusedBalanceCache.cache_parent_key(
            namespace_name,
            null
        ),
        callback
    )


func unsubscribe_unused_balances(
    callback_id: int
) -> void:
    _gs2.cache.list_unsubscribe(
        "Gs2Money2UnusedBalance",
        Gs2Money2UnusedBalanceCache.cache_parent_key(
            namespace_name,
            null
        ),
        callback_id
    )


func invalidate_unused_balances(
) -> void:
    _gs2.cache.clear_list_cache(
        "Gs2Money2UnusedBalance",
        Gs2Money2UnusedBalanceCache.cache_parent_key(
            namespace_name,
            null
        )
    )
func unused_balance(
    currency
) -> Gs2Money2UnusedBalanceDomain:
    return Gs2Money2UnusedBalanceDomain.new(
        _gs2,
        namespace_name,
        currency
    )


func store_content_model_masters(
    name_prefix = null
) -> Gs2Money2DescribeStoreContentModelMastersIterator:
    return Gs2Money2DescribeStoreContentModelMastersIterator.new(
        _gs2,
        _client,
        namespace_name,
        name_prefix
    )


func subscribe_store_content_model_masters(
    callback: Callable,
    name_prefix = null
) -> int:
    return _gs2.cache.list_subscribe(
        "Gs2Money2StoreContentModelMaster",
        Gs2Money2StoreContentModelMasterCache.cache_parent_key(
            namespace_name,
            null
        ),
        callback
    )


func unsubscribe_store_content_model_masters(
    callback_id: int,
    name_prefix = null
) -> void:
    _gs2.cache.list_unsubscribe(
        "Gs2Money2StoreContentModelMaster",
        Gs2Money2StoreContentModelMasterCache.cache_parent_key(
            namespace_name,
            null
        ),
        callback_id
    )


func invalidate_store_content_model_masters(
    name_prefix = null
) -> void:
    _gs2.cache.clear_list_cache(
        "Gs2Money2StoreContentModelMaster",
        Gs2Money2StoreContentModelMasterCache.cache_parent_key(
            namespace_name,
            null
        )
    )
func store_content_model_master(
    content_name
) -> Gs2Money2StoreContentModelMasterDomain:
    return Gs2Money2StoreContentModelMasterDomain.new(
        _gs2,
        namespace_name,
        content_name
    )


func store_subscription_content_models(
) -> Gs2Money2DescribeStoreSubscriptionContentModelsIterator:
    return Gs2Money2DescribeStoreSubscriptionContentModelsIterator.new(
        _gs2,
        _client,
        namespace_name
    )


func subscribe_store_subscription_content_models(
    callback: Callable
) -> int:
    return _gs2.cache.list_subscribe(
        "Gs2Money2StoreSubscriptionContentModel",
        Gs2Money2StoreSubscriptionContentModelCache.cache_parent_key(
            namespace_name,
            null
        ),
        callback
    )


func unsubscribe_store_subscription_content_models(
    callback_id: int
) -> void:
    _gs2.cache.list_unsubscribe(
        "Gs2Money2StoreSubscriptionContentModel",
        Gs2Money2StoreSubscriptionContentModelCache.cache_parent_key(
            namespace_name,
            null
        ),
        callback_id
    )


func invalidate_store_subscription_content_models(
) -> void:
    _gs2.cache.clear_list_cache(
        "Gs2Money2StoreSubscriptionContentModel",
        Gs2Money2StoreSubscriptionContentModelCache.cache_parent_key(
            namespace_name,
            null
        )
    )
func store_subscription_content_model(
    content_name
) -> Gs2Money2StoreSubscriptionContentModelDomain:
    return Gs2Money2StoreSubscriptionContentModelDomain.new(
        _gs2,
        namespace_name,
        content_name
    )


func store_subscription_content_model_masters(
    name_prefix = null
) -> Gs2Money2DescribeStoreSubscriptionContentModelMastersIterator:
    return Gs2Money2DescribeStoreSubscriptionContentModelMastersIterator.new(
        _gs2,
        _client,
        namespace_name,
        name_prefix
    )


func subscribe_store_subscription_content_model_masters(
    callback: Callable,
    name_prefix = null
) -> int:
    return _gs2.cache.list_subscribe(
        "Gs2Money2StoreSubscriptionContentModelMaster",
        Gs2Money2StoreSubscriptionContentModelMasterCache.cache_parent_key(
            namespace_name,
            null
        ),
        callback
    )


func unsubscribe_store_subscription_content_model_masters(
    callback_id: int,
    name_prefix = null
) -> void:
    _gs2.cache.list_unsubscribe(
        "Gs2Money2StoreSubscriptionContentModelMaster",
        Gs2Money2StoreSubscriptionContentModelMasterCache.cache_parent_key(
            namespace_name,
            null
        ),
        callback_id
    )


func invalidate_store_subscription_content_model_masters(
    name_prefix = null
) -> void:
    _gs2.cache.clear_list_cache(
        "Gs2Money2StoreSubscriptionContentModelMaster",
        Gs2Money2StoreSubscriptionContentModelMasterCache.cache_parent_key(
            namespace_name,
            null
        )
    )
func store_subscription_content_model_master(
    content_name
) -> Gs2Money2StoreSubscriptionContentModelMasterDomain:
    return Gs2Money2StoreSubscriptionContentModelMasterDomain.new(
        _gs2,
        namespace_name,
        content_name
    )


func model() -> Gs2AsyncResult:
    var pair = Gs2Money2NamespaceCache.get_cache(
        _gs2.cache,
        namespace_name,
        null
    )
    if pair[1]:
        return Gs2AsyncResult.new(pair[0], null)
    return await Gs2Money2NamespaceCache.fetch(
        _gs2.cache,
        namespace_name,
        null,
        func():
            var get_result = await get_(Gs2Money2GetNamespaceRequest.new())
            return get_result
    )


func invalidate() -> void:
    Gs2Money2NamespaceCache.delete_cache(
        _gs2.cache,
        namespace_name,
        null
    )


func subscribe_model(callback: Callable) -> int:
    return _gs2.cache.subscribe(
        "Gs2Money2Namespace",
        Gs2Money2NamespaceCache.cache_parent_key(
            null
        ),
        Gs2Money2NamespaceCache.cache_key(
            namespace_name
        ),
        callback,
        func(): await model()
    )


func unsubscribe_model(callback_id: int) -> void:
    _gs2.cache.unsubscribe(
        "Gs2Money2Namespace",
        Gs2Money2NamespaceCache.cache_parent_key(
            null
        ),
        Gs2Money2NamespaceCache.cache_key(
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