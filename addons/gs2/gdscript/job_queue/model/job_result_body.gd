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
class_name Gs2JobQueueJobResultBody
extends RefCounted


var try_number = null
var status_code = null
var result = null
var try_at = null


func with_try_number(v) -> Gs2JobQueueJobResultBody:
    try_number = v
    return self


func with_status_code(v) -> Gs2JobQueueJobResultBody:
    status_code = v
    return self


func with_result(v) -> Gs2JobQueueJobResultBody:
    result = v
    return self


func with_try_at(v) -> Gs2JobQueueJobResultBody:
    try_at = v
    return self


static func from_dict(data) -> Gs2JobQueueJobResultBody:
    if data == null:
        return null
    var ret = Gs2JobQueueJobResultBody.new()
    ret.try_number = null if data.get("tryNumber") == null else int(data.get("tryNumber"))
    ret.status_code = null if data.get("statusCode") == null else int(data.get("statusCode"))
    ret.result = null if data.get("result") == null else str(data.get("result"))
    ret.try_at = null if data.get("tryAt") == null else int(data.get("tryAt"))
    return ret


func to_dict() -> Dictionary:
    var ret = {}
    ret["tryNumber"] = try_number
    ret["statusCode"] = status_code
    ret["result"] = result
    ret["tryAt"] = try_at
    return ret