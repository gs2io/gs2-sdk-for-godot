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
class_name Gs2EnchantVerifyRarityParameterStatusByUserIdSpeculativeExecutor
extends RefCounted


static func action() -> String:
    return "Gs2Enchant:VerifyRarityParameterStatusByUserId"


# diff +++ start
static func _bad_request() -> Gs2Exception:
    var e = Gs2BadRequestException.new()
    e.status_code = 400
    var request_error = Gs2RequestError.new()
    request_error.component = "count"
    request_error.message = "invalid"
    e.errors.append(request_error)
    return e


static func transform(
    gs2: Gs2Domain,
    access_token,
    request: Gs2EnchantVerifyRarityParameterStatusByUserIdRequest,
    item
) -> Gs2AsyncResult:
    var count = 0
    for v in (item.parameter_values if item.parameter_values != null else []):
        if v.name == request.parameter_name:
            count += 1
    match request.verify_type:
        "havent":
            if count > 0:
                return Gs2AsyncResult.new(null, _bad_request())
        "have":
            if count == 0:
                return Gs2AsyncResult.new(null, _bad_request())
        "count":
            if (item.parameter_values.size() if item.parameter_values != null else 0) != request.parameter_count:
                return Gs2AsyncResult.new(null, _bad_request())
    return Gs2AsyncResult.new(item, null)
# diff +++ end
static func execute(
    gs2,
    access_token,
    request: Gs2EnchantVerifyRarityParameterStatusByUserIdRequest
) -> Gs2AsyncResult:
    var model_result = await Gs2Enchant.new(gs2).namespace_(request.namespace_name).access_token(access_token).rarity_parameter_status(request.parameter_name, request.property_id).model()
    if model_result.error != null:
        return model_result
    var item = model_result.result
    if item == null:
        return Gs2AsyncResult.new(null, null)
    # diff --- start
    #item = Gs2EnchantRarityParameterStatusVerifyRarityParameterStatusByUserIdExecutable.speculative_execution(item, request)
    # diff --- end
    # diff +++ start
    var transform_result = transform(gs2, access_token, request, item)
    if transform_result.error != null:
        return transform_result
    item = transform_result.result
    # diff +++ end
    var commit = func():
        pass
    return Gs2AsyncResult.new(commit, null)
