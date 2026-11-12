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
class_name Gs2ExchangeExchangeAccessTokenDomain
extends RefCounted

var _gs2: Gs2DomainCore
var _client: Gs2ExchangeRestClient
var namespace_name: Variant = null
var access_token: Gs2AuthAccessToken
var user_id: Variant:
    get:
        return null if access_token == null else access_token.user_id


func _init(
    gs2: Gs2DomainCore,
    namespace_name_,
    access_token_
):
    _gs2 = gs2
    _client = Gs2ExchangeRestClient.new(gs2.rest_session)
    namespace_name = namespace_name_
    access_token = access_token_


func exchange(
    request: Gs2ExchangeExchangeRequest,
    speculative_execute: bool = true
) -> Gs2AsyncResult:
    request = request.with_context_stack(_gs2.default_context_stack if request.context_stack == null or request.context_stack == "" else request.context_stack)
    request = request.with_namespace_name(namespace_name)
    request = request.with_access_token(null if access_token == null else access_token.token)
    if speculative_execute:
        var speculative_result = await Gs2ExchangeExchangeByUserIdTransactionSpeculativeExecutor.execute(
            _gs2,
            access_token,
            Gs2ExchangeExchangeByUserIdRequest.from_dict(request.to_dict())
        )
        if speculative_result.error != null:
            return speculative_result
        if speculative_result.result is Callable:
            speculative_result.result.call()
    var async_result = await Gs2ExchangeExchangeMethodCache.invoke(
        _gs2.cache,
        user_id,
        (null if access_token == null else access_token.time_offset),
        request,
        func(): return await _client.exchange(request)
    )
    if async_result.error != null:
        return async_result
    var result = async_result.result
    var transaction = Gs2TransactionDomainFactory.to_transaction(
        _gs2,
        access_token,
        false if result.auto_run_stamp_sheet == null else result.auto_run_stamp_sheet,
        result.transaction_id,
        result.stamp_sheet,
        result.stamp_sheet_encryption_key_id,
        result.atomic_commit,
        result.transaction_result,
        result.metadata
    )
    if result.stamp_sheet != null:
        var wait_result = await transaction.wait(true)
        if wait_result.error != null:
            return wait_result
    return Gs2AsyncResult.new(transaction, null)


func incremental(
    request: Gs2ExchangeIncrementalExchangeRequest,
    speculative_execute: bool = true
) -> Gs2AsyncResult:
    request = request.with_context_stack(_gs2.default_context_stack if request.context_stack == null or request.context_stack == "" else request.context_stack)
    request = request.with_namespace_name(namespace_name)
    request = request.with_access_token(null if access_token == null else access_token.token)
    if speculative_execute:
        var speculative_result = await Gs2ExchangeIncrementalExchangeByUserIdTransactionSpeculativeExecutor.execute(
            _gs2,
            access_token,
            Gs2ExchangeIncrementalExchangeByUserIdRequest.from_dict(request.to_dict())
        )
        if speculative_result.error != null:
            return speculative_result
        if speculative_result.result is Callable:
            speculative_result.result.call()
    var async_result = await Gs2ExchangeIncrementalExchangeMethodCache.invoke(
        _gs2.cache,
        user_id,
        (null if access_token == null else access_token.time_offset),
        request,
        func(): return await _client.incremental_exchange(request)
    )
    if async_result.error != null:
        return async_result
    var result = async_result.result
    var transaction = Gs2TransactionDomainFactory.to_transaction(
        _gs2,
        access_token,
        false if result.auto_run_stamp_sheet == null else result.auto_run_stamp_sheet,
        result.transaction_id,
        result.stamp_sheet,
        result.stamp_sheet_encryption_key_id,
        result.atomic_commit,
        result.transaction_result,
        result.metadata
    )
    if result.stamp_sheet != null:
        var wait_result = await transaction.wait(true)
        if wait_result.error != null:
            return wait_result
    return Gs2AsyncResult.new(transaction, null)