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
class_name Gs2InventoryConsumeSimpleItemsByStampTaskRequest
extends Gs2Request


var stamp_task = null
var key_id = null


func with_stamp_task(v) -> Gs2InventoryConsumeSimpleItemsByStampTaskRequest:
    stamp_task = v
    return self


func with_key_id(v) -> Gs2InventoryConsumeSimpleItemsByStampTaskRequest:
    key_id = v
    return self


static func from_dict(data) -> Gs2InventoryConsumeSimpleItemsByStampTaskRequest:
    if data == null:
        return null
    var ret = Gs2InventoryConsumeSimpleItemsByStampTaskRequest.new()
    ret.stamp_task = null if data.get("stampTask") == null else str(data.get("stampTask"))
    ret.key_id = null if data.get("keyId") == null else str(data.get("keyId"))
    return ret


func to_dict() -> Dictionary:
    var ret = {}
    ret["stampTask"] = stamp_task
    ret["keyId"] = key_id
    return ret