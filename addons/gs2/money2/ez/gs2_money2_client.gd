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
class_name Gs2Money2Client
extends RefCounted


var _connection: Gs2Connection
var _rest_client: Gs2Money2RestClient


func _init(connection: Gs2Connection):
    _connection = connection
    _rest_client = Gs2Money2RestClient.new(connection.rest_session)


func get_(game_session, namespace_name, slot) -> Gs2AsyncResult:
    var request_action = func():
        var request = Gs2Money2GetWalletRequest.new()
        request.namespace_name = namespace_name
        request.access_token = game_session.access_token.token
        request.slot = slot
        return await _rest_client.get_wallet(request)
    var async_result = await _connection.run(game_session, request_action)
    if async_result.error != null:
        return Gs2AsyncResult.new(null, async_result.error)
    return Gs2AsyncResult.new(null if async_result.result == null else Gs2Money2EzGetResult.from_model(async_result.result), null)


func list(game_session, namespace_name) -> Gs2AsyncResult:
    var request_action = func():
        var request = Gs2Money2DescribeWalletsRequest.new()
        request.namespace_name = namespace_name
        request.access_token = game_session.access_token.token
        return await _rest_client.describe_wallets(request)
    var async_result = await _connection.run(game_session, request_action)
    if async_result.error != null:
        return Gs2AsyncResult.new(null, async_result.error)
    return Gs2AsyncResult.new(null if async_result.result == null else Gs2Money2EzListResult.from_model(async_result.result), null)


func withdraw(game_session, namespace_name, slot, withdraw_count, paid_only = null) -> Gs2AsyncResult:
    var request_action = func():
        var request = Gs2Money2WithdrawRequest.new()
        request.namespace_name = namespace_name
        request.access_token = game_session.access_token.token
        request.slot = slot
        request.withdraw_count = withdraw_count
        request.paid_only = paid_only
        return await _rest_client.withdraw(request)
    var async_result = await _connection.run(game_session, request_action)
    if async_result.error != null:
        return Gs2AsyncResult.new(null, async_result.error)
    return Gs2AsyncResult.new(null if async_result.result == null else Gs2Money2EzWithdrawResult.from_model(async_result.result), null)


func allocate_subscription_status(game_session, namespace_name, receipt) -> Gs2AsyncResult:
    var request_action = func():
        var request = Gs2Money2AllocateSubscriptionStatusRequest.new()
        request.namespace_name = namespace_name
        request.access_token = game_session.access_token.token
        request.receipt = receipt
        return await _rest_client.allocate_subscription_status(request)
    var async_result = await _connection.run(game_session, request_action)
    if async_result.error != null:
        return Gs2AsyncResult.new(null, async_result.error)
    return Gs2AsyncResult.new(null if async_result.result == null else Gs2Money2EzAllocateSubscriptionStatusResult.from_model(async_result.result), null)


func get_subscription_status(game_session, namespace_name, content_name) -> Gs2AsyncResult:
    var request_action = func():
        var request = Gs2Money2GetSubscriptionStatusRequest.new()
        request.namespace_name = namespace_name
        request.access_token = game_session.access_token.token
        request.content_name = content_name
        return await _rest_client.get_subscription_status(request)
    var async_result = await _connection.run(game_session, request_action)
    if async_result.error != null:
        return Gs2AsyncResult.new(null, async_result.error)
    return Gs2AsyncResult.new(null if async_result.result == null else Gs2Money2EzGetSubscriptionStatusResult.from_model(async_result.result), null)


func list_subscription_statuses(game_session, namespace_name) -> Gs2AsyncResult:
    var request_action = func():
        var request = Gs2Money2DescribeSubscriptionStatusesRequest.new()
        request.namespace_name = namespace_name
        request.access_token = game_session.access_token.token
        return await _rest_client.describe_subscription_statuses(request)
    var async_result = await _connection.run(game_session, request_action)
    if async_result.error != null:
        return Gs2AsyncResult.new(null, async_result.error)
    return Gs2AsyncResult.new(null if async_result.result == null else Gs2Money2EzListSubscriptionStatusesResult.from_model(async_result.result), null)


func take_over_subscription_status(game_session, namespace_name, receipt) -> Gs2AsyncResult:
    var request_action = func():
        var request = Gs2Money2TakeoverSubscriptionStatusRequest.new()
        request.namespace_name = namespace_name
        request.access_token = game_session.access_token.token
        request.receipt = receipt
        return await _rest_client.takeover_subscription_status(request)
    var async_result = await _connection.run(game_session, request_action)
    if async_result.error != null:
        return Gs2AsyncResult.new(null, async_result.error)
    return Gs2AsyncResult.new(null if async_result.result == null else Gs2Money2EzTakeOverSubscriptionStatusResult.from_model(async_result.result), null)


func get_store_content_model(namespace_name, content_name) -> Gs2AsyncResult:
    var request_action = func():
        var request = Gs2Money2GetStoreContentModelRequest.new()
        request.namespace_name = namespace_name
        request.content_name = content_name
        return await _rest_client.get_store_content_model(request)
    var async_result = await _connection.run(null, request_action)
    if async_result.error != null:
        return Gs2AsyncResult.new(null, async_result.error)
    return Gs2AsyncResult.new(null if async_result.result == null else Gs2Money2EzGetStoreContentModelResult.from_model(async_result.result), null)


func list_store_content_models(namespace_name) -> Gs2AsyncResult:
    var request_action = func():
        var request = Gs2Money2DescribeStoreContentModelsRequest.new()
        request.namespace_name = namespace_name
        return await _rest_client.describe_store_content_models(request)
    var async_result = await _connection.run(null, request_action)
    if async_result.error != null:
        return Gs2AsyncResult.new(null, async_result.error)
    return Gs2AsyncResult.new(null if async_result.result == null else Gs2Money2EzListStoreContentModelsResult.from_model(async_result.result), null)