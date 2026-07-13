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
class_name Gs2LimitCounterVerifyCounterByUserIdExecutable
extends RefCounted


static func is_executable(
    item,
    request: Gs2LimitVerifyCounterByUserIdRequest
) -> bool:
    match request.verify_type:
        "less":
            push_error("not implemented action Gs2Limit:VerifyCounterByUserId")
            return false
        "lessEqual":
            push_error("not implemented action Gs2Limit:VerifyCounterByUserId")
            return false
        "greater":
            push_error("not implemented action Gs2Limit:VerifyCounterByUserId")
            return false
        "greaterEqual":
            push_error("not implemented action Gs2Limit:VerifyCounterByUserId")
            return false
        "equal":
            push_error("not implemented action Gs2Limit:VerifyCounterByUserId")
            return false
        "notEqual":
            push_error("not implemented action Gs2Limit:VerifyCounterByUserId")
            return false
    return false


static func speculative_execution(
    item,
    request: Gs2LimitVerifyCounterByUserIdRequest
):
    return item.get_script().from_dict(item.to_dict())


static func rate(
    request: Gs2LimitVerifyCounterByUserIdRequest,
    rate_value
) -> Gs2LimitVerifyCounterByUserIdRequest:
    push_error("not supported rate action Gs2Limit:VerifyCounterByUserId")
    return request