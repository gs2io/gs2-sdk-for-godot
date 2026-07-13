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
class_name Gs2SkillTreeEzNodeModel
extends RefCounted


var name = null
var metadata = null
var release_verify_actions = []
var release_consume_actions = []
var return_acquire_actions = []
var restrain_return_rate = 0


func with_name(v) -> Gs2SkillTreeEzNodeModel:
    name = v
    return self


func with_metadata(v) -> Gs2SkillTreeEzNodeModel:
    metadata = v
    return self


func with_release_verify_actions(v) -> Gs2SkillTreeEzNodeModel:
    release_verify_actions = v
    return self


func with_release_consume_actions(v) -> Gs2SkillTreeEzNodeModel:
    release_consume_actions = v
    return self


func with_return_acquire_actions(v) -> Gs2SkillTreeEzNodeModel:
    return_acquire_actions = v
    return self


func with_restrain_return_rate(v) -> Gs2SkillTreeEzNodeModel:
    restrain_return_rate = v
    return self


func to_model() -> Gs2SkillTreeNodeModel:
    var ret = Gs2SkillTreeNodeModel.new()
    ret.name = name
    ret.metadata = metadata
    ret.release_verify_actions = null if release_verify_actions == null else release_verify_actions.map(func(v): return null if v == null else v.to_model())
    ret.release_consume_actions = null if release_consume_actions == null else release_consume_actions.map(func(v): return null if v == null else v.to_model())
    ret.return_acquire_actions = null if return_acquire_actions == null else return_acquire_actions.map(func(v): return null if v == null else v.to_model())
    ret.restrain_return_rate = restrain_return_rate
    return ret


static func from_model(model) -> Gs2SkillTreeEzNodeModel:
    var ret = Gs2SkillTreeEzNodeModel.new()
    ret.name = model.name
    ret.metadata = model.metadata
    ret.release_verify_actions = [] if model.release_verify_actions == null else model.release_verify_actions.map(func(v): return Gs2EzVerifyAction.from_model(v))
    ret.release_consume_actions = [] if model.release_consume_actions == null else model.release_consume_actions.map(func(v): return Gs2EzConsumeAction.from_model(v))
    ret.return_acquire_actions = [] if model.return_acquire_actions == null else model.return_acquire_actions.map(func(v): return Gs2EzAcquireAction.from_model(v))
    ret.restrain_return_rate = 0 if model.restrain_return_rate == null else model.restrain_return_rate
    return ret