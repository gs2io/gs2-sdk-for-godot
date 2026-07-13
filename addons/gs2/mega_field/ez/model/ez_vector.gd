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
class_name Gs2MegaFieldEzVector
extends RefCounted


var x = 0
var y = 0
var z = 0


func with_x(v) -> Gs2MegaFieldEzVector:
    x = v
    return self


func with_y(v) -> Gs2MegaFieldEzVector:
    y = v
    return self


func with_z(v) -> Gs2MegaFieldEzVector:
    z = v
    return self


func to_model() -> Gs2MegaFieldVector:
    var ret = Gs2MegaFieldVector.new()
    ret.x = x
    ret.y = y
    ret.z = z
    return ret


static func from_model(model) -> Gs2MegaFieldEzVector:
    var ret = Gs2MegaFieldEzVector.new()
    ret.x = 0 if model.x == null else model.x
    ret.y = 0 if model.y == null else model.y
    ret.z = 0 if model.z == null else model.z
    return ret