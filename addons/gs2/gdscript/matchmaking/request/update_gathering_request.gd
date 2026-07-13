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
class_name Gs2MatchmakingUpdateGatheringRequest
extends Gs2Request


var namespace_name = null
var gathering_name = null
var access_token = null
var attribute_ranges = null
var duplication_avoider = null


func with_namespace_name(v) -> Gs2MatchmakingUpdateGatheringRequest:
    namespace_name = v
    return self


func with_gathering_name(v) -> Gs2MatchmakingUpdateGatheringRequest:
    gathering_name = v
    return self


func with_access_token(v) -> Gs2MatchmakingUpdateGatheringRequest:
    access_token = v
    return self


func with_attribute_ranges(v) -> Gs2MatchmakingUpdateGatheringRequest:
    attribute_ranges = v
    return self


func with_duplication_avoider(v) -> Gs2MatchmakingUpdateGatheringRequest:
    duplication_avoider = v
    return self


static func from_dict(data) -> Gs2MatchmakingUpdateGatheringRequest:
    if data == null:
        return null
    var ret = Gs2MatchmakingUpdateGatheringRequest.new()
    ret.namespace_name = null if data.get("namespaceName") == null else str(data.get("namespaceName"))
    ret.gathering_name = null if data.get("gatheringName") == null else str(data.get("gatheringName"))
    ret.access_token = null if data.get("accessToken") == null else str(data.get("accessToken"))
    ret.attribute_ranges = null if data.get("attributeRanges") == null else data.get("attributeRanges").map(func(v): return Gs2MatchmakingAttributeRange.from_dict(v))
    return ret


func to_dict() -> Dictionary:
    var ret = {}
    ret["namespaceName"] = namespace_name
    ret["gatheringName"] = gathering_name
    ret["accessToken"] = access_token
    ret["attributeRanges"] = null if attribute_ranges == null else attribute_ranges.map(func(v): return null if v == null else v.to_dict())
    return ret