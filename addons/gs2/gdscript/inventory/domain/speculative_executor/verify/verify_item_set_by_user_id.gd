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
class_name Gs2InventoryVerifyItemSetByUserIdSpeculativeExecutor
extends RefCounted


static func action() -> String:
    return "Gs2Inventory:VerifyItemSetByUserId"


# 戻り値: Gs2AsyncResult (result = コミット用 Callable / null)
static func execute(
    gs2: Gs2Domain,
    access_token,
    request: Gs2InventoryVerifyItemSetByUserIdRequest
) -> Gs2AsyncResult:
    var model_result = await Gs2Inventory.new(gs2).namespace_(request.namespace_name).access_token(access_token).inventory(request.inventory_name).item_set(request.item_name, request.item_set_name).model()
    if model_result.error != null:
        return model_result
    var item = model_result.result
    if item == null:
        return Gs2AsyncResult.new(null, null)
    var total_count = 0
    for value in item:
        total_count += value.count if value.count != null else 0
    var invalid = false
    match request.verify_type:
        "less": invalid = total_count < request.count
        "lessEqual": invalid = total_count <= request.count
        "greater": invalid = total_count > request.count
        "greaterEqual": invalid = total_count >= request.count
        "equal": invalid = total_count == request.count
        "notEqual": invalid = total_count != request.count
    if invalid:
        var error = Gs2BadRequestException.new()
        error.status_code = 400
        var request_error = Gs2RequestError.new()
        request_error.component = "count"
        request_error.message = "invalid"
        error.errors.append(request_error)
        return Gs2AsyncResult.new(null, error)
    var commit = func():
        pass
    return Gs2AsyncResult.new(commit, null)
