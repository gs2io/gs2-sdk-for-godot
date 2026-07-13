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
class_name Gs2MissionCounterVerifyCounterValueByUserIdExecutable
extends RefCounted


static func is_executable(
    item,
    request: Gs2MissionVerifyCounterValueByUserIdRequest
) -> bool:
    # diff +++ start
    var value = 0
    for v in (item.values if item.values != null else []):
        if v != null and v.reset_type == request.reset_type:
            value = 0 if v.value == null else v.value
            break
    # diff +++ end
    match request.verify_type:
        "less":
            # diff --- start
            # return item.value < request.value
            # diff --- end
            return value < request.value # diff +++
        "lessEqual":
            # diff --- start
            # return item.value <= request.value
            # diff --- end
            return value <= request.value # diff +++
        "greater":
            # diff --- start
            # return item.value > request.value
            # diff --- end
            return value > request.value # diff +++
        "greaterEqual":
            # diff --- start
            # return item.value >= request.value
            # diff --- end
            return value >= request.value # diff +++
        "equal":
            # diff --- start
            # return item.value == request.value
            # diff --- end
            return value == request.value # diff +++
        "notEqual":
            # diff --- start
            # return item.value != request.value
            # diff --- end
            return value != request.value # diff +++
    return false


static func speculative_execution(
    item,
    request: Gs2MissionVerifyCounterValueByUserIdRequest
):
    return item.get_script().from_dict(item.to_dict())


static func rate(
    request: Gs2MissionVerifyCounterValueByUserIdRequest,
    rate_value
) -> Gs2MissionVerifyCounterValueByUserIdRequest:
    request.value = int(request.value * rate_value)
    return request