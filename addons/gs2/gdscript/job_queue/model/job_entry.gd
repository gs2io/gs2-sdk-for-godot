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
class_name Gs2JobQueueJobEntry
extends RefCounted


var script_id = null
var args = null
var max_try_count = null


func with_script_id(v) -> Gs2JobQueueJobEntry:
    script_id = v
    return self


func with_args(v) -> Gs2JobQueueJobEntry:
    args = v
    return self


func with_max_try_count(v) -> Gs2JobQueueJobEntry:
    max_try_count = v
    return self


static func from_dict(data) -> Gs2JobQueueJobEntry:
    if data == null:
        return null
    var ret = Gs2JobQueueJobEntry.new()
    ret.script_id = null if data.get("scriptId") == null else str(data.get("scriptId"))
    ret.args = null if data.get("args") == null else str(data.get("args"))
    ret.max_try_count = null if data.get("maxTryCount") == null else int(data.get("maxTryCount"))
    return ret


func to_dict() -> Dictionary:
    var ret = {}
    ret["scriptId"] = script_id
    ret["args"] = args
    ret["maxTryCount"] = max_try_count
    return ret