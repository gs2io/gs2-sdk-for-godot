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
class_name Gs2AccountAccountDomain
extends RefCounted

var _gs2: Gs2Domain
var _client: Gs2AccountRestClient
var namespace_name: Variant = null
var user_id: Variant = null
var ban_statuses: Variant = null
var body: Variant = null
var signature: Variant = null
var authorization_url: Variant = null
var next_page_token: Variant = null


func _init(
    gs2: Gs2Domain,
    namespace_name_,
    user_id_
):
    _gs2 = gs2
    _client = Gs2AccountRestClient.new(gs2.rest_session)
    namespace_name = namespace_name_
    user_id = user_id_


func update_time_offset(
    request: Gs2AccountUpdateTimeOffsetRequest
) -> Gs2AsyncResult:
    request = request.with_context_stack(_gs2.default_context_stack if request.context_stack == null or request.context_stack == "" else request.context_stack)
    request = request.with_namespace_name(namespace_name)
    request = request.with_user_id(user_id)
    var async_result = await Gs2AccountUpdateTimeOffsetMethodCache.invoke(
        _gs2.cache,
        user_id,
        null,
        request,
        func(): return await _client.update_time_offset(request)
    )
    if async_result.error != null:
        return async_result
    var result = async_result.result
    var domain = self
    return Gs2AsyncResult.new(domain, null)


func update_banned(
    request: Gs2AccountUpdateBannedRequest
) -> Gs2AsyncResult:
    request = request.with_context_stack(_gs2.default_context_stack if request.context_stack == null or request.context_stack == "" else request.context_stack)
    request = request.with_namespace_name(namespace_name)
    request = request.with_user_id(user_id)
    var async_result = await Gs2AccountUpdateBannedMethodCache.invoke(
        _gs2.cache,
        user_id,
        null,
        request,
        func(): return await _client.update_banned(request)
    )
    if async_result.error != null:
        return async_result
    var result = async_result.result
    var domain = self
    return Gs2AsyncResult.new(domain, null)


func add_ban(
    request: Gs2AccountAddBanRequest
) -> Gs2AsyncResult:
    request = request.with_context_stack(_gs2.default_context_stack if request.context_stack == null or request.context_stack == "" else request.context_stack)
    request = request.with_namespace_name(namespace_name)
    request = request.with_user_id(user_id)
    var async_result = await Gs2AccountAddBanMethodCache.invoke(
        _gs2.cache,
        user_id,
        null,
        request,
        func(): return await _client.add_ban(request)
    )
    if async_result.error != null:
        return async_result
    var result = async_result.result
    var domain = self
    return Gs2AsyncResult.new(domain, null)


func remove_ban(
    request: Gs2AccountRemoveBanRequest
) -> Gs2AsyncResult:
    request = request.with_context_stack(_gs2.default_context_stack if request.context_stack == null or request.context_stack == "" else request.context_stack)
    request = request.with_namespace_name(namespace_name)
    request = request.with_user_id(user_id)
    var async_result = await Gs2AccountRemoveBanMethodCache.invoke(
        _gs2.cache,
        user_id,
        null,
        request,
        func(): return await _client.remove_ban(request)
    )
    if async_result.error != null:
        return async_result
    var result = async_result.result
    var domain = self
    return Gs2AsyncResult.new(domain, null)


func get_(
    request: Gs2AccountGetAccountRequest
) -> Gs2AsyncResult:
    request = request.with_context_stack(_gs2.default_context_stack if request.context_stack == null or request.context_stack == "" else request.context_stack)
    request = request.with_namespace_name(namespace_name)
    request = request.with_user_id(user_id)
    var async_result = await Gs2AccountGetAccountMethodCache.invoke(
        _gs2.cache,
        user_id,
        null,
        request,
        func(): return await _client.get_account(request)
    )
    if async_result.error != null:
        return async_result
    var result = async_result.result
    return Gs2AsyncResult.new(null if result == null else result.item, null)


func delete(
    request: Gs2AccountDeleteAccountRequest
) -> Gs2AsyncResult:
    request = request.with_context_stack(_gs2.default_context_stack if request.context_stack == null or request.context_stack == "" else request.context_stack)
    request = request.with_namespace_name(namespace_name)
    request = request.with_user_id(user_id)
    var async_result = await Gs2AccountDeleteAccountMethodCache.invoke(
        _gs2.cache,
        user_id,
        null,
        request,
        func(): return await _client.delete_account(request)
    )
    if async_result.error != null and not (async_result.error is Gs2NotFoundException):
        return async_result
    var result = async_result.result
    var domain = self
    return Gs2AsyncResult.new(domain, null)


