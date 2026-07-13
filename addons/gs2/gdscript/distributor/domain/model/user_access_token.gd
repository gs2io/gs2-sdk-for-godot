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
class_name Gs2DistributorUserAccessTokenDomain
extends RefCounted

var _gs2: Gs2Domain
var _client: Gs2DistributorRestClient
var namespace_name: Variant = null
var access_token: Gs2AuthAccessToken
var user_id: Variant:
    get:
        return null if access_token == null else access_token.user_id
# diff +++ start
var gs2: Variant:
    get:
        return _gs2
# diff +++ end


func _init(
    gs2: Gs2Domain,
    namespace_name_,
    access_token_
):
    _gs2 = gs2
    _client = Gs2DistributorRestClient.new(gs2.rest_session)
    namespace_name = namespace_name_
    access_token = access_token_
# diff +++ start
func freeze_master_data(
    request: Gs2DistributorFreezeMasterDataRequest
) -> Gs2AsyncResult:
    request = request.with_context_stack(_gs2.default_context_stack if request.context_stack == null or request.context_stack == "" else request.context_stack)
    request = request.with_namespace_name(namespace_name)
    request = request.with_access_token(null if access_token == null else access_token.token)
    var async_result = await Gs2DistributorFreezeMasterDataMethodCache.invoke(
        _gs2.cache,
        null,
        (null if access_token == null else access_token.time_offset),
        request,
        func(): return await _client.freeze_master_data(request)
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


func freeze_master_data_by_signed_timestamp(
    request: Gs2DistributorFreezeMasterDataBySignedTimestampRequest
) -> Gs2AsyncResult:
    request = request.with_context_stack(_gs2.default_context_stack if request.context_stack == null or request.context_stack == "" else request.context_stack)
    request = request.with_namespace_name(namespace_name)
    request = request.with_access_token(null if access_token == null else access_token.token)
    var async_result = await Gs2DistributorFreezeMasterDataBySignedTimestampMethodCache.invoke(
        _gs2.cache,
        null,
        (null if access_token == null else access_token.time_offset),
        request,
        func(): return await _client.freeze_master_data_by_signed_timestamp(request)
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
func stamp_sheet_result(
    transaction_id
) -> Gs2DistributorStampSheetResultAccessTokenDomain:
    return Gs2DistributorStampSheetResultAccessTokenDomain.new(
        _gs2,
        namespace_name,
        access_token,
        transaction_id
    )
func transaction_result(
    transaction_id
) -> Gs2DistributorTransactionResultAccessTokenDomain:
    return Gs2DistributorTransactionResultAccessTokenDomain.new(
        _gs2,
        namespace_name,
        access_token,
        transaction_id
    )