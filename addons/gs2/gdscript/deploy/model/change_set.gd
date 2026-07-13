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
class_name Gs2DeployChangeSet
extends RefCounted


var resource_name = null
var resource_type = null
var operation = null


func with_resource_name(v) -> Gs2DeployChangeSet:
    resource_name = v
    return self


func with_resource_type(v) -> Gs2DeployChangeSet:
    resource_type = v
    return self


func with_operation(v) -> Gs2DeployChangeSet:
    operation = v
    return self


static func from_dict(data) -> Gs2DeployChangeSet:
    if data == null:
        return null
    var ret = Gs2DeployChangeSet.new()
    ret.resource_name = null if data.get("resourceName") == null else str(data.get("resourceName"))
    ret.resource_type = null if data.get("resourceType") == null else str(data.get("resourceType"))
    ret.operation = null if data.get("operation") == null else str(data.get("operation"))
    return ret


func to_dict() -> Dictionary:
    var ret = {}
    ret["resourceName"] = resource_name
    ret["resourceType"] = resource_type
    ret["operation"] = operation
    return ret