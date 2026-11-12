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
class_name Gs2DictionaryUserDomain
extends RefCounted

var _gs2: Gs2DomainCore
var _client: Gs2DictionaryRestClient
var namespace_name: Variant = null
var user_id: Variant = null
var next_page_token: Variant = null


func _init(
    gs2: Gs2DomainCore,
    namespace_name_,
    user_id_
):
    _gs2 = gs2
    _client = Gs2DictionaryRestClient.new(gs2.rest_session)
    namespace_name = namespace_name_
    user_id = user_id_


func add_entries(
    request: Gs2DictionaryAddEntriesByUserIdRequest
) -> Gs2AsyncResult:
    request = request.with_context_stack(_gs2.default_context_stack if request.context_stack == null or request.context_stack == "" else request.context_stack)
    request = request.with_namespace_name(namespace_name)
    request = request.with_user_id(user_id)
    var async_result = await Gs2DictionaryAddEntriesByUserIdMethodCache.invoke(
        _gs2.cache,
        user_id,
        null,
        request,
        func(): return await _client.add_entries_by_user_id(request)
    )
    if async_result.error != null:
        return async_result
    var result = async_result.result
    var domain = []
    if result != null and result.items != null:
        for v in result.items:
            domain.append(Gs2DictionaryEntryDomain.new(
                _gs2,
                namespace_name,
                (null if v == null else v.user_id),
                (null if v == null else v.name)
            ))
    return Gs2AsyncResult.new(domain, null)


func reset(
    request: Gs2DictionaryResetByUserIdRequest
) -> Gs2AsyncResult:
    request = request.with_context_stack(_gs2.default_context_stack if request.context_stack == null or request.context_stack == "" else request.context_stack)
    request = request.with_namespace_name(namespace_name)
    request = request.with_user_id(user_id)
    var async_result = await Gs2DictionaryResetByUserIdMethodCache.invoke(
        _gs2.cache,
        user_id,
        null,
        request,
        func(): return await _client.reset_by_user_id(request)
    )
    if async_result.error != null:
        return async_result
    var result = async_result.result
    var domain = self
    return Gs2AsyncResult.new(domain, null)


func delete_entries(
    request: Gs2DictionaryDeleteEntriesByUserIdRequest
) -> Gs2AsyncResult:
    request = request.with_context_stack(_gs2.default_context_stack if request.context_stack == null or request.context_stack == "" else request.context_stack)
    request = request.with_namespace_name(namespace_name)
    request = request.with_user_id(user_id)
    var async_result = await Gs2DictionaryDeleteEntriesByUserIdMethodCache.invoke(
        _gs2.cache,
        user_id,
        null,
        request,
        func(): return await _client.delete_entries_by_user_id(request)
    )
    if async_result.error != null and not (async_result.error is Gs2NotFoundException):
        return async_result
    var result = async_result.result
    var domain = []
    if result != null and result.items != null:
        for v in result.items:
            domain.append(Gs2DictionaryEntryDomain.new(
                _gs2,
                namespace_name,
                (null if v == null else v.user_id),
                (null if v == null else v.name)
            ))
    return Gs2AsyncResult.new(domain, null)


func add_likes(
    request: Gs2DictionaryAddLikesByUserIdRequest
) -> Gs2AsyncResult:
    request = request.with_context_stack(_gs2.default_context_stack if request.context_stack == null or request.context_stack == "" else request.context_stack)
    request = request.with_namespace_name(namespace_name)
    request = request.with_user_id(user_id)
    var async_result = await Gs2DictionaryAddLikesByUserIdMethodCache.invoke(
        _gs2.cache,
        user_id,
        null,
        request,
        func(): return await _client.add_likes_by_user_id(request)
    )
    if async_result.error != null:
        return async_result
    var result = async_result.result
    var domain = []
    if result != null and result.items != null:
        for v in result.items:
            domain.append(Gs2DictionaryLikeDomain.new(
                _gs2,
                namespace_name,
                (null if v == null else v.user_id),
                (null if v == null else v.name)
            ))
    return Gs2AsyncResult.new(domain, null)


