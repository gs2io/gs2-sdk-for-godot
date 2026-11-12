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
class_name Gs2JobQueueJobAccessTokenDomain
extends RefCounted

var _gs2: Gs2DomainCore
var _client: Gs2JobQueueRestClient
var namespace_name: Variant = null
var access_token: Gs2AuthAccessToken
var user_id: Variant:
    get:
        return null if access_token == null else access_token.user_id
var job_name: Variant = null
var auto_run: Variant = null
var is_last_job: Variant = null
var need_retry: Variant = null
var item = null # diff +++
var result = null # diff +++


func _init(
    gs2: Gs2DomainCore,
    namespace_name_,
    access_token_,
    job_name_
):
    _gs2 = gs2
    _client = Gs2JobQueueRestClient.new(gs2.rest_session)
    namespace_name = namespace_name_
    access_token = access_token_
    job_name = job_name_


func delete(
    request: Gs2JobQueueDeleteJobRequest
) -> Gs2AsyncResult:
    request = request.with_context_stack(_gs2.default_context_stack if request.context_stack == null or request.context_stack == "" else request.context_stack)
    request = request.with_namespace_name(namespace_name)
    request = request.with_access_token(null if access_token == null else access_token.token)
    request = request.with_job_name(job_name)
    var async_result = await Gs2JobQueueDeleteJobMethodCache.invoke(
        _gs2.cache,
        user_id,
        (null if access_token == null else access_token.time_offset),
        request,
        func(): return await _client.delete_job(request)
    )
    if async_result.error != null and not (async_result.error is Gs2NotFoundException):
        return async_result
    var result = async_result.result
    var domain = self
    return Gs2AsyncResult.new(domain, null)
func job_result(
# diff --- start
#    try_number
# diff --- end
    try_number = 0 # diff +++
) -> Gs2JobQueueJobResultAccessTokenDomain:
    return Gs2JobQueueJobResultAccessTokenDomain.new(
        _gs2,
        namespace_name,
        access_token,
        job_name,
        try_number
    )


func model() -> Gs2AsyncResult:
    var pair = Gs2JobQueueJobCache.get_cache(
        _gs2.cache,
        namespace_name,
        user_id,
        job_name,
        (null if access_token == null else access_token.time_offset)
    )
    if pair[1]:
        return Gs2AsyncResult.new(pair[0], null)
    return Gs2AsyncResult.new(null, null)


func invalidate() -> void:
    Gs2JobQueueJobCache.delete_cache(
        _gs2.cache,
        namespace_name,
        user_id,
        job_name,
        (null if access_token == null else access_token.time_offset)
    )


func subscribe_model(callback: Callable) -> int:
    return _gs2.cache.subscribe(
        "Gs2JobQueueJob",
        Gs2JobQueueJobCache.cache_parent_key(
            namespace_name,
            user_id,
            (null if access_token == null else access_token.time_offset)
        ),
        Gs2JobQueueJobCache.cache_key(
            job_name
        ),
        callback,
        func(): await model()
    )


func unsubscribe_model(callback_id: int) -> void:
    _gs2.cache.unsubscribe(
        "Gs2JobQueueJob",
        Gs2JobQueueJobCache.cache_parent_key(
            namespace_name,
            user_id,
            (null if access_token == null else access_token.time_offset)
        ),
        Gs2JobQueueJobCache.cache_key(
            job_name
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