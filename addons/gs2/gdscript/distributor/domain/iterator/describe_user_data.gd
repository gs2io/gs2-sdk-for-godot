
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
class_name Gs2DistributorDescribeUserDataIterator
extends RefCounted


static var fetch_size: Variant = null

var _gs2: Gs2Domain
var _client: Gs2DistributorRestClient
var access_token: Gs2AuthAccessToken
var user_id: Variant:
    get:
        return null if access_token == null else access_token.user_id
var _page_token: Variant = null
var _last: bool = false
var _list_cached: Dictionary = {}  # "service\nkind\nparent_key" -> [service, kind, parent_key]


func _init(
    gs2: Gs2Domain,
    client,
    access_token_
):
    _gs2 = gs2
    _client = client
    access_token = access_token_
    _last = false


func load() -> Gs2AsyncResult:
    var result = []
    _page_token = null
    _last = false
    while not _last:
        var request = Gs2DistributorDescribeUserDataRequest.new()
        request = request.with_context_stack(_gs2.default_context_stack)
        request = request.with_access_token(null if access_token == null else access_token.token)
        request = request.with_page_token(_page_token)
        request = request.with_limit(fetch_size)
        var r = await _client.describe_user_data(request)
        if r.error != null:
            return r
        var page = []
        for item in (r.result.items if r.result.items != null else []):
            page.append(item)
        result.append_array(page)
        for entry in page:
            if entry == null:
                continue
            var parent_key = _gs2.put_user_data(
                entry.service,
                entry.namespace_name,
                user_id,
                null if access_token == null else access_token.time_offset,
                entry.kind,
                entry.payload
            )
            if parent_key == null:
                continue
            _list_cached["\n".join([entry.service, entry.kind, parent_key])] = [entry.service, entry.kind, parent_key]
        _page_token = r.result.next_page_token
        _last = _page_token == null
    for triple in _list_cached.values():
        _gs2.set_list_cached(triple[0], null if access_token == null else access_token.time_offset, triple[1], triple[2])
    _list_cached = {}
    return Gs2AsyncResult.new(result, null)