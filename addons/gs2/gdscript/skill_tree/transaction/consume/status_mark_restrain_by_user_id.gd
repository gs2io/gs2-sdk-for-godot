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
class_name Gs2SkillTreeStatusMarkRestrainByUserIdExecutable
extends RefCounted


static func is_executable(
    item,
    request: Gs2SkillTreeMarkRestrainByUserIdRequest
) -> bool:
    return true


static func speculative_execution(
    item,
    request: Gs2SkillTreeMarkRestrainByUserIdRequest
):
    # diff --- start
    #push_warning("Speculative execution not supported on this action: Gs2SkillTree:MarkRestrainByUserId")
    #return item.get_script().from_dict(item.to_dict())
    # diff --- end
    # diff +++ start
    var clone = item.get_script().from_dict(item.to_dict())
    var released_node_names = clone.released_node_names if clone.released_node_names != null else []
    var node_model_names = request.node_model_names if request.node_model_names != null else []
    for v in released_node_names:
        if node_model_names.has(v):
            return clone
    var filtered = []
    for v in released_node_names:
        if not node_model_names.has(v):
            filtered.append(v)
    clone.released_node_names = filtered
    return clone
    # diff +++ end


static func rate(
    request: Gs2SkillTreeMarkRestrainByUserIdRequest,
    rate_value
) -> Gs2SkillTreeMarkRestrainByUserIdRequest:
    push_error("not supported rate action Gs2SkillTree:MarkRestrainByUserId")
    return request