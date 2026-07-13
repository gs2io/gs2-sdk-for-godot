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
class_name Gs2MissionCompleteReceiveByUserIdExecutable
extends RefCounted


static func is_executable(
    item,
    request: Gs2MissionReceiveByUserIdRequest
) -> bool:
    return true


static func speculative_execution(
    item,
    request: Gs2MissionReceiveByUserIdRequest
):
    # diff --- start
    # push_warning("Speculative execution not supported on this action: Gs2Mission:ReceiveByUserId")
    # return item.get_script().from_dict(item.to_dict())
    # diff --- end
    # diff +++ start
    var clone = item.get_script().from_dict(item.to_dict())
    if clone.received_mission_task_names != null and clone.received_mission_task_names.count(request.mission_task_name) != 0:
        return clone
    if clone.received_mission_task_names == null:
        clone.received_mission_task_names = []
    clone.received_mission_task_names.append(request.mission_task_name)
    return clone
    # diff +++ end


static func rate(
    request: Gs2MissionReceiveByUserIdRequest,
    rate_value
) -> Gs2MissionReceiveByUserIdRequest:
    push_error("not supported rate action Gs2Mission:ReceiveByUserId")
    return request