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
class_name Gs2ExchangeUserDomain
extends RefCounted

var _gs2: Gs2DomainCore
var _client: Gs2ExchangeRestClient
var namespace_name: Variant = null
var user_id: Variant = null
var next_page_token: Variant = null


func _init(
    gs2: Gs2DomainCore,
    namespace_name_,
    user_id_
):
    _gs2 = gs2
    _client = Gs2ExchangeRestClient.new(gs2.rest_session)
    namespace_name = namespace_name_
    user_id = user_id_


func create_await(
    request: Gs2ExchangeCreateAwaitByUserIdRequest
) -> Gs2AsyncResult:
    request = request.with_context_stack(_gs2.default_context_stack if request.context_stack == null or request.context_stack == "" else request.context_stack)
    request = request.with_namespace_name(namespace_name)
    request = request.with_user_id(user_id)
    var async_result = await Gs2ExchangeCreateAwaitByUserIdMethodCache.invoke(
        _gs2.cache,
        user_id,
        null,
        request,
        func(): return await _client.create_await_by_user_id(request)
    )
    if async_result.error != null:
        return async_result
    var result = async_result.result
    var ref = null if result == null else result.item
    var domain = Gs2ExchangeAwaitDomain.new(
        _gs2,
        namespace_name,
        (null if ref == null else ref.user_id),
        (null if ref == null else ref.name)
    )
    return Gs2AsyncResult.new(domain, null)
func exchange(
) -> Gs2ExchangeExchangeDomain:
    return Gs2ExchangeExchangeDomain.new(
        _gs2,
        namespace_name,
        user_id
    )


func awaits(
    rate_name = null,
    time_offset_token = null
) -> Gs2ExchangeDescribeAwaitsByUserIdIterator:
    return Gs2ExchangeDescribeAwaitsByUserIdIterator.new(
        _gs2,
        _client,
        namespace_name,
        user_id,
        rate_name,
        time_offset_token
    )


func subscribe_awaits(
    callback: Callable,
    rate_name = null
) -> int:
    return _gs2.cache.list_subscribe(
        "Gs2ExchangeAwait",
        Gs2ExchangeAwaitCache.cache_parent_key(
            namespace_name,
            user_id,
            null
        ),
        callback
    )


func unsubscribe_awaits(
    callback_id: int,
    rate_name = null
) -> void:
    _gs2.cache.list_unsubscribe(
        "Gs2ExchangeAwait",
        Gs2ExchangeAwaitCache.cache_parent_key(
            namespace_name,
            user_id,
            null
        ),
        callback_id
    )


func invalidate_awaits(
    rate_name = null
) -> void:
    _gs2.cache.clear_list_cache(
        "Gs2ExchangeAwait",
        Gs2ExchangeAwaitCache.cache_parent_key(
            namespace_name,
            user_id,
            null
        )
    )
func await_(
    await_name
) -> Gs2ExchangeAwaitDomain:
    return Gs2ExchangeAwaitDomain.new(
        _gs2,
        namespace_name,
        user_id,
        await_name
    )