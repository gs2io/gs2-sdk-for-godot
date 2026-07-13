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
class_name Gs2RankingCalcRankingResult
extends RefCounted


var processing = null
var metadata = null


func with_processing(v) -> Gs2RankingCalcRankingResult:
    processing = v
    return self


func with_metadata(v) -> Gs2RankingCalcRankingResult:
    metadata = v
    return self


static func from_dict(data) -> Gs2RankingCalcRankingResult:
    if data == null:
        return null
    var ret = Gs2RankingCalcRankingResult.new()
    ret.processing = null if data.get("processing") == null else bool(data.get("processing"))
    ret.metadata = null if data.get("metadata") == null else Gs2ResultMetadata.from_dict(data.get("metadata"))
    return ret


func to_dict() -> Dictionary:
    var ret = {}
    ret["processing"] = processing
    ret["metadata"] = null if metadata == null else metadata.to_dict()
    return ret