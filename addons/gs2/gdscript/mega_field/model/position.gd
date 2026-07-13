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
class_name Gs2MegaFieldPosition
extends RefCounted


var x = null
var y = null
var z = null


func with_x(v) -> Gs2MegaFieldPosition:
    x = v
    return self


func with_y(v) -> Gs2MegaFieldPosition:
    y = v
    return self


func with_z(v) -> Gs2MegaFieldPosition:
    z = v
    return self


static func from_dict(data) -> Gs2MegaFieldPosition:
    if data == null:
        return null
    var ret = Gs2MegaFieldPosition.new()
    ret.x = null if data.get("x") == null else float(data.get("x"))
    ret.y = null if data.get("y") == null else float(data.get("y"))
    ret.z = null if data.get("z") == null else float(data.get("z"))
    return ret


func to_dict() -> Dictionary:
    var ret = {}
    ret["x"] = x
    ret["y"] = y
    ret["z"] = z
    return ret