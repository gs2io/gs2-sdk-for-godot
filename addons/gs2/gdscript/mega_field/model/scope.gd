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
class_name Gs2MegaFieldScope
extends RefCounted


var layer_name = null
var r = null
var limit = null


func with_layer_name(v) -> Gs2MegaFieldScope:
    layer_name = v
    return self


func with_r(v) -> Gs2MegaFieldScope:
    r = v
    return self


func with_limit(v) -> Gs2MegaFieldScope:
    limit = v
    return self


static func from_dict(data) -> Gs2MegaFieldScope:
    if data == null:
        return null
    var ret = Gs2MegaFieldScope.new()
    ret.layer_name = null if data.get("layerName") == null else str(data.get("layerName"))
    ret.r = null if data.get("r") == null else float(data.get("r"))
    ret.limit = null if data.get("limit") == null else int(data.get("limit"))
    return ret


func to_dict() -> Dictionary:
    var ret = {}
    ret["layerName"] = layer_name
    ret["r"] = r
    ret["limit"] = limit
    return ret