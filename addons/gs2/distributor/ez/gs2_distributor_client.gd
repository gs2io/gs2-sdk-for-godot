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
class_name Gs2DistributorClient
extends RefCounted


var _connection: Gs2Connection
var _rest_client: Gs2DistributorRestClient


func _init(connection: Gs2Connection):
    _connection = connection
    _rest_client = Gs2DistributorRestClient.new(connection.rest_session)


func get_distributor_model(namespace_name, distributor_name) -> Gs2AsyncResult:
    var request_action = func():
        var request = Gs2DistributorGetDistributorModelRequest.new()
        request.namespace_name = namespace_name
        request.distributor_name = distributor_name
        return await _rest_client.get_distributor_model(request)
    var async_result = await _connection.run(null, request_action)
    if async_result.error != null:
        return Gs2AsyncResult.new(null, async_result.error)
    return Gs2AsyncResult.new(null if async_result.result == null else Gs2DistributorEzGetDistributorModelResult.from_model(async_result.result), null)


func list_distributor_models(namespace_name) -> Gs2AsyncResult:
    var request_action = func():
        var request = Gs2DistributorDescribeDistributorModelsRequest.new()
        request.namespace_name = namespace_name
        return await _rest_client.describe_distributor_models(request)
    var async_result = await _connection.run(null, request_action)
    if async_result.error != null:
        return Gs2AsyncResult.new(null, async_result.error)
    return Gs2AsyncResult.new(null if async_result.result == null else Gs2DistributorEzListDistributorModelsResult.from_model(async_result.result), null)


func batch_execute_api(request_payloads) -> Gs2AsyncResult:
    var request_action = func():
        var request = Gs2DistributorBatchExecuteApiRequest.new()
        request.request_payloads = null if request_payloads == null else request_payloads.map(func(v): return null if v == null else v.to_model())
        return await _rest_client.batch_execute_api(request)
    var async_result = await _connection.run(null, request_action)
    if async_result.error != null:
        return Gs2AsyncResult.new(null, async_result.error)
    return Gs2AsyncResult.new(null if async_result.result == null else Gs2DistributorEzBatchExecuteApiResult.from_model(async_result.result), null)


func freeze_master_data(game_session, namespace_name) -> Gs2AsyncResult:
    var request_action = func():
        var request = Gs2DistributorFreezeMasterDataRequest.new()
        request.namespace_name = namespace_name
        request.access_token = game_session.access_token.token
        return await _rest_client.freeze_master_data(request)
    var async_result = await _connection.run(game_session, request_action)
    if async_result.error != null:
        return Gs2AsyncResult.new(null, async_result.error)
    return Gs2AsyncResult.new(null if async_result.result == null else Gs2DistributorEzFreezeMasterDataResult.from_model(async_result.result), null)


func freeze_master_data_by_signed_timestamp(game_session, namespace_name, body, signature, key_id) -> Gs2AsyncResult:
    var request_action = func():
        var request = Gs2DistributorFreezeMasterDataBySignedTimestampRequest.new()
        request.namespace_name = namespace_name
        request.access_token = game_session.access_token.token
        request.body = body
        request.signature = signature
        request.key_id = key_id
        return await _rest_client.freeze_master_data_by_signed_timestamp(request)
    var async_result = await _connection.run(game_session, request_action)
    if async_result.error != null:
        return Gs2AsyncResult.new(null, async_result.error)
    return Gs2AsyncResult.new(null if async_result.result == null else Gs2DistributorEzFreezeMasterDataBySignedTimestampResult.from_model(async_result.result), null)


func run_stamp_sheet(namespace_name, stamp_sheet, key_id, context_stack = null) -> Gs2AsyncResult:
    var request_action = func():
        var request = Gs2DistributorRunStampSheetRequest.new()
        request.namespace_name = namespace_name
        request.stamp_sheet = stamp_sheet
        request.key_id = key_id
        request.context_stack = context_stack
        return await _rest_client.run_stamp_sheet(request)
    var async_result = await _connection.run(null, request_action)
    if async_result.error != null:
        return Gs2AsyncResult.new(null, async_result.error)
    return Gs2AsyncResult.new(null if async_result.result == null else Gs2DistributorEzRunStampSheetResult.from_model(async_result.result), null)


func run_stamp_sheet_express(namespace_name, stamp_sheet, key_id) -> Gs2AsyncResult:
    var request_action = func():
        var request = Gs2DistributorRunStampSheetExpressRequest.new()
        request.namespace_name = namespace_name
        request.stamp_sheet = stamp_sheet
        request.key_id = key_id
        return await _rest_client.run_stamp_sheet_express(request)
    var async_result = await _connection.run(null, request_action)
    if async_result.error != null:
        return Gs2AsyncResult.new(null, async_result.error)
    return Gs2AsyncResult.new(null if async_result.result == null else Gs2DistributorEzRunStampSheetExpressResult.from_model(async_result.result), null)


func run_stamp_sheet_express_without_namespace(stamp_sheet, key_id) -> Gs2AsyncResult:
    var request_action = func():
        var request = Gs2DistributorRunStampSheetExpressWithoutNamespaceRequest.new()
        request.stamp_sheet = stamp_sheet
        request.key_id = key_id
        return await _rest_client.run_stamp_sheet_express_without_namespace(request)
    var async_result = await _connection.run(null, request_action)
    if async_result.error != null:
        return Gs2AsyncResult.new(null, async_result.error)
    return Gs2AsyncResult.new(null if async_result.result == null else Gs2DistributorEzRunStampSheetExpressWithoutNamespaceResult.from_model(async_result.result), null)


