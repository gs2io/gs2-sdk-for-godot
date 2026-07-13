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
class_name Gs2MissionCounterDecreaseCounterByUserIdExecutable
extends RefCounted


static func is_executable(
    item,
    request: Gs2MissionDecreaseCounterByUserIdRequest
) -> bool:
    return true


static func speculative_execution(
    item,
    request: Gs2MissionDecreaseCounterByUserIdRequest
):
    var clone = item.get_script().from_dict(item.to_dict())
    # diff --- start
    # clone.values -= request.value
    # diff --- end
    # diff +++ start
    if clone.values == null:
        clone.values = []
    for v in clone.values:
        if v != null and v.value != null:
            v.value -= request.value
    # diff +++ end
    return clone


static func rate(
    request: Gs2MissionDecreaseCounterByUserIdRequest,
    rate_value
) -> Gs2MissionDecreaseCounterByUserIdRequest:
    request.value = int(request.value * rate_value)
    return request