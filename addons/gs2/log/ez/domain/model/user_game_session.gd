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
# deny overwrite
class_name Gs2LogEzUserGameSessionDomain
extends RefCounted


var _domain: Gs2LogUserAccessTokenDomain
var _game_session: Variant
var _connection: Gs2Connection
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
var user_id: Variant:
    get:
        return null if _domain == null else _domain.user_id


func _init(
    domain: Gs2LogUserAccessTokenDomain,
    game_session: Variant,
    connection: Gs2Connection
):
    _domain = domain
    _game_session = game_session
    _connection = connection
func send_in_game_log(
    payload,
    tags = null
) -> Gs2AsyncResult:
    var async_result = await _connection.run(
        _game_session,
        func(): return await _domain.send_in_game_log(
            Gs2LogSendInGameLogRequest.new()
                .with_tags(null if tags == null else tags.map(func(v): return null if v == null else v.to_model()))
                .with_payload(payload)
        )
    )
    if async_result.error != null:
        return async_result
    # return async_result  # diff ---
    # diff +++ start
    return Gs2AsyncResult.new(Gs2LogEzInGameLogGameSessionDomain.new(
        async_result.result,
        _game_session,
        _connection
    ), null)
    # diff +++ end