func authentication(
    request: Gs2AccountAuthenticationRequest
) -> Gs2AsyncResult:
    request = request.with_context_stack(_gs2.default_context_stack if request.context_stack == null or request.context_stack == "" else request.context_stack)
    request = request.with_namespace_name(namespace_name)
    request = request.with_user_id(user_id)
    var async_result = await Gs2AccountAuthenticationMethodCache.invoke(
        _gs2.cache,
        user_id,
        null,
        request,
        func(): return await _client.authentication(request)
    )
    if async_result.error != null:
        return async_result
    var result = async_result.result
    var domain = self
    domain.ban_statuses = null if result == null else result.ban_statuses
    domain.body = null if result == null else result.body
    domain.signature = null if result == null else result.signature
    return Gs2AsyncResult.new(domain, null)


func request_deletion(
    request: Gs2AccountRequestDeletionByUserIdRequest
) -> Gs2AsyncResult:
    request = request.with_context_stack(_gs2.default_context_stack if request.context_stack == null or request.context_stack == "" else request.context_stack)
    request = request.with_namespace_name(namespace_name)
    request = request.with_user_id(user_id)
    var async_result = await Gs2AccountRequestDeletionByUserIdMethodCache.invoke(
        _gs2.cache,
        user_id,
        null,
        request,
        func(): return await _client.request_deletion_by_user_id(request)
    )
    if async_result.error != null:
        return async_result
    var result = async_result.result
    var domain = self
    return Gs2AsyncResult.new(domain, null)


func cancel_deletion(
    request: Gs2AccountCancelDeletionRequest
) -> Gs2AsyncResult:
    request = request.with_context_stack(_gs2.default_context_stack if request.context_stack == null or request.context_stack == "" else request.context_stack)
    request = request.with_namespace_name(namespace_name)
    request = request.with_user_id(user_id)
    var async_result = await Gs2AccountCancelDeletionMethodCache.invoke(
        _gs2.cache,
        user_id,
        null,
        request,
        func(): return await _client.cancel_deletion(request)
    )
    if async_result.error != null:
        return async_result
    var result = async_result.result
    var domain = self
    return Gs2AsyncResult.new(domain, null)


func cancel_deletion_by_user_id(
    request: Gs2AccountCancelDeletionByUserIdRequest
) -> Gs2AsyncResult:
    request = request.with_context_stack(_gs2.default_context_stack if request.context_stack == null or request.context_stack == "" else request.context_stack)
    request = request.with_namespace_name(namespace_name)
    request = request.with_user_id(user_id)
    var async_result = await Gs2AccountCancelDeletionByUserIdMethodCache.invoke(
        _gs2.cache,
        user_id,
        null,
        request,
        func(): return await _client.cancel_deletion_by_user_id(request)
    )
    if async_result.error != null:
        return async_result
    var result = async_result.result
    var domain = self
    return Gs2AsyncResult.new(domain, null)


func execute_deletion(
    request: Gs2AccountExecuteDeletionByUserIdRequest
) -> Gs2AsyncResult:
    request = request.with_context_stack(_gs2.default_context_stack if request.context_stack == null or request.context_stack == "" else request.context_stack)
    request = request.with_namespace_name(namespace_name)
    request = request.with_user_id(user_id)
    var async_result = await Gs2AccountExecuteDeletionByUserIdMethodCache.invoke(
        _gs2.cache,
        user_id,
        null,
        request,
        func(): return await _client.execute_deletion_by_user_id(request)
    )
    if async_result.error != null:
        return async_result
    var result = async_result.result
    var domain = self
    return Gs2AsyncResult.new(domain, null)


func create_take_over_open_id_connect_and(
    request: Gs2AccountCreateTakeOverOpenIdConnectAndByUserIdRequest
) -> Gs2AsyncResult:
    request = request.with_context_stack(_gs2.default_context_stack if request.context_stack == null or request.context_stack == "" else request.context_stack)
    request = request.with_namespace_name(namespace_name)
    request = request.with_user_id(user_id)
    var async_result = await Gs2AccountCreateTakeOverOpenIdConnectAndByUserIdMethodCache.invoke(
        _gs2.cache,
        user_id,
        null,
        request,
        func(): return await _client.create_take_over_open_id_connect_and_by_user_id(request)
    )
    if async_result.error != null:
        return async_result
    var result = async_result.result
    var ref = null if result == null else result.item
    var domain = Gs2AccountTakeOverDomain.new(
        _gs2,
        namespace_name,
        (null if ref == null else ref.user_id),
        (null if ref == null else ref.type)
    )
    return Gs2AsyncResult.new(domain, null)


