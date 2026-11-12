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
class_name Gs2ShowcaseRandomShowcaseStatusDomain
extends RefCounted

var _gs2: Gs2DomainCore
var _client: Gs2ShowcaseRestClient
var namespace_name: Variant = null
var user_id: Variant = null
var showcase_name: Variant = null


func _init(
    gs2: Gs2DomainCore,
    namespace_name_,
    user_id_,
    showcase_name_
):
    _gs2 = gs2
    _client = Gs2ShowcaseRestClient.new(gs2.rest_session)
    namespace_name = namespace_name_
    user_id = user_id_
    showcase_name = showcase_name_


func increment_purchase_count(
    request: Gs2ShowcaseIncrementPurchaseCountByUserIdRequest
) -> Gs2AsyncResult:
    request = request.with_context_stack(_gs2.default_context_stack if request.context_stack == null or request.context_stack == "" else request.context_stack)
    request = request.with_namespace_name(namespace_name)
    request = request.with_showcase_name(showcase_name)
    request = request.with_user_id(user_id)
    var async_result = await Gs2ShowcaseIncrementPurchaseCountByUserIdMethodCache.invoke(
        _gs2.cache,
        user_id,
        null,
        request,
        func(): return await _client.increment_purchase_count_by_user_id(request)
    )
    if async_result.error != null:
        return async_result
    var result = async_result.result
    var ref = null if result == null else result.item
    var domain = Gs2ShowcaseRandomDisplayItemDomain.new(
        _gs2,
        namespace_name,
        user_id,
        (null if ref == null else ref.showcase_name),
        request.display_item_name
    )
    return Gs2AsyncResult.new(domain, null)


func decrement_purchase_count(
    request: Gs2ShowcaseDecrementPurchaseCountByUserIdRequest
) -> Gs2AsyncResult:
    request = request.with_context_stack(_gs2.default_context_stack if request.context_stack == null or request.context_stack == "" else request.context_stack)
    request = request.with_namespace_name(namespace_name)
    request = request.with_showcase_name(showcase_name)
    request = request.with_user_id(user_id)
    var async_result = await Gs2ShowcaseDecrementPurchaseCountByUserIdMethodCache.invoke(
        _gs2.cache,
        user_id,
        null,
        request,
        func(): return await _client.decrement_purchase_count_by_user_id(request)
    )
    if async_result.error != null:
        return async_result
    var result = async_result.result
    var ref = null if result == null else result.item
    var domain = Gs2ShowcaseRandomDisplayItemDomain.new(
        _gs2,
        namespace_name,
        user_id,
        (null if ref == null else ref.showcase_name),
        request.display_item_name
    )
    return Gs2AsyncResult.new(domain, null)


func force_re_draw(
    request: Gs2ShowcaseForceReDrawByUserIdRequest
) -> Gs2AsyncResult:
    request = request.with_context_stack(_gs2.default_context_stack if request.context_stack == null or request.context_stack == "" else request.context_stack)
    request = request.with_namespace_name(namespace_name)
    request = request.with_showcase_name(showcase_name)
    request = request.with_user_id(user_id)
    var async_result = await Gs2ShowcaseForceReDrawByUserIdMethodCache.invoke(
        _gs2.cache,
        user_id,
        null,
        request,
        func(): return await _client.force_re_draw_by_user_id(request)
    )
    if async_result.error != null:
        return async_result
    var result = async_result.result
    var domain = []
    if result != null and result.items != null:
        for v in result.items:
            domain.append(Gs2ShowcaseRandomDisplayItemDomain.new(
                _gs2,
                namespace_name,
                user_id,
                (null if v == null else v.showcase_name),
                # diff --- start
                # null
                # diff --- end
                # diff +++ start
                (null if v == null else v.name)
                # diff +++ end
            ))
    return Gs2AsyncResult.new(domain, null)