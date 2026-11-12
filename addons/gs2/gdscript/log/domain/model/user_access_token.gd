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
class_name Gs2LogUserAccessTokenDomain
extends RefCounted

var _gs2: Gs2DomainCore
var _client: Gs2LogRestClient
var namespace_name: Variant = null
var access_token: Gs2AuthAccessToken
var user_id: Variant:
    get:
        return null if access_token == null else access_token.user_id
var next_page_token: Variant = null
var total_count: Variant = null
var scan_size: Variant = null


func _init(
    gs2: Gs2DomainCore,
    namespace_name_,
    access_token_
):
    _gs2 = gs2
    _client = Gs2LogRestClient.new(gs2.rest_session)
    namespace_name = namespace_name_
    access_token = access_token_


func send_in_game_log(
    request: Gs2LogSendInGameLogRequest
) -> Gs2AsyncResult:
    request = request.with_context_stack(_gs2.default_context_stack if request.context_stack == null or request.context_stack == "" else request.context_stack)
    request = request.with_namespace_name(namespace_name)
    request = request.with_access_token(null if access_token == null else access_token.token)
    var async_result = await Gs2LogSendInGameLogMethodCache.invoke(
        _gs2.cache,
        user_id,
        (null if access_token == null else access_token.time_offset),
        request,
        func(): return await _client.send_in_game_log(request)
    )
    if async_result.error != null:
        return async_result
    var result = async_result.result
    var ref = null if result == null else result.item
    var domain = Gs2LogInGameLogAccessTokenDomain.new(
        _gs2,
        namespace_name,
        access_token,
        (null if ref == null else ref.request_id)
    )
    return Gs2AsyncResult.new(domain, null)
func in_game_log(
    request_id
) -> Gs2LogInGameLogAccessTokenDomain:
    return Gs2LogInGameLogAccessTokenDomain.new(
        _gs2,
        namespace_name,
        access_token,
        request_id
    )