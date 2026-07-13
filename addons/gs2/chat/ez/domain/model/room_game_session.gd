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
class_name Gs2ChatEzRoomGameSessionDomain
extends RefCounted


var _domain: Gs2ChatRoomAccessTokenDomain
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
var room_name: Variant:
    get:
        return null if _domain == null else _domain.room_name
var password: Variant:
    get:
        return null if _domain == null else _domain.password


func _init(
    domain: Gs2ChatRoomAccessTokenDomain,
    game_session: Variant,
    connection: Gs2Connection
):
    _domain = domain
    _game_session = game_session
    _connection = connection
# 戻り値: Gs2AsyncResult (result = Gs2ChatEzRoomGameSessionDomain)
func delete_room(
) -> Gs2AsyncResult:
    var async_result = await _connection.run(
        _game_session,
        func(): return await _domain.delete(
            Gs2ChatDeleteRoomRequest.new()
        )
    )
    if async_result.error != null:
        return async_result
    return Gs2AsyncResult.new(Gs2ChatEzRoomGameSessionDomain.new(
        async_result.result,
        _game_session,
        _connection
    ), null)
# 戻り値: Gs2AsyncResult (result = Gs2ChatEzMessageGameSessionDomain)
func post(
    metadata,
    category = null
) -> Gs2AsyncResult:
    var async_result = await _connection.run(
        _game_session,
        func(): return await _domain.post(
            Gs2ChatPostRequest.new()
                .with_category(category)
                .with_metadata(metadata)
        )
    )
    if async_result.error != null:
        return async_result
    return Gs2AsyncResult.new(Gs2ChatEzMessageGameSessionDomain.new(
        async_result.result,
        _game_session,
        _connection
    ), null)


func latest_messages(
    category = null
) -> Gs2ChatEzListLatestMessagesIterator:
    return Gs2ChatEzListLatestMessagesIterator.new(
        _domain,
        _game_session,
        _connection,
        category
    )


func subscribe_latest_messages(
    callback: Callable,
    category = null
) -> int:
    return _domain.subscribe_latest_messages(
        func(items): callback.call([] if items == null else items.map(func(v): return Gs2ChatEzMessage.from_model(v))),
        category
    )


func unsubscribe_latest_messages(
    callback_id: int,
    category = null
) -> void:
    _domain.unsubscribe_latest_messages(
        callback_id,
        category
    )


func messages(
    category = null
) -> Gs2ChatEzListMessagesIterator:
    return Gs2ChatEzListMessagesIterator.new(
        _domain,
        _game_session,
        _connection,
        category
    )


func subscribe_messages(
    callback: Callable,
    category = null
) -> int:
    return _domain.subscribe_messages(
        func(items): callback.call([] if items == null else items.map(func(v): return Gs2ChatEzMessage.from_model(v))),
        category
    )


func unsubscribe_messages(
    callback_id: int,
    category = null
) -> void:
    _domain.unsubscribe_messages(
        callback_id,
        category
    )


func message(
    message_name
) -> Gs2ChatEzMessageGameSessionDomain:
    return Gs2ChatEzMessageGameSessionDomain.new(
        _domain.message(
            message_name
        ),
        _game_session,
        _connection
    )


# 戻り値: Gs2AsyncResult (result = Gs2ChatEzRoom)
func model() -> Gs2AsyncResult:
    var async_result = await _connection.run(
        _game_session,
        func(): return await _domain.model()
    )
    if async_result.error != null:
        return async_result
    if async_result.result == null:
        return Gs2AsyncResult.new(null, null)
    return Gs2AsyncResult.new(Gs2ChatEzRoom.from_model(async_result.result), null)


func invalidate() -> void:
    _domain.invalidate()


func subscribe_model(callback: Callable) -> int:
    return _domain.subscribe_model(
        func(item): callback.call(null if item == null else Gs2ChatEzRoom.from_model(item))
    )


func unsubscribe_model(callback_id: int) -> void:
    _domain.unsubscribe_model(callback_id)


func subscribe_model_with_initial_call(callback: Callable) -> Gs2AsyncResult:
    var model_result = await model()
    if model_result.error != null:
        return model_result
    var callback_id = subscribe_model(callback)
    callback.call(model_result.result)
    return Gs2AsyncResult.new(callback_id, null)