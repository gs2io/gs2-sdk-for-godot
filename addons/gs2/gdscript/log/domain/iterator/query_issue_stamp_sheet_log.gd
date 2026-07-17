
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
class_name Gs2LogQueryIssueStampSheetLogIterator
extends RefCounted


static var fetch_size: Variant = null

var _gs2: Gs2Domain
var _client: Gs2LogRestClient
var _response_cache: Variant = null
var namespace_name: Variant = null
var service: Variant = null
var method: Variant = null
var user_id: Variant = null
var action: Variant = null
var begin: Variant = null
var end: Variant = null
var long_term: Variant = null
var time_offset_token: Variant = null
var _page_token: Variant = null
var _last: bool = false


func _init(
    gs2: Gs2Domain,
    client,
    namespace_name_,
    service_ = null,
    method_ = null,
    user_id_ = null,
    action_ = null,
    begin_ = null,
    end_ = null,
    long_term_ = null,
    time_offset_token_ = null,
    response_cache_ = null
):
    _gs2 = gs2
    _client = client
    _response_cache = response_cache_
    namespace_name = namespace_name_
    service = service_
    method = method_
    user_id = user_id_
    action = action_
    begin = begin_
    end = end_
    long_term = long_term_
    time_offset_token = time_offset_token_
    _last = false


# 全ページを読み込んで Array を返す (Gs2AsyncResult.result = Array)
func load() -> Gs2AsyncResult:
    var result = []
    _page_token = null
    _last = false
    while not _last:
        var request = Gs2LogQueryIssueStampSheetLogRequest.new()
        request = request.with_context_stack(_gs2.default_context_stack)
        request = request.with_namespace_name(namespace_name)
        request = request.with_begin(begin)
        request = request.with_end(end)
        request = request.with_long_term(long_term)
        request = request.with_page_token(_page_token)
        request = request.with_limit(fetch_size)
        var r = await _client.query_issue_stamp_sheet_log(request)
        if r.error != null:
            return r
        if _response_cache != null:
            _response_cache.total_count = r.result.total_count
            _response_cache.scan_size = r.result.scan_size
        var page = []
        for item in (r.result.items if r.result.items != null else []):
            if not (service == null or item.service == service):
                continue
            if not (method == null or item.method == method):
                continue
            if not (user_id == null or item.user_id == user_id):
                continue
            if not (action == null or item.action == action):
                continue
            if not (begin == null or item.timestamp >= begin):
                continue
            if not (end == null or item.timestamp <= end):
                continue
            page.append(item)
        result.append_array(page)
        _page_token = r.result.next_page_token
        _last = _page_token == null
        Gs2LogQueryIssueStampSheetLogMethodCache.put_cache(
            r.result,
            _gs2.cache,
            user_id,
            null,
            request
        )
    return Gs2AsyncResult.new(result, null)