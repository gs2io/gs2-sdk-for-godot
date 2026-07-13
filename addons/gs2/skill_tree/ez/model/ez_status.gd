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
class_name Gs2SkillTreeEzStatus
extends RefCounted


var status_id = null
var user_id = null
var released_node_names = []


func with_status_id(v) -> Gs2SkillTreeEzStatus:
    status_id = v
    return self


func with_user_id(v) -> Gs2SkillTreeEzStatus:
    user_id = v
    return self


func with_released_node_names(v) -> Gs2SkillTreeEzStatus:
    released_node_names = v
    return self


func to_model() -> Gs2SkillTreeStatus:
    var ret = Gs2SkillTreeStatus.new()
    ret.status_id = status_id
    ret.user_id = user_id
    ret.released_node_names = null if released_node_names == null else released_node_names.map(func(v): return v)
    return ret


static func from_model(model) -> Gs2SkillTreeEzStatus:
    var ret = Gs2SkillTreeEzStatus.new()
    ret.status_id = model.status_id
    ret.user_id = model.user_id
    ret.released_node_names = [] if model.released_node_names == null else model.released_node_names.map(func(v): return v)
    return ret