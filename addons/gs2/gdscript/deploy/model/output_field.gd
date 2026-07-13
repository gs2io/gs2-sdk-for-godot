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
class_name Gs2DeployOutputField
extends RefCounted


var name = null
var field_name = null


func with_name(v) -> Gs2DeployOutputField:
    name = v
    return self


func with_field_name(v) -> Gs2DeployOutputField:
    field_name = v
    return self


static func from_dict(data) -> Gs2DeployOutputField:
    if data == null:
        return null
    var ret = Gs2DeployOutputField.new()
    ret.name = null if data.get("name") == null else str(data.get("name"))
    ret.field_name = null if data.get("fieldName") == null else str(data.get("fieldName"))
    return ret


func to_dict() -> Dictionary:
    var ret = {}
    ret["name"] = name
    ret["fieldName"] = field_name
    return ret