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
class_name Gs2StaminaStaminaVerifyStaminaMaxValueByUserIdExecutable
extends RefCounted


static func is_executable(
    item,
    request: Gs2StaminaVerifyStaminaMaxValueByUserIdRequest
) -> bool:
    match request.verify_type:
        "less":
            return item.max_value < request.value
        "lessEqual":
            return item.max_value <= request.value
        "greater":
            return item.max_value > request.value
        "greaterEqual":
            return item.max_value >= request.value
        "equal":
            return item.max_value == request.value
        "notEqual":
            return item.max_value != request.value
    return false


static func speculative_execution(
    item,
    request: Gs2StaminaVerifyStaminaMaxValueByUserIdRequest
):
    return item.get_script().from_dict(item.to_dict())


static func rate(
    request: Gs2StaminaVerifyStaminaMaxValueByUserIdRequest,
    rate_value
) -> Gs2StaminaVerifyStaminaMaxValueByUserIdRequest:
    request.value = int(request.value * rate_value)
    return request