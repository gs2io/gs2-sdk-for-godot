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
class_name Gs2ExperienceStatusDomain
extends RefCounted

var _gs2: Gs2DomainCore
var _client: Gs2ExperienceRestClient
var namespace_name: Variant = null
var user_id: Variant = null
var experience_name: Variant = null
var property_id: Variant = null
var body: Variant = null
var signature: Variant = null


func _init(
    gs2: Gs2DomainCore,
    namespace_name_,
    user_id_,
    experience_name_,
    property_id_
):
    _gs2 = gs2
    _client = Gs2ExperienceRestClient.new(gs2.rest_session)
    namespace_name = namespace_name_
    user_id = user_id_
    experience_name = experience_name_
    if property_id_ != null:
        property_id_ = property_id_.replace("{region}", gs2.rest_session.region).replace("{ownerId}", "" if gs2.rest_session.owner_id == null else gs2.rest_session.owner_id).replace("{userId}", "" if user_id == null else user_id)
    property_id = property_id_


func get_(
    request: Gs2ExperienceGetStatusByUserIdRequest
) -> Gs2AsyncResult:
    request = request.with_context_stack(_gs2.default_context_stack if request.context_stack == null or request.context_stack == "" else request.context_stack)
    request = request.with_namespace_name(namespace_name)
    request = request.with_user_id(user_id)
    request = request.with_experience_name(experience_name)
    request = request.with_property_id(property_id)
    var async_result = await Gs2ExperienceGetStatusByUserIdMethodCache.invoke(
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


func get_with_signature(
    request: Gs2ExperienceGetStatusWithSignatureByUserIdRequest
) -> Gs2AsyncResult:
    request = request.with_context_stack(_gs2.default_context_stack if request.context_stack == null or request.context_stack == "" else request.context_stack)
    request = request.with_namespace_name(namespace_name)
    request = request.with_user_id(user_id)
    request = request.with_experience_name(experience_name)
    request = request.with_property_id(property_id)
    var async_result = await Gs2ExperienceGetStatusWithSignatureByUserIdMethodCache.invoke(
        _gs2.cache,
        user_id,
        null,
        request,
        func(): return await _client.get_status_with_signature_by_user_id(request)
    )
    if async_result.error != null:
        return async_result
    var result = async_result.result
    var domain = self
    domain.body = null if result == null else result.body
    domain.signature = null if result == null else result.signature
    return Gs2AsyncResult.new(domain, null)


func add_experience(
    request: Gs2ExperienceAddExperienceByUserIdRequest
) -> Gs2AsyncResult:
    request = request.with_context_stack(_gs2.default_context_stack if request.context_stack == null or request.context_stack == "" else request.context_stack)
    request = request.with_namespace_name(namespace_name)
    request = request.with_user_id(user_id)
    request = request.with_experience_name(experience_name)
    request = request.with_property_id(property_id)
    var async_result = await Gs2ExperienceAddExperienceByUserIdMethodCache.invoke(
        _gs2.cache,
        user_id,
        null,
        request,
        func(): return await _client.add_experience_by_user_id(request)
    )
    if async_result.error != null:
        return async_result
    var result = async_result.result
    var domain = self
    return Gs2AsyncResult.new(domain, null)


func sub_experience(
    request: Gs2ExperienceSubExperienceByUserIdRequest
) -> Gs2AsyncResult:
    request = request.with_context_stack(_gs2.default_context_stack if request.context_stack == null or request.context_stack == "" else request.context_stack)
    request = request.with_namespace_name(namespace_name)
    request = request.with_user_id(user_id)
    request = request.with_experience_name(experience_name)
    request = request.with_property_id(property_id)
    var async_result = await Gs2ExperienceSubExperienceByUserIdMethodCache.invoke(
        _gs2.cache,
        user_id,
        null,
        request,
        func(): return await _client.sub_experience_by_user_id(request)
    )
    if async_result.error != null:
        return async_result
    var result = async_result.result
    var domain = self
    return Gs2AsyncResult.new(domain, null)


func set_experience(
    request: Gs2ExperienceSetExperienceByUserIdRequest
) -> Gs2AsyncResult:
    request = request.with_context_stack(_gs2.default_context_stack if request.context_stack == null or request.context_stack == "" else request.context_stack)
    request = request.with_namespace_name(namespace_name)
    request = request.with_user_id(user_id)
    request = request.with_experience_name(experience_name)
    request = request.with_property_id(property_id)
    var async_result = await Gs2ExperienceSetExperienceByUserIdMethodCache.invoke(
        _gs2.cache,
        user_id,
        null,
        request,
        func(): return await _client.set_experience_by_user_id(request)
    )
    if async_result.error != null:
        return async_result
    var result = async_result.result
    var domain = self
    return Gs2AsyncResult.new(domain, null)


func add_rank_cap(
    request: Gs2ExperienceAddRankCapByUserIdRequest
) -> Gs2AsyncResult:
    request = request.with_context_stack(_gs2.default_context_stack if request.context_stack == null or request.context_stack == "" else request.context_stack)
    request = request.with_namespace_name(namespace_name)
    request = request.with_user_id(user_id)
    request = request.with_experience_name(experience_name)
    request = request.with_property_id(property_id)
    var async_result = await Gs2ExperienceAddRankCapByUserIdMethodCache.invoke(
        _gs2.cache,
        user_id,
        null,
        request,
        func(): return await _client.add_rank_cap_by_user_id(request)
    )
    if async_result.error != null:
        return async_result
    var result = async_result.result
    var domain = self
    return Gs2AsyncResult.new(domain, null)


func sub_rank_cap(
    request: Gs2ExperienceSubRankCapByUserIdRequest
) -> Gs2AsyncResult:
    request = request.with_context_stack(_gs2.default_context_stack if request.context_stack == null or request.context_stack == "" else request.context_stack)
    request = request.with_namespace_name(namespace_name)
    request = request.with_user_id(user_id)
    request = request.with_experience_name(experience_name)
    request = request.with_property_id(property_id)
    var async_result = await Gs2ExperienceSubRankCapByUserIdMethodCache.invoke(
        _gs2.cache,
        user_id,
        null,
        request,
        func(): return await _client.sub_rank_cap_by_user_id(request)
    )
    if async_result.error != null:
        return async_result
    var result = async_result.result
    var domain = self
    return Gs2AsyncResult.new(domain, null)


func set_rank_cap(
    request: Gs2ExperienceSetRankCapByUserIdRequest
) -> Gs2AsyncResult:
    request = request.with_context_stack(_gs2.default_context_stack if request.context_stack == null or request.context_stack == "" else request.context_stack)
    request = request.with_namespace_name(namespace_name)
    request = request.with_user_id(user_id)
    request = request.with_experience_name(experience_name)
    request = request.with_property_id(property_id)
    var async_result = await Gs2ExperienceSetRankCapByUserIdMethodCache.invoke(
        _gs2.cache,
        user_id,
        null,
        request,
        func(): return await _client.set_rank_cap_by_user_id(request)
    )
    if async_result.error != null:
        return async_result
    var result = async_result.result
    var domain = self
    return Gs2AsyncResult.new(domain, null)


func delete(
    request: Gs2ExperienceDeleteStatusByUserIdRequest
) -> Gs2AsyncResult:
    request = request.with_context_stack(_gs2.default_context_stack if request.context_stack == null or request.context_stack == "" else request.context_stack)
    request = request.with_namespace_name(namespace_name)
    request = request.with_user_id(user_id)
    request = request.with_experience_name(experience_name)
    request = request.with_property_id(property_id)
    var async_result = await Gs2ExperienceDeleteStatusByUserIdMethodCache.invoke(
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


func verify_rank(
    request: Gs2ExperienceVerifyRankByUserIdRequest
) -> Gs2AsyncResult:
    request = request.with_context_stack(_gs2.default_context_stack if request.context_stack == null or request.context_stack == "" else request.context_stack)
    request = request.with_namespace_name(namespace_name)
    request = request.with_user_id(user_id)
    request = request.with_experience_name(experience_name)
    request = request.with_property_id(property_id)
    var async_result = await Gs2ExperienceVerifyRankByUserIdMethodCache.invoke(
        _gs2.cache,
        user_id,
        null,
        request,
        func(): return await _client.verify_rank_by_user_id(request)
    )
    if async_result.error != null:
        return async_result
    var result = async_result.result
    var domain = self
    return Gs2AsyncResult.new(domain, null)


func verify_rank_cap(
    request: Gs2ExperienceVerifyRankCapByUserIdRequest
) -> Gs2AsyncResult:
    request = request.with_context_stack(_gs2.default_context_stack if request.context_stack == null or request.context_stack == "" else request.context_stack)
    request = request.with_namespace_name(namespace_name)
    request = request.with_user_id(user_id)
    request = request.with_experience_name(experience_name)
    request = request.with_property_id(property_id)
    var async_result = await Gs2ExperienceVerifyRankCapByUserIdMethodCache.invoke(
        _gs2.cache,
        user_id,
        null,
        request,
        func(): return await _client.verify_rank_cap_by_user_id(request)
    )
    if async_result.error != null:
        return async_result
    var result = async_result.result
    var domain = self
    return Gs2AsyncResult.new(domain, null)


func multiply_acquire_actions(
    request: Gs2ExperienceMultiplyAcquireActionsByUserIdRequest
) -> Gs2AsyncResult:
    request = request.with_context_stack(_gs2.default_context_stack if request.context_stack == null or request.context_stack == "" else request.context_stack)
    request = request.with_namespace_name(namespace_name)
    request = request.with_user_id(user_id)
    request = request.with_experience_name(experience_name)
    request = request.with_property_id(property_id)
    var async_result = await Gs2ExperienceMultiplyAcquireActionsByUserIdMethodCache.invoke(
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
    var pair = Gs2ExperienceStatusCache.get_cache(
        _gs2.cache,
        namespace_name,
        user_id,
        experience_name,
        property_id,
        null
    )
    if pair[1]:
        return Gs2AsyncResult.new(pair[0], null)
    return await Gs2ExperienceStatusCache.fetch(
        _gs2.cache,
        namespace_name,
        user_id,
        experience_name,
        property_id,
        null,
        func():
            var get_result = await get_(Gs2ExperienceGetStatusByUserIdRequest.new())
            return get_result
    )


func invalidate() -> void:
    Gs2ExperienceStatusCache.delete_cache(
        _gs2.cache,
        namespace_name,
        user_id,
        experience_name,
        property_id,
        null
    )


func subscribe_model(callback: Callable) -> int:
    return _gs2.cache.subscribe(
        "Gs2ExperienceStatus",
        Gs2ExperienceStatusCache.cache_parent_key(
            namespace_name,
            user_id,
            null
        ),
        Gs2ExperienceStatusCache.cache_key(
            experience_name,
            property_id
        ),
        callback,
        func(): await model()
    )


func unsubscribe_model(callback_id: int) -> void:
    _gs2.cache.unsubscribe(
        "Gs2ExperienceStatus",
        Gs2ExperienceStatusCache.cache_parent_key(
            namespace_name,
            user_id,
            null
        ),
        Gs2ExperienceStatusCache.cache_key(
            experience_name,
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