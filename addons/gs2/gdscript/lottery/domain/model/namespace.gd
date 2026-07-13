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
class_name Gs2LotteryNamespaceDomain
extends RefCounted

var _gs2: Gs2Domain
var _client: Gs2LotteryRestClient
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
    _client = Gs2LotteryRestClient.new(gs2.rest_session)
    namespace_name = namespace_name_


func get_status(
    request: Gs2LotteryGetNamespaceStatusRequest
) -> Gs2AsyncResult:
    request = request.with_context_stack(_gs2.default_context_stack if request.context_stack == null or request.context_stack == "" else request.context_stack)
    request = request.with_namespace_name(namespace_name)
    var async_result = await Gs2LotteryGetNamespaceStatusMethodCache.invoke(
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
    request: Gs2LotteryGetNamespaceRequest
) -> Gs2AsyncResult:
    request = request.with_context_stack(_gs2.default_context_stack if request.context_stack == null or request.context_stack == "" else request.context_stack)
    request = request.with_namespace_name(namespace_name)
    var async_result = await Gs2LotteryGetNamespaceMethodCache.invoke(
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
    request: Gs2LotteryUpdateNamespaceRequest
) -> Gs2AsyncResult:
    request = request.with_context_stack(_gs2.default_context_stack if request.context_stack == null or request.context_stack == "" else request.context_stack)
    request = request.with_namespace_name(namespace_name)
    var async_result = await Gs2LotteryUpdateNamespaceMethodCache.invoke(
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
    request: Gs2LotteryDeleteNamespaceRequest
) -> Gs2AsyncResult:
    request = request.with_context_stack(_gs2.default_context_stack if request.context_stack == null or request.context_stack == "" else request.context_stack)
    request = request.with_namespace_name(namespace_name)
    var async_result = await Gs2LotteryDeleteNamespaceMethodCache.invoke(
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


func create_prize_table_master(
    request: Gs2LotteryCreatePrizeTableMasterRequest
) -> Gs2AsyncResult:
    request = request.with_context_stack(_gs2.default_context_stack if request.context_stack == null or request.context_stack == "" else request.context_stack)
    request = request.with_namespace_name(namespace_name)
    var async_result = await Gs2LotteryCreatePrizeTableMasterMethodCache.invoke(
        _gs2.cache,
        null,
        null,
        request,
        func(): return await _client.create_prize_table_master(request)
    )
    if async_result.error != null:
        return async_result
    var result = async_result.result
    var ref = null if result == null else result.item
    var domain = Gs2LotteryPrizeTableMasterDomain.new(
        _gs2,
        namespace_name,
        (null if ref == null else ref.name)
    )
    return Gs2AsyncResult.new(domain, null)


func create_lottery_model_master(
    request: Gs2LotteryCreateLotteryModelMasterRequest
) -> Gs2AsyncResult:
    request = request.with_context_stack(_gs2.default_context_stack if request.context_stack == null or request.context_stack == "" else request.context_stack)
    request = request.with_namespace_name(namespace_name)
    var async_result = await Gs2LotteryCreateLotteryModelMasterMethodCache.invoke(
        _gs2.cache,
        null,
        null,
        request,
        func(): return await _client.create_lottery_model_master(request)
    )
    if async_result.error != null:
        return async_result
    var result = async_result.result
    var ref = null if result == null else result.item
    var domain = Gs2LotteryLotteryModelMasterDomain.new(
        _gs2,
        namespace_name,
        (null if ref == null else ref.name)
    )
    return Gs2AsyncResult.new(domain, null)
func current_lottery_master(
) -> Gs2LotteryCurrentLotteryMasterDomain:
    return Gs2LotteryCurrentLotteryMasterDomain.new(
        _gs2,
        namespace_name
    )


func prize_tables(
) -> Gs2LotteryDescribePrizeTablesIterator:
    return Gs2LotteryDescribePrizeTablesIterator.new(
        _gs2,
        _client,
        namespace_name
    )


func subscribe_prize_tables(
    callback: Callable
) -> int:
    return _gs2.cache.list_subscribe(
        "Gs2LotteryPrizeTable",
        Gs2LotteryPrizeTableCache.cache_parent_key(
            namespace_name,
            null
        ),
        callback
    )


func unsubscribe_prize_tables(
    callback_id: int
) -> void:
    _gs2.cache.list_unsubscribe(
        "Gs2LotteryPrizeTable",
        Gs2LotteryPrizeTableCache.cache_parent_key(
            namespace_name,
            null
        ),
        callback_id
    )


func invalidate_prize_tables(
) -> void:
    _gs2.cache.clear_list_cache(
        "Gs2LotteryPrizeTable",
        Gs2LotteryPrizeTableCache.cache_parent_key(
            namespace_name,
            null
        )
    )
func prize_table(
    prize_table_name
) -> Gs2LotteryPrizeTableDomain:
    return Gs2LotteryPrizeTableDomain.new(
        _gs2,
        namespace_name,
        prize_table_name
    )


func lottery_models(
) -> Gs2LotteryDescribeLotteryModelsIterator:
    return Gs2LotteryDescribeLotteryModelsIterator.new(
        _gs2,
        _client,
        namespace_name
    )


func subscribe_lottery_models(
    callback: Callable
) -> int:
    return _gs2.cache.list_subscribe(
        "Gs2LotteryLotteryModel",
        Gs2LotteryLotteryModelCache.cache_parent_key(
            namespace_name,
            null
        ),
        callback
    )


func unsubscribe_lottery_models(
    callback_id: int
) -> void:
    _gs2.cache.list_unsubscribe(
        "Gs2LotteryLotteryModel",
        Gs2LotteryLotteryModelCache.cache_parent_key(
            namespace_name,
            null
        ),
        callback_id
    )


func invalidate_lottery_models(
) -> void:
    _gs2.cache.clear_list_cache(
        "Gs2LotteryLotteryModel",
        Gs2LotteryLotteryModelCache.cache_parent_key(
            namespace_name,
            null
        )
    )
func lottery_model(
    lottery_name
) -> Gs2LotteryLotteryModelDomain:
    return Gs2LotteryLotteryModelDomain.new(
        _gs2,
        namespace_name,
        lottery_name
    )
func user(
    user_id
) -> Gs2LotteryUserDomain:
    return Gs2LotteryUserDomain.new(
        _gs2,
        namespace_name,
        user_id
    )


func access_token(
    access_token_
) -> Gs2LotteryUserAccessTokenDomain:
    return Gs2LotteryUserAccessTokenDomain.new(
        _gs2,
        namespace_name,
        access_token_
    )


func prize_table_masters(
    name_prefix = null
) -> Gs2LotteryDescribePrizeTableMastersIterator:
    return Gs2LotteryDescribePrizeTableMastersIterator.new(
        _gs2,
        _client,
        namespace_name,
        name_prefix
    )


func subscribe_prize_table_masters(
    callback: Callable,
    name_prefix = null
) -> int:
    return _gs2.cache.list_subscribe(
        "Gs2LotteryPrizeTableMaster",
        Gs2LotteryPrizeTableMasterCache.cache_parent_key(
            namespace_name,
            null
        ),
        callback
    )


func unsubscribe_prize_table_masters(
    callback_id: int,
    name_prefix = null
) -> void:
    _gs2.cache.list_unsubscribe(
        "Gs2LotteryPrizeTableMaster",
        Gs2LotteryPrizeTableMasterCache.cache_parent_key(
            namespace_name,
            null
        ),
        callback_id
    )


func invalidate_prize_table_masters(
    name_prefix = null
) -> void:
    _gs2.cache.clear_list_cache(
        "Gs2LotteryPrizeTableMaster",
        Gs2LotteryPrizeTableMasterCache.cache_parent_key(
            namespace_name,
            null
        )
    )
func prize_table_master(
    prize_table_name
) -> Gs2LotteryPrizeTableMasterDomain:
    return Gs2LotteryPrizeTableMasterDomain.new(
        _gs2,
        namespace_name,
        prize_table_name
    )


func lottery_model_masters(
    name_prefix = null
) -> Gs2LotteryDescribeLotteryModelMastersIterator:
    return Gs2LotteryDescribeLotteryModelMastersIterator.new(
        _gs2,
        _client,
        namespace_name,
        name_prefix
    )


func subscribe_lottery_model_masters(
    callback: Callable,
    name_prefix = null
) -> int:
    return _gs2.cache.list_subscribe(
        "Gs2LotteryLotteryModelMaster",
        Gs2LotteryLotteryModelMasterCache.cache_parent_key(
            namespace_name,
            null
        ),
        callback
    )


func unsubscribe_lottery_model_masters(
    callback_id: int,
    name_prefix = null
) -> void:
    _gs2.cache.list_unsubscribe(
        "Gs2LotteryLotteryModelMaster",
        Gs2LotteryLotteryModelMasterCache.cache_parent_key(
            namespace_name,
            null
        ),
        callback_id
    )


func invalidate_lottery_model_masters(
    name_prefix = null
) -> void:
    _gs2.cache.clear_list_cache(
        "Gs2LotteryLotteryModelMaster",
        Gs2LotteryLotteryModelMasterCache.cache_parent_key(
            namespace_name,
            null
        )
    )
func lottery_model_master(
    lottery_name
) -> Gs2LotteryLotteryModelMasterDomain:
    return Gs2LotteryLotteryModelMasterDomain.new(
        _gs2,
        namespace_name,
        lottery_name
    )


func model() -> Gs2AsyncResult:
    var pair = Gs2LotteryNamespaceCache.get_cache(
        _gs2.cache,
        namespace_name,
        null
    )
    if pair[1]:
        return Gs2AsyncResult.new(pair[0], null)
    return await Gs2LotteryNamespaceCache.fetch(
        _gs2.cache,
        namespace_name,
        null,
        func():
            var get_result = await get_(Gs2LotteryGetNamespaceRequest.new())
            return get_result
    )


func invalidate() -> void:
    Gs2LotteryNamespaceCache.delete_cache(
        _gs2.cache,
        namespace_name,
        null
    )


func drawn_prizes() -> Gs2LotteryDescribeDrawnPrizesIterator:
    return Gs2LotteryDescribeDrawnPrizesIterator.new(_gs2, namespace_name)


func subscribe_drawn_prizes(callback: Callable) -> int:
    return Gs2LotteryDrawnPrizeCache.list_subscribe(
        _gs2.cache, namespace_name, null, callback
    )


func unsubscribe_drawn_prizes(callback_id: int) -> void:
    Gs2LotteryDrawnPrizeCache.list_unsubscribe(
        _gs2.cache, namespace_name, null, callback_id
    )


func subscribe_model(callback: Callable) -> int:
    return _gs2.cache.subscribe(
        "Gs2LotteryNamespace",
        Gs2LotteryNamespaceCache.cache_parent_key(
            null
        ),
        Gs2LotteryNamespaceCache.cache_key(
            namespace_name
        ),
        callback,
        func(): await model()
    )


func unsubscribe_model(callback_id: int) -> void:
    _gs2.cache.unsubscribe(
        "Gs2LotteryNamespace",
        Gs2LotteryNamespaceCache.cache_parent_key(
            null
        ),
        Gs2LotteryNamespaceCache.cache_key(
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
