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
class_name Gs2SeasonRatingGetBallotRequest
extends Gs2Request


var namespace_name = null
var season_name = null
var session_name = null
var access_token = null
var number_of_player = null
var key_id = null


func with_namespace_name(v) -> Gs2SeasonRatingGetBallotRequest:
    namespace_name = v
    return self


func with_season_name(v) -> Gs2SeasonRatingGetBallotRequest:
    season_name = v
    return self


func with_session_name(v) -> Gs2SeasonRatingGetBallotRequest:
    session_name = v
    return self


func with_access_token(v) -> Gs2SeasonRatingGetBallotRequest:
    access_token = v
    return self


func with_number_of_player(v) -> Gs2SeasonRatingGetBallotRequest:
    number_of_player = v
    return self


func with_key_id(v) -> Gs2SeasonRatingGetBallotRequest:
    key_id = v
    return self


static func from_dict(data) -> Gs2SeasonRatingGetBallotRequest:
    if data == null:
        return null
    var ret = Gs2SeasonRatingGetBallotRequest.new()
    ret.namespace_name = null if data.get("namespaceName") == null else str(data.get("namespaceName"))
    ret.season_name = null if data.get("seasonName") == null else str(data.get("seasonName"))
    ret.session_name = null if data.get("sessionName") == null else str(data.get("sessionName"))
    ret.access_token = null if data.get("accessToken") == null else str(data.get("accessToken"))
    ret.number_of_player = null if data.get("numberOfPlayer") == null else int(data.get("numberOfPlayer"))
    ret.key_id = null if data.get("keyId") == null else str(data.get("keyId"))
    return ret


func to_dict() -> Dictionary:
    var ret = {}
    ret["namespaceName"] = namespace_name
    ret["seasonName"] = season_name
    ret["sessionName"] = session_name
    ret["accessToken"] = access_token
    ret["numberOfPlayer"] = number_of_player
    ret["keyId"] = key_id
    return ret