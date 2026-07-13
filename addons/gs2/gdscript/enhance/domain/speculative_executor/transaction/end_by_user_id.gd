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
class_name Gs2EnhanceEndByUserIdTransactionSpeculativeExecutor
extends RefCounted


static func action() -> String:
    return "Gs2Enhance:EndByUserId"


# 戻り値: Gs2AsyncResult (result = コミット用 Callable / null)
static func execute(
    gs2: Gs2Domain,
    access_token,
    request: Gs2EnhanceEndByUserIdRequest
) -> Gs2AsyncResult:
    push_warning("Speculative execution not supported on this action: " + action())
# diff --- start
#    var model_result = await Gs2Enhance.new(gs2).namespace_(request.namespace_name).access_token(access_token).progress().model()
#    if model_result.error != null:
#        return model_result
#    var item = model_result.result
#    if item == null:
#        return Gs2AsyncResult.new(null, null)
#    var consume_actions = []
#    if item.consume_actions != null:
#        for v in item.consume_actions:
#            for config in (request.config if request.config != null else []):
#                v = v.apply_config(config.key, config.value)
#            consume_actions.append(v)
#    var acquire_actions = []
#    if item.acquire_actions != null:
#        for v in item.acquire_actions:
#            for config in (request.config if request.config != null else []):
#                v = v.apply_config(config.key, config.value)
#            acquire_actions.append(v)
#    return await Gs2SpeculativeExecutor.execute(
#        gs2,
#        access_token,
#        consume_actions,
#        acquire_actions,
#        1.0
#    )
# diff --- end
# diff +++ start
    # C# deny: speculative execution not supported (no-op commit)
    return Gs2AsyncResult.new(func(): return null, null)
# diff +++ end
