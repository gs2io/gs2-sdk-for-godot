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
class_name Gs2JobQueueEzUserGameSessionDomain
extends RefCounted


var _domain: Gs2JobQueueUserAccessTokenDomain
var _game_session: Variant
var _connection: Gs2Connection
var auto_run: Variant:
    get:
        return _domain.auto_run
var is_last_job: Variant:
    get:
        return _domain.is_last_job
var next_page_token: Variant:
    get:
        return _domain.next_page_token
var namespace_name: Variant:
    get:
        return null if _domain == null else _domain.namespace_name
var user_id: Variant:
    get:
        return null if _domain == null else _domain.user_id


func _init(
    domain: Gs2JobQueueUserAccessTokenDomain,
    game_session: Variant,
    connection: Gs2Connection
):
    _domain = domain
    _game_session = game_session
    _connection = connection
func run(
) -> Gs2AsyncResult:
    var async_result = await _connection.run(
        _game_session,
        func(): return await _domain.run(
            Gs2JobQueueRunRequest.new()
        )
    )
    if async_result.error != null:
        return async_result
    return Gs2AsyncResult.new(Gs2JobQueueEzJobGameSessionDomain.new(
        async_result.result,
        _game_session,
        _connection
    ), null)


func job(
    job_name
) -> Gs2JobQueueEzJobGameSessionDomain:
    return Gs2JobQueueEzJobGameSessionDomain.new(
        _domain.job(
            job_name
        ),
        _game_session,
        _connection
    )