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
class_name Gs2LogEzNamespaceDomain
extends RefCounted


var _domain: Gs2LogNamespaceDomain
var _connection: Gs2Connection
var status: Variant:
    get:
        return _domain.status
var next_page_token: Variant:
    get:
        return _domain.next_page_token
var total_count: Variant:
    get:
        return _domain.total_count
var scan_size: Variant:
    get:
        return _domain.scan_size
var namespace_name: Variant:
    get:
        return null if _domain == null else _domain.namespace_name


func _init(
    domain: Gs2LogNamespaceDomain,
    connection: Gs2Connection
):
    _domain = domain
    _connection = connection


func user(
    user_id
) -> Gs2LogEzUserDomain:
    return Gs2LogEzUserDomain.new(
        _domain.user(
            user_id
        ),
        _connection
    )


func me(
    game_session
) -> Gs2LogEzUserGameSessionDomain:
    return Gs2LogEzUserGameSessionDomain.new(
        _domain.access_token(
            game_session.access_token
        ),
        game_session,
        _connection
    )