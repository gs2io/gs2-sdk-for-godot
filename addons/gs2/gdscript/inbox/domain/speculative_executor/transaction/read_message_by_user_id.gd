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
class_name Gs2InboxReadMessageByUserIdTransactionSpeculativeExecutor
extends RefCounted


static func action() -> String:
    return "Gs2Inbox:ReadMessageByUserId"


static func execute(
    gs2: Gs2DomainCore,
    access_token,
    request: Gs2InboxReadMessageByUserIdRequest
) -> Gs2AsyncResult:
    # diff --- start
    # push_warning("Speculative execution not supported on this action: " + action())
    # diff --- end
    var model_result = await Gs2Inbox.new(gs2).namespace_(request.namespace_name).access_token(access_token).message(request.message_name).model()
    if model_result.error != null:
        return model_result
    var item = model_result.result
    if item == null:
        return Gs2AsyncResult.new(null, null)
    # diff --- start
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
    var consume_actions = [
        Gs2ConsumeAction.new() \
            .with_action("Gs2Inbox:OpenMessageByUserId") \
            .with_request(JSON.stringify(
                Gs2InboxOpenMessageByUserIdRequest.new()
                    .with_namespace_name(request.namespace_name)
                    .with_user_id(request.user_id)
                    .with_message_name(request.message_name)
                    .to_dict()
            )),
    ]
    var acquire_actions = item.read_acquire_actions if item.read_acquire_actions != null else []
    # diff +++ end
    return await Gs2SpeculativeExecutor.execute(
        gs2,
        access_token,
        consume_actions,
        acquire_actions,
        1.0
    )