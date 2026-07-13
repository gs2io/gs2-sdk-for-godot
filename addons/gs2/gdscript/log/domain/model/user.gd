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
class_name Gs2LogUserDomain
extends RefCounted

var _gs2: Gs2Domain
var _client: Gs2LogRestClient
var namespace_name: Variant = null
var user_id: Variant = null
var next_page_token: Variant = null
var total_count: Variant = null
var scan_size: Variant = null


func _init(
    gs2: Gs2Domain,
    namespace_name_,
    user_id_
):
    _gs2 = gs2
    _client = Gs2LogRestClient.new(gs2.rest_session)
    namespace_name = namespace_name_
    user_id = user_id_


func send_in_game_log(
    request: Gs2LogSendInGameLogByUserIdRequest
) -> Gs2AsyncResult:
    request = request.with_context_stack(_gs2.default_context_stack if request.context_stack == null or request.context_stack == "" else request.context_stack)
    request = request.with_namespace_name(namespace_name)
    request = request.with_user_id(user_id)
    var async_result = await Gs2LogSendInGameLogByUserIdMethodCache.invoke(
        _gs2.cache,
        user_id,
        null,
        request,
        func(): return await _client.send_in_game_log_by_user_id(request)
    )
    if async_result.error != null:
        return async_result
    var result = async_result.result
    var ref = null if result == null else result.item
    var domain = Gs2LogInGameLogDomain.new(
        _gs2,
        namespace_name,
        (null if ref == null else ref.user_id),
        (null if ref == null else ref.request_id)
    )
    return Gs2AsyncResult.new(domain, null)


func in_game_log(
    tags = null,
    begin = null,
    end = null,
    long_term = null,
    time_offset_token = null
) -> Gs2LogQueryInGameLogIterator:
    return Gs2LogQueryInGameLogIterator.new(
        _gs2,
        _client,
        namespace_name,
        user_id,
        tags,
        begin,
        end,
        long_term,
        time_offset_token
    )


func subscribe_in_game_log(
    callback: Callable,
    tags = null,
    begin = null,
    end = null,
    long_term = null
) -> int:
    return _gs2.cache.list_subscribe(
        "Gs2LogInGameLog",
        Gs2LogInGameLogCache.cache_parent_key(
            namespace_name,
            user_id,
            null
        ),
        callback
    )


func unsubscribe_in_game_log(
    callback_id: int,
    tags = null,
    begin = null,
    end = null,
    long_term = null
) -> void:
    _gs2.cache.list_unsubscribe(
        "Gs2LogInGameLog",
        Gs2LogInGameLogCache.cache_parent_key(
            namespace_name,
            user_id,
            null
        ),
        callback_id
    )


func invalidate_in_game_log(
    tags = null,
    begin = null,
    end = null,
    long_term = null
) -> void:
    _gs2.cache.clear_list_cache(
        "Gs2LogInGameLog",
        Gs2LogInGameLogCache.cache_parent_key(
            namespace_name,
            user_id,
            null
        )
    )
func in_game_log_(
    request_id
) -> Gs2LogInGameLogDomain:
    return Gs2LogInGameLogDomain.new(
        _gs2,
        namespace_name,
        user_id,
        request_id
    )