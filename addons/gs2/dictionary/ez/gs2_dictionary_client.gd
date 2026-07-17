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
class_name Gs2DictionaryClient
extends RefCounted


var _connection: Gs2Connection
var _rest_client: Gs2DictionaryRestClient


func _init(connection: Gs2Connection):
    _connection = connection
    _rest_client = Gs2DictionaryRestClient.new(connection.rest_session)


func get_entry_model(namespace_name, entry_name) -> Gs2AsyncResult:
    var request_action = func():
        var request = Gs2DictionaryGetEntryModelRequest.new()
        request.namespace_name = namespace_name
        request.entry_name = entry_name
        return await _rest_client.get_entry_model(request)
    var async_result = await _connection.run(null, request_action)
    if async_result.error != null:
        return Gs2AsyncResult.new(null, async_result.error)
    return Gs2AsyncResult.new(null if async_result.result == null else Gs2DictionaryEzGetEntryModelResult.from_model(async_result.result), null)


func list_entry_models(namespace_name) -> Gs2AsyncResult:
    var request_action = func():
        var request = Gs2DictionaryDescribeEntryModelsRequest.new()
        request.namespace_name = namespace_name
        return await _rest_client.describe_entry_models(request)
    var async_result = await _connection.run(null, request_action)
    if async_result.error != null:
        return Gs2AsyncResult.new(null, async_result.error)
    return Gs2AsyncResult.new(null if async_result.result == null else Gs2DictionaryEzListEntryModelsResult.from_model(async_result.result), null)


func get_entry(game_session, namespace_name, entry_model_name) -> Gs2AsyncResult:
    var request_action = func():
        var request = Gs2DictionaryGetEntryRequest.new()
        request.namespace_name = namespace_name
        request.access_token = game_session.access_token.token
        request.entry_model_name = entry_model_name
        return await _rest_client.get_entry(request)
    var async_result = await _connection.run(game_session, request_action)
    if async_result.error != null:
        return Gs2AsyncResult.new(null, async_result.error)
    return Gs2AsyncResult.new(null if async_result.result == null else Gs2DictionaryEzGetEntryResult.from_model(async_result.result), null)


func get_entry_with_signature(game_session, namespace_name, entry_model_name, key_id = null) -> Gs2AsyncResult:
    var request_action = func():
        var request = Gs2DictionaryGetEntryWithSignatureRequest.new()
        request.namespace_name = namespace_name
        request.access_token = game_session.access_token.token
        request.entry_model_name = entry_model_name
        request.key_id = key_id
        return await _rest_client.get_entry_with_signature(request)
    var async_result = await _connection.run(game_session, request_action)
    if async_result.error != null:
        return Gs2AsyncResult.new(null, async_result.error)
    return Gs2AsyncResult.new(null if async_result.result == null else Gs2DictionaryEzGetEntryWithSignatureResult.from_model(async_result.result), null)


func list_entries(game_session, namespace_name, limit = null, page_token = null) -> Gs2AsyncResult:
    var request_action = func():
        var request = Gs2DictionaryDescribeEntriesRequest.new()
        request.namespace_name = namespace_name
        request.access_token = game_session.access_token.token
        request.limit = limit
        request.page_token = page_token
        return await _rest_client.describe_entries(request)
    var async_result = await _connection.run(game_session, request_action)
    if async_result.error != null:
        return Gs2AsyncResult.new(null, async_result.error)
    return Gs2AsyncResult.new(null if async_result.result == null else Gs2DictionaryEzListEntriesResult.from_model(async_result.result), null)


func add_likes(game_session, namespace_name, entry_model_names = null) -> Gs2AsyncResult:
    var request_action = func():
        var request = Gs2DictionaryAddLikesRequest.new()
        request.namespace_name = namespace_name
        request.access_token = game_session.access_token.token
        request.entry_model_names = null if entry_model_names == null else entry_model_names.map(func(v): return v)
        return await _rest_client.add_likes(request)
    var async_result = await _connection.run(game_session, request_action)
    if async_result.error != null:
        return Gs2AsyncResult.new(null, async_result.error)
    return Gs2AsyncResult.new(null if async_result.result == null else Gs2DictionaryEzAddLikesResult.from_model(async_result.result), null)


func delete_likes(game_session, namespace_name, entry_model_names = null) -> Gs2AsyncResult:
    var request_action = func():
        var request = Gs2DictionaryDeleteLikesRequest.new()
        request.namespace_name = namespace_name
        request.access_token = game_session.access_token.token
        request.entry_model_names = null if entry_model_names == null else entry_model_names.map(func(v): return v)
        return await _rest_client.delete_likes(request)
    var async_result = await _connection.run(game_session, request_action)
    if async_result.error != null:
        return Gs2AsyncResult.new(null, async_result.error)
    return Gs2AsyncResult.new(null if async_result.result == null else Gs2DictionaryEzDeleteLikesResult.from_model(async_result.result), null)


func get_like(game_session, namespace_name, entry_model_name) -> Gs2AsyncResult:
    var request_action = func():
        var request = Gs2DictionaryGetLikeRequest.new()
        request.namespace_name = namespace_name
        request.access_token = game_session.access_token.token
        request.entry_model_name = entry_model_name
        return await _rest_client.get_like(request)
    var async_result = await _connection.run(game_session, request_action)
    if async_result.error != null:
        return Gs2AsyncResult.new(null, async_result.error)
    return Gs2AsyncResult.new(null if async_result.result == null else Gs2DictionaryEzGetLikeResult.from_model(async_result.result), null)


func list_likes(game_session, namespace_name, limit = null, page_token = null) -> Gs2AsyncResult:
    var request_action = func():
        var request = Gs2DictionaryDescribeLikesRequest.new()
        request.namespace_name = namespace_name
        request.access_token = game_session.access_token.token
        request.limit = limit
        request.page_token = page_token
        return await _rest_client.describe_likes(request)
    var async_result = await _connection.run(game_session, request_action)
    if async_result.error != null:
        return Gs2AsyncResult.new(null, async_result.error)
    return Gs2AsyncResult.new(null if async_result.result == null else Gs2DictionaryEzListLikesResult.from_model(async_result.result), null)