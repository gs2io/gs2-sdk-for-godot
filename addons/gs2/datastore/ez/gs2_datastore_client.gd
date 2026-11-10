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
class_name Gs2DatastoreClient
extends RefCounted


var _connection: Gs2Connection
var _rest_client: Gs2DatastoreRestClient


func _init(connection: Gs2Connection):
    _connection = connection
    _rest_client = Gs2DatastoreRestClient.new(connection.rest_session)


func delete_data_object(game_session, namespace_name, data_object_name = null) -> Gs2AsyncResult:
    var request_action = func():
        var request = Gs2DatastoreDeleteDataObjectRequest.new()
        request.namespace_name = namespace_name
        request.access_token = game_session.access_token.token
        request.data_object_name = data_object_name
        return await _rest_client.delete_data_object(request)
    var async_result = await _connection.run(game_session, request_action)
    if async_result.error != null:
        return Gs2AsyncResult.new(null, async_result.error)
    return Gs2AsyncResult.new(null if async_result.result == null else Gs2DatastoreEzDeleteDataObjectResult.from_model(async_result.result), null)


func done_upload(game_session, namespace_name, data_object_name = null) -> Gs2AsyncResult:
    var request_action = func():
        var request = Gs2DatastoreDoneUploadRequest.new()
        request.namespace_name = namespace_name
        request.access_token = game_session.access_token.token
        request.data_object_name = data_object_name
        return await _rest_client.done_upload(request)
    var async_result = await _connection.run(game_session, request_action)
    if async_result.error != null:
        return Gs2AsyncResult.new(null, async_result.error)
    return Gs2AsyncResult.new(null if async_result.result == null else Gs2DatastoreEzDoneUploadResult.from_model(async_result.result), null)


func list_my_data_objects(game_session, namespace_name, status = null, page_token = null, limit = null) -> Gs2AsyncResult:
    var request_action = func():
        var request = Gs2DatastoreDescribeDataObjectsRequest.new()
        request.namespace_name = namespace_name
        request.access_token = game_session.access_token.token
        request.status = status
        request.page_token = page_token
        request.limit = limit
        return await _rest_client.describe_data_objects(request)
    var async_result = await _connection.run(game_session, request_action)
    if async_result.error != null:
        return Gs2AsyncResult.new(null, async_result.error)
    return Gs2AsyncResult.new(null if async_result.result == null else Gs2DatastoreEzListMyDataObjectsResult.from_model(async_result.result), null)


func prepare_download(game_session, namespace_name, data_object_id) -> Gs2AsyncResult:
    var request_action = func():
        var request = Gs2DatastorePrepareDownloadRequest.new()
        request.namespace_name = namespace_name
        request.data_object_id = data_object_id
        request.access_token = game_session.access_token.token
        return await _rest_client.prepare_download(request)
    var async_result = await _connection.run(game_session, request_action)
    if async_result.error != null:
        return Gs2AsyncResult.new(null, async_result.error)
    return Gs2AsyncResult.new(null if async_result.result == null else Gs2DatastoreEzPrepareDownloadResult.from_model(async_result.result), null)


func prepare_download_by_user_id_and_data_object_name(namespace_name, user_id, data_object_name = null) -> Gs2AsyncResult:
    var request_action = func():
        var request = Gs2DatastorePrepareDownloadByUserIdAndDataObjectNameRequest.new()
        request.namespace_name = namespace_name
        request.user_id = user_id
        request.data_object_name = data_object_name
        return await _rest_client.prepare_download_by_user_id_and_data_object_name(request)
    var async_result = await _connection.run(null, request_action)
    if async_result.error != null:
        return Gs2AsyncResult.new(null, async_result.error)
    return Gs2AsyncResult.new(null if async_result.result == null else Gs2DatastoreEzPrepareDownloadByUserIdAndDataObjectNameResult.from_model(async_result.result), null)


