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
class_name Gs2MissionCompleteRevertReceiveByUserIdExecutable
extends RefCounted


static func is_executable(
    item,
    request: Gs2MissionRevertReceiveByUserIdRequest
) -> bool:
    return true


static func speculative_execution(
    item,
    request: Gs2MissionRevertReceiveByUserIdRequest
):
    # diff --- start
    # push_warning("Speculative execution not supported on this action: Gs2Mission:RevertReceiveByUserId")
    # return item.get_script().from_dict(item.to_dict())
    # diff --- end
    # diff +++ start
    var clone = item.get_script().from_dict(item.to_dict())
    var names = []
    for v in (clone.received_mission_task_names if clone.received_mission_task_names != null else []):
        if v == request.mission_task_name:
            names.append(v)
    clone.received_mission_task_names = names
    return clone
    # diff +++ end


static func rate(
    request: Gs2MissionRevertReceiveByUserIdRequest,
    rate_value
) -> Gs2MissionRevertReceiveByUserIdRequest:
    push_error("not supported rate action Gs2Mission:RevertReceiveByUserId")
    return request