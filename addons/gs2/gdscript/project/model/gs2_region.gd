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
class_name Gs2ProjectGs2Region
extends RefCounted


var region_name = null
var status = null


func with_region_name(v) -> Gs2ProjectGs2Region:
    region_name = v
    return self


func with_status(v) -> Gs2ProjectGs2Region:
    status = v
    return self


static func from_dict(data) -> Gs2ProjectGs2Region:
    if data == null:
        return null
    var ret = Gs2ProjectGs2Region.new()
    ret.region_name = null if data.get("regionName") == null else str(data.get("regionName"))
    ret.status = null if data.get("status") == null else str(data.get("status"))
    return ret


func to_dict() -> Dictionary:
    var ret = {}
    ret["regionName"] = region_name
    ret["status"] = status
    return ret