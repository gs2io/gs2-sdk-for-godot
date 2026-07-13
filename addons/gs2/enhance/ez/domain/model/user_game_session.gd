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
class_name Gs2EnhanceEzUserGameSessionDomain
extends RefCounted


var _domain: Gs2EnhanceUserAccessTokenDomain
var _game_session: Variant
var _connection: Gs2Connection
var acquire_experience: Variant:
    get:
        return _domain.acquire_experience
var bonus_rate: Variant:
    get:
        return _domain.bonus_rate
var namespace_name: Variant:
    get:
        return null if _domain == null else _domain.namespace_name
var user_id: Variant:
    get:
        return null if _domain == null else _domain.user_id


func _init(
    domain: Gs2EnhanceUserAccessTokenDomain,
    game_session: Variant,
    connection: Gs2Connection
):
    _domain = domain
    _game_session = game_session
    _connection = connection


func progress(
) -> Gs2EnhanceEzProgressGameSessionDomain:
    return Gs2EnhanceEzProgressGameSessionDomain.new(
        _domain.progress(
        ),
        _game_session,
        _connection
    )


func enhance(
) -> Gs2EnhanceEzEnhanceGameSessionDomain:
    return Gs2EnhanceEzEnhanceGameSessionDomain.new(
        _domain.enhance(
        ),
        _game_session,
        _connection
    )