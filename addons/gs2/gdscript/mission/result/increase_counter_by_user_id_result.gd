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
class_name Gs2MissionIncreaseCounterByUserIdResult
extends RefCounted


var item = null
var changed_completes = null
var metadata = null


func with_item(v) -> Gs2MissionIncreaseCounterByUserIdResult:
    item = v
    return self


func with_changed_completes(v) -> Gs2MissionIncreaseCounterByUserIdResult:
    changed_completes = v
    return self


func with_metadata(v) -> Gs2MissionIncreaseCounterByUserIdResult:
    metadata = v
    return self


static func from_dict(data) -> Gs2MissionIncreaseCounterByUserIdResult:
    if data == null:
        return null
    var ret = Gs2MissionIncreaseCounterByUserIdResult.new()
    ret.item = null if data.get("item") == null else Gs2MissionCounter.from_dict(data.get("item"))
    ret.changed_completes = null if data.get("changedCompletes") == null else data.get("changedCompletes").map(func(v): return Gs2MissionComplete.from_dict(v))
    ret.metadata = null if data.get("metadata") == null else Gs2ResultMetadata.from_dict(data.get("metadata"))
    return ret


func to_dict() -> Dictionary:
    var ret = {}
    ret["item"] = null if item == null else item.to_dict()
    ret["changedCompletes"] = null if changed_completes == null else changed_completes.map(func(v): return null if v == null else v.to_dict())
    ret["metadata"] = null if metadata == null else metadata.to_dict()
    return ret