func delete_take_over_by_user_identifier(
    request: Gs2AccountDeleteTakeOverByUserIdentifierRequest
) -> Gs2AsyncResult:
    request = request.with_context_stack(_gs2.default_context_stack if request.context_stack == null or request.context_stack == "" else request.context_stack)
    request = request.with_namespace_name(namespace_name)
    var async_result = await Gs2AccountDeleteTakeOverByUserIdentifierMethodCache.invoke(
        _gs2.cache,
        user_id,
        null,
        request,
        func(): return await _client.delete_take_over_by_user_identifier(request)
    )
    if async_result.error != null and not (async_result.error is Gs2NotFoundException):
        return async_result
    var result = async_result.result
    var ref = null if result == null else result.item
    var domain = Gs2AccountTakeOverDomain.new(
        _gs2,
        namespace_name,
        (null if ref == null else ref.user_id),
        (null if ref == null else ref.type)
    )
    return Gs2AsyncResult.new(domain, null)


func delete_take_over(
    request: Gs2AccountDeleteTakeOverByUserIdRequest
) -> Gs2AsyncResult:
    request = request.with_context_stack(_gs2.default_context_stack if request.context_stack == null or request.context_stack == "" else request.context_stack)
    request = request.with_namespace_name(namespace_name)
    request = request.with_user_id(user_id)
    var async_result = await Gs2AccountDeleteTakeOverByUserIdMethodCache.invoke(
        _gs2.cache,
        user_id,
        null,
        request,
        func(): return await _client.delete_take_over_by_user_id(request)
    )
    if async_result.error != null and not (async_result.error is Gs2NotFoundException):
        return async_result
    var result = async_result.result
    var ref = null if result == null else result.item
    var domain = Gs2AccountTakeOverDomain.new(
        _gs2,
        namespace_name,
        (null if ref == null else ref.user_id),
        (null if ref == null else ref.type)
    )
    return Gs2AsyncResult.new(domain, null)


func get_authorization_url(
    request: Gs2AccountGetAuthorizationUrlRequest
) -> Gs2AsyncResult:
    request = request.with_context_stack(_gs2.default_context_stack if request.context_stack == null or request.context_stack == "" else request.context_stack)
    request = request.with_namespace_name(namespace_name)
    var async_result = await Gs2AccountGetAuthorizationUrlMethodCache.invoke(
        _gs2.cache,
        user_id,
        null,
        request,
        func(): return await _client.get_authorization_url(request)
    )
    if async_result.error != null:
        return async_result
    var result = async_result.result
    var domain = self
    self.authorization_url = null if result == null else result.authorization_url
    domain.authorization_url = self.authorization_url
    return Gs2AsyncResult.new(domain, null)


func delete_data_owner(
    request: Gs2AccountDeleteDataOwnerByUserIdRequest
) -> Gs2AsyncResult:
    request = request.with_context_stack(_gs2.default_context_stack if request.context_stack == null or request.context_stack == "" else request.context_stack)
    request = request.with_namespace_name(namespace_name)
    request = request.with_user_id(user_id)
    var async_result = await Gs2AccountDeleteDataOwnerByUserIdMethodCache.invoke(
        _gs2.cache,
        user_id,
        null,
        request,
        func(): return await _client.delete_data_owner_by_user_id(request)
    )
    if async_result.error != null and not (async_result.error is Gs2NotFoundException):
        return async_result
    var result = async_result.result
    var ref = null if result == null else result.item
    var domain = Gs2AccountDataOwnerDomain.new(
        _gs2,
        namespace_name,
        (null if ref == null else ref.user_id)
    )
    return Gs2AsyncResult.new(domain, null)


