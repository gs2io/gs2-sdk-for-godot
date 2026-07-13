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
class_name Gs2GradeStatusDomain
extends RefCounted

var _gs2: Gs2Domain
var _client: Gs2GradeRestClient
var namespace_name: Variant = null
var user_id: Variant = null
var grade_name: Variant = null
var property_id: Variant = null
var experience_namespace_name: Variant = null


func _init(
    gs2: Gs2Domain,
    namespace_name_,
    user_id_,
    grade_name_,
    property_id_
):
    _gs2 = gs2
    _client = Gs2GradeRestClient.new(gs2.rest_session)
    namespace_name = namespace_name_
    user_id = user_id_
    grade_name = grade_name_
    if property_id_ != null:
        property_id_ = property_id_.replace("{region}", gs2.rest_session.region).replace("{ownerId}", "" if gs2.rest_session.owner_id == null else gs2.rest_session.owner_id).replace("{userId}", "" if user_id == null else user_id)
    property_id = property_id_


func get_(
    request: Gs2GradeGetStatusByUserIdRequest
) -> Gs2AsyncResult:
    request = request.with_context_stack(_gs2.default_context_stack if request.context_stack == null or request.context_stack == "" else request.context_stack)
    request = request.with_namespace_name(namespace_name)
    request = request.with_user_id(user_id)
    request = request.with_grade_name(grade_name)
    request = request.with_property_id(property_id)
    var async_result = await Gs2GradeGetStatusByUserIdMethodCache.invoke(
        _gs2.cache,
        user_id,
        null,
        request,
        func(): return await _client.get_status_by_user_id(request)
    )
    if async_result.error != null:
        return async_result
    var result = async_result.result
    return Gs2AsyncResult.new(null if result == null else result.item, null)


func add_grade(
    request: Gs2GradeAddGradeByUserIdRequest
) -> Gs2AsyncResult:
    request = request.with_context_stack(_gs2.default_context_stack if request.context_stack == null or request.context_stack == "" else request.context_stack)
    request = request.with_namespace_name(namespace_name)
    request = request.with_user_id(user_id)
    request = request.with_grade_name(grade_name)
    request = request.with_property_id(property_id)
    var async_result = await Gs2GradeAddGradeByUserIdMethodCache.invoke(
        _gs2.cache,
        user_id,
        null,
        request,
        func(): return await _client.add_grade_by_user_id(request)
    )
    if async_result.error != null:
        return async_result
    var result = async_result.result
    var domain = self
    domain.experience_namespace_name = null if result == null else result.experience_namespace_name
    return Gs2AsyncResult.new(domain, null)


func sub_grade(
    request: Gs2GradeSubGradeByUserIdRequest
) -> Gs2AsyncResult:
    request = request.with_context_stack(_gs2.default_context_stack if request.context_stack == null or request.context_stack == "" else request.context_stack)
    request = request.with_namespace_name(namespace_name)
    request = request.with_user_id(user_id)
    request = request.with_grade_name(grade_name)
    request = request.with_property_id(property_id)
    var async_result = await Gs2GradeSubGradeByUserIdMethodCache.invoke(
        _gs2.cache,
        user_id,
        null,
        request,
        func(): return await _client.sub_grade_by_user_id(request)
    )
    if async_result.error != null:
        return async_result
    var result = async_result.result
    var domain = self
    domain.experience_namespace_name = null if result == null else result.experience_namespace_name
    return Gs2AsyncResult.new(domain, null)


func set_grade(
    request: Gs2GradeSetGradeByUserIdRequest
) -> Gs2AsyncResult:
    request = request.with_context_stack(_gs2.default_context_stack if request.context_stack == null or request.context_stack == "" else request.context_stack)
    request = request.with_namespace_name(namespace_name)
    request = request.with_user_id(user_id)
    request = request.with_grade_name(grade_name)
    request = request.with_property_id(property_id)
    var async_result = await Gs2GradeSetGradeByUserIdMethodCache.invoke(
        _gs2.cache,
        user_id,
        null,
        request,
        func(): return await _client.set_grade_by_user_id(request)
    )
    if async_result.error != null:
        return async_result
    var result = async_result.result
    var domain = self
    domain.experience_namespace_name = null if result == null else result.experience_namespace_name
    return Gs2AsyncResult.new(domain, null)


func apply_rank_cap(
    request: Gs2GradeApplyRankCapByUserIdRequest
) -> Gs2AsyncResult:
    request = request.with_context_stack(_gs2.default_context_stack if request.context_stack == null or request.context_stack == "" else request.context_stack)
    request = request.with_namespace_name(namespace_name)
    request = request.with_user_id(user_id)
    request = request.with_grade_name(grade_name)
    request = request.with_property_id(property_id)
    var async_result = await Gs2GradeApplyRankCapByUserIdMethodCache.invoke(
        _gs2.cache,
        user_id,
        null,
        request,
        func(): return await _client.apply_rank_cap_by_user_id(request)
    )
    if async_result.error != null:
        return async_result
    var result = async_result.result
    var domain = self
    domain.experience_namespace_name = null if result == null else result.experience_namespace_name
    return Gs2AsyncResult.new(domain, null)


