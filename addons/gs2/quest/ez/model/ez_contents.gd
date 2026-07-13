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
class_name Gs2QuestEzContents
extends RefCounted


var metadata = null
var complete_acquire_actions = []


func with_metadata(v) -> Gs2QuestEzContents:
    metadata = v
    return self


func with_complete_acquire_actions(v) -> Gs2QuestEzContents:
    complete_acquire_actions = v
    return self


func to_model() -> Gs2QuestContents:
    var ret = Gs2QuestContents.new()
    ret.metadata = metadata
    ret.complete_acquire_actions = null if complete_acquire_actions == null else complete_acquire_actions.map(func(v): return null if v == null else v.to_model())
    return ret


static func from_model(model) -> Gs2QuestEzContents:
    var ret = Gs2QuestEzContents.new()
    ret.metadata = model.metadata
    ret.complete_acquire_actions = [] if model.complete_acquire_actions == null else model.complete_acquire_actions.map(func(v): return Gs2EzAcquireAction.from_model(v))
    return ret