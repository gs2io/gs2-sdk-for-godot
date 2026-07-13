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
class_name Gs2InventoryAcquireItemSetWithGradeByUserIdRequest
extends Gs2Request


var namespace_name = null
var inventory_name = null
var item_name = null
var user_id = null
var grade_model_id = null
var grade_value = null
var time_offset_token = null
var duplication_avoider = null


func with_namespace_name(v) -> Gs2InventoryAcquireItemSetWithGradeByUserIdRequest:
    namespace_name = v
    return self


func with_inventory_name(v) -> Gs2InventoryAcquireItemSetWithGradeByUserIdRequest:
    inventory_name = v
    return self


func with_item_name(v) -> Gs2InventoryAcquireItemSetWithGradeByUserIdRequest:
    item_name = v
    return self


func with_user_id(v) -> Gs2InventoryAcquireItemSetWithGradeByUserIdRequest:
    user_id = v
    return self


func with_grade_model_id(v) -> Gs2InventoryAcquireItemSetWithGradeByUserIdRequest:
    grade_model_id = v
    return self


func with_grade_value(v) -> Gs2InventoryAcquireItemSetWithGradeByUserIdRequest:
    grade_value = v
    return self


func with_time_offset_token(v) -> Gs2InventoryAcquireItemSetWithGradeByUserIdRequest:
    time_offset_token = v
    return self


func with_duplication_avoider(v) -> Gs2InventoryAcquireItemSetWithGradeByUserIdRequest:
    duplication_avoider = v
    return self


static func from_dict(data) -> Gs2InventoryAcquireItemSetWithGradeByUserIdRequest:
    if data == null:
        return null
    var ret = Gs2InventoryAcquireItemSetWithGradeByUserIdRequest.new()
    ret.namespace_name = null if data.get("namespaceName") == null else str(data.get("namespaceName"))
    ret.inventory_name = null if data.get("inventoryName") == null else str(data.get("inventoryName"))
    ret.item_name = null if data.get("itemName") == null else str(data.get("itemName"))
    ret.user_id = null if data.get("userId") == null else str(data.get("userId"))
    ret.grade_model_id = null if data.get("gradeModelId") == null else str(data.get("gradeModelId"))
    ret.grade_value = null if data.get("gradeValue") == null else int(data.get("gradeValue"))
    ret.time_offset_token = null if data.get("timeOffsetToken") == null else str(data.get("timeOffsetToken"))
    return ret


func to_dict() -> Dictionary:
    var ret = {}
    ret["namespaceName"] = namespace_name
    ret["inventoryName"] = inventory_name
    ret["itemName"] = item_name
    ret["userId"] = user_id
    ret["gradeModelId"] = grade_model_id
    ret["gradeValue"] = grade_value
    ret["timeOffsetToken"] = time_offset_token
    return ret