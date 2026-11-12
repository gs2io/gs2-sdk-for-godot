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
class_name Gs2LoginRewardMarkReceivedByUserIdSpeculativeExecutor
extends RefCounted


static func action() -> String:
    return "Gs2LoginReward:MarkReceivedByUserId"


static func execute(
    gs2: Gs2DomainCore,
    access_token,
    request: Gs2LoginRewardMarkReceivedByUserIdRequest
) -> Gs2AsyncResult:
    var model_result = await Gs2LoginReward.new(gs2).namespace_(request.namespace_name).access_token(access_token).receive_status(request.bonus_model_name).model()
    if model_result.error != null:
        return model_result
    var item = model_result.result
    if item == null:
        return Gs2AsyncResult.new(null, null)
    item = Gs2LoginRewardReceiveStatusMarkReceivedByUserIdExecutable.speculative_execution(item, request)
    var commit = func():
        Gs2LoginRewardReceiveStatusCache.put_cache(
            item,
            gs2.cache,
            request.namespace_name,
            access_token.user_id,
            request.bonus_model_name,
            null if access_token == null else access_token.time_offset
        )
    return Gs2AsyncResult.new(commit, null)