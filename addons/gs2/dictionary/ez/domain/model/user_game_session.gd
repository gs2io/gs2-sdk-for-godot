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
class_name Gs2DictionaryEzUserGameSessionDomain
extends RefCounted


var _domain: Gs2DictionaryUserAccessTokenDomain
var _game_session: Variant
var _connection: Gs2Connection
var next_page_token: Variant:
    get:
        return _domain.next_page_token
var namespace_name: Variant:
    get:
        return null if _domain == null else _domain.namespace_name
var user_id: Variant:
    get:
        return null if _domain == null else _domain.user_id


func _init(
    domain: Gs2DictionaryUserAccessTokenDomain,
    game_session: Variant,
    connection: Gs2Connection
):
    _domain = domain
    _game_session = game_session
    _connection = connection
# 戻り値: Gs2AsyncResult (result = Gs2DictionaryEzLikeGameSessionDomain[])
func add_likes(
    entry_model_names = null
) -> Gs2AsyncResult:
    var async_result = await _connection.run(
        _game_session,
        func(): return await _domain.add_likes(
            Gs2DictionaryAddLikesRequest.new()
                .with_entry_model_names(entry_model_names)
        )
    )
    if async_result.error != null:
        return async_result
    var domains = []
    if async_result.result != null:
        for v in async_result.result:
            domains.append(Gs2DictionaryEzLikeGameSessionDomain.new(
                v,
                _game_session,
                _connection
            ))
    return Gs2AsyncResult.new(domains, null)
# 戻り値: Gs2AsyncResult (result = Gs2DictionaryEzLikeGameSessionDomain[])
func delete_likes(
    entry_model_names = null
) -> Gs2AsyncResult:
    var async_result = await _connection.run(
        _game_session,
        func(): return await _domain.delete_likes(
            Gs2DictionaryDeleteLikesRequest.new()
                .with_entry_model_names(entry_model_names)
        )
    )
    if async_result.error != null:
        return async_result
    var domains = []
    if async_result.result != null:
        for v in async_result.result:
            domains.append(Gs2DictionaryEzLikeGameSessionDomain.new(
                v,
                _game_session,
                _connection
            ))
    return Gs2AsyncResult.new(domains, null)


func entries(
) -> Gs2DictionaryEzListEntriesIterator:
    return Gs2DictionaryEzListEntriesIterator.new(
        _domain,
        _game_session,
        _connection
    )


func subscribe_entries(
    callback: Callable
) -> int:
    return _domain.subscribe_entries(
        func(items): callback.call([] if items == null else items.map(func(v): return Gs2DictionaryEzEntry.from_model(v)))
    )


func unsubscribe_entries(
    callback_id: int
) -> void:
    _domain.unsubscribe_entries(
        callback_id
    )


func likes(
) -> Gs2DictionaryEzListLikesIterator:
    return Gs2DictionaryEzListLikesIterator.new(
        _domain,
        _game_session,
        _connection
    )


func subscribe_likes(
    callback: Callable
) -> int:
    return _domain.subscribe_likes(
        func(items): callback.call([] if items == null else items.map(func(v): return Gs2DictionaryEzLike.from_model(v)))
    )


func unsubscribe_likes(
    callback_id: int
) -> void:
    _domain.unsubscribe_likes(
        callback_id
    )


func entry(
    entry_model_name
) -> Gs2DictionaryEzEntryGameSessionDomain:
    return Gs2DictionaryEzEntryGameSessionDomain.new(
        _domain.entry(
            entry_model_name
        ),
        _game_session,
        _connection
    )


func like(
    entry_model_name
) -> Gs2DictionaryEzLikeGameSessionDomain:
    return Gs2DictionaryEzLikeGameSessionDomain.new(
        _domain.like(
            entry_model_name
        ),
        _game_session,
        _connection
    )