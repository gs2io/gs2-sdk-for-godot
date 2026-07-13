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
class_name Gs2GatewayUserDomain
extends RefCounted

var _gs2: Gs2Domain
var _client: Gs2GatewayRestClient
var _wsclient: Gs2GatewayWebSocketClient
var namespace_name: Variant = null
var user_id: Variant = null
var protocol: Variant = null
var send_connection_ids: Variant = null
var next_page_token: Variant = null


func _init(
    gs2: Gs2Domain,
    namespace_name_,
    user_id_
):
    _gs2 = gs2
    _client = Gs2GatewayRestClient.new(gs2.rest_session)
    _wsclient = Gs2GatewayWebSocketClient.new(gs2.web_socket_session)
    namespace_name = namespace_name_
    user_id = user_id_


func send_notification(
    request: Gs2GatewaySendNotificationRequest
) -> Gs2AsyncResult:
    request = request.with_context_stack(_gs2.default_context_stack if request.context_stack == null or request.context_stack == "" else request.context_stack)
    request = request.with_namespace_name(namespace_name)
    request = request.with_user_id(user_id)
    var async_result = await Gs2GatewaySendNotificationMethodCache.invoke(
        _gs2.cache,
        user_id,
        null,
        request,
        func(): return await _client.send_notification(request)
    )
    if async_result.error != null:
        return async_result
    var result = async_result.result
    var domain = self
    self.protocol = null if result == null else result.protocol
    domain.protocol = self.protocol
    self.send_connection_ids = null if result == null else result.send_connection_ids
    domain.send_connection_ids = self.send_connection_ids
    return Gs2AsyncResult.new(domain, null)


func disconnect_(
    request: Gs2GatewayDisconnectByUserIdRequest
) -> Gs2AsyncResult:
    request = request.with_context_stack(_gs2.default_context_stack if request.context_stack == null or request.context_stack == "" else request.context_stack)
    request = request.with_namespace_name(namespace_name)
    request = request.with_user_id(user_id)
    var async_result = await Gs2GatewayDisconnectByUserIdMethodCache.invoke(
        _gs2.cache,
        user_id,
        null,
        request,
        func(): return await _client.disconnect_by_user_id(request)
    )
    if async_result.error != null:
        return async_result
    var result = async_result.result
    var domain = []
    if result != null and result.items != null:
        for v in result.items:
            domain.append(Gs2GatewayWebSocketSessionDomain.new(
                _gs2,
                (null if v == null else v.namespace_name),
                (null if v == null else v.user_id)
            ))
    return Gs2AsyncResult.new(domain, null)


func disconnect_all(
    request: Gs2GatewayDisconnectAllRequest
) -> Gs2AsyncResult:
    request = request.with_context_stack(_gs2.default_context_stack if request.context_stack == null or request.context_stack == "" else request.context_stack)
    request = request.with_namespace_name(namespace_name)
    var async_result = await Gs2GatewayDisconnectAllMethodCache.invoke(
        _gs2.cache,
        user_id,
        null,
        request,
        func(): return await _client.disconnect_all(request)
    )
    if async_result.error != null:
        return async_result
    var result = async_result.result
    var domain = self
    return Gs2AsyncResult.new(domain, null)


func web_socket_sessions(
    time_offset_token = null
) -> Gs2GatewayDescribeWebSocketSessionsByUserIdIterator:
    return Gs2GatewayDescribeWebSocketSessionsByUserIdIterator.new(
        _gs2,
        _client,
        namespace_name,
        user_id,
        time_offset_token
    )


func subscribe_web_socket_sessions(
    callback: Callable
) -> int:
    return _gs2.cache.list_subscribe(
        "Gs2GatewayWebSocketSession",
        Gs2GatewayWebSocketSessionCache.cache_parent_key(
            namespace_name,
            user_id,
            null
        ),
        callback
    )


func unsubscribe_web_socket_sessions(
    callback_id: int
) -> void:
    _gs2.cache.list_unsubscribe(
        "Gs2GatewayWebSocketSession",
        Gs2GatewayWebSocketSessionCache.cache_parent_key(
            namespace_name,
            user_id,
            null
        ),
        callback_id
    )


func invalidate_web_socket_sessions(
) -> void:
    _gs2.cache.clear_list_cache(
        "Gs2GatewayWebSocketSession",
        Gs2GatewayWebSocketSessionCache.cache_parent_key(
            namespace_name,
            user_id,
            null
        )
    )
func web_socket_session(
) -> Gs2GatewayWebSocketSessionDomain:
    return Gs2GatewayWebSocketSessionDomain.new(
        _gs2,
        namespace_name,
        user_id
    )
func firebase_token(
) -> Gs2GatewayFirebaseTokenDomain:
    return Gs2GatewayFirebaseTokenDomain.new(
        _gs2,
        namespace_name,
        user_id
    )