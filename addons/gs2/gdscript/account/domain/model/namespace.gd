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
class_name Gs2AccountNamespaceDomain
extends RefCounted

var _gs2: Gs2Domain
var _client: Gs2AccountRestClient
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
    _client = Gs2AccountRestClient.new(gs2.rest_session)
    namespace_name = namespace_name_


func get_status(
    request: Gs2AccountGetNamespaceStatusRequest
) -> Gs2AsyncResult:
    request = request.with_context_stack(_gs2.default_context_stack if request.context_stack == null or request.context_stack == "" else request.context_stack)
    request = request.with_namespace_name(namespace_name)
    var async_result = await Gs2AccountGetNamespaceStatusMethodCache.invoke(
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
    request: Gs2AccountGetNamespaceRequest
) -> Gs2AsyncResult:
    request = request.with_context_stack(_gs2.default_context_stack if request.context_stack == null or request.context_stack == "" else request.context_stack)
    request = request.with_namespace_name(namespace_name)
    var async_result = await Gs2AccountGetNamespaceMethodCache.invoke(
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
    request: Gs2AccountUpdateNamespaceRequest
) -> Gs2AsyncResult:
    request = request.with_context_stack(_gs2.default_context_stack if request.context_stack == null or request.context_stack == "" else request.context_stack)
    request = request.with_namespace_name(namespace_name)
    var async_result = await Gs2AccountUpdateNamespaceMethodCache.invoke(
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
    request: Gs2AccountDeleteNamespaceRequest
) -> Gs2AsyncResult:
    request = request.with_context_stack(_gs2.default_context_stack if request.context_stack == null or request.context_stack == "" else request.context_stack)
    request = request.with_namespace_name(namespace_name)
    var async_result = await Gs2AccountDeleteNamespaceMethodCache.invoke(
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


func create_account(
    request: Gs2AccountCreateAccountRequest
) -> Gs2AsyncResult:
    request = request.with_context_stack(_gs2.default_context_stack if request.context_stack == null or request.context_stack == "" else request.context_stack)
    request = request.with_namespace_name(namespace_name)
    var async_result = await Gs2AccountCreateAccountMethodCache.invoke(
        _gs2.cache,
        null,
        null,
        request,
        func(): return await _client.create_account(request)
    )
    if async_result.error != null:
        return async_result
    var result = async_result.result
    var ref = null if result == null else result.item
    var domain = Gs2AccountAccountDomain.new(
        _gs2,
        namespace_name,
        (null if ref == null else ref.user_id)
    )
    return Gs2AsyncResult.new(domain, null)


func do_take_over(
    request: Gs2AccountDoTakeOverRequest
) -> Gs2AsyncResult:
    request = request.with_context_stack(_gs2.default_context_stack if request.context_stack == null or request.context_stack == "" else request.context_stack)
    request = request.with_namespace_name(namespace_name)
    var async_result = await Gs2AccountDoTakeOverMethodCache.invoke(
        _gs2.cache,
        null,
        null,
        request,
        func(): return await _client.do_take_over(request)
    )
    if async_result.error != null:
        return async_result
    var result = async_result.result
    var ref = null if result == null else result.item
    var domain = Gs2AccountAccountDomain.new(
        _gs2,
        namespace_name,
        (null if ref == null else ref.user_id)
    )
    return Gs2AsyncResult.new(domain, null)


func do_take_over_open_id_connect(
    request: Gs2AccountDoTakeOverOpenIdConnectRequest
) -> Gs2AsyncResult:
    request = request.with_context_stack(_gs2.default_context_stack if request.context_stack == null or request.context_stack == "" else request.context_stack)
    request = request.with_namespace_name(namespace_name)
    var async_result = await Gs2AccountDoTakeOverOpenIdConnectMethodCache.invoke(
        _gs2.cache,
        null,
        null,
        request,
        func(): return await _client.do_take_over_open_id_connect(request)
    )
    if async_result.error != null:
        return async_result
    var result = async_result.result
    var ref = null if result == null else result.item
    var domain = Gs2AccountAccountDomain.new(
        _gs2,
        namespace_name,
        (null if ref == null else ref.user_id)
    )
    return Gs2AsyncResult.new(domain, null)


func delete_platform_id_by_user_identifier(
    request: Gs2AccountDeletePlatformIdByUserIdentifierRequest
) -> Gs2AsyncResult:
    request = request.with_context_stack(_gs2.default_context_stack if request.context_stack == null or request.context_stack == "" else request.context_stack)
    request = request.with_namespace_name(namespace_name)
    var async_result = await Gs2AccountDeletePlatformIdByUserIdentifierMethodCache.invoke(
        _gs2.cache,
        null,
        null,
        request,
        func(): return await _client.delete_platform_id_by_user_identifier(request)
    )
    if async_result.error != null and not (async_result.error is Gs2NotFoundException):
        return async_result
    var result = async_result.result
    var ref = null if result == null else result.item
    var domain = Gs2AccountPlatformIdDomain.new(
        _gs2,
        namespace_name,
        (null if ref == null else ref.user_id),
        (null if ref == null else ref.type)
    )
    return Gs2AsyncResult.new(domain, null)


func accounts(
) -> Gs2AccountDescribeAccountsIterator:
    return Gs2AccountDescribeAccountsIterator.new(
        _gs2,
        _client,
        namespace_name
    )


func subscribe_accounts(
    callback: Callable
) -> int:
    return _gs2.cache.list_subscribe(
        "Gs2AccountAccount",
        Gs2AccountAccountCache.cache_parent_key(
            namespace_name,
            null
        ),
        callback
    )


func unsubscribe_accounts(
    callback_id: int
) -> void:
    _gs2.cache.list_unsubscribe(
        "Gs2AccountAccount",
        Gs2AccountAccountCache.cache_parent_key(
            namespace_name,
            null
        ),
        callback_id
    )


func invalidate_accounts(
) -> void:
    _gs2.cache.clear_list_cache(
        "Gs2AccountAccount",
        Gs2AccountAccountCache.cache_parent_key(
            namespace_name,
            null
        )
    )
func account(
    user_id
) -> Gs2AccountAccountDomain:
    return Gs2AccountAccountDomain.new(
        _gs2,
        namespace_name,
        user_id
    )


func access_token(
    access_token_
) -> Gs2AccountAccountAccessTokenDomain:
    return Gs2AccountAccountAccessTokenDomain.new(
        _gs2,
        namespace_name,
        access_token_
    )
func current_model_master(
) -> Gs2AccountCurrentModelMasterDomain:
    return Gs2AccountCurrentModelMasterDomain.new(
        _gs2,
        namespace_name
    )


func take_over_type_models(
) -> Gs2AccountDescribeTakeOverTypeModelsIterator:
    return Gs2AccountDescribeTakeOverTypeModelsIterator.new(
        _gs2,
        _client,
        namespace_name
    )


func subscribe_take_over_type_models(
    callback: Callable
) -> int:
    return _gs2.cache.list_subscribe(
        "Gs2AccountTakeOverTypeModel",
        Gs2AccountTakeOverTypeModelCache.cache_parent_key(
            namespace_name,
            null
        ),
        callback
    )


func unsubscribe_take_over_type_models(
    callback_id: int
) -> void:
    _gs2.cache.list_unsubscribe(
        "Gs2AccountTakeOverTypeModel",
        Gs2AccountTakeOverTypeModelCache.cache_parent_key(
            namespace_name,
            null
        ),
        callback_id
    )


func invalidate_take_over_type_models(
) -> void:
    _gs2.cache.clear_list_cache(
        "Gs2AccountTakeOverTypeModel",
        Gs2AccountTakeOverTypeModelCache.cache_parent_key(
            namespace_name,
            null
        )
    )
func take_over_type_model(
    type
) -> Gs2AccountTakeOverTypeModelDomain:
    return Gs2AccountTakeOverTypeModelDomain.new(
        _gs2,
        namespace_name,
        type
    )


func take_over_type_model_masters(
) -> Gs2AccountDescribeTakeOverTypeModelMastersIterator:
    return Gs2AccountDescribeTakeOverTypeModelMastersIterator.new(
        _gs2,
        _client,
        namespace_name
    )


func subscribe_take_over_type_model_masters(
    callback: Callable
) -> int:
    return _gs2.cache.list_subscribe(
        "Gs2AccountTakeOverTypeModelMaster",
        Gs2AccountTakeOverTypeModelMasterCache.cache_parent_key(
            namespace_name,
            null
        ),
        callback
    )


func unsubscribe_take_over_type_model_masters(
    callback_id: int
) -> void:
    _gs2.cache.list_unsubscribe(
        "Gs2AccountTakeOverTypeModelMaster",
        Gs2AccountTakeOverTypeModelMasterCache.cache_parent_key(
            namespace_name,
            null
        ),
        callback_id
    )


func invalidate_take_over_type_model_masters(
) -> void:
    _gs2.cache.clear_list_cache(
        "Gs2AccountTakeOverTypeModelMaster",
        Gs2AccountTakeOverTypeModelMasterCache.cache_parent_key(
            namespace_name,
            null
        )
    )
func take_over_type_model_master(
    type
) -> Gs2AccountTakeOverTypeModelMasterDomain:
    return Gs2AccountTakeOverTypeModelMasterDomain.new(
        _gs2,
        namespace_name,
        type
    )


func model() -> Gs2AsyncResult:
    var pair = Gs2AccountNamespaceCache.get_cache(
        _gs2.cache,
        namespace_name,
        null
    )
    if pair[1]:
        return Gs2AsyncResult.new(pair[0], null)
    return await Gs2AccountNamespaceCache.fetch(
        _gs2.cache,
        namespace_name,
        null,
        func():
            var get_result = await get_(Gs2AccountGetNamespaceRequest.new())
            return get_result
    )


func invalidate() -> void:
    Gs2AccountNamespaceCache.delete_cache(
        _gs2.cache,
        namespace_name,
        null
    )


func subscribe_model(callback: Callable) -> int:
    return _gs2.cache.subscribe(
        "Gs2AccountNamespace",
        Gs2AccountNamespaceCache.cache_parent_key(
            null
        ),
        Gs2AccountNamespaceCache.cache_key(
            namespace_name
        ),
        callback,
        func(): await model()
    )


func unsubscribe_model(callback_id: int) -> void:
    _gs2.cache.unsubscribe(
        "Gs2AccountNamespace",
        Gs2AccountNamespaceCache.cache_parent_key(
            null
        ),
        Gs2AccountNamespaceCache.cache_key(
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