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
class_name Gs2JobQueueRunByUserIdResult
extends RefCounted


var item = null
var result = null
var is_last_job = null
var metadata = null


func with_item(v) -> Gs2JobQueueRunByUserIdResult:
    item = v
    return self


func with_result(v) -> Gs2JobQueueRunByUserIdResult:
    result = v
    return self


func with_is_last_job(v) -> Gs2JobQueueRunByUserIdResult:
    is_last_job = v
    return self


func with_metadata(v) -> Gs2JobQueueRunByUserIdResult:
    metadata = v
    return self


static func from_dict(data) -> Gs2JobQueueRunByUserIdResult:
    if data == null:
        return null
    var ret = Gs2JobQueueRunByUserIdResult.new()
    ret.item = null if data.get("item") == null else Gs2JobQueueJob.from_dict(data.get("item"))
    ret.result = null if data.get("result") == null else Gs2JobQueueJobResultBody.from_dict(data.get("result"))
    ret.is_last_job = null if data.get("isLastJob") == null else bool(data.get("isLastJob"))
    ret.metadata = null if data.get("metadata") == null else Gs2ResultMetadata.from_dict(data.get("metadata"))
    return ret


func to_dict() -> Dictionary:
    var ret = {}
    ret["item"] = null if item == null else item.to_dict()
    ret["result"] = null if result == null else result.to_dict()
    ret["isLastJob"] = is_last_job
    ret["metadata"] = null if metadata == null else metadata.to_dict()
    return ret