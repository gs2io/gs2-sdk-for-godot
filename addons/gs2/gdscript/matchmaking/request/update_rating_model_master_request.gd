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
class_name Gs2MatchmakingUpdateRatingModelMasterRequest
extends Gs2Request


var namespace_name = null
var rating_name = null
var description = null
var metadata = null
var initial_value = null
var volatility = null


func with_namespace_name(v) -> Gs2MatchmakingUpdateRatingModelMasterRequest:
    namespace_name = v
    return self


func with_rating_name(v) -> Gs2MatchmakingUpdateRatingModelMasterRequest:
    rating_name = v
    return self


func with_description(v) -> Gs2MatchmakingUpdateRatingModelMasterRequest:
    description = v
    return self


func with_metadata(v) -> Gs2MatchmakingUpdateRatingModelMasterRequest:
    metadata = v
    return self


func with_initial_value(v) -> Gs2MatchmakingUpdateRatingModelMasterRequest:
    initial_value = v
    return self


func with_volatility(v) -> Gs2MatchmakingUpdateRatingModelMasterRequest:
    volatility = v
    return self


static func from_dict(data) -> Gs2MatchmakingUpdateRatingModelMasterRequest:
    if data == null:
        return null
    var ret = Gs2MatchmakingUpdateRatingModelMasterRequest.new()
    ret.namespace_name = null if data.get("namespaceName") == null else str(data.get("namespaceName"))
    ret.rating_name = null if data.get("ratingName") == null else str(data.get("ratingName"))
    ret.description = null if data.get("description") == null else str(data.get("description"))
    ret.metadata = null if data.get("metadata") == null else str(data.get("metadata"))
    ret.initial_value = null if data.get("initialValue") == null else int(data.get("initialValue"))
    ret.volatility = null if data.get("volatility") == null else int(data.get("volatility"))
    return ret


func to_dict() -> Dictionary:
    var ret = {}
    ret["namespaceName"] = namespace_name
    ret["ratingName"] = rating_name
    ret["description"] = description
    ret["metadata"] = metadata
    ret["initialValue"] = initial_value
    ret["volatility"] = volatility
    return ret