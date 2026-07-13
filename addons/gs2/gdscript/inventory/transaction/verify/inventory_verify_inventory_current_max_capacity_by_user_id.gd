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
class_name Gs2InventoryInventoryVerifyInventoryCurrentMaxCapacityByUserIdExecutable
extends RefCounted


static func is_executable(
    item,
    request: Gs2InventoryVerifyInventoryCurrentMaxCapacityByUserIdRequest
) -> bool:
    match request.verify_type:
        "less":
            return item.current_inventory_max_capacity < request.current_inventory_max_capacity
        "lessEqual":
            return item.current_inventory_max_capacity <= request.current_inventory_max_capacity
        "greater":
            return item.current_inventory_max_capacity > request.current_inventory_max_capacity
        "greaterEqual":
            return item.current_inventory_max_capacity >= request.current_inventory_max_capacity
        "equal":
            return item.current_inventory_max_capacity == request.current_inventory_max_capacity
        "notEqual":
            return item.current_inventory_max_capacity != request.current_inventory_max_capacity
    return false


static func speculative_execution(
    item,
    request: Gs2InventoryVerifyInventoryCurrentMaxCapacityByUserIdRequest
):
    return item.get_script().from_dict(item.to_dict())


static func rate(
    request: Gs2InventoryVerifyInventoryCurrentMaxCapacityByUserIdRequest,
    rate_value
) -> Gs2InventoryVerifyInventoryCurrentMaxCapacityByUserIdRequest:
    request.current_inventory_max_capacity = int(request.current_inventory_max_capacity * rate_value)
    return request