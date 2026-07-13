
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
class_name Gs2MatchmakingDoMatchmakingByUserIdIterator
extends RefCounted


static var fetch_size: Variant = null

var _gs2: Gs2Domain
var _client: Gs2MatchmakingRestClient
var namespace_name: Variant = null
var user_id: Variant = null
var player: Variant = null
var time_offset_token: Variant = null
var _matchmaking_context_token: Variant = null
var _last: bool = false


func _init(
    gs2: Gs2Domain,
    client,
    namespace_name_,
    user_id_,
    player_,
    time_offset_token_ = null
):
    _gs2 = gs2
    _client = client
    namespace_name = namespace_name_
    user_id = user_id_
    player = player_
    time_offset_token = time_offset_token_
    _last = false


# 全ページを読み込んで Array を返す (Gs2AsyncResult.result = Array)
func load() -> Gs2AsyncResult:
    var result = []
    _matchmaking_context_token = null
    _last = false
    while not _last:
        var request = Gs2MatchmakingDoMatchmakingByUserIdRequest.new()
        request = request.with_context_stack(_gs2.default_context_stack)
        request = request.with_namespace_name(namespace_name)
        request = request.with_user_id(user_id)
        request = request.with_player(player)
        request = request.with_matchmaking_context_token(_matchmaking_context_token)
        var r = await _client.do_matchmaking_by_user_id(request)
        if r.error != null:
            return r
        var page = []
        if r.result.item != null:
            page.append(r.result.item)
        result.append_array(page)
        _matchmaking_context_token = r.result.matchmaking_context_token
        _last = _matchmaking_context_token == null
        _gs2.cache.clear_list_cache(
            "Gs2MatchmakingGathering",
            
            Gs2MatchmakingGatheringCache.cache_parent_key(
                namespace_name,
                user_id,
                null
            )
        )
    return Gs2AsyncResult.new(result, null)