func run_stamp_sheet_without_namespace(stamp_sheet, key_id, context_stack = null) -> Gs2AsyncResult:
    var request_action = func():
        var request = Gs2DistributorRunStampSheetWithoutNamespaceRequest.new()
        request.stamp_sheet = stamp_sheet
        request.key_id = key_id
        request.context_stack = context_stack
        return await _rest_client.run_stamp_sheet_without_namespace(request)
    var async_result = await _connection.run(null, request_action)
    if async_result.error != null:
        return Gs2AsyncResult.new(null, async_result.error)
    return Gs2AsyncResult.new(null if async_result.result == null else Gs2DistributorEzRunStampSheetWithoutNamespaceResult.from_model(async_result.result), null)


func run_stamp_task(namespace_name, stamp_task, key_id, context_stack = null) -> Gs2AsyncResult:
    var request_action = func():
        var request = Gs2DistributorRunStampTaskRequest.new()
        request.namespace_name = namespace_name
        request.stamp_task = stamp_task
        request.key_id = key_id
        request.context_stack = context_stack
        return await _rest_client.run_stamp_task(request)
    var async_result = await _connection.run(null, request_action)
    if async_result.error != null:
        return Gs2AsyncResult.new(null, async_result.error)
    return Gs2AsyncResult.new(null if async_result.result == null else Gs2DistributorEzRunStampTaskResult.from_model(async_result.result), null)


func run_stamp_task_without_namespace(stamp_task, key_id, context_stack = null) -> Gs2AsyncResult:
    var request_action = func():
        var request = Gs2DistributorRunStampTaskWithoutNamespaceRequest.new()
        request.stamp_task = stamp_task
        request.key_id = key_id
        request.context_stack = context_stack
        return await _rest_client.run_stamp_task_without_namespace(request)
    var async_result = await _connection.run(null, request_action)
    if async_result.error != null:
        return Gs2AsyncResult.new(null, async_result.error)
    return Gs2AsyncResult.new(null if async_result.result == null else Gs2DistributorEzRunStampTaskWithoutNamespaceResult.from_model(async_result.result), null)


func run_verify_task(namespace_name, verify_task, key_id, context_stack = null) -> Gs2AsyncResult:
    var request_action = func():
        var request = Gs2DistributorRunVerifyTaskRequest.new()
        request.namespace_name = namespace_name
        request.verify_task = verify_task
        request.key_id = key_id
        request.context_stack = context_stack
        return await _rest_client.run_verify_task(request)
    var async_result = await _connection.run(null, request_action)
    if async_result.error != null:
        return Gs2AsyncResult.new(null, async_result.error)
    return Gs2AsyncResult.new(null if async_result.result == null else Gs2DistributorEzRunVerifyTaskResult.from_model(async_result.result), null)


func run_verify_task_without_namespace(verify_task, key_id, context_stack = null) -> Gs2AsyncResult:
    var request_action = func():
        var request = Gs2DistributorRunVerifyTaskWithoutNamespaceRequest.new()
        request.verify_task = verify_task
        request.key_id = key_id
        request.context_stack = context_stack
        return await _rest_client.run_verify_task_without_namespace(request)
    var async_result = await _connection.run(null, request_action)
    if async_result.error != null:
        return Gs2AsyncResult.new(null, async_result.error)
    return Gs2AsyncResult.new(null if async_result.result == null else Gs2DistributorEzRunVerifyTaskWithoutNamespaceResult.from_model(async_result.result), null)


func set_default_config(game_session, config) -> Gs2AsyncResult:
    var request_action = func():
        var request = Gs2DistributorSetTransactionDefaultConfigRequest.new()
        request.access_token = game_session.access_token.token
        request.config = null if config == null else config.map(func(v): return null if v == null else v.to_model())
        return await _rest_client.set_transaction_default_config(request)
    var async_result = await _connection.run(game_session, request_action)
    if async_result.error != null:
        return Gs2AsyncResult.new(null, async_result.error)
    return Gs2AsyncResult.new(null if async_result.result == null else Gs2DistributorEzSetDefaultConfigResult.from_model(async_result.result), null)


func get_stamp_sheet_result(game_session, namespace_name, transaction_id) -> Gs2AsyncResult:
    var request_action = func():
        var request = Gs2DistributorGetStampSheetResultRequest.new()
        request.namespace_name = namespace_name
        request.access_token = game_session.access_token.token
        request.transaction_id = transaction_id
        return await _rest_client.get_stamp_sheet_result(request)
    var async_result = await _connection.run(game_session, request_action)
    if async_result.error != null:
        return Gs2AsyncResult.new(null, async_result.error)
    return Gs2AsyncResult.new(null if async_result.result == null else Gs2DistributorEzGetStampSheetResultResult.from_model(async_result.result), null)


func get_transaction_result(game_session, namespace_name, transaction_id) -> Gs2AsyncResult:
    var request_action = func():
        var request = Gs2DistributorGetTransactionResultRequest.new()
        request.namespace_name = namespace_name
        request.access_token = game_session.access_token.token
        request.transaction_id = transaction_id
        return await _rest_client.get_transaction_result(request)
    var async_result = await _connection.run(game_session, request_action)
    if async_result.error != null:
        return Gs2AsyncResult.new(null, async_result.error)
    return Gs2AsyncResult.new(null if async_result.result == null else Gs2DistributorEzGetTransactionResultResult.from_model(async_result.result), null)