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
class_name Gs2DeployValidateRequest
extends Gs2Request


var mode = null
var template = null
var upload_token = null


func with_mode(v) -> Gs2DeployValidateRequest:
    mode = v
    return self


func with_template(v) -> Gs2DeployValidateRequest:
    template = v
    return self


func with_upload_token(v) -> Gs2DeployValidateRequest:
    upload_token = v
    return self


static func from_dict(data) -> Gs2DeployValidateRequest:
    if data == null:
        return null
    var ret = Gs2DeployValidateRequest.new()
    ret.mode = null if data.get("mode") == null else str(data.get("mode"))
    ret.template = null if data.get("template") == null else str(data.get("template"))
    ret.upload_token = null if data.get("uploadToken") == null else str(data.get("uploadToken"))
    return ret


func to_dict() -> Dictionary:
    var ret = {}
    ret["mode"] = mode
    ret["template"] = template
    ret["uploadToken"] = upload_token
    return ret