func prepare_download_own_data(game_session, namespace_name, data_object_name = null) -> Gs2AsyncResult:
    var request_action = func():
        var request = Gs2DatastorePrepareDownloadOwnDataRequest.new()
        request.namespace_name = namespace_name
        request.data_object_name = data_object_name
        request.access_token = game_session.access_token.token
        return await _rest_client.prepare_download_own_data(request)
    var async_result = await _connection.run(game_session, request_action)
    if async_result.error != null:
        return Gs2AsyncResult.new(null, async_result.error)
    return Gs2AsyncResult.new(null if async_result.result == null else Gs2DatastoreEzPrepareDownloadOwnDataResult.from_model(async_result.result), null)


func prepare_re_upload(game_session, namespace_name, data_object_name = null, content_type = null) -> Gs2AsyncResult:
    var request_action = func():
        var request = Gs2DatastorePrepareReUploadRequest.new()
        request.namespace_name = namespace_name
        request.access_token = game_session.access_token.token
        request.data_object_name = data_object_name
        request.content_type = content_type
        return await _rest_client.prepare_re_upload(request)
    var async_result = await _connection.run(game_session, request_action)
    if async_result.error != null:
        return Gs2AsyncResult.new(null, async_result.error)
    return Gs2AsyncResult.new(null if async_result.result == null else Gs2DatastoreEzPrepareReUploadResult.from_model(async_result.result), null)


func prepare_upload(game_session, namespace_name, name = null, scope = null, content_type = null, allow_user_ids = null, update_if_exists = null) -> Gs2AsyncResult:
    var request_action = func():
        var request = Gs2DatastorePrepareUploadRequest.new()
        request.namespace_name = namespace_name
        request.access_token = game_session.access_token.token
        request.name = name
        request.scope = scope
        request.content_type = content_type
        request.allow_user_ids = null if allow_user_ids == null else allow_user_ids.map(func(v): return v)
        request.update_if_exists = update_if_exists
        return await _rest_client.prepare_upload(request)
    var async_result = await _connection.run(game_session, request_action)
    if async_result.error != null:
        return Gs2AsyncResult.new(null, async_result.error)
    return Gs2AsyncResult.new(null if async_result.result == null else Gs2DatastoreEzPrepareUploadResult.from_model(async_result.result), null)


func restore_data_object(namespace_name, data_object_id) -> Gs2AsyncResult:
    var request_action = func():
        var request = Gs2DatastoreRestoreDataObjectRequest.new()
        request.namespace_name = namespace_name
        request.data_object_id = data_object_id
        return await _rest_client.restore_data_object(request)
    var async_result = await _connection.run(null, request_action)
    if async_result.error != null:
        return Gs2AsyncResult.new(null, async_result.error)
    return Gs2AsyncResult.new(null if async_result.result == null else Gs2DatastoreEzRestoreDataObjectResult.from_model(async_result.result), null)


func update_data_object(game_session, namespace_name, scope = null, allow_user_ids = null) -> Gs2AsyncResult:
    var request_action = func():
        var request = Gs2DatastoreUpdateDataObjectRequest.new()
        request.namespace_name = namespace_name
        request.access_token = game_session.access_token.token
        request.scope = scope
        request.allow_user_ids = null if allow_user_ids == null else allow_user_ids.map(func(v): return v)
        return await _rest_client.update_data_object(request)
    var async_result = await _connection.run(game_session, request_action)
    if async_result.error != null:
        return Gs2AsyncResult.new(null, async_result.error)
    return Gs2AsyncResult.new(null if async_result.result == null else Gs2DatastoreEzUpdateDataObjectResult.from_model(async_result.result), null)


func list_data_object_histories(game_session, namespace_name, data_object_name = null, page_token = null, limit = null) -> Gs2AsyncResult:
    var request_action = func():
        var request = Gs2DatastoreDescribeDataObjectHistoriesRequest.new()
        request.namespace_name = namespace_name
        request.access_token = game_session.access_token.token
        request.data_object_name = data_object_name
        request.page_token = page_token
        request.limit = limit
        return await _rest_client.describe_data_object_histories(request)
    var async_result = await _connection.run(game_session, request_action)
    if async_result.error != null:
        return Gs2AsyncResult.new(null, async_result.error)
    return Gs2AsyncResult.new(null if async_result.result == null else Gs2DatastoreEzListDataObjectHistoriesResult.from_model(async_result.result), null)


