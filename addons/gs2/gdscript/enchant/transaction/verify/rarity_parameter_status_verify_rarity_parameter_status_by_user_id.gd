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
class_name Gs2EnchantRarityParameterStatusVerifyRarityParameterStatusByUserIdExecutable
extends RefCounted


static func is_executable(
    item,
    request: Gs2EnchantVerifyRarityParameterStatusByUserIdRequest
) -> bool:
    match request.verify_type:
        "havent":
            # diff --- start
            #return item.parameter_values.has(request.parameter_name)
            # diff --- end
            # diff +++ start
            for v in (item.parameter_values if item.parameter_values != null else []):
                if v.name == request.parameter_name:
                    return true
            return false
            # diff +++ end
        "have":
            # diff --- start
            #return not item.parameter_values.has(request.parameter_name)
            # diff --- end
            # diff +++ start
            for v in (item.parameter_values if item.parameter_values != null else []):
                if v.name == request.parameter_name:
                    return false
            return true
            # diff +++ end
        "count":
            # diff --- start
            #return item.parameter_values.size() == request.parameter_name
            # diff --- end
            # diff +++ start
            return (item.parameter_values.size() if item.parameter_values != null else 0) == request.parameter_count
            # diff +++ end
    return false


static func speculative_execution(
    item,
    request: Gs2EnchantVerifyRarityParameterStatusByUserIdRequest
):
    return item.get_script().from_dict(item.to_dict())


static func rate(
    request: Gs2EnchantVerifyRarityParameterStatusByUserIdRequest,
    rate_value
) -> Gs2EnchantVerifyRarityParameterStatusByUserIdRequest:
    push_error("not supported rate action Gs2Enchant:VerifyRarityParameterStatusByUserId")
    return request