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
class_name Gs2GuildVerifyCurrentMaximumMemberCountByGuildNameSpeculativeExecutor
extends RefCounted


static func action() -> String:
    return "Gs2Guild:VerifyCurrentMaximumMemberCountByGuildName"


static func execute(
    gs2: Gs2DomainCore,
    access_token,
    request: Gs2GuildVerifyCurrentMaximumMemberCountByGuildNameRequest
) -> Gs2AsyncResult:
    # diff --- start
    # var model_result = await Gs2Guild.new(gs2).namespace_(request.namespace_name).guild(request.guild_model_name, request.guild_name).model()
    # diff --- end
    var model_result = await Gs2Guild.new(gs2).namespace_(request.namespace_name).guild(request.guild_model_name, request.guild_name).model(access_token)  # diff +++
    if model_result.error != null:
        return model_result
    var item = model_result.result
    if item == null:
        return Gs2AsyncResult.new(null, null)
    item = Gs2GuildGuildVerifyCurrentMaximumMemberCountByGuildNameExecutable.speculative_execution(item, request)
    var commit = func():
        pass
    return Gs2AsyncResult.new(commit, null)