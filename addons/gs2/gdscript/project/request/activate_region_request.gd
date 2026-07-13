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
class_name Gs2ProjectActivateRegionRequest
extends Gs2Request


var account_token = null
var project_name = null
var region_name = null


func with_account_token(v) -> Gs2ProjectActivateRegionRequest:
    account_token = v
    return self


func with_project_name(v) -> Gs2ProjectActivateRegionRequest:
    project_name = v
    return self


func with_region_name(v) -> Gs2ProjectActivateRegionRequest:
    region_name = v
    return self


static func from_dict(data) -> Gs2ProjectActivateRegionRequest:
    if data == null:
        return null
    var ret = Gs2ProjectActivateRegionRequest.new()
    ret.account_token = null if data.get("accountToken") == null else str(data.get("accountToken"))
    ret.project_name = null if data.get("projectName") == null else str(data.get("projectName"))
    ret.region_name = null if data.get("regionName") == null else str(data.get("regionName"))
    return ret


func to_dict() -> Dictionary:
    var ret = {}
    ret["accountToken"] = account_token
    ret["projectName"] = project_name
    ret["regionName"] = region_name
    return ret