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
class_name Gs2MissionBatchCompleteByUserIdTransactionSpeculativeExecutor
extends RefCounted


static func action() -> String:
    return "Gs2Mission:BatchCompleteByUserId"


static func execute(
    gs2: Gs2DomainCore,
    access_token,
    request: Gs2MissionBatchCompleteByUserIdRequest
) -> Gs2AsyncResult:
    # diff --- start
    # push_warning("Speculative execution not supported on this action: " + action())
    # var model_result = await Gs2Mission.new(gs2).namespace_(request.namespace_name).access_token(access_token).complete(request.mission_group_name).model()
    # if model_result.error != null:
    #     return model_result
    # var item = model_result.result
    # if item == null:
    #     return Gs2AsyncResult.new(null, null)
    # var consume_actions = []
    # if item.consume_actions != null:
    #     for v in item.consume_actions:
    #         for config in (request.config if request.config != null else []):
    #             v = v.apply_config(config.key, config.value)
    #         consume_actions.append(v)
    # var acquire_actions = []
    # if item.acquire_actions != null:
    #     for v in item.acquire_actions:
    #         for config in (request.config if request.config != null else []):
    #             v = v.apply_config(config.key, config.value)
    #         acquire_actions.append(v)
    # diff --- end
    # diff +++ start
    var acquire_actions = []
    for mission_task_name in (request.mission_task_names if request.mission_task_names != null else []):
        var model_result = await Gs2Mission.new(gs2).namespace_(request.namespace_name).mission_group_model(request.mission_group_name).mission_task_model(mission_task_name).model()
        if model_result.error != null:
            return model_result
        var item = model_result.result
        if item != null and item.complete_acquire_actions != null:
            acquire_actions.append_array(item.complete_acquire_actions)
    var consume_actions = [
        Gs2ConsumeAction.new() \
            .with_action("Gs2Mission:BatchReceiveByUserId") \
            .with_request(JSON.stringify(
                Gs2MissionBatchReceiveByUserIdRequest.new()
                    .with_namespace_name(request.namespace_name)
                    .with_mission_group_name(request.mission_group_name)
                    .with_mission_task_names(request.mission_task_names)
                    .with_user_id(request.user_id)
                    .to_dict()
            )),
    ]
    # diff +++ end
    return await Gs2SpeculativeExecutor.execute(
        gs2,
        access_token,
        consume_actions,
        acquire_actions,
        1.0
    )