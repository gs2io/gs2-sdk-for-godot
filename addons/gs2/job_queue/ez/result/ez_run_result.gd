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
class_name Gs2JobQueueEzRunResult
extends RefCounted


var item = null
var result = null
var is_last_job = false


static func from_model(model) -> Gs2JobQueueEzRunResult:
    var ret = Gs2JobQueueEzRunResult.new()
    ret.item = null if model.item == null else Gs2JobQueueEzJob.from_model(model.item)
    ret.result = null if model.result == null else Gs2JobQueueEzJobResultBody.from_model(model.result)
    ret.is_last_job = false if model.is_last_job == null else model.is_last_job
    return ret