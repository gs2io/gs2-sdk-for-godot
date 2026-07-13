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
class_name Gs2MegaFieldUserDomain
extends RefCounted

var _gs2: Gs2Domain
var _client: Gs2MegaFieldRestClient
var namespace_name: Variant = null
var user_id: Variant = null


func _init(
    gs2: Gs2Domain,
    namespace_name_,
    user_id_
):
    _gs2 = gs2
    _client = Gs2MegaFieldRestClient.new(gs2.rest_session)
    namespace_name = namespace_name_
    user_id = user_id_


func fetch_position_from_system(
    request: Gs2MegaFieldFetchPositionFromSystemRequest
) -> Gs2AsyncResult:
    request = request.with_context_stack(_gs2.default_context_stack if request.context_stack == null or request.context_stack == "" else request.context_stack)
    request = request.with_namespace_name(namespace_name)
    var async_result = await Gs2MegaFieldFetchPositionFromSystemMethodCache.invoke(
        _gs2.cache,
        user_id,
        null,
        request,
        func(): return await _client.fetch_position_from_system(request)
    )
    if async_result.error != null:
        return async_result
    var result = async_result.result
    var domain = []
    if result != null and result.items != null:
        for v in result.items:
            domain.append(Gs2MegaFieldSpatialDomain.new(
                _gs2,
                namespace_name,
                (null if v == null else v.user_id),
                (null if v == null else v.area_model_name),
                (null if v == null else v.layer_model_name)
            ))
    return Gs2AsyncResult.new(domain, null)


func near_user_ids_from_system(
    request: Gs2MegaFieldNearUserIdsFromSystemRequest
) -> Gs2AsyncResult:
    request = request.with_context_stack(_gs2.default_context_stack if request.context_stack == null or request.context_stack == "" else request.context_stack)
    request = request.with_namespace_name(namespace_name)
    var async_result = await Gs2MegaFieldNearUserIdsFromSystemMethodCache.invoke(
        _gs2.cache,
        user_id,
        null,
        request,
        func(): return await _client.near_user_ids_from_system(request)
    )
    if async_result.error != null:
        return async_result
    var result = async_result.result
    var domain: Variant = self
    return Gs2AsyncResult.new(domain, null)
func spatial(
    area_model_name,
    layer_model_name
) -> Gs2MegaFieldSpatialDomain:
    return Gs2MegaFieldSpatialDomain.new(
        _gs2,
        namespace_name,
        user_id,
        area_model_name,
        layer_model_name
    )