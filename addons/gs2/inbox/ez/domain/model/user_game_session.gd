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
class_name Gs2InboxEzUserGameSessionDomain
extends RefCounted


var _domain: Gs2InboxUserAccessTokenDomain
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
    domain: Gs2InboxUserAccessTokenDomain,
    game_session: Variant,
    connection: Gs2Connection
):
    _domain = domain
    _game_session = game_session
    _connection = connection
# 戻り値: Gs2AsyncResult (result = Gs2InboxEzMessageGameSessionDomain[])
func receive_global_message(
) -> Gs2AsyncResult:
    var async_result = await _connection.run(
        _game_session,
        func(): return await _domain.receive_global_message(
            Gs2InboxReceiveGlobalMessageRequest.new()
        )
    )
    if async_result.error != null:
        return async_result
    var domains = []
    if async_result.result != null:
        for v in async_result.result:
            domains.append(Gs2InboxEzMessageGameSessionDomain.new(
                v,
                _game_session,
                _connection
            ))
    return Gs2AsyncResult.new(domains, null)
# 戻り値: Gs2AsyncResult (result = Gs2EzTransactionDomain)
func batch_read(
    message_names,
    speculative_execute: bool = true
) -> Gs2AsyncResult:
    var async_result = await _connection.run(
        _game_session,
        func(): return await _domain.batch_read_messages(
            Gs2InboxBatchReadMessagesRequest.new()
                .with_message_names(message_names),
            speculative_execute
        )
    )
    if async_result.error != null:
        return async_result
    return Gs2AsyncResult.new(null if async_result.result == null else Gs2EzTransactionDomain.new(async_result.result), null)


func messages(
    is_read = null
) -> Gs2InboxEzListIterator:
    return Gs2InboxEzListIterator.new(
        _domain,
        _game_session,
        _connection,
        is_read
    )


func subscribe_messages(
    callback: Callable,
    is_read = null
) -> int:
    return _domain.subscribe_messages(
        func(items): callback.call([] if items == null else items.map(func(v): return Gs2InboxEzMessage.from_model(v))),
        is_read
    )


func unsubscribe_messages(
    callback_id: int,
    is_read = null
) -> void:
    _domain.unsubscribe_messages(
        callback_id,
        is_read
    )


func message(
    message_name
) -> Gs2InboxEzMessageGameSessionDomain:
    return Gs2InboxEzMessageGameSessionDomain.new(
        _domain.message(
            message_name
        ),
        _game_session,
        _connection
    )