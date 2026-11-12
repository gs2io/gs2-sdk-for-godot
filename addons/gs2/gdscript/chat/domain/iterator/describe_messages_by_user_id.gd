
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
class_name Gs2ChatDescribeMessagesByUserIdIterator
extends RefCounted


static var fetch_size: Variant = null

var _gs2: Gs2DomainCore
var _client: Gs2ChatRestClient
var namespace_name: Variant = null
var room_name: Variant = null
var password: Variant = null
var category: Variant = null
var user_id: Variant = null
var time_offset_token: Variant = null
var _start_at: Variant = null
var _last: bool = false


func _init(
    gs2: Gs2DomainCore,
    client,
    namespace_name_,
    user_id_,
    room_name_ = null,
    password_ = null,
    category_ = null,
    time_offset_token_ = null
):
    _gs2 = gs2
    _client = client
    namespace_name = namespace_name_
    room_name = room_name_
    password = password_
    category = category_
    user_id = user_id_
    time_offset_token = time_offset_token_
    _last = false


func load() -> Gs2AsyncResult:
    var result = []
    _start_at = null
    _last = false
    var cached = _gs2.cache.try_get_list(
        "Gs2ChatMessage",
        
        Gs2ChatMessageCache.cache_parent_key(
            namespace_name,
            user_id,
            room_name,
            null
        )
    )
    if cached[1]:
        if cached[2] == null:
            return Gs2AsyncResult.new(cached[0], null)
        _start_at = cached[2]
        for item in cached[0]:
            if item.created_at < _start_at:
                result.append(item)
        _gs2.cache.clear_list_cache(
            "Gs2ChatMessage",
            
            Gs2ChatMessageCache.cache_parent_key(
                namespace_name,
                user_id,
                room_name,
                null
            )
        )
    while not _last:
        var request = Gs2ChatDescribeMessagesByUserIdRequest.new()
        request = request.with_context_stack(_gs2.default_context_stack)
        request = request.with_namespace_name(namespace_name)
        request = request.with_room_name(room_name)
        request = request.with_password(password)
        request = request.with_user_id(user_id)
        request = request.with_start_at(_start_at)
        request = request.with_limit(fetch_size)
        var r = await _client.describe_messages_by_user_id(request)
        if r.error != null:
            return r
        var page = []
        for item in (r.result.items if r.result.items != null else []):
            if not (category == null or item.category == category):
                continue
            page.append(item)
        result.append_array(page)
        if page.size() > 0:
            _start_at = page[page.size() - 1].created_at + 1
        else:
            _last = true
        Gs2ChatDescribeMessagesByUserIdMethodCache.put_cache(
            r.result,
            _gs2.cache,
            user_id,
            null,
            request
        )
    _gs2.cache.set_list_cached(
        "Gs2ChatMessage",
        
        Gs2ChatMessageCache.cache_parent_key(
            namespace_name,
            user_id,
            room_name,
            null
        ),
        _start_at
    )
    return Gs2AsyncResult.new(result, null)