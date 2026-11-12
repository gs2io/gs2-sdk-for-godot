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
class_name Gs2AccountEzNamespaceDomain
extends RefCounted


var _domain: Gs2AccountNamespaceDomain
var _connection: Gs2Connection
var status: Variant:
    get:
        return _domain.status
var url: Variant:
    get:
        return _domain.url
var upload_token: Variant:
    get:
        return _domain.upload_token
var upload_url: Variant:
    get:
        return _domain.upload_url
var ban_statuses: Variant:
    get:
        return null if _domain.ban_statuses == null else _domain.ban_statuses.map(func(v): return Gs2AccountEzBanStatus.from_model(v))
var token: Variant:
    get:
        return _domain.token
var expire: Variant:
    get:
        return _domain.expire
var next_page_token: Variant:
    get:
        return _domain.next_page_token
var authorization_url = null  # diff +++
var namespace_name: Variant:
    get:
        return null if _domain == null else _domain.namespace_name


func _init(
    domain: Gs2AccountNamespaceDomain,
    connection: Gs2Connection
):
    _domain = domain
    _connection = connection
func create(
) -> Gs2AsyncResult:
    var async_result = await _connection.run(
        null,
        func(): return await _domain.create_account(
            Gs2AccountCreateAccountRequest.new()
        )
    )
    if async_result.error != null:
        return async_result
    return Gs2AsyncResult.new(Gs2AccountEzAccountDomain.new(
        async_result.result,
        _connection
    ), null)


# diff +++ start
# Unity Namespace Domain parity: GetAuthorizationUrl belongs to the namespace axis.
func get_authorization_url(
    type
) -> Gs2AsyncResult:
    var async_result = await Gs2AccountClient.new(_connection).get_authorization_url(
        namespace_name,
        type
    )
    if async_result.error != null:
        return async_result
    authorization_url = null if async_result.result == null else async_result.result.authorization_url
    return Gs2AsyncResult.new(self, null)
# diff +++ end
func preview_take_over(
    type,
    user_identifier,
    password
) -> Gs2AsyncResult:
    var async_result = await _connection.run(
        null,
        func(): return await _domain.preview_take_over(
            Gs2AccountPreviewTakeOverRequest.new()
                .with_type(type)
                .with_user_identifier(user_identifier)
                .with_password(password)
        )
    )
    if async_result.error != null:
        return async_result
    return Gs2AsyncResult.new(Gs2AccountEzAccountDomain.new(
        async_result.result,
        _connection
    ), null)
func preview_take_over_open_id_connect(
    type,
    id_token
) -> Gs2AsyncResult:
    var async_result = await _connection.run(
        null,
        func(): return await _domain.preview_take_over_open_id_connect(
            Gs2AccountPreviewTakeOverOpenIdConnectRequest.new()
                .with_type(type)
                .with_id_token(id_token)
        )
    )
    if async_result.error != null:
        return async_result
    return Gs2AsyncResult.new(Gs2AccountEzAccountDomain.new(
        async_result.result,
        _connection
    ), null)
func do_take_over(
    type,
    user_identifier,
    password
) -> Gs2AsyncResult:
    var async_result = await _connection.run(
        null,
        func(): return await _domain.do_take_over(
            Gs2AccountDoTakeOverRequest.new()
                .with_type(type)
                .with_user_identifier(user_identifier)
                .with_password(password)
        )
    )
    if async_result.error != null:
        return async_result
    return Gs2AsyncResult.new(Gs2AccountEzAccountDomain.new(
        async_result.result,
        _connection
    ), null)
func do_take_over_open_id_connect(
    type,
    id_token
) -> Gs2AsyncResult:
    var async_result = await _connection.run(
        null,
        func(): return await _domain.do_take_over_open_id_connect(
            Gs2AccountDoTakeOverOpenIdConnectRequest.new()
                .with_type(type)
                .with_id_token(id_token)
        )
    )
    if async_result.error != null:
        return async_result
    return Gs2AsyncResult.new(Gs2AccountEzAccountDomain.new(
        async_result.result,
        _connection
    ), null)


func account(
    user_id
) -> Gs2AccountEzAccountDomain:
    return Gs2AccountEzAccountDomain.new(
        _domain.account(
            user_id
        ),
        _connection
    )


func me(
    game_session
) -> Gs2AccountEzAccountGameSessionDomain:
    return Gs2AccountEzAccountGameSessionDomain.new(
        _domain.access_token(
            game_session.access_token
        ),
        game_session,
        _connection
    )
