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
class_name Gs2ChatEzUserGameSessionDomain
extends RefCounted


var _domain: Gs2ChatUserAccessTokenDomain
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
    domain: Gs2ChatUserAccessTokenDomain,
    game_session: Variant,
    connection: Gs2Connection
):
    _domain = domain
    _game_session = game_session
    _connection = connection
# 戻り値: Gs2AsyncResult (result = Gs2ChatEzRoomGameSessionDomain)
func create_room(
    name = null,
    metadata = null,
    password = null,
    white_list_user_ids = null
) -> Gs2AsyncResult:
    var async_result = await _connection.run(
        _game_session,
        func(): return await _domain.create_room(
            Gs2ChatCreateRoomRequest.new()
                .with_name(name)
                .with_metadata(metadata)
                .with_password(password)
                .with_white_list_user_ids(white_list_user_ids)
        )
    )
    if async_result.error != null:
        return async_result
    return Gs2AsyncResult.new(Gs2ChatEzRoomGameSessionDomain.new(
        async_result.result,
        _game_session,
        _connection
    ), null)


func subscribes(
    room_name_prefix = null
) -> Gs2ChatEzListSubscribeRoomsIterator:
    return Gs2ChatEzListSubscribeRoomsIterator.new(
        _domain,
        _game_session,
        _connection,
        room_name_prefix
    )


func subscribe_subscribes(
    callback: Callable,
    room_name_prefix = null
) -> int:
    return _domain.subscribe_subscribes(
        func(items): callback.call([] if items == null else items.map(func(v): return Gs2ChatEzSubscribe.from_model(v))),
        room_name_prefix
    )


func unsubscribe_subscribes(
    callback_id: int,
    room_name_prefix = null
) -> void:
    _domain.unsubscribe_subscribes(
        callback_id,
        room_name_prefix
    )


func room(
    room_name,
    password = null
) -> Gs2ChatEzRoomGameSessionDomain:
    return Gs2ChatEzRoomGameSessionDomain.new(
        _domain.room(
            room_name,
            password
        ),
        _game_session,
        _connection
    )


func subscribe(
    room_name
) -> Gs2ChatEzSubscribeGameSessionDomain:
    return Gs2ChatEzSubscribeGameSessionDomain.new(
        _domain.subscribe(
            room_name
        ),
        _game_session,
        _connection
    )