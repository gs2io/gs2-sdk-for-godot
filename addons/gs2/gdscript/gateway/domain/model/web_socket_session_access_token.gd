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
# deny overwrite
class_name Gs2GatewayWebSocketSessionAccessTokenDomain
extends RefCounted

var _gs2: Gs2DomainCore
var _client: Gs2GatewayRestClient
var _wsclient: Gs2GatewayWebSocketClient
var namespace_name: Variant = null
var access_token: Gs2AuthAccessToken
var user_id: Variant:
    get:
        return null if access_token == null else access_token.user_id
var connection_id: Variant = null
var protocol: Variant = null
# diff --- start
#var send_connection_ids = null
# diff --- end


func _init(
    gs2: Gs2DomainCore,
    namespace_name_,
    access_token_
):
    _gs2 = gs2
    _client = Gs2GatewayRestClient.new(gs2.rest_session)
    _wsclient = Gs2GatewayWebSocketClient.new(gs2.web_socket_session)
    namespace_name = namespace_name_
    access_token = access_token_


func set_user_id(
    request: Gs2GatewaySetUserIdRequest
) -> Gs2AsyncResult:
    var model_async_result = await model()
    if model_async_result.error != null:
        return model_async_result
    var model_value = model_async_result.result
    request = request.with_context_stack(_gs2.default_context_stack if request.context_stack == null or request.context_stack == "" else request.context_stack)
    request = request.with_namespace_name(namespace_name)
    request = request.with_access_token(null if access_token == null else access_token.token)
    var async_result = await Gs2GatewaySetUserIdMethodCache.invoke(
        _gs2.cache,
        user_id,
        (null if access_token == null else access_token.time_offset),
        request,
        func(): return await _wsclient.set_user_id(request)
    )
    if async_result.error != null:
        return async_result
    var result = async_result.result
    var domain = self
    return Gs2AsyncResult.new(domain, null)


func model() -> Gs2AsyncResult:
    var pair = Gs2GatewayWebSocketSessionCache.get_cache(
        _gs2.cache,
        namespace_name,
        user_id,
        (null if access_token == null else access_token.time_offset)
    )
    if pair[1]:
        return Gs2AsyncResult.new(pair[0], null)
    return Gs2AsyncResult.new(null, null)


func invalidate() -> void:
    Gs2GatewayWebSocketSessionCache.delete_cache(
        _gs2.cache,
        namespace_name,
        user_id,
        (null if access_token == null else access_token.time_offset)
    )


func subscribe_model(callback: Callable) -> int:
    return _gs2.cache.subscribe(
        "Gs2GatewayWebSocketSession",
        Gs2GatewayWebSocketSessionCache.cache_parent_key(
            namespace_name,
            user_id,
            (null if access_token == null else access_token.time_offset)
        ),
        Gs2GatewayWebSocketSessionCache.cache_key(
        ),
        callback,
        func(): await model()
    )


func unsubscribe_model(callback_id: int) -> void:
    _gs2.cache.unsubscribe(
        "Gs2GatewayWebSocketSession",
        Gs2GatewayWebSocketSessionCache.cache_parent_key(
            namespace_name,
            user_id,
            (null if access_token == null else access_token.time_offset)
        ),
        Gs2GatewayWebSocketSessionCache.cache_key(
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