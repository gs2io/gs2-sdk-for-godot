
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
class_name Gs2ChatDescribeSubscribesByRoomNameIterator
extends RefCounted


static var fetch_size: Variant = null

var _gs2: Gs2DomainCore
var _client: Gs2ChatRestClient
var namespace_name: Variant = null
var room_name: Variant = null
var _page_token: Variant = null
var _last: bool = false


func _init(
    gs2: Gs2DomainCore,
    client,
    namespace_name_,
    room_name_
):
    _gs2 = gs2
    _client = client
    namespace_name = namespace_name_
    room_name = room_name_
    _last = false


func load() -> Gs2AsyncResult:
    var result = []
    _page_token = null
    _last = false
    while not _last:
        var request = Gs2ChatDescribeSubscribesByRoomNameRequest.new()
        request = request.with_context_stack(_gs2.default_context_stack)
        request = request.with_namespace_name(namespace_name)
        request = request.with_room_name(room_name)
        request = request.with_page_token(_page_token)
        request = request.with_limit(fetch_size)
        var r = await _client.describe_subscribes_by_room_name(request)
        if r.error != null:
            return r
        var page = []
        for item in (r.result.items if r.result.items != null else []):
            if not (room_name == null or item.room_name == room_name):
                continue
            page.append(item)
        result.append_array(page)
        _page_token = r.result.next_page_token
        _last = _page_token == null
    return Gs2AsyncResult.new(result, null)