func upload_impl(upload_url, data: PackedByteArray) -> Gs2AsyncResult:
    var response = await _connection.rest_session.upload(upload_url, data, "application/octet-stream")
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(null, null)


func download_impl(download_url) -> Gs2AsyncResult:
    var response = await _connection.rest_session.download(download_url)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(response.body_bytes, null)


func upload(game_session, namespace_name, scope, allow_user_ids, data: PackedByteArray, name = null, content_type = null, update_if_exists = null) -> Gs2AsyncResult:
    var prepare_result = await prepare_upload(
        game_session,
        namespace_name,
        name,
        scope,
        content_type,
        allow_user_ids,
        update_if_exists
    )
    if prepare_result.error != null:
        return prepare_result
    var upload_result = await upload_impl(prepare_result.result.upload_url, data)
    if upload_result.error != null:
        return upload_result
    var done_result = await done_upload(game_session, namespace_name, prepare_result.result.item.name)
    if done_result.error != null:
        return done_result
    return Gs2AsyncResult.new(Gs2DatastoreEzUploadResult.new(done_result.result.item), null)


func re_upload(game_session, namespace_name, data_object, data: PackedByteArray) -> Gs2AsyncResult:
    var prepare_result = await prepare_re_upload(game_session, namespace_name, data_object.name)
    if prepare_result.error != null:
        return prepare_result
    var upload_result = await upload_impl(prepare_result.result.upload_url, data)
    if upload_result.error != null:
        return upload_result
    var done_result = await done_upload(game_session, namespace_name, prepare_result.result.item.name)
    if done_result.error != null:
        return done_result
    return Gs2AsyncResult.new(Gs2DatastoreEzReUploadResult.new(done_result.result.item), null)


func download(game_session, namespace_name, data_object_id) -> Gs2AsyncResult:
    var is_data_already_restored = false
    while true:
        var prepare_result = await prepare_download(game_session, namespace_name, data_object_id)
        if prepare_result.error != null:
            return prepare_result
        var download_result = await download_impl(prepare_result.result.file_url)
        if download_result.error != null and not is_data_already_restored and download_result.error is Gs2NotFoundException:
            var restore_result = await restore_data_object(namespace_name, prepare_result.result.item.data_object_id)
            if restore_result.error != null:
                return restore_result
            is_data_already_restored = true
            continue
        if download_result.error != null:
            return download_result
        return Gs2AsyncResult.new(Gs2DatastoreEzDownloadResult.new(download_result.result), null)
    return Gs2AsyncResult.new(null, null)


func download_own_data(game_session, namespace_name, data_object_name) -> Gs2AsyncResult:
    var is_data_already_restored = false
    while true:
        var prepare_result = await prepare_download_own_data(game_session, namespace_name, data_object_name)
        if prepare_result.error != null:
            return prepare_result
        var download_result = await download_impl(prepare_result.result.file_url)
        if download_result.error != null and not is_data_already_restored and download_result.error is Gs2NotFoundException:
            var restore_result = await restore_data_object(namespace_name, prepare_result.result.item.data_object_id)
            if restore_result.error != null:
                return restore_result
            is_data_already_restored = true
            continue
        if download_result.error != null:
            return download_result
        return Gs2AsyncResult.new(Gs2DatastoreEzDownloadResult.new(download_result.result), null)
    return Gs2AsyncResult.new(null, null)


func download_by_user_id_and_data_object_name(namespace_name, user_id, data_object_name) -> Gs2AsyncResult:
    var is_data_already_restored = false
    while true:
        var prepare_result = await prepare_download_by_user_id_and_data_object_name(namespace_name, user_id, data_object_name)
        if prepare_result.error != null:
            return prepare_result
        var download_result = await download_impl(prepare_result.result.file_url)
        if download_result.error != null and not is_data_already_restored and download_result.error is Gs2NotFoundException:
            var restore_result = await restore_data_object(namespace_name, prepare_result.result.item.data_object_id)
            if restore_result.error != null:
                return restore_result
            is_data_already_restored = true
            continue
        if download_result.error != null:
            return download_result
        return Gs2AsyncResult.new(Gs2DatastoreEzDownloadResult.new(download_result.result), null)
    return Gs2AsyncResult.new(null, null)