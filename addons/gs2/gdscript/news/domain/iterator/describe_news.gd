
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
class_name Gs2NewsDescribeNewsIterator
extends RefCounted


static var fetch_size: Variant = null

var _gs2: Gs2Domain
var _client: Gs2NewsRestClient
var _response_cache: Variant = null
var namespace_name: Variant = null
var access_token: Gs2AuthAccessToken
var user_id: Variant:
    get:
        return null if access_token == null else access_token.user_id
var _last: bool = false


func _init(
    gs2: Gs2Domain,
    client,
    namespace_name_,
    access_token_,
    response_cache_ = null
):
    _gs2 = gs2
    _client = client
    _response_cache = response_cache_
    namespace_name = namespace_name_
    access_token = access_token_
    _last = false


func load() -> Gs2AsyncResult:
    var result = []
    _last = false
    while not _last:
        var request = Gs2NewsDescribeNewsRequest.new()
        request = request.with_context_stack(_gs2.default_context_stack)
        request = request.with_namespace_name(namespace_name)
        request = request.with_access_token(null if access_token == null else access_token.token)
        var r = await _client.describe_news(request)
        if r.error != null:
            return r
        if _response_cache != null:
            _response_cache.content_hash = r.result.content_hash
            _response_cache.template_hash = r.result.template_hash
        var page = []
        for item in (r.result.items if r.result.items != null else []):
            page.append(item)
        result.append_array(page)
        _last = true
        Gs2NewsDescribeNewsMethodCache.put_cache(
            r.result,
            _gs2.cache,
            user_id,
            null if access_token == null else access_token.time_offset,
            request
        )
    return Gs2AsyncResult.new(result, null)