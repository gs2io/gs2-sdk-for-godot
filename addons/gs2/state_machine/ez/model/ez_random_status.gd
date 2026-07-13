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
class_name Gs2StateMachineEzRandomStatus
extends RefCounted


var seed = 0
var used = []


func with_seed(v) -> Gs2StateMachineEzRandomStatus:
    seed = v
    return self


func with_used(v) -> Gs2StateMachineEzRandomStatus:
    used = v
    return self


func to_model() -> Gs2StateMachineRandomStatus:
    var ret = Gs2StateMachineRandomStatus.new()
    ret.seed = seed
    ret.used = null if used == null else used.map(func(v): return null if v == null else v.to_model())
    return ret


static func from_model(model) -> Gs2StateMachineEzRandomStatus:
    var ret = Gs2StateMachineEzRandomStatus.new()
    ret.seed = 0 if model.seed == null else model.seed
    ret.used = [] if model.used == null else model.used.map(func(v): return Gs2StateMachineEzRandomUsed.from_model(v))
    return ret