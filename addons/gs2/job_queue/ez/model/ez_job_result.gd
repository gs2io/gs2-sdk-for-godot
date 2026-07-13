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
class_name Gs2JobQueueEzJobResult
extends RefCounted


var status_code = 0
var result = null


func with_status_code(v) -> Gs2JobQueueEzJobResult:
    status_code = v
    return self


func with_result(v) -> Gs2JobQueueEzJobResult:
    result = v
    return self


func to_model() -> Gs2JobQueueJobResult:
    var ret = Gs2JobQueueJobResult.new()
    ret.status_code = status_code
    ret.result = result
    return ret


static func from_model(model) -> Gs2JobQueueEzJobResult:
    var ret = Gs2JobQueueEzJobResult.new()
    ret.status_code = 0 if model.status_code == null else model.status_code
    ret.result = model.result
    return ret