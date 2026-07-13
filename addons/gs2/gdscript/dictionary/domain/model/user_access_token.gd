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
class_name Gs2DictionaryUserAccessTokenDomain
extends RefCounted

var _gs2: Gs2Domain
var _client: Gs2DictionaryRestClient
var namespace_name: Variant = null
var access_token: Gs2AuthAccessToken
var user_id: Variant:
    get:
        return null if access_token == null else access_token.user_id
var next_page_token: Variant = null


func _init(
    gs2: Gs2Domain,
    namespace_name_,
    access_token_
):
    _gs2 = gs2
    _client = Gs2DictionaryRestClient.new(gs2.rest_session)
    namespace_name = namespace_name_
    access_token = access_token_


func delete_entries(
    request: Gs2DictionaryDeleteEntriesRequest
) -> Gs2AsyncResult:
    request = request.with_context_stack(_gs2.default_context_stack if request.context_stack == null or request.context_stack == "" else request.context_stack)
    request = request.with_namespace_name(namespace_name)
    request = request.with_access_token(null if access_token == null else access_token.token)
    var async_result = await Gs2DictionaryDeleteEntriesMethodCache.invoke(
        _gs2.cache,
        user_id,
        (null if access_token == null else access_token.time_offset),
        request,
        func(): return await _client.delete_entries(request)
    )
    if async_result.error != null and not (async_result.error is Gs2NotFoundException):
        return async_result
    var result = async_result.result
    var domain = []
    if result != null and result.items != null:
        for v in result.items:
            domain.append(Gs2DictionaryEntryAccessTokenDomain.new(
                _gs2,
                namespace_name,
                access_token,
                (null if v == null else v.name)
            ))
    return Gs2AsyncResult.new(domain, null)


func add_likes(
    request: Gs2DictionaryAddLikesRequest
) -> Gs2AsyncResult:
    request = request.with_context_stack(_gs2.default_context_stack if request.context_stack == null or request.context_stack == "" else request.context_stack)
    request = request.with_namespace_name(namespace_name)
    request = request.with_access_token(null if access_token == null else access_token.token)
    var async_result = await Gs2DictionaryAddLikesMethodCache.invoke(
        _gs2.cache,
        user_id,
        (null if access_token == null else access_token.time_offset),
        request,
        func(): return await _client.add_likes(request)
    )
    if async_result.error != null:
        return async_result
    var result = async_result.result
    var domain = []
    if result != null and result.items != null:
        for v in result.items:
            domain.append(Gs2DictionaryLikeAccessTokenDomain.new(
                _gs2,
                namespace_name,
                access_token,
                (null if v == null else v.name)
            ))
    return Gs2AsyncResult.new(domain, null)


func reset_likes(
    request: Gs2DictionaryResetLikesRequest
) -> Gs2AsyncResult:
    request = request.with_context_stack(_gs2.default_context_stack if request.context_stack == null or request.context_stack == "" else request.context_stack)
    request = request.with_namespace_name(namespace_name)
    request = request.with_access_token(null if access_token == null else access_token.token)
    var async_result = await Gs2DictionaryResetLikesMethodCache.invoke(
        _gs2.cache,
        user_id,
        (null if access_token == null else access_token.time_offset),
        request,
        func(): return await _client.reset_likes(request)
    )
    if async_result.error != null:
        return async_result
    var result = async_result.result
    var domain = self
    return Gs2AsyncResult.new(domain, null)


func delete_likes(
    request: Gs2DictionaryDeleteLikesRequest
) -> Gs2AsyncResult:
    request = request.with_context_stack(_gs2.default_context_stack if request.context_stack == null or request.context_stack == "" else request.context_stack)
    request = request.with_namespace_name(namespace_name)
    request = request.with_access_token(null if access_token == null else access_token.token)
    var async_result = await Gs2DictionaryDeleteLikesMethodCache.invoke(
        _gs2.cache,
        user_id,
        (null if access_token == null else access_token.time_offset),
        request,
        func(): return await _client.delete_likes(request)
    )
    if async_result.error != null and not (async_result.error is Gs2NotFoundException):
        return async_result
    var result = async_result.result
    var domain = []
    if result != null and result.items != null:
        for v in result.items:
            domain.append(Gs2DictionaryLikeAccessTokenDomain.new(
                _gs2,
                namespace_name,
                access_token,
                (null if v == null else v.name)
            ))
    return Gs2AsyncResult.new(domain, null)


func entries(
) -> Gs2DictionaryDescribeEntriesIterator:
    return Gs2DictionaryDescribeEntriesIterator.new(
        _gs2,
        _client,
        namespace_name,
        access_token
    )


func subscribe_entries(
    callback: Callable
) -> int:
    return _gs2.cache.list_subscribe(
        "Gs2DictionaryEntry",
        Gs2DictionaryEntryCache.cache_parent_key(
            namespace_name,
            user_id,
            null if access_token == null else access_token.time_offset
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
            null if access_token == null else access_token.time_offset
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
            null if access_token == null else access_token.time_offset
        )
    )
func entry(
    entry_model_name
) -> Gs2DictionaryEntryAccessTokenDomain:
    return Gs2DictionaryEntryAccessTokenDomain.new(
        _gs2,
        namespace_name,
        access_token,
        entry_model_name
    )


func likes(
) -> Gs2DictionaryDescribeLikesIterator:
    return Gs2DictionaryDescribeLikesIterator.new(
        _gs2,
        _client,
        namespace_name,
        access_token
    )


func subscribe_likes(
    callback: Callable
) -> int:
    return _gs2.cache.list_subscribe(
        "Gs2DictionaryLike",
        Gs2DictionaryLikeCache.cache_parent_key(
            namespace_name,
            user_id,
            null if access_token == null else access_token.time_offset
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
            null if access_token == null else access_token.time_offset
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
            null if access_token == null else access_token.time_offset
        )
    )
func like(
    entry_model_name
) -> Gs2DictionaryLikeAccessTokenDomain:
    return Gs2DictionaryLikeAccessTokenDomain.new(
        _gs2,
        namespace_name,
        access_token,
        entry_model_name
    )