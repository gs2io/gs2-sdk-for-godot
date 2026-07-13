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
class_name Gs2AuthEzAccessTokenDomain
extends RefCounted


var _domain: Gs2AuthAccessTokenDomain
var _connection: Gs2Connection
var token: Variant:
    get:
        return _domain.token
var user_id: Variant:
    get:
        return _domain.user_id
var expire: Variant:
    get:
        return _domain.expire
var status: Variant:
    get:
        return _domain.status


func _init(
    domain: Gs2AuthAccessTokenDomain,
    connection: Gs2Connection
):
    _domain = domain
    _connection = connection
# 戻り値: Gs2AsyncResult (result = Gs2AuthEzAccessTokenDomain)
func login(
    body,
    signature,
    key_id = null
) -> Gs2AsyncResult:
    var async_result = await _connection.run(
        null,
        func(): return await _domain.login_by_signature(
            Gs2AuthLoginBySignatureRequest.new()
                .with_key_id(key_id)
                .with_body(body)
                .with_signature(signature)
        )
    )
    if async_result.error != null:
        return async_result
    return Gs2AsyncResult.new(Gs2AuthEzAccessTokenDomain.new(
        async_result.result,
        _connection
    ), null)