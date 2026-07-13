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
class_name Gs2ChatCheckDumpUserDataByUserIdResult
extends RefCounted


var url = null
var metadata = null


func with_url(v) -> Gs2ChatCheckDumpUserDataByUserIdResult:
    url = v
    return self


func with_metadata(v) -> Gs2ChatCheckDumpUserDataByUserIdResult:
    metadata = v
    return self


static func from_dict(data) -> Gs2ChatCheckDumpUserDataByUserIdResult:
    if data == null:
        return null
    var ret = Gs2ChatCheckDumpUserDataByUserIdResult.new()
    ret.url = null if data.get("url") == null else str(data.get("url"))
    ret.metadata = null if data.get("metadata") == null else Gs2ResultMetadata.from_dict(data.get("metadata"))
    return ret


func to_dict() -> Dictionary:
    var ret = {}
    ret["url"] = url
    ret["metadata"] = null if metadata == null else metadata.to_dict()
    return ret