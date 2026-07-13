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
class_name Gs2MatchmakingGetBallotByUserIdRequest
extends Gs2Request


var namespace_name = null
var rating_name = null
var gathering_name = null
var user_id = null
var number_of_player = null
var key_id = null
var time_offset_token = null


func with_namespace_name(v) -> Gs2MatchmakingGetBallotByUserIdRequest:
    namespace_name = v
    return self


func with_rating_name(v) -> Gs2MatchmakingGetBallotByUserIdRequest:
    rating_name = v
    return self


func with_gathering_name(v) -> Gs2MatchmakingGetBallotByUserIdRequest:
    gathering_name = v
    return self


func with_user_id(v) -> Gs2MatchmakingGetBallotByUserIdRequest:
    user_id = v
    return self


func with_number_of_player(v) -> Gs2MatchmakingGetBallotByUserIdRequest:
    number_of_player = v
    return self


func with_key_id(v) -> Gs2MatchmakingGetBallotByUserIdRequest:
    key_id = v
    return self


func with_time_offset_token(v) -> Gs2MatchmakingGetBallotByUserIdRequest:
    time_offset_token = v
    return self


static func from_dict(data) -> Gs2MatchmakingGetBallotByUserIdRequest:
    if data == null:
        return null
    var ret = Gs2MatchmakingGetBallotByUserIdRequest.new()
    ret.namespace_name = null if data.get("namespaceName") == null else str(data.get("namespaceName"))
    ret.rating_name = null if data.get("ratingName") == null else str(data.get("ratingName"))
    ret.gathering_name = null if data.get("gatheringName") == null else str(data.get("gatheringName"))
    ret.user_id = null if data.get("userId") == null else str(data.get("userId"))
    ret.number_of_player = null if data.get("numberOfPlayer") == null else int(data.get("numberOfPlayer"))
    ret.key_id = null if data.get("keyId") == null else str(data.get("keyId"))
    ret.time_offset_token = null if data.get("timeOffsetToken") == null else str(data.get("timeOffsetToken"))
    return ret


func to_dict() -> Dictionary:
    var ret = {}
    ret["namespaceName"] = namespace_name
    ret["ratingName"] = rating_name
    ret["gatheringName"] = gathering_name
    ret["userId"] = user_id
    ret["numberOfPlayer"] = number_of_player
    ret["keyId"] = key_id
    ret["timeOffsetToken"] = time_offset_token
    return ret