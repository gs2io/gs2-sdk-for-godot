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
class_name Gs2DatastoreEzUserGameSessionDomain
extends RefCounted


var _domain: Gs2DatastoreUserAccessTokenDomain
var _game_session: Variant
var _connection: Gs2Connection
var upload_url: Variant:
    get:
        return _domain.upload_url
var file_url: Variant:
    get:
        return _domain.file_url
var content_length: Variant:
    get:
        return _domain.content_length
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
    domain: Gs2DatastoreUserAccessTokenDomain,
    game_session: Variant,
    connection: Gs2Connection
):
    _domain = domain
    _game_session = game_session
    _connection = connection


func upload(
    scope,
    allow_user_ids,
    data: PackedByteArray,
    name = null,
    update_if_exists = null
) -> Gs2AsyncResult:
    var prepare_result = await prepare_upload(name, scope, null, allow_user_ids, update_if_exists)
    if prepare_result.error != null:
        return prepare_result
    var upload_response = await _connection.rest_session.upload(
        prepare_result.result.upload_url,
        data,
        "application/octet-stream"
    )
    if upload_response.error != null:
        return Gs2AsyncResult.new(null, upload_response.error)
    var done_result = await data_object(prepare_result.result.data_object_name).done_upload()
    if done_result.error != null:
        return done_result
    return await done_result.result.model()


func download(
    data_object_id
) -> Gs2AsyncResult:
    var prepare_result = await prepare_download(data_object_id)
    if prepare_result.error != null:
        return prepare_result
    var response = await _connection.rest_session.download(prepare_result.result.file_url)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(response.body_bytes, null)


func prepare_upload(
    name = null,
    scope = null,
    content_type = null,
    allow_user_ids = null,
    update_if_exists = null
) -> Gs2AsyncResult:
    var async_result = await _connection.run(
        _game_session,
        func(): return await _domain.prepare_upload(
            Gs2DatastorePrepareUploadRequest.new()
                .with_name(name)
                .with_scope(scope)
                .with_content_type(content_type)
                .with_allow_user_ids(allow_user_ids)
                .with_update_if_exists(update_if_exists)
        )
    )
    if async_result.error != null:
        return async_result
    return Gs2AsyncResult.new(Gs2DatastoreEzDataObjectGameSessionDomain.new(
        async_result.result,
        _game_session,
        _connection
    ), null)
func prepare_download(
    data_object_id
) -> Gs2AsyncResult:
    var async_result = await _connection.run(
        _game_session,
        func(): return await _domain.prepare_download(
            Gs2DatastorePrepareDownloadRequest.new()
                .with_data_object_id(data_object_id)
        )
    )
    if async_result.error != null:
        return async_result
    return Gs2AsyncResult.new(Gs2DatastoreEzDataObjectGameSessionDomain.new(
        async_result.result,
        _game_session,
        _connection
    ), null)


func data_objects(
    status = null
) -> Gs2DatastoreEzListMyDataObjectsIterator:
    return Gs2DatastoreEzListMyDataObjectsIterator.new(
        _domain,
        _game_session,
        _connection,
        status
    )


func subscribe_data_objects(
    callback: Callable,
    status = null
) -> int:
    return _domain.subscribe_data_objects(
        func(items): callback.call([] if items == null else items.map(func(v): return Gs2DatastoreEzDataObject.from_model(v))),
        status
    )


func unsubscribe_data_objects(
    callback_id: int,
    status = null
) -> void:
    _domain.unsubscribe_data_objects(
        callback_id,
        status
    )


func data_object(
    data_object_name
) -> Gs2DatastoreEzDataObjectGameSessionDomain:
    return Gs2DatastoreEzDataObjectGameSessionDomain.new(
        _domain.data_object(
            data_object_name
        ),
        _game_session,
        _connection
    )
