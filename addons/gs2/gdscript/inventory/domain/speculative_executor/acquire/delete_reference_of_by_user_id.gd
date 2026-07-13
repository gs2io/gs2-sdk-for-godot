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
class_name Gs2InventoryDeleteReferenceOfByUserIdSpeculativeExecutor
extends RefCounted


static func action() -> String:
    return "Gs2Inventory:DeleteReferenceOfByUserId"


# 戻り値: Gs2AsyncResult (result = コミット用 Callable / null)
static func execute(
    gs2: Gs2Domain,
    access_token,
    request: Gs2InventoryDeleteReferenceOfByUserIdRequest
) -> Gs2AsyncResult:
    var model_result = await Gs2Inventory.new(gs2).namespace_(request.namespace_name).access_token(access_token).inventory(request.inventory_name).item_set(request.item_name, request.item_set_name).reference_of(request.reference_of).model()
    if model_result.error != null:
        return model_result
    var item = model_result.result
    if item == null:
        return Gs2AsyncResult.new(null, null)
    item = Gs2InventoryReferenceOfDeleteReferenceOfByUserIdExecutable.speculative_execution(item, request)
    var commit = func():
        Gs2InventoryReferenceOfCache.put_cache(
            item,
            gs2.cache,
            request.namespace_name,
            request.user_id,
            request.inventory_name,
            request.item_name,
            request.item_set_name,
            request.reference_of,
            null
        )
    return Gs2AsyncResult.new(commit, null)