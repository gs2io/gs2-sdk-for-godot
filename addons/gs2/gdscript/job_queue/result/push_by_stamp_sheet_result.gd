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
class_name Gs2JobQueuePushByStampSheetResult
extends RefCounted


var items = null
var auto_run = null
var metadata = null


func with_items(v) -> Gs2JobQueuePushByStampSheetResult:
    items = v
    return self


func with_auto_run(v) -> Gs2JobQueuePushByStampSheetResult:
    auto_run = v
    return self


func with_metadata(v) -> Gs2JobQueuePushByStampSheetResult:
    metadata = v
    return self


static func from_dict(data) -> Gs2JobQueuePushByStampSheetResult:
    if data == null:
        return null
    var ret = Gs2JobQueuePushByStampSheetResult.new()
    ret.items = null if data.get("items") == null else data.get("items").map(func(v): return Gs2JobQueueJob.from_dict(v))
    ret.auto_run = null if data.get("autoRun") == null else bool(data.get("autoRun"))
    ret.metadata = null if data.get("metadata") == null else Gs2ResultMetadata.from_dict(data.get("metadata"))
    return ret


func to_dict() -> Dictionary:
    var ret = {}
    ret["items"] = null if items == null else items.map(func(v): return null if v == null else v.to_dict())
    ret["autoRun"] = auto_run
    ret["metadata"] = null if metadata == null else metadata.to_dict()
    return ret