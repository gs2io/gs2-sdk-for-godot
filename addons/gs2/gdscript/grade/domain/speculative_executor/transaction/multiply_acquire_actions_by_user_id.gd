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
class_name Gs2GradeMultiplyAcquireActionsByUserIdTransactionSpeculativeExecutor
extends RefCounted


static func action() -> String:
    return "Gs2Grade:MultiplyAcquireActionsByUserId"


static func execute(
    gs2: Gs2Domain,
    access_token,
    request: Gs2GradeMultiplyAcquireActionsByUserIdRequest
) -> Gs2AsyncResult:
    push_warning("Speculative execution not supported on this action: " + action())
    # diff --- start
    # var model_result = await Gs2Grade.new(gs2).namespace_(request.namespace_name).access_token(access_token).status(request.grade_name, request.property_id).model()
    # if model_result.error != null:
    #     return model_result
    # var item = model_result.result
    # if item == null:
    #     return Gs2AsyncResult.new(null, null)
    # var consume_actions = item.consume_actions if item.consume_actions != null else []
    # var acquire_actions = item.acquire_actions if item.acquire_actions != null else []
    # return await Gs2SpeculativeExecutor.execute(
    #     gs2,
    #     access_token,
    #     consume_actions,
    #     acquire_actions,
    #     1.0
    # )
    # diff --- end
    # diff +++ start
    return Gs2AsyncResult.new(func(): return null, null)
    # diff +++ end