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
class_name Gs2MatchmakingVerifyIncludeParticipantRequest
extends Gs2Request


var namespace_name = null
var season_name = null
var season = null
var tier = null
var season_gathering_name = null
var access_token = null
var verify_type = null
var duplication_avoider = null


func with_namespace_name(v) -> Gs2MatchmakingVerifyIncludeParticipantRequest:
    namespace_name = v
    return self


func with_season_name(v) -> Gs2MatchmakingVerifyIncludeParticipantRequest:
    season_name = v
    return self


func with_season(v) -> Gs2MatchmakingVerifyIncludeParticipantRequest:
    season = v
    return self


func with_tier(v) -> Gs2MatchmakingVerifyIncludeParticipantRequest:
    tier = v
    return self


func with_season_gathering_name(v) -> Gs2MatchmakingVerifyIncludeParticipantRequest:
    season_gathering_name = v
    return self


func with_access_token(v) -> Gs2MatchmakingVerifyIncludeParticipantRequest:
    access_token = v
    return self


func with_verify_type(v) -> Gs2MatchmakingVerifyIncludeParticipantRequest:
    verify_type = v
    return self


func with_duplication_avoider(v) -> Gs2MatchmakingVerifyIncludeParticipantRequest:
    duplication_avoider = v
    return self


static func from_dict(data) -> Gs2MatchmakingVerifyIncludeParticipantRequest:
    if data == null:
        return null
    var ret = Gs2MatchmakingVerifyIncludeParticipantRequest.new()
    ret.namespace_name = null if data.get("namespaceName") == null else str(data.get("namespaceName"))
    ret.season_name = null if data.get("seasonName") == null else str(data.get("seasonName"))
    ret.season = null if data.get("season") == null else int(data.get("season"))
    ret.tier = null if data.get("tier") == null else int(data.get("tier"))
    ret.season_gathering_name = null if data.get("seasonGatheringName") == null else str(data.get("seasonGatheringName"))
    ret.access_token = null if data.get("accessToken") == null else str(data.get("accessToken"))
    ret.verify_type = null if data.get("verifyType") == null else str(data.get("verifyType"))
    return ret


func to_dict() -> Dictionary:
    var ret = {}
    ret["namespaceName"] = namespace_name
    ret["seasonName"] = season_name
    ret["season"] = season
    ret["tier"] = tier
    ret["seasonGatheringName"] = season_gathering_name
    ret["accessToken"] = access_token
    ret["verifyType"] = verify_type
    return ret