func delete(
    request: Gs2GradeDeleteStatusByUserIdRequest
) -> Gs2AsyncResult:
    request = request.with_context_stack(_gs2.default_context_stack if request.context_stack == null or request.context_stack == "" else request.context_stack)
    request = request.with_namespace_name(namespace_name)
    request = request.with_user_id(user_id)
    request = request.with_grade_name(grade_name)
    request = request.with_property_id(property_id)
    var async_result = await Gs2GradeDeleteStatusByUserIdMethodCache.invoke(
        _gs2.cache,
        user_id,
        null,
        request,
        func(): return await _client.delete_status_by_user_id(request)
    )
    if async_result.error != null and not (async_result.error is Gs2NotFoundException):
        return async_result
    var result = async_result.result
    var domain = self
    return Gs2AsyncResult.new(domain, null)


func verify_grade(
    request: Gs2GradeVerifyGradeByUserIdRequest
) -> Gs2AsyncResult:
    request = request.with_context_stack(_gs2.default_context_stack if request.context_stack == null or request.context_stack == "" else request.context_stack)
    request = request.with_namespace_name(namespace_name)
    request = request.with_user_id(user_id)
    request = request.with_grade_name(grade_name)
    request = request.with_property_id(property_id)
    var async_result = await Gs2GradeVerifyGradeByUserIdMethodCache.invoke(
        _gs2.cache,
        user_id,
        null,
        request,
        func(): return await _client.verify_grade_by_user_id(request)
    )
    if async_result.error != null:
        return async_result
    var result = async_result.result
    var domain = self
    return Gs2AsyncResult.new(domain, null)


func verify_grade_up_material(
    request: Gs2GradeVerifyGradeUpMaterialByUserIdRequest
) -> Gs2AsyncResult:
    request = request.with_context_stack(_gs2.default_context_stack if request.context_stack == null or request.context_stack == "" else request.context_stack)
    request = request.with_namespace_name(namespace_name)
    request = request.with_user_id(user_id)
    request = request.with_grade_name(grade_name)
    request = request.with_property_id(property_id)
    var async_result = await Gs2GradeVerifyGradeUpMaterialByUserIdMethodCache.invoke(
        _gs2.cache,
        user_id,
        null,
        request,
        func(): return await _client.verify_grade_up_material_by_user_id(request)
    )
    if async_result.error != null:
        return async_result
    var result = async_result.result
    var domain = self
    return Gs2AsyncResult.new(domain, null)


func multiply_acquire_actions(
    request: Gs2GradeMultiplyAcquireActionsByUserIdRequest
) -> Gs2AsyncResult:
    request = request.with_context_stack(_gs2.default_context_stack if request.context_stack == null or request.context_stack == "" else request.context_stack)
    request = request.with_namespace_name(namespace_name)
    request = request.with_user_id(user_id)
    request = request.with_grade_name(grade_name)
    request = request.with_property_id(property_id)
    var async_result = await Gs2GradeMultiplyAcquireActionsByUserIdMethodCache.invoke(
        _gs2.cache,
        user_id,
        null,
        request,
        func(): return await _client.multiply_acquire_actions_by_user_id(request)
    )
    if async_result.error != null:
        return async_result
    var result = async_result.result
    var transaction = Gs2TransactionDomainFactory.to_transaction_by_user_id(
        _gs2,
        user_id,
        false if result.auto_run_stamp_sheet == null else result.auto_run_stamp_sheet,
        result.transaction_id,
        result.stamp_sheet,
        result.stamp_sheet_encryption_key_id,
        result.atomic_commit,
        result.transaction_result,
        result.metadata
    )
    if result.stamp_sheet != null:
        var wait_result = await transaction.wait(true)
        if wait_result.error != null:
            return wait_result
    return Gs2AsyncResult.new(transaction, null)


func model() -> Gs2AsyncResult:
    var pair = Gs2GradeStatusCache.get_cache(
        _gs2.cache,
        namespace_name,
        user_id,
        grade_name,
        property_id,
        null
    )
    if pair[1]:
        return Gs2AsyncResult.new(pair[0], null)
    return await Gs2GradeStatusCache.fetch(
        _gs2.cache,
        namespace_name,
        user_id,
        grade_name,
        property_id,
        null,
        func():
            var get_result = await get_(Gs2GradeGetStatusByUserIdRequest.new())
            return get_result
    )


func invalidate() -> void:
    Gs2GradeStatusCache.delete_cache(
        _gs2.cache,
        namespace_name,
        user_id,
        grade_name,
        property_id,
        null
    )


func subscribe_model(callback: Callable) -> int:
    return _gs2.cache.subscribe(
        "Gs2GradeStatus",
        Gs2GradeStatusCache.cache_parent_key(
            namespace_name,
            user_id,
            null
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
            null
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