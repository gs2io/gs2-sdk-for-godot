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
class_name Gs2VersionEzCheckerGameSessionDomain
extends RefCounted


var _domain: Gs2VersionCheckerAccessTokenDomain
var _game_session: Variant
var _connection: Gs2Connection
var project_token: Variant:
    get:
        return _domain.project_token
var warnings: Variant:
    get:
        return null if _domain.warnings == null else _domain.warnings.map(func(v): return Gs2VersionEzStatus.from_model(v))
var errors: Variant:
    get:
        return null if _domain.errors == null else _domain.errors.map(func(v): return Gs2VersionEzStatus.from_model(v))
var body: Variant:
    get:
        return _domain.body
var signature: Variant:
    get:
        return _domain.signature
var namespace_name: Variant:
    get:
        return null if _domain == null else _domain.namespace_name
var user_id: Variant:
    get:
        return null if _domain == null else _domain.user_id


func _init(
    domain: Gs2VersionCheckerAccessTokenDomain,
    game_session: Variant,
    connection: Gs2Connection
):
    _domain = domain
    _game_session = game_session
    _connection = connection
func check_version(
    target_versions = null
) -> Gs2AsyncResult:
    var async_result = await _connection.run(
        _game_session,
        func(): return await _domain.check_version(
            Gs2VersionCheckVersionRequest.new()
                .with_target_versions(null if target_versions == null else target_versions.map(func(v): return null if v == null else v.to_model()))
        )
    )
    if async_result.error != null:
        return async_result
    return Gs2AsyncResult.new(Gs2VersionEzCheckerGameSessionDomain.new(
        async_result.result,
        _game_session,
        _connection
    ), null)