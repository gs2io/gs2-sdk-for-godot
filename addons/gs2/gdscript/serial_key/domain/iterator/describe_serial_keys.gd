
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
class_name Gs2SerialKeyDescribeSerialKeysIterator
extends RefCounted


static var fetch_size: Variant = null

var _gs2: Gs2DomainCore
var _client: Gs2SerialKeyRestClient
var namespace_name: Variant = null
var campaign_model_name: Variant = null
var issue_job_name: Variant = null
var _page_token: Variant = null
var _last: bool = false


func _init(
    gs2: Gs2DomainCore,
    client,
    namespace_name_,
    campaign_model_name_,
    issue_job_name_ = null
):
    _gs2 = gs2
    _client = client
    namespace_name = namespace_name_
    campaign_model_name = campaign_model_name_
    issue_job_name = issue_job_name_
    _last = false


func load() -> Gs2AsyncResult:
    var result = []
    _page_token = null
    _last = false
    var cached = _gs2.cache.try_get_list(
        "Gs2SerialKeySerialKey",
        
        Gs2SerialKeySerialKeyCache.cache_parent_key(
            namespace_name,
            null,
            null
        )
    )
    if cached[1]:
        var list = []
        for item in cached[0]:
            if not (campaign_model_name == null or item.campaign_model_name == campaign_model_name):
                continue
            list.append(item)
        return Gs2AsyncResult.new(list, null)
    while not _last:
        var request = Gs2SerialKeyDescribeSerialKeysRequest.new()
        request = request.with_context_stack(_gs2.default_context_stack)
        request = request.with_namespace_name(namespace_name)
        request = request.with_campaign_model_name(campaign_model_name)
        request = request.with_issue_job_name(issue_job_name)
        request = request.with_page_token(_page_token)
        request = request.with_limit(fetch_size)
        var r = await _client.describe_serial_keys(request)
        if r.error != null:
            return r
        var page = []
        for item in (r.result.items if r.result.items != null else []):
            if not (campaign_model_name == null or item.campaign_model_name == campaign_model_name):
                continue
            page.append(item)
        result.append_array(page)
        _page_token = r.result.next_page_token
        _last = _page_token == null
        Gs2SerialKeyDescribeSerialKeysMethodCache.put_cache(
            r.result,
            _gs2.cache,
            null,
            null,
            request
        )
    _gs2.cache.set_list_cached(
        "Gs2SerialKeySerialKey",
        
        Gs2SerialKeySerialKeyCache.cache_parent_key(
            namespace_name,
            null,
            null
        )
    )
    return Gs2AsyncResult.new(result, null)