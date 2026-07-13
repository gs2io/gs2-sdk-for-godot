
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
class_name Gs2SkillTreeDescribeStatusesByUserIdIterator
extends RefCounted


static var fetch_size: Variant = null

var _gs2: Gs2Domain
var _client: Gs2SkillTreeRestClient
var namespace_name: Variant = null
var user_id: Variant = null
var time_offset_token: Variant = null
var _page_token: Variant = null
var _last: bool = false


func _init(
    gs2: Gs2Domain,
    client,
    namespace_name_,
    user_id_,
    time_offset_token_ = null
):
    _gs2 = gs2
    _client = client
    namespace_name = namespace_name_
    user_id = user_id_
    time_offset_token = time_offset_token_
    _last = false


# 全ページを読み込んで Array を返す (Gs2AsyncResult.result = Array)
func load() -> Gs2AsyncResult:
    var result = []
    _page_token = null
    _last = false
    var cached = _gs2.cache.try_get_list(
        "Gs2SkillTreeStatus",
        
        Gs2SkillTreeStatusCache.cache_parent_key(
            namespace_name,
            user_id,
            null
        )
    )
    if cached[1]:
        var list = []
        for item in cached[0]:
            list.append(item)
        return Gs2AsyncResult.new(list, null)
    while not _last:
        var request = Gs2SkillTreeDescribeStatusesByUserIdRequest.new()
        request = request.with_context_stack(_gs2.default_context_stack)
        request = request.with_namespace_name(namespace_name)
        request = request.with_user_id(user_id)
        request = request.with_page_token(_page_token)
        request = request.with_limit(fetch_size)
        var r = await _client.describe_statuses_by_user_id(request)
        if r.error != null:
            return r
        var page = []
        for item in (r.result.items if r.result.items != null else []):
            page.append(item)
        result.append_array(page)
        _page_token = r.result.next_page_token
        _last = _page_token == null
        Gs2SkillTreeDescribeStatusesByUserIdMethodCache.put_cache(
            r.result,
            _gs2.cache,
            user_id,
            null,
            request
        )
    _gs2.cache.set_list_cached(
        "Gs2SkillTreeStatus",
        
        Gs2SkillTreeStatusCache.cache_parent_key(
            namespace_name,
            user_id,
            null
        )
    )
    return Gs2AsyncResult.new(result, null)