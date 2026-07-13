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
class_name Gs2JobQueueUserAccessTokenDomain
extends RefCounted

var _gs2: Gs2Domain
var _client: Gs2JobQueueRestClient
var namespace_name: Variant = null
var access_token: Gs2AuthAccessToken
var user_id: Variant:
    get:
        return null if access_token == null else access_token.user_id
var auto_run: Variant = null
var is_last_job: Variant = null
var next_page_token: Variant = null


func _init(
    gs2: Gs2Domain,
    namespace_name_,
    access_token_
):
    _gs2 = gs2
    _client = Gs2JobQueueRestClient.new(gs2.rest_session)
    namespace_name = namespace_name_
    access_token = access_token_


func run(
    request: Gs2JobQueueRunRequest
) -> Gs2AsyncResult:
    request = request.with_context_stack(_gs2.default_context_stack if request.context_stack == null or request.context_stack == "" else request.context_stack)
    request = request.with_namespace_name(namespace_name)
    request = request.with_access_token(null if access_token == null else access_token.token)
    var async_result = await Gs2JobQueueRunMethodCache.invoke(
        _gs2.cache,
        user_id,
        (null if access_token == null else access_token.time_offset),
        request,
        func(): return await _client.run(request)
    )
    if async_result.error != null:
        return async_result
    var result = async_result.result
    if result != null and result.item != null:
        _gs2.update_cache_from_job_result(
            result.item,
            result.result
        )
    var ref = null if result == null else result.item
    var domain = Gs2JobQueueJobAccessTokenDomain.new(
        _gs2,
        namespace_name,
        access_token,
        (null if ref == null else ref.name)
    )
    domain.is_last_job = null if result == null else result.is_last_job
    domain.item = null if result == null else result.item # diff +++
    domain.result = null if result == null else result.result # diff +++
    return Gs2AsyncResult.new(domain, null)
func job(
    job_name
) -> Gs2JobQueueJobAccessTokenDomain:
    return Gs2JobQueueJobAccessTokenDomain.new(
        _gs2,
        namespace_name,
        access_token,
        job_name
    )