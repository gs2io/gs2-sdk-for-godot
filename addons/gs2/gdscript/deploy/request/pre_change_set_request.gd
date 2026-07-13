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
class_name Gs2DeployPreChangeSetRequest
extends Gs2Request


var stack_name = null


func with_stack_name(v) -> Gs2DeployPreChangeSetRequest:
    stack_name = v
    return self


static func from_dict(data) -> Gs2DeployPreChangeSetRequest:
    if data == null:
        return null
    var ret = Gs2DeployPreChangeSetRequest.new()
    ret.stack_name = null if data.get("stackName") == null else str(data.get("stackName"))
    return ret


func to_dict() -> Dictionary:
    var ret = {}
    ret["stackName"] = stack_name
    return ret