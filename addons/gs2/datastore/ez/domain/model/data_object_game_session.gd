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
class_name Gs2DatastoreEzDataObjectGameSessionDomain
extends RefCounted


var _domain: Gs2DatastoreDataObjectAccessTokenDomain
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
var data_object_name: Variant:
    get:
        return null if _domain == null else _domain.data_object_name


func _init(
    domain: Gs2DatastoreDataObjectAccessTokenDomain,
    game_session: Variant,
    connection: Gs2Connection
):
    _domain = domain
    _game_session = game_session
    _connection = connection


# 戻り値: Gs2AsyncResult (result = PackedByteArray)
func download(
) -> Gs2AsyncResult:
    var prepare_result = await prepare_download_own_data()
    if prepare_result.error != null:
        return prepare_result
    var response = await _connection.rest_session.download(prepare_result.result.file_url)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(response.body_bytes, null)


# 戻り値: Gs2AsyncResult (result = PackedByteArray)
func download_own(
) -> Gs2AsyncResult:
    return await download()


# 戻り値: Gs2AsyncResult (result = Gs2DatastoreEzDataObjectGameSessionDomain)
func re_upload(
    data: PackedByteArray
) -> Gs2AsyncResult:
    var prepare_result = await prepare_re_upload()
    if prepare_result.error != null:
        return prepare_result
    var upload_response = await _connection.rest_session.upload(
        prepare_result.result.upload_url,
        data,
        "application/octet-stream"
    )
    if upload_response.error != null:
        return Gs2AsyncResult.new(null, upload_response.error)
    return await done_upload()


# 戻り値: Gs2AsyncResult (result = Gs2DatastoreEzDataObjectGameSessionDomain)
func update_data_object(
    scope = null,
    allow_user_ids = null
) -> Gs2AsyncResult:
    var async_result = await _connection.run(
        _game_session,
        func(): return await _domain.update(
            Gs2DatastoreUpdateDataObjectRequest.new()
                .with_scope(scope)
                .with_allow_user_ids(allow_user_ids)
        )
    )
    if async_result.error != null:
        return async_result
    return Gs2AsyncResult.new(Gs2DatastoreEzDataObjectGameSessionDomain.new(
        async_result.result,
        _game_session,
        _connection
    ), null)
# 戻り値: Gs2AsyncResult (result = Gs2DatastoreEzDataObjectGameSessionDomain)
func prepare_re_upload(
    content_type = null
) -> Gs2AsyncResult:
    var async_result = await _connection.run(
        _game_session,
        func(): return await _domain.prepare_re_upload(
            Gs2DatastorePrepareReUploadRequest.new()
                .with_content_type(content_type)
        )
    )
    if async_result.error != null:
        return async_result
    return Gs2AsyncResult.new(Gs2DatastoreEzDataObjectGameSessionDomain.new(
        async_result.result,
        _game_session,
        _connection
    ), null)
# 戻り値: Gs2AsyncResult (result = Gs2DatastoreEzDataObjectGameSessionDomain)
func done_upload(
) -> Gs2AsyncResult:
    var async_result = await _connection.run(
        _game_session,
        func(): return await _domain.done_upload(
            Gs2DatastoreDoneUploadRequest.new()
        )
    )
    if async_result.error != null:
        return async_result
    return Gs2AsyncResult.new(Gs2DatastoreEzDataObjectGameSessionDomain.new(
        async_result.result,
        _game_session,
        _connection
    ), null)
# 戻り値: Gs2AsyncResult (result = Gs2DatastoreEzDataObjectGameSessionDomain)
func delete_data_object(
) -> Gs2AsyncResult:
    var async_result = await _connection.run(
        _game_session,
        func(): return await _domain.delete(
            Gs2DatastoreDeleteDataObjectRequest.new()
        )
    )
    if async_result.error != null:
        return async_result
    return Gs2AsyncResult.new(Gs2DatastoreEzDataObjectGameSessionDomain.new(
        async_result.result,
        _game_session,
        _connection
    ), null)
# 戻り値: Gs2AsyncResult (result = Gs2DatastoreEzDataObjectGameSessionDomain)
func prepare_download_own_data(
) -> Gs2AsyncResult:
    var async_result = await _connection.run(
        _game_session,
        func(): return await _domain.prepare_download_own_data(
            Gs2DatastorePrepareDownloadOwnDataRequest.new()
        )
    )
    if async_result.error != null:
        return async_result
    return Gs2AsyncResult.new(Gs2DatastoreEzDataObjectGameSessionDomain.new(
        async_result.result,
        _game_session,
        _connection
    ), null)


func data_object_histories(
) -> Gs2DatastoreEzListDataObjectHistoriesIterator:
    return Gs2DatastoreEzListDataObjectHistoriesIterator.new(
        _domain,
        _game_session,
        _connection
    )


func subscribe_data_object_histories(
    callback: Callable
) -> int:
    return _domain.subscribe_data_object_histories(
        func(items): callback.call([] if items == null else items.map(func(v): return Gs2DatastoreEzDataObjectHistory.from_model(v)))
    )


func unsubscribe_data_object_histories(
    callback_id: int
) -> void:
    _domain.unsubscribe_data_object_histories(
        callback_id
    )


func data_object_history(
    generation
) -> Gs2DatastoreEzDataObjectHistoryGameSessionDomain:
    return Gs2DatastoreEzDataObjectHistoryGameSessionDomain.new(
        _domain.data_object_history(
            generation
        ),
        _game_session,
        _connection
    )


# 戻り値: Gs2AsyncResult (result = Gs2DatastoreEzDataObject)
func model() -> Gs2AsyncResult:
    var async_result = await _connection.run(
        _game_session,
        func(): return await _domain.model()
    )
    if async_result.error != null:
        return async_result
    if async_result.result == null:
        return Gs2AsyncResult.new(null, null)
    return Gs2AsyncResult.new(Gs2DatastoreEzDataObject.from_model(async_result.result), null)


func invalidate() -> void:
    _domain.invalidate()


func subscribe_model(callback: Callable) -> int:
    return _domain.subscribe_model(
        func(item): callback.call(null if item == null else Gs2DatastoreEzDataObject.from_model(item))
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
