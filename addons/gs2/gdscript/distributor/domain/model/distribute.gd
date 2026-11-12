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
class_name Gs2DistributorDistributeDomain
extends RefCounted

var _gs2: Gs2DomainCore
var _client: Gs2DistributorRestClient
var namespace_name: Variant = null
var inbox_namespace_id: Variant = null
var result: Variant = null
var context_stack: Variant = null
var status_code: Variant = null
var verify_task_result_codes: Variant = null
var verify_task_results: Variant = null
var task_result_codes: Variant = null
var task_results: Variant = null
var sheet_result_code: Variant = null
var sheet_result: Variant = null
# diff --- start
#var body = null
#var signature = null
#var results = null
# diff --- end


func _init(
    gs2: Gs2DomainCore,
    namespace_name_
):
    _gs2 = gs2
    _client = Gs2DistributorRestClient.new(gs2.rest_session)
    namespace_name = namespace_name_


# diff --- start
#func freeze_master_data(
#    request: Gs2DistributorFreezeMasterDataByUserIdRequest
#) -> Gs2AsyncResult:
#    request = request.with_context_stack(_gs2.default_context_stack if request.context_stack == null or request.context_stack == "" else request.context_stack)
#    request = request.with_namespace_name(namespace_name)
#    var async_result = await Gs2DistributorFreezeMasterDataByUserIdMethodCache.invoke(
#        _gs2.cache,
#        null,
#        null,
#        request,
#        func(): return await _client.freeze_master_data_by_user_id(request)
#    )
#    if async_result.error != null:
#        return async_result
#    var result = async_result.result
#    var domain = self
#    return Gs2AsyncResult.new(domain, null)
#
#
#func sign_freeze_master_data_timestamp(
#    request: Gs2DistributorSignFreezeMasterDataTimestampRequest
#) -> Gs2AsyncResult:
#    request = request.with_context_stack(_gs2.default_context_stack if request.context_stack == null or request.context_stack == "" else request.context_stack)
#    request = request.with_namespace_name(namespace_name)
#    var async_result = await Gs2DistributorSignFreezeMasterDataTimestampMethodCache.invoke(
#        _gs2.cache,
#        null,
#        null,
#        request,
#        func(): return await _client.sign_freeze_master_data_timestamp(request)
#    )
#    if async_result.error != null:
#        return async_result
#    var result = async_result.result
#    var domain = self
#    self.body = null if result == null else result.body
#    domain.body = self.body
#    self.signature = null if result == null else result.signature
#    domain.signature = self.signature
#    return Gs2AsyncResult.new(domain, null)
# diff --- end