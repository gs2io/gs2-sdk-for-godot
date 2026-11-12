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
# deny overwrite
class_name Gs2MatchmakingBallotDomain
extends RefCounted

var _gs2: Gs2DomainCore
var _client: Gs2MatchmakingRestClient
var namespace_name: Variant = null
var user_id: Variant = null
var rating_name: Variant = null
var gathering_name: Variant = null
var number_of_player: Variant = null
var key_id: Variant = null
var body: Variant = null
var signature: Variant = null


func _init(
    gs2: Gs2DomainCore,
    namespace_name_,
    user_id_,
    rating_name_,
    gathering_name_,
    number_of_player_,
    key_id_
):
    _gs2 = gs2
    _client = Gs2MatchmakingRestClient.new(gs2.rest_session)
    namespace_name = namespace_name_
    user_id = user_id_
    rating_name = rating_name_
    gathering_name = gathering_name_
    number_of_player = number_of_player_
    key_id = key_id_


func get_(
    request: Gs2MatchmakingGetBallotByUserIdRequest
) -> Gs2AsyncResult:
    request = request.with_context_stack(_gs2.default_context_stack if request.context_stack == null or request.context_stack == "" else request.context_stack)
    request = request.with_namespace_name(namespace_name)
    request = request.with_rating_name(rating_name)
    request = request.with_gathering_name(gathering_name)
    request = request.with_user_id(user_id)
    request = request.with_number_of_player(number_of_player)
    request = request.with_key_id(key_id)
    var async_result = await Gs2MatchmakingGetBallotByUserIdMethodCache.invoke(
        _gs2.cache,
        user_id,
        null,
        request,
        func(): return await _client.get_ballot_by_user_id(request)
    )
    if async_result.error != null:
        return async_result
    var result = async_result.result
# diff --- start
#    return Gs2AsyncResult.new(null if result == null else result.item, null)
# diff --- end
# diff +++ start
    return Gs2AsyncResult.new(
        null if result == null else Gs2MatchmakingSignedBallot.new()
            .with_body(result.body)
            .with_signature(result.signature),
        null
    )
# diff +++ end


func model() -> Gs2AsyncResult:
    var pair = Gs2MatchmakingBallotCache.get_cache(
        _gs2.cache,
        namespace_name,
        user_id,
        rating_name,
        gathering_name,
# diff --- start
#        number_of_player,
#        key_id,
# diff --- end
        null
    )
    if pair[1]:
# diff +++ start
        if pair[0] != null:
            self.body = pair[0].body
            self.signature = pair[0].signature
# diff +++ end
        return Gs2AsyncResult.new(pair[0], null)
# diff --- start
#    return await Gs2MatchmakingBallotCache.fetch(
# diff --- end
    var fetched = await Gs2MatchmakingBallotCache.fetch(  # diff +++
        _gs2.cache,
        namespace_name,
        user_id,
        rating_name,
        gathering_name,
# diff --- start
#        number_of_player,
#        key_id,
# diff --- end
        null,
        func():
            var get_result = await get_(Gs2MatchmakingGetBallotByUserIdRequest.new())
            return get_result
    )
# diff +++ start
    if fetched.error == null and fetched.result != null:
        self.body = fetched.result.body
        self.signature = fetched.result.signature
    return fetched
# diff +++ end


func invalidate() -> void:
    Gs2MatchmakingBallotCache.delete_cache(
        _gs2.cache,
        namespace_name,
        user_id,
        rating_name,
        gathering_name,
# diff --- start
#        number_of_player,
#        key_id,
# diff --- end
        null
    )


func subscribe_model(callback: Callable) -> int:
    return _gs2.cache.subscribe(
# diff --- start
#        "Gs2MatchmakingBallot",
# diff --- end
        "Gs2MatchmakingSignedBallot", # diff +++
        Gs2MatchmakingBallotCache.cache_parent_key(
            namespace_name,
            user_id,
            null
        ),
        Gs2MatchmakingBallotCache.cache_key(
            rating_name,
            gathering_name,
# diff --- start
#            number_of_player,
#            key_id
# diff --- end
        ),
        callback,
        func(): await model()
    )


func unsubscribe_model(callback_id: int) -> void:
    _gs2.cache.unsubscribe(
# diff --- start
#        "Gs2MatchmakingBallot",
# diff --- end
        "Gs2MatchmakingSignedBallot", # diff +++
        Gs2MatchmakingBallotCache.cache_parent_key(
            namespace_name,
            user_id,
            null
        ),
        Gs2MatchmakingBallotCache.cache_key(
            rating_name,
            gathering_name,
# diff --- start
#            number_of_player,
#            key_id
# diff --- end
        ),
        callback_id
    )


func subscribe_model_with_initial_call(callback: Callable) -> Gs2AsyncResult:
    var model_result = await model()
    if model_result.error != null:
        return model_result
    var callback_id = subscribe_model(callback)
    callback.call(model_result.result)
    return Gs2AsyncResult.new(callback_id, null)