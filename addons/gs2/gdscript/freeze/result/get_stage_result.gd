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
class_name Gs2FreezeGetStageResult
extends RefCounted


var item = null
var source = null
var current = null
var metadata = null


func with_item(v) -> Gs2FreezeGetStageResult:
    item = v
    return self


func with_source(v) -> Gs2FreezeGetStageResult:
    source = v
    return self


func with_current(v) -> Gs2FreezeGetStageResult:
    current = v
    return self


func with_metadata(v) -> Gs2FreezeGetStageResult:
    metadata = v
    return self


static func from_dict(data) -> Gs2FreezeGetStageResult:
    if data == null:
        return null
    var ret = Gs2FreezeGetStageResult.new()
    ret.item = null if data.get("item") == null else Gs2FreezeStage.from_dict(data.get("item"))
    ret.source = null if data.get("source") == null else data.get("source").map(func(v): return Gs2FreezeMicroservice.from_dict(v))
    ret.current = null if data.get("current") == null else data.get("current").map(func(v): return Gs2FreezeMicroservice.from_dict(v))
    ret.metadata = null if data.get("metadata") == null else Gs2ResultMetadata.from_dict(data.get("metadata"))
    return ret


func to_dict() -> Dictionary:
    var ret = {}
    ret["item"] = null if item == null else item.to_dict()
    ret["source"] = null if source == null else source.map(func(v): return null if v == null else v.to_dict())
    ret["current"] = null if current == null else current.map(func(v): return null if v == null else v.to_dict())
    ret["metadata"] = null if metadata == null else metadata.to_dict()
    return ret