func reset_likes(
    request: Gs2DictionaryResetLikesByUserIdRequest
) -> Gs2AsyncResult:
    request = request.with_context_stack(_gs2.default_context_stack if request.context_stack == null or request.context_stack == "" else request.context_stack)
    request = request.with_namespace_name(namespace_name)
    request = request.with_user_id(user_id)
    var async_result = await Gs2DictionaryResetLikesByUserIdMethodCache.invoke(
        _gs2.cache,
        user_id,
        null,
        request,
        func(): return await _client.reset_likes_by_user_id(request)
    )
    if async_result.error != null:
        return async_result
    var result = async_result.result
    var domain = self
    return Gs2AsyncResult.new(domain, null)


func delete_likes(
    request: Gs2DictionaryDeleteLikesByUserIdRequest
) -> Gs2AsyncResult:
    request = request.with_context_stack(_gs2.default_context_stack if request.context_stack == null or request.context_stack == "" else request.context_stack)
    request = request.with_namespace_name(namespace_name)
    request = request.with_user_id(user_id)
    var async_result = await Gs2DictionaryDeleteLikesByUserIdMethodCache.invoke(
        _gs2.cache,
        user_id,
        null,
        request,
        func(): return await _client.delete_likes_by_user_id(request)
    )
    if async_result.error != null and not (async_result.error is Gs2NotFoundException):
        return async_result
    var result = async_result.result
    var domain = []
    if result != null and result.items != null:
        for v in result.items:
            domain.append(Gs2DictionaryLikeDomain.new(
                _gs2,
                namespace_name,
                (null if v == null else v.user_id),
                (null if v == null else v.name)
            ))
    return Gs2AsyncResult.new(domain, null)


func entries(
    time_offset_token = null
) -> Gs2DictionaryDescribeEntriesByUserIdIterator:
    return Gs2DictionaryDescribeEntriesByUserIdIterator.new(
        _gs2,
        _client,
        namespace_name,
        user_id,
        time_offset_token
    )


func subscribe_entries(
    callback: Callable
) -> int:
    return _gs2.cache.list_subscribe(
        "Gs2DictionaryEntry",
        Gs2DictionaryEntryCache.cache_parent_key(
            namespace_name,
            user_id,
            null
        ),
        callback
    )


func unsubscribe_entries(
    callback_id: int
) -> void:
    _gs2.cache.list_unsubscribe(
        "Gs2DictionaryEntry",
        Gs2DictionaryEntryCache.cache_parent_key(
            namespace_name,
            user_id,
            null
        ),
        callback_id
    )


func invalidate_entries(
) -> void:
    _gs2.cache.clear_list_cache(
        "Gs2DictionaryEntry",
        Gs2DictionaryEntryCache.cache_parent_key(
            namespace_name,
            user_id,
            null
        )
    )
func entry(
    entry_model_name
) -> Gs2DictionaryEntryDomain:
    return Gs2DictionaryEntryDomain.new(
        _gs2,
        namespace_name,
        user_id,
        entry_model_name
    )


func likes(
    time_offset_token = null
) -> Gs2DictionaryDescribeLikesByUserIdIterator:
    return Gs2DictionaryDescribeLikesByUserIdIterator.new(
        _gs2,
        _client,
        namespace_name,
        user_id,
        time_offset_token
    )


func subscribe_likes(
    callback: Callable
) -> int:
    return _gs2.cache.list_subscribe(
        "Gs2DictionaryLike",
        Gs2DictionaryLikeCache.cache_parent_key(
            namespace_name,
            user_id,
            null
        ),
        callback
    )


func unsubscribe_likes(
    callback_id: int
) -> void:
    _gs2.cache.list_unsubscribe(
        "Gs2DictionaryLike",
        Gs2DictionaryLikeCache.cache_parent_key(
            namespace_name,
            user_id,
            null
        ),
        callback_id
    )


func invalidate_likes(
) -> void:
    _gs2.cache.clear_list_cache(
        "Gs2DictionaryLike",
        Gs2DictionaryLikeCache.cache_parent_key(
            namespace_name,
            user_id,
            null
        )
    )
func like(
    entry_model_name
) -> Gs2DictionaryLikeDomain:
    return Gs2DictionaryLikeDomain.new(
        _gs2,
        namespace_name,
        user_id,
        entry_model_name
    )