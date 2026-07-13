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
class_name Gs2GradeStatusAccessTokenDomain
extends RefCounted

var _gs2: Gs2Domain
var _client: Gs2GradeRestClient
var namespace_name: Variant = null
var access_token: Gs2AuthAccessToken
var user_id: Variant:
    get:
        return null if access_token == null else access_token.user_id
var grade_name: Variant = null
var property_id: Variant = null
var experience_namespace_name: Variant = null


func _init(
    gs2: Gs2Domain,
    namespace_name_,
    access_token_,
    grade_name_,
    property_id_
):
    _gs2 = gs2
    _client = Gs2GradeRestClient.new(gs2.rest_session)
    namespace_name = namespace_name_
    access_token = access_token_
    grade_name = grade_name_
    if property_id_ != null:
        property_id_ = property_id_.replace("{region}", gs2.rest_session.region).replace("{ownerId}", "" if gs2.rest_session.owner_id == null else gs2.rest_session.owner_id).replace("{userId}", "" if user_id == null else user_id)
    property_id = property_id_


func get_(
    request: Gs2GradeGetStatusRequest
) -> Gs2AsyncResult:
    request = request.with_context_stack(_gs2.default_context_stack if request.context_stack == null or request.context_stack == "" else request.context_stack)
    request = request.with_namespace_name(namespace_name)
    request = request.with_access_token(null if access_token == null else access_token.token)
    request = request.with_grade_name(grade_name)
    request = request.with_property_id(property_id)
    var async_result = await Gs2GradeGetStatusMethodCache.invoke(
        _gs2.cache,
        user_id,
        (null if access_token == null else access_token.time_offset),
        request,
        func(): return await _client.get_status(request)
    )
    if async_result.error != null:
        return async_result
    var result = async_result.result
    return Gs2AsyncResult.new(null if result == null else result.item, null)


func sub_grade(
    request: Gs2GradeSubGradeRequest
) -> Gs2AsyncResult:
    request = request.with_context_stack(_gs2.default_context_stack if request.context_stack == null or request.context_stack == "" else request.context_stack)
    request = request.with_namespace_name(namespace_name)
    request = request.with_access_token(null if access_token == null else access_token.token)
    request = request.with_grade_name(grade_name)
    request = request.with_property_id(property_id)
    var async_result = await Gs2GradeSubGradeMethodCache.invoke(
        _gs2.cache,
        user_id,
        (null if access_token == null else access_token.time_offset),
        request,
        func(): return await _client.sub_grade(request)
    )
    if async_result.error != null:
        return async_result
    var result = async_result.result
    var domain = self
    domain.experience_namespace_name = null if result == null else result.experience_namespace_name
    return Gs2AsyncResult.new(domain, null)


func apply_rank_cap(
    request: Gs2GradeApplyRankCapRequest
) -> Gs2AsyncResult:
    request = request.with_context_stack(_gs2.default_context_stack if request.context_stack == null or request.context_stack == "" else request.context_stack)
    request = request.with_namespace_name(namespace_name)
    request = request.with_access_token(null if access_token == null else access_token.token)
    request = request.with_grade_name(grade_name)
    request = request.with_property_id(property_id)
    var async_result = await Gs2GradeApplyRankCapMethodCache.invoke(
        _gs2.cache,
        user_id,
        (null if access_token == null else access_token.time_offset),
        request,
        func(): return await _client.apply_rank_cap(request)
    )
    if async_result.error != null:
        return async_result
    var result = async_result.result
    var domain = self
    domain.experience_namespace_name = null if result == null else result.experience_namespace_name
    return Gs2AsyncResult.new(domain, null)


func verify_grade(
    request: Gs2GradeVerifyGradeRequest
) -> Gs2AsyncResult:
    request = request.with_context_stack(_gs2.default_context_stack if request.context_stack == null or request.context_stack == "" else request.context_stack)
    request = request.with_namespace_name(namespace_name)
    request = request.with_access_token(null if access_token == null else access_token.token)
    request = request.with_grade_name(grade_name)
    request = request.with_property_id(property_id)
    var async_result = await Gs2GradeVerifyGradeMethodCache.invoke(
        _gs2.cache,
        user_id,
        (null if access_token == null else access_token.time_offset),
        request,
        func(): return await _client.verify_grade(request)
    )
    if async_result.error != null:
        return async_result
    var result = async_result.result
    var domain = self
    return Gs2AsyncResult.new(domain, null)


func verify_grade_up_material(
    request: Gs2GradeVerifyGradeUpMaterialRequest
) -> Gs2AsyncResult:
    request = request.with_context_stack(_gs2.default_context_stack if request.context_stack == null or request.context_stack == "" else request.context_stack)
    request = request.with_namespace_name(namespace_name)
    request = request.with_access_token(null if access_token == null else access_token.token)
    request = request.with_grade_name(grade_name)
    request = request.with_property_id(property_id)
    var async_result = await Gs2GradeVerifyGradeUpMaterialMethodCache.invoke(
        _gs2.cache,
        user_id,
        (null if access_token == null else access_token.time_offset),
        request,
        func(): return await _client.verify_grade_up_material(request)
    )
    if async_result.error != null:
        return async_result
    var result = async_result.result
    var domain = self
    return Gs2AsyncResult.new(domain, null)


func model() -> Gs2AsyncResult:
    var pair = Gs2GradeStatusCache.get_cache(
        _gs2.cache,
        namespace_name,
        user_id,
        grade_name,
        property_id,
        (null if access_token == null else access_token.time_offset)
    )
    if pair[1]:
        return Gs2AsyncResult.new(pair[0], null)
    return await Gs2GradeStatusCache.fetch(
        _gs2.cache,
        namespace_name,
        user_id,
        grade_name,
        property_id,
        (null if access_token == null else access_token.time_offset),
        func():
            var get_result = await get_(Gs2GradeGetStatusRequest.new())
            return get_result
    )


func invalidate() -> void:
    Gs2GradeStatusCache.delete_cache(
        _gs2.cache,
        namespace_name,
        user_id,
        grade_name,
        property_id,
        (null if access_token == null else access_token.time_offset)
    )


func subscribe_model(callback: Callable) -> int:
    return _gs2.cache.subscribe(
        "Gs2GradeStatus",
        Gs2GradeStatusCache.cache_parent_key(
            namespace_name,
            user_id,
            (null if access_token == null else access_token.time_offset)
        ),
        Gs2GradeStatusCache.cache_key(
            grade_name,
            property_id
        ),
        callback,
        func(): await model()
    )


func unsubscribe_model(callback_id: int) -> void:
    _gs2.cache.unsubscribe(
        "Gs2GradeStatus",
        Gs2GradeStatusCache.cache_parent_key(
            namespace_name,
            user_id,
            (null if access_token == null else access_token.time_offset)
        ),
        Gs2GradeStatusCache.cache_key(
            grade_name,
            property_id
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