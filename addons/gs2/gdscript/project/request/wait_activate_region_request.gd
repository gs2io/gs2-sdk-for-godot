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
class_name Gs2ProjectWaitActivateRegionRequest
extends Gs2Request


var owner_id = null
var project_name = null
var region_name = null


func with_owner_id(v) -> Gs2ProjectWaitActivateRegionRequest:
    owner_id = v
    return self


func with_project_name(v) -> Gs2ProjectWaitActivateRegionRequest:
    project_name = v
    return self


func with_region_name(v) -> Gs2ProjectWaitActivateRegionRequest:
    region_name = v
    return self


static func from_dict(data) -> Gs2ProjectWaitActivateRegionRequest:
    if data == null:
        return null
    var ret = Gs2ProjectWaitActivateRegionRequest.new()
    ret.owner_id = null if data.get("ownerId") == null else str(data.get("ownerId"))
    ret.project_name = null if data.get("projectName") == null else str(data.get("projectName"))
    ret.region_name = null if data.get("regionName") == null else str(data.get("regionName"))
    return ret


func to_dict() -> Dictionary:
    var ret = {}
    ret["ownerId"] = owner_id
    ret["projectName"] = project_name
    ret["regionName"] = region_name
    return ret