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
class_name Gs2DistributorEzNamespaceDomain
extends RefCounted


var _domain: Gs2DistributorNamespaceDomain
var _connection: Gs2Connection
var status: Variant:
    get:
        return _domain.status
var result: Variant:
    get:
        return _domain.result
var context_stack: Variant:
    get:
        return _domain.context_stack
var status_code: Variant:
    get:
        return _domain.status_code
var verify_task_result_codes: Variant:
    get:
        return _domain.verify_task_result_codes
var verify_task_results: Variant:
    get:
        return _domain.verify_task_results
var task_result_codes: Variant:
    get:
        return _domain.task_result_codes
var task_results: Variant:
    get:
        return _domain.task_results
var sheet_result_code: Variant:
    get:
        return _domain.sheet_result_code
var sheet_result: Variant:
    get:
        return _domain.sheet_result
var results: Variant:
    get:
        return null if _domain.results == null else _domain.results.map(func(v): return Gs2DistributorEzBatchResultPayload.from_model(v))
var expression_result: Variant:
    get:
        return _domain.expression_result
var next_page_token: Variant:
    get:
        return _domain.next_page_token
var namespace_name: Variant:
    get:
        return null if _domain == null else _domain.namespace_name


func _init(
    domain: Gs2DistributorNamespaceDomain,
    connection: Gs2Connection
):
    _domain = domain
    _connection = connection
# 戻り値: Gs2AsyncResult (result = Gs2DistributorEzNamespaceDomain)
func batch_execute_api(
    request_payloads
) -> Gs2AsyncResult:
    var async_result = await _connection.run(
        null,
        func(): return await _domain.batch_execute_api(
            Gs2DistributorBatchExecuteApiRequest.new()
                .with_request_payloads(null if request_payloads == null else request_payloads.map(func(v): return null if v == null else v.to_model()))
        )
    )
    if async_result.error != null:
        return async_result
    return Gs2AsyncResult.new(Gs2DistributorEzNamespaceDomain.new(
        async_result.result,
        _connection
    ), null)


func distributor_models(
) -> Gs2DistributorEzListDistributorModelsIterator:
    return Gs2DistributorEzListDistributorModelsIterator.new(
        _domain,
        _connection
    )


func subscribe_distributor_models(
    callback: Callable
) -> int:
    return _domain.subscribe_distributor_models(
        func(items): callback.call([] if items == null else items.map(func(v): return Gs2DistributorEzDistributorModel.from_model(v)))
    )


func unsubscribe_distributor_models(
    callback_id: int
) -> void:
    _domain.unsubscribe_distributor_models(
        callback_id
    )


func distributor_model(
    distributor_name
) -> Gs2DistributorEzDistributorModelDomain:
    return Gs2DistributorEzDistributorModelDomain.new(
        _domain.distributor_model(
            distributor_name
        ),
        _connection
    )


func user(
    user_id
) -> Gs2DistributorEzUserDomain:
    return Gs2DistributorEzUserDomain.new(
        _domain.user(
            user_id
        ),
        _connection
    )


func me(
    game_session
) -> Gs2DistributorEzUserGameSessionDomain:
    return Gs2DistributorEzUserGameSessionDomain.new(
        _domain.access_token(
            game_session.access_token
        ),
        game_session,
        _connection
    )