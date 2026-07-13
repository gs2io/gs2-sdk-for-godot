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
class_name Gs2StateMachineEzRandomUsed
extends RefCounted


var category = 0
var used = 0


func with_category(v) -> Gs2StateMachineEzRandomUsed:
    category = v
    return self


func with_used(v) -> Gs2StateMachineEzRandomUsed:
    used = v
    return self


func to_model() -> Gs2StateMachineRandomUsed:
    var ret = Gs2StateMachineRandomUsed.new()
    ret.category = category
    ret.used = used
    return ret


static func from_model(model) -> Gs2StateMachineEzRandomUsed:
    var ret = Gs2StateMachineEzRandomUsed.new()
    ret.category = 0 if model.category == null else model.category
    ret.used = 0 if model.used == null else model.used
    return ret