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
class_name Gs2StateMachineRandomUsed
extends RefCounted


var category = null
var used = null


func with_category(v) -> Gs2StateMachineRandomUsed:
    category = v
    return self


func with_used(v) -> Gs2StateMachineRandomUsed:
    used = v
    return self


static func from_dict(data) -> Gs2StateMachineRandomUsed:
    if data == null:
        return null
    var ret = Gs2StateMachineRandomUsed.new()
    ret.category = null if data.get("category") == null else int(data.get("category"))
    ret.used = null if data.get("used") == null else int(data.get("used"))
    return ret


func to_dict() -> Dictionary:
    var ret = {}
    ret["category"] = category
    ret["used"] = used
    return ret