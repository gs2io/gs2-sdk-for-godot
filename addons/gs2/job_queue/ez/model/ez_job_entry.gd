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
class_name Gs2JobQueueEzJobEntry
extends RefCounted


var script_id = null
var args = null
var max_try_count = 0


func with_script_id(v) -> Gs2JobQueueEzJobEntry:
    script_id = v
    return self


func with_args(v) -> Gs2JobQueueEzJobEntry:
    args = v
    return self


func with_max_try_count(v) -> Gs2JobQueueEzJobEntry:
    max_try_count = v
    return self


func to_model() -> Gs2JobQueueJobEntry:
    var ret = Gs2JobQueueJobEntry.new()
    ret.script_id = script_id
    ret.args = args
    ret.max_try_count = max_try_count
    return ret


static func from_model(model) -> Gs2JobQueueEzJobEntry:
    var ret = Gs2JobQueueEzJobEntry.new()
    ret.script_id = model.script_id
    ret.args = model.args
    ret.max_try_count = 0 if model.max_try_count == null else model.max_try_count
    return ret