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
class_name Gs2DeployCreateStackRequest
extends Gs2Request


var name = null
var description = null
var mode = null
var template = null
var upload_token = null


func with_name(v) -> Gs2DeployCreateStackRequest:
    name = v
    return self


func with_description(v) -> Gs2DeployCreateStackRequest:
    description = v
    return self


func with_mode(v) -> Gs2DeployCreateStackRequest:
    mode = v
    return self


func with_template(v) -> Gs2DeployCreateStackRequest:
    template = v
    return self


func with_upload_token(v) -> Gs2DeployCreateStackRequest:
    upload_token = v
    return self


static func from_dict(data) -> Gs2DeployCreateStackRequest:
    if data == null:
        return null
    var ret = Gs2DeployCreateStackRequest.new()
    ret.name = null if data.get("name") == null else str(data.get("name"))
    ret.description = null if data.get("description") == null else str(data.get("description"))
    ret.mode = null if data.get("mode") == null else str(data.get("mode"))
    ret.template = null if data.get("template") == null else str(data.get("template"))
    ret.upload_token = null if data.get("uploadToken") == null else str(data.get("uploadToken"))
    return ret


func to_dict() -> Dictionary:
    var ret = {}
    ret["name"] = name
    ret["description"] = description
    ret["mode"] = mode
    ret["template"] = template
    ret["uploadToken"] = upload_token
    return ret