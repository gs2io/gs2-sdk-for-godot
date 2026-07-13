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
class_name Gs2MegaFieldMyPosition
extends RefCounted


var position = null
var vector = null
var r = null


func with_position(v) -> Gs2MegaFieldMyPosition:
    position = v
    return self


func with_vector(v) -> Gs2MegaFieldMyPosition:
    vector = v
    return self


func with_r(v) -> Gs2MegaFieldMyPosition:
    r = v
    return self


static func from_dict(data) -> Gs2MegaFieldMyPosition:
    if data == null:
        return null
    var ret = Gs2MegaFieldMyPosition.new()
    ret.position = null if data.get("position") == null else Gs2MegaFieldPosition.from_dict(data.get("position"))
    ret.vector = null if data.get("vector") == null else Gs2MegaFieldVector.from_dict(data.get("vector"))
    ret.r = null if data.get("r") == null else float(data.get("r"))
    return ret


func to_dict() -> Dictionary:
    var ret = {}
    ret["position"] = null if position == null else position.to_dict()
    ret["vector"] = null if vector == null else vector.to_dict()
    ret["r"] = r
    return ret