func delete_platform_id(
    request: Gs2AccountDeletePlatformIdByUserIdRequest
) -> Gs2AsyncResult:
    request = request.with_context_stack(_gs2.default_context_stack if request.context_stack == null or request.context_stack == "" else request.context_stack)
    request = request.with_namespace_name(namespace_name)
    request = request.with_user_id(user_id)
    var async_result = await Gs2AccountDeletePlatformIdByUserIdMethodCache.invoke(
        _gs2.cache,
        user_id,
        null,
        request,
        func(): return await _client.delete_platform_id_by_user_id(request)
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


func take_overs(
    time_offset_token = null
) -> Gs2AccountDescribeTakeOversByUserIdIterator:
    return Gs2AccountDescribeTakeOversByUserIdIterator.new(
        _gs2,
        _client,
        namespace_name,
        user_id,
        time_offset_token
    )


func subscribe_take_overs(
    callback: Callable
) -> int:
    return _gs2.cache.list_subscribe(
        "Gs2AccountTakeOver",
        Gs2AccountTakeOverCache.cache_parent_key(
            namespace_name,
            user_id,
            null
        ),
        callback
    )


func unsubscribe_take_overs(
    callback_id: int
) -> void:
    _gs2.cache.list_unsubscribe(
        "Gs2AccountTakeOver",
        Gs2AccountTakeOverCache.cache_parent_key(
            namespace_name,
            user_id,
            null
        ),
        callback_id
    )


func invalidate_take_overs(
) -> void:
    _gs2.cache.clear_list_cache(
        "Gs2AccountTakeOver",
        Gs2AccountTakeOverCache.cache_parent_key(
            namespace_name,
            user_id,
            null
        )
    )
func take_over(
    type
) -> Gs2AccountTakeOverDomain:
    return Gs2AccountTakeOverDomain.new(
        _gs2,
        namespace_name,
        user_id,
        type
    )
func data_owner(
) -> Gs2AccountDataOwnerDomain:
    return Gs2AccountDataOwnerDomain.new(
        _gs2,
        namespace_name,
        user_id
    )


func platform_ids(
    time_offset_token = null
) -> Gs2AccountDescribePlatformIdsByUserIdIterator:
    return Gs2AccountDescribePlatformIdsByUserIdIterator.new(
        _gs2,
        _client,
        namespace_name,
        user_id,
        time_offset_token
    )


func subscribe_platform_ids(
    callback: Callable
) -> int:
    return _gs2.cache.list_subscribe(
        "Gs2AccountPlatformId",
        Gs2AccountPlatformIdCache.cache_parent_key(
            namespace_name,
            user_id,
            null
        ),
        callback
    )


func unsubscribe_platform_ids(
    callback_id: int
) -> void:
    _gs2.cache.list_unsubscribe(
        "Gs2AccountPlatformId",
        Gs2AccountPlatformIdCache.cache_parent_key(
            namespace_name,
            user_id,
            null
        ),
        callback_id
    )


func invalidate_platform_ids(
) -> void:
    _gs2.cache.clear_list_cache(
        "Gs2AccountPlatformId",
        Gs2AccountPlatformIdCache.cache_parent_key(
            namespace_name,
            user_id,
            null
        )
    )
func platform_id(
    type
) -> Gs2AccountPlatformIdDomain:
    return Gs2AccountPlatformIdDomain.new(
        _gs2,
        namespace_name,
        user_id,
        type
    )


func model() -> Gs2AsyncResult:
    var pair = Gs2AccountAccountCache.get_cache(
        _gs2.cache,
        namespace_name,
        user_id,
        null
    )
    if pair[1]:
        return Gs2AsyncResult.new(pair[0], null)
    return await Gs2AccountAccountCache.fetch(
        _gs2.cache,
        namespace_name,
        user_id,
        null,
        func():
            var get_result = await get_(Gs2AccountGetAccountRequest.new())
            return get_result
    )


func invalidate() -> void:
    Gs2AccountAccountCache.delete_cache(
        _gs2.cache,
        namespace_name,
        user_id,
        null
    )


func subscribe_model(callback: Callable) -> int:
    return _gs2.cache.subscribe(
        "Gs2AccountAccount",
        Gs2AccountAccountCache.cache_parent_key(
            namespace_name,
            null
        ),
        Gs2AccountAccountCache.cache_key(
            user_id
        ),
        callback,
        func(): await model()
    )


func unsubscribe_model(callback_id: int) -> void:
    _gs2.cache.unsubscribe(
        "Gs2AccountAccount",
        Gs2AccountAccountCache.cache_parent_key(
            namespace_name,
            null
        ),
        Gs2AccountAccountCache.cache_key(
            user_id
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