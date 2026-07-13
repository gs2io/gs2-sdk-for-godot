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
# deny overwrite
class_name Gs2DistributorUserDomain
extends RefCounted

var _gs2: Gs2Domain
var _client: Gs2DistributorRestClient
var namespace_name: Variant = null
var user_id: Variant = null


func _init(
    gs2: Gs2Domain,
    namespace_name_,
    user_id_
):
    _gs2 = gs2
    _client = Gs2DistributorRestClient.new(gs2.rest_session)
    namespace_name = namespace_name_
    user_id = user_id_
# diff +++ start
func freeze_master_data(
    request: Gs2DistributorFreezeMasterDataByUserIdRequest
) -> Gs2AsyncResult:
    request = request.with_context_stack(_gs2.default_context_stack if request.context_stack == null or request.context_stack == "" else request.context_stack)
    request = request.with_namespace_name(namespace_name)
    request = request.with_user_id(user_id)
    var async_result = await Gs2DistributorFreezeMasterDataByUserIdMethodCache.invoke(
        _gs2.cache,
        null,
        null,
        request,
        func(): return await _client.freeze_master_data_by_user_id(request)
    )
    if async_result.error != null:
        return async_result
    var result = async_result.result
    var domain = self
    var new_gs2 = Gs2Domain.new(
        _gs2.rest_session,
        _gs2.web_socket_session,
        _gs2.transaction_configuration.namespace_name
    )
    new_gs2.default_context_stack = null if result == null else result.new_context_stack
    return Gs2AsyncResult.new(new_gs2, null)
# diff +++ end


func run_transaction(
    request: Gs2DistributorRunTransactionRequest
) -> Gs2AsyncResult:
    request = request.with_context_stack(_gs2.default_context_stack if request.context_stack == null or request.context_stack == "" else request.context_stack)
    request = request.with_namespace_name(namespace_name)
    request = request.with_user_id(user_id)
    var async_result = await Gs2DistributorRunTransactionMethodCache.invoke(
        _gs2.cache,
        user_id,
        null,
        request,
        func(): return await _client.run_transaction(request)
    )
    if async_result.error != null:
        return async_result
    var result = async_result.result
    var ref = null if result == null else result.item
    var domain = Gs2DistributorTransactionResultDomain.new(
        _gs2,
        namespace_name,
        (null if ref == null else ref.user_id),
        (null if ref == null else ref.transaction_id)
    )
    return Gs2AsyncResult.new(domain, null)
func stamp_sheet_result(
    transaction_id
) -> Gs2DistributorStampSheetResultDomain:
    return Gs2DistributorStampSheetResultDomain.new(
        _gs2,
        namespace_name,
        user_id,
        transaction_id
    )
func transaction_result(
    transaction_id
) -> Gs2DistributorTransactionResultDomain:
    return Gs2DistributorTransactionResultDomain.new(
        _gs2,
        namespace_name,
        user_id,
        transaction_id
    )