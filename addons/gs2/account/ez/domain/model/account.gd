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
class_name Gs2AccountEzAccountDomain
extends RefCounted


var _domain: Gs2AccountAccountDomain
var _connection: Gs2Connection
var ban_statuses: Variant:
    get:
        return null if _domain.ban_statuses == null else _domain.ban_statuses.map(func(v): return Gs2AccountEzBanStatus.from_model(v))
var body: Variant:
    get:
        return _domain.body
var signature: Variant:
    get:
        return _domain.signature
var authorization_url: Variant:
    get:
        return _domain.authorization_url
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
    domain: Gs2AccountAccountDomain,
    connection: Gs2Connection
):
    _domain = domain
    _connection = connection
# 戻り値: Gs2AsyncResult (result = Gs2AccountEzAccountDomain)
func authentication(
    password,
    key_id = null
) -> Gs2AsyncResult:
    var async_result = await _connection.run(
        null,
        func(): return await _domain.authentication(
            Gs2AccountAuthenticationRequest.new()
                .with_key_id(key_id)
                .with_password(password)
        )
    )
    if async_result.error != null:
        return async_result
    return Gs2AsyncResult.new(Gs2AccountEzAccountDomain.new(
        async_result.result,
        _connection
    ), null)
# 戻り値: Gs2AsyncResult (result = Gs2AccountEzAccountDomain)
func get_authorization_url(
    type
) -> Gs2AsyncResult:
    var async_result = await _connection.run(
        null,
        func(): return await _domain.get_authorization_url(
            Gs2AccountGetAuthorizationUrlRequest.new()
                .with_type(type)
        )
    )
    if async_result.error != null:
        return async_result
    return Gs2AsyncResult.new(Gs2AccountEzAccountDomain.new(
        async_result.result,
        _connection
    ), null)


func take_over(
    type
) -> Gs2AccountEzTakeOverDomain:
    return Gs2AccountEzTakeOverDomain.new(
        _domain.take_over(
            type
        ),
        _connection
    )


func platform_id(
    type
) -> Gs2AccountEzPlatformIdDomain:
    return Gs2AccountEzPlatformIdDomain.new(
        _domain.platform_id(
            type
        ),
        _connection
    )


# 戻り値: Gs2AsyncResult (result = Gs2AccountEzAccount)
func model() -> Gs2AsyncResult:
    var async_result = await _connection.run(
        null,
        func(): return await _domain.model()
    )
    if async_result.error != null:
        return async_result
    if async_result.result == null:
        return Gs2AsyncResult.new(null, null)
    return Gs2AsyncResult.new(Gs2AccountEzAccount.from_model(async_result.result), null)


func invalidate() -> void:
    _domain.invalidate()


func subscribe_model(callback: Callable) -> int:
    return _domain.subscribe_model(
        func(item): callback.call(null if item == null else Gs2AccountEzAccount.from_model(item))
    )


func unsubscribe_model(callback_id: int) -> void:
    _domain.unsubscribe_model(callback_id)


func subscribe_model_with_initial_call(callback: Callable) -> Gs2AsyncResult:
    var model_result = await model()
    if model_result.error != null:
        return model_result
    var callback_id = subscribe_model(callback)
    callback.call(model_result.result)
    return Gs2AsyncResult.new(callback_id, null)