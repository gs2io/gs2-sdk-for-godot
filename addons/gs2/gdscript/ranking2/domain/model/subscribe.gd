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
class_name Gs2Ranking2SubscribeDomain
extends RefCounted

var _gs2: Gs2Domain
var _client: Gs2Ranking2RestClient
var namespace_name: Variant = null
var user_id: Variant = null
var ranking_name: Variant = null


func _init(
    gs2: Gs2Domain,
    namespace_name_,
    user_id_,
    ranking_name_
):
    _gs2 = gs2
    _client = Gs2Ranking2RestClient.new(gs2.rest_session)
    namespace_name = namespace_name_
    user_id = user_id_
    ranking_name = ranking_name_


func add(
    request: Gs2Ranking2AddSubscribeByUserIdRequest
) -> Gs2AsyncResult:
    request = request.with_context_stack(_gs2.default_context_stack if request.context_stack == null or request.context_stack == "" else request.context_stack)
    request = request.with_namespace_name(namespace_name)
    request = request.with_ranking_name(ranking_name)
    request = request.with_user_id(user_id)
    var async_result = await Gs2Ranking2AddSubscribeByUserIdMethodCache.invoke(
        _gs2.cache,
        user_id,
        null,
        request,
        func(): return await _client.add_subscribe_by_user_id(request)
    )
    if async_result.error != null:
        return async_result
    var result = async_result.result
    var ref = null if result == null else result.item
    var domain = Gs2Ranking2SubscribeUserDomain.new(
        _gs2,
        namespace_name,
        (null if ref == null else ref.user_id),
        (null if ref == null else ref.ranking_name),
        (null if ref == null else ref.target_user_id)
    )
    return Gs2AsyncResult.new(domain, null)
func subscribe_user(
    target_user_id
) -> Gs2Ranking2SubscribeUserDomain:
    return Gs2Ranking2SubscribeUserDomain.new(
        _gs2,
        namespace_name,
        user_id,
        ranking_name,
        target_user_id
    )


func model() -> Gs2AsyncResult:
    var pair = Gs2Ranking2SubscribeCache.get_cache(
        _gs2.cache,
        namespace_name,
        user_id,
        ranking_name,
        null
    )
    if pair[1]:
        return Gs2AsyncResult.new(pair[0], null)
    return Gs2AsyncResult.new(null, null)


func invalidate() -> void:
    Gs2Ranking2SubscribeCache.delete_cache(
        _gs2.cache,
        namespace_name,
        user_id,
        ranking_name,
        null
    )


func subscribe_model(callback: Callable) -> int:
    return _gs2.cache.subscribe(
        "Gs2Ranking2Subscribe",
        Gs2Ranking2SubscribeCache.cache_parent_key(
            namespace_name,
            user_id,
            null
        ),
        Gs2Ranking2SubscribeCache.cache_key(
            ranking_name
        ),
        callback,
        func(): await model()
    )


func unsubscribe_model(callback_id: int) -> void:
    _gs2.cache.unsubscribe(
        "Gs2Ranking2Subscribe",
        Gs2Ranking2SubscribeCache.cache_parent_key(
            namespace_name,
            user_id,
            null
        ),
        Gs2Ranking2SubscribeCache.cache_key(
            ranking_name
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