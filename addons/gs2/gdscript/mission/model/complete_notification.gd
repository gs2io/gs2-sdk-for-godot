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
class_name Gs2MissionCompleteNotification
extends RefCounted


var namespace_name = null
var group_name = null
var user_id = null
var task_name = null


func with_namespace_name(v) -> Gs2MissionCompleteNotification:
    namespace_name = v
    return self


func with_group_name(v) -> Gs2MissionCompleteNotification:
    group_name = v
    return self


func with_user_id(v) -> Gs2MissionCompleteNotification:
    user_id = v
    return self


func with_task_name(v) -> Gs2MissionCompleteNotification:
    task_name = v
    return self


static func from_dict(data) -> Gs2MissionCompleteNotification:
    if data == null:
        return null
    var ret = Gs2MissionCompleteNotification.new()
    ret.namespace_name = null if data.get("namespaceName") == null else str(data.get("namespaceName"))
    ret.group_name = null if data.get("groupName") == null else str(data.get("groupName"))
    ret.user_id = null if data.get("userId") == null else str(data.get("userId"))
    ret.task_name = null if data.get("taskName") == null else str(data.get("taskName"))
    return ret