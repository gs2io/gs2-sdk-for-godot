
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
class_name Gs2LotteryDescribeProbabilitiesIterator
extends RefCounted


static var fetch_size = null

var _gs2
var _client
var namespace_name = null
var lottery_name = null
var access_token = null
var user_id:
    get:
        return null if access_token == null else access_token.user_id
var _last = false


func _init(
    gs2,
    client,
    namespace_name_,
    lottery_name_,
    access_token_
):
    _gs2 = gs2
    _client = client
    namespace_name = namespace_name_
    lottery_name = lottery_name_
    access_token = access_token_
    _last = false


# 全ページを読み込んで Array を返す (Gs2AsyncResult.result = Array)
func load() -> Gs2AsyncResult:
    var result = []
    _last = false
    var cached = _gs2.cache.try_get_list(
        "Gs2LotteryProbability",
        
        Gs2LotteryProbabilityCache.cache_parent_key(
            namespace_name,
            user_id,
            lottery_name,
            null if access_token == null else access_token.time_offset
        )
    )
    if cached[1]:
        var list = []
        for item in cached[0]:
            list.append(item)
        return Gs2AsyncResult.new(list, null)
    while not _last:
        var request = Gs2LotteryDescribeProbabilitiesRequest.new()
        request = request.with_context_stack(_gs2.default_context_stack)
        request = request.with_namespace_name(namespace_name)
        request = request.with_lottery_name(lottery_name)
        request = request.with_access_token(null if access_token == null else access_token.token)
        var r = await _client.describe_probabilities(request)
        if r.error != null:
            return r
        var page = []
        for item in (r.result.items if r.result.items != null else []):
            page.append(item)
        result.append_array(page)
        _last = true
        Gs2LotteryDescribeProbabilitiesMethodCache.put_cache(
            r.result,
            _gs2.cache,
            user_id,
            null if access_token == null else access_token.time_offset,
            request
        )
    _gs2.cache.set_list_cached(
        "Gs2LotteryProbability",
        
        Gs2LotteryProbabilityCache.cache_parent_key(
            namespace_name,
            user_id,
            lottery_name,
            null if access_token == null else access_token.time_offset
        )
    )
    return Gs2AsyncResult.new(result, null)