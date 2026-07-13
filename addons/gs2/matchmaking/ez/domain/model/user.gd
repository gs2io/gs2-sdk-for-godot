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
class_name Gs2MatchmakingEzUserDomain
extends RefCounted


var _domain: Gs2MatchmakingUserDomain
var _connection: Gs2Connection
var next_page_token: Variant:
    get:
        return _domain.next_page_token
var matchmaking_context_token: Variant:
    get:
        return _domain.matchmaking_context_token
var namespace_name: Variant:
    get:
        return null if _domain == null else _domain.namespace_name
var user_id: Variant:
    get:
        return null if _domain == null else _domain.user_id


func _init(
    domain: Gs2MatchmakingUserDomain,
    connection: Gs2Connection
):
    _domain = domain
    _connection = connection


func gathering(
    gathering_name
) -> Gs2MatchmakingEzGatheringDomain:
    return Gs2MatchmakingEzGatheringDomain.new(
        _domain.gathering(
            gathering_name
        ),
        _connection
    )


func rating(
    rating_name
) -> Gs2MatchmakingEzRatingDomain:
    return Gs2MatchmakingEzRatingDomain.new(
        _domain.rating(
            rating_name
        ),
        _connection
    )


func ballot(
    rating_name,
    gathering_name,
    number_of_player,
    key_id
) -> Gs2MatchmakingEzBallotDomain:
    return Gs2MatchmakingEzBallotDomain.new(
        _domain.ballot(
            rating_name,
            gathering_name,
            number_of_player,
            key_id
        ),
        _connection
    )