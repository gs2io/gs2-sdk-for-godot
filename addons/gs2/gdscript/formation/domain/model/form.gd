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
class_name Gs2FormationFormDomain
extends RefCounted

var _gs2: Gs2Domain
var _client: Gs2FormationRestClient
var namespace_name: Variant = null
var user_id: Variant = null
var mold_model_name: Variant = null
var index: Variant = null
var body: Variant = null
var signature: Variant = null


func _init(
    gs2: Gs2Domain,
    namespace_name_,
    user_id_,
    mold_model_name_,
    index_
):
    _gs2 = gs2
    _client = Gs2FormationRestClient.new(gs2.rest_session)
    namespace_name = namespace_name_
    user_id = user_id_
    mold_model_name = mold_model_name_
    index = index_


func get_(
    request: Gs2FormationGetFormByUserIdRequest
) -> Gs2AsyncResult:
    request = request.with_context_stack(_gs2.default_context_stack if request.context_stack == null or request.context_stack == "" else request.context_stack)
    request = request.with_namespace_name(namespace_name)
    request = request.with_user_id(user_id)
    request = request.with_mold_model_name(mold_model_name)
    request = request.with_index(index)
    var async_result = await Gs2FormationGetFormByUserIdMethodCache.invoke(
        _gs2.cache,
        user_id,
        null,
        request,
        func(): return await _client.get_form_by_user_id(request)
    )
    if async_result.error != null:
        return async_result
    var result = async_result.result
    return Gs2AsyncResult.new(null if result == null else result.item, null)


func get_with_signature(
    request: Gs2FormationGetFormWithSignatureByUserIdRequest
) -> Gs2AsyncResult:
    request = request.with_context_stack(_gs2.default_context_stack if request.context_stack == null or request.context_stack == "" else request.context_stack)
    request = request.with_namespace_name(namespace_name)
    request = request.with_user_id(user_id)
    request = request.with_mold_model_name(mold_model_name)
    request = request.with_index(index)
    var async_result = await Gs2FormationGetFormWithSignatureByUserIdMethodCache.invoke(
        _gs2.cache,
        user_id,
        null,
        request,
        func(): return await _client.get_form_with_signature_by_user_id(request)
    )
    if async_result.error != null:
        return async_result
    var result = async_result.result
    var domain = self
    domain.body = null if result == null else result.body
    domain.signature = null if result == null else result.signature
    return Gs2AsyncResult.new(domain, null)


func set_(
    request: Gs2FormationSetFormByUserIdRequest
) -> Gs2AsyncResult:
    request = request.with_context_stack(_gs2.default_context_stack if request.context_stack == null or request.context_stack == "" else request.context_stack)
    request = request.with_namespace_name(namespace_name)
    request = request.with_user_id(user_id)
    request = request.with_mold_model_name(mold_model_name)
    request = request.with_index(index)
    var async_result = await Gs2FormationSetFormByUserIdMethodCache.invoke(
        _gs2.cache,
        user_id,
        null,
        request,
        func(): return await _client.set_form_by_user_id(request)
    )
    if async_result.error != null:
        return async_result
    var result = async_result.result
    var domain = self
    return Gs2AsyncResult.new(domain, null)


func acquire_actions_to_properties(
    request: Gs2FormationAcquireActionsToFormPropertiesRequest
) -> Gs2AsyncResult:
    request = request.with_context_stack(_gs2.default_context_stack if request.context_stack == null or request.context_stack == "" else request.context_stack)
    request = request.with_namespace_name(namespace_name)
    request = request.with_user_id(user_id)
    request = request.with_mold_model_name(mold_model_name)
    request = request.with_index(index)
    var async_result = await Gs2FormationAcquireActionsToFormPropertiesMethodCache.invoke(
        _gs2.cache,
        user_id,
        null,
        request,
        func(): return await _client.acquire_actions_to_form_properties(request)
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


func delete(
    request: Gs2FormationDeleteFormByUserIdRequest
) -> Gs2AsyncResult:
    request = request.with_context_stack(_gs2.default_context_stack if request.context_stack == null or request.context_stack == "" else request.context_stack)
    request = request.with_namespace_name(namespace_name)
    request = request.with_user_id(user_id)
    request = request.with_mold_model_name(mold_model_name)
    request = request.with_index(index)
    var async_result = await Gs2FormationDeleteFormByUserIdMethodCache.invoke(
        _gs2.cache,
        user_id,
        null,
        request,
        func(): return await _client.delete_form_by_user_id(request)
    )
    if async_result.error != null and not (async_result.error is Gs2NotFoundException):
        return async_result
    var result = async_result.result
    var domain = self
    return Gs2AsyncResult.new(domain, null)


func model() -> Gs2AsyncResult:
    var pair = Gs2FormationFormCache.get_cache(
        _gs2.cache,
        namespace_name,
        user_id,
        mold_model_name,
        index,
        null
    )
    if pair[1]:
        return Gs2AsyncResult.new(pair[0], null)
    return await Gs2FormationFormCache.fetch(
        _gs2.cache,
        namespace_name,
        user_id,
        mold_model_name,
        index,
        null,
        func():
            var get_result = await get_(Gs2FormationGetFormByUserIdRequest.new())
            return get_result
    )


func invalidate() -> void:
    Gs2FormationFormCache.delete_cache(
        _gs2.cache,
        namespace_name,
        user_id,
        mold_model_name,
        index,
        null
    )


func subscribe_model(callback: Callable) -> int:
    return _gs2.cache.subscribe(
        "Gs2FormationForm",
        Gs2FormationFormCache.cache_parent_key(
            namespace_name,
            user_id,
            mold_model_name,
            null
        ),
        Gs2FormationFormCache.cache_key(
            index
        ),
        callback,
        func(): await model()
    )


func unsubscribe_model(callback_id: int) -> void:
    _gs2.cache.unsubscribe(
        "Gs2FormationForm",
        Gs2FormationFormCache.cache_parent_key(
            namespace_name,
            user_id,
            mold_model_name,
            null
        ),
        Gs2FormationFormCache.cache_key(
            index
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