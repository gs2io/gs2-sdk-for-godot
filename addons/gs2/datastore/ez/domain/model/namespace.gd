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
class_name Gs2DatastoreEzNamespaceDomain
extends RefCounted


var _domain: Gs2DatastoreNamespaceDomain
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
var namespace_name: Variant:
    get:
        return null if _domain == null else _domain.namespace_name


func _init(
    domain: Gs2DatastoreNamespaceDomain,
    connection: Gs2Connection
):
    _domain = domain
    _connection = connection
func restore_data_object(
    data_object_id
) -> Gs2AsyncResult:
    var async_result = await _connection.run(
        null,
        func(): return await _domain.restore_data_object(
            Gs2DatastoreRestoreDataObjectRequest.new()
                .with_data_object_id(data_object_id)
        )
    )
    if async_result.error != null:
        return async_result
    return Gs2AsyncResult.new(Gs2DatastoreEzDataObjectDomain.new(
        async_result.result,
        _connection
    ), null)


func user(
    user_id
) -> Gs2DatastoreEzUserDomain:
    return Gs2DatastoreEzUserDomain.new(
        _domain.user(
            user_id
        ),
        _connection
    )


func me(
    game_session
) -> Gs2DatastoreEzUserGameSessionDomain:
    return Gs2DatastoreEzUserGameSessionDomain.new(
        _domain.access_token(
            game_session.access_token
        ),
        game_session,
        _connection
    )