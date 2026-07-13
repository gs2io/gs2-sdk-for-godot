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
class_name Gs2JobQueueEzJobResultBody
extends RefCounted


var try_number = 0
var status_code = 0
var result = null
var try_at = 0


func with_try_number(v) -> Gs2JobQueueEzJobResultBody:
    try_number = v
    return self


func with_status_code(v) -> Gs2JobQueueEzJobResultBody:
    status_code = v
    return self


func with_result(v) -> Gs2JobQueueEzJobResultBody:
    result = v
    return self


func with_try_at(v) -> Gs2JobQueueEzJobResultBody:
    try_at = v
    return self


func to_model() -> Gs2JobQueueJobResultBody:
    var ret = Gs2JobQueueJobResultBody.new()
    ret.try_number = try_number
    ret.status_code = status_code
    ret.result = result
    ret.try_at = try_at
    return ret


static func from_model(model) -> Gs2JobQueueEzJobResultBody:
    var ret = Gs2JobQueueEzJobResultBody.new()
    ret.try_number = 0 if model.try_number == null else model.try_number
    ret.status_code = 0 if model.status_code == null else model.status_code
    ret.result = model.result
    ret.try_at = 0 if model.try_at == null else model.try_at
    return ret