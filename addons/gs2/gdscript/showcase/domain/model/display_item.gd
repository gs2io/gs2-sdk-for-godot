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
class_name Gs2ShowcaseDisplayItemDomain
extends RefCounted

var _gs2: Gs2Domain
var _client: Gs2ShowcaseRestClient
var namespace_name: Variant = null
var user_id: Variant = null
var showcase_name: Variant = null
var display_item_id: Variant = null


func _init(
    gs2: Gs2Domain,
    namespace_name_,
    user_id_,
    showcase_name_,
    display_item_id_
):
    _gs2 = gs2
    _client = Gs2ShowcaseRestClient.new(gs2.rest_session)
    namespace_name = namespace_name_
    user_id = user_id_
    showcase_name = showcase_name_
    display_item_id = display_item_id_


func buy(
    request: Gs2ShowcaseBuyByUserIdRequest
) -> Gs2AsyncResult:
    request = request.with_context_stack(_gs2.default_context_stack if request.context_stack == null or request.context_stack == "" else request.context_stack)
    request = request.with_namespace_name(namespace_name)
    request = request.with_showcase_name(showcase_name)
    request = request.with_display_item_id(display_item_id)
    request = request.with_user_id(user_id)
    var async_result = await Gs2ShowcaseBuyByUserIdMethodCache.invoke(
        _gs2.cache,
        user_id,
        null,
        request,
        func(): return await _client.buy_by_user_id(request)
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
    var pair = Gs2ShowcaseDisplayItemCache.get_cache(
        _gs2.cache,
        namespace_name,
        user_id,
        showcase_name,
        display_item_id,
        null
    )
    if pair[1]:
        return Gs2AsyncResult.new(pair[0], null)
    # diff --- start
    # return Gs2AsyncResult.new(null, null)
    # diff --- end
    # diff +++ start
    var showcase_result = await Gs2Showcase.new(_gs2).namespace_(
        namespace_name
    ).user(
        user_id
    ).showcase(
        showcase_name
    ).model()
    if showcase_result.error != null:
        return showcase_result
    var showcase = showcase_result.result
    if showcase == null or showcase.display_items == null:
        return Gs2AsyncResult.new(null, null)
    for v in showcase.display_items:
        if v != null and v.display_item_id == display_item_id:
            return Gs2AsyncResult.new(v, null)
    return Gs2AsyncResult.new(null, null)
    # diff +++ end


func invalidate() -> void:
    Gs2ShowcaseDisplayItemCache.delete_cache(
        _gs2.cache,
        namespace_name,
        user_id,
        showcase_name,
        display_item_id,
        null
    )


func subscribe_model(callback: Callable) -> int:
    return _gs2.cache.subscribe(
        "Gs2ShowcaseDisplayItem",
        Gs2ShowcaseDisplayItemCache.cache_parent_key(
            namespace_name,
            user_id,
            showcase_name,
            null
        ),
        Gs2ShowcaseDisplayItemCache.cache_key(
            display_item_id
        ),
        callback,
        func(): await model()
    )


func unsubscribe_model(callback_id: int) -> void:
    _gs2.cache.unsubscribe(
        "Gs2ShowcaseDisplayItem",
        Gs2ShowcaseDisplayItemCache.cache_parent_key(
            namespace_name,
            user_id,
            showcase_name,
            null
        ),
        Gs2ShowcaseDisplayItemCache.cache_key(
            display_item_id
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