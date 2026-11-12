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
class_name Gs2SeasonRatingUserDomain
extends RefCounted

var _gs2: Gs2DomainCore
var _client: Gs2SeasonRatingRestClient
var namespace_name: Variant = null
var user_id: Variant = null


func _init(
    gs2: Gs2DomainCore,
    namespace_name_,
    user_id_
):
    _gs2 = gs2
    _client = Gs2SeasonRatingRestClient.new(gs2.rest_session)
    namespace_name = namespace_name_
    user_id = user_id_
func ballot(
    season_name,
    session_name,
    number_of_player,
    key_id
) -> Gs2SeasonRatingBallotDomain:
    return Gs2SeasonRatingBallotDomain.new(
        _gs2,
        namespace_name,
        user_id,
        season_name,
        session_name,
        number_of_player,
        key_id
    )