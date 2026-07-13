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
class_name Gs2StateMachineEzChangeStateEvent
extends RefCounted


var task_name = null
var hash = null
var timestamp = 0


func with_task_name(v) -> Gs2StateMachineEzChangeStateEvent:
    task_name = v
    return self


func with_hash(v) -> Gs2StateMachineEzChangeStateEvent:
    hash = v
    return self


func with_timestamp(v) -> Gs2StateMachineEzChangeStateEvent:
    timestamp = v
    return self


func to_model() -> Gs2StateMachineChangeStateEvent:
    var ret = Gs2StateMachineChangeStateEvent.new()
    ret.task_name = task_name
    ret.hash = hash
    ret.timestamp = timestamp
    return ret


static func from_model(model) -> Gs2StateMachineEzChangeStateEvent:
    var ret = Gs2StateMachineEzChangeStateEvent.new()
    ret.task_name = model.task_name
    ret.hash = model.hash
    ret.timestamp = 0 if model.timestamp == null else model.timestamp
    return ret