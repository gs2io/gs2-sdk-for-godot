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
class_name Gs2SerialKeyUserDomain
extends RefCounted

var _gs2: Gs2DomainCore
var _client: Gs2SerialKeyRestClient
var namespace_name: Variant = null
var user_id: Variant = null
var url: Variant = null
var next_page_token: Variant = null


func _init(
    gs2: Gs2DomainCore,
    namespace_name_,
    user_id_
):
    _gs2 = gs2
    _client = Gs2SerialKeyRestClient.new(gs2.rest_session)
    namespace_name = namespace_name_
    user_id = user_id_


func download_serial_codes(
    request: Gs2SerialKeyDownloadSerialCodesRequest
) -> Gs2AsyncResult:
    request = request.with_context_stack(_gs2.default_context_stack if request.context_stack == null or request.context_stack == "" else request.context_stack)
    request = request.with_namespace_name(namespace_name)
    var async_result = await Gs2SerialKeyDownloadSerialCodesMethodCache.invoke(
        _gs2.cache,
        user_id,
        null,
        request,
        func(): return await _client.download_serial_codes(request)
    )
    if async_result.error != null:
        return async_result
    var result = async_result.result
    var domain = self
    self.url = null if result == null else result.url
    domain.url = self.url
    return Gs2AsyncResult.new(domain, null)


func issue_once(
    request: Gs2SerialKeyIssueOnceRequest
) -> Gs2AsyncResult:
    request = request.with_context_stack(_gs2.default_context_stack if request.context_stack == null or request.context_stack == "" else request.context_stack)
    request = request.with_namespace_name(namespace_name)
    var async_result = await Gs2SerialKeyIssueOnceMethodCache.invoke(
        _gs2.cache,
        user_id,
        null,
        request,
        func(): return await _client.issue_once(request)
    )
    if async_result.error != null:
        return async_result
    var result = async_result.result
    var ref = null if result == null else result.item
    var domain = Gs2SerialKeySerialKeyDomain.new(
        _gs2,
        namespace_name,
        user_id,
        (null if ref == null else ref.code)
    )
    return Gs2AsyncResult.new(domain, null)


func verify_code(
    request: Gs2SerialKeyVerifyCodeByUserIdRequest
) -> Gs2AsyncResult:
    request = request.with_context_stack(_gs2.default_context_stack if request.context_stack == null or request.context_stack == "" else request.context_stack)
    request = request.with_namespace_name(namespace_name)
    request = request.with_user_id(user_id)
    var async_result = await Gs2SerialKeyVerifyCodeByUserIdMethodCache.invoke(
        _gs2.cache,
        user_id,
        null,
        request,
        func(): return await _client.verify_code_by_user_id(request)
    )
    if async_result.error != null:
        return async_result
    var result = async_result.result
    var ref = null if result == null else result.item
    var domain = Gs2SerialKeySerialKeyDomain.new(
        _gs2,
        namespace_name,
        request.user_id,
        (null if ref == null else ref.code)
    )
    return Gs2AsyncResult.new(domain, null)


func revert_use(
    request: Gs2SerialKeyRevertUseByUserIdRequest
) -> Gs2AsyncResult:
    request = request.with_context_stack(_gs2.default_context_stack if request.context_stack == null or request.context_stack == "" else request.context_stack)
    request = request.with_namespace_name(namespace_name)
    request = request.with_user_id(user_id)
    var async_result = await Gs2SerialKeyRevertUseByUserIdMethodCache.invoke(
        _gs2.cache,
        user_id,
        null,
        request,
        func(): return await _client.revert_use_by_user_id(request)
    )
    if async_result.error != null:
        return async_result
    var result = async_result.result
    var ref = null if result == null else result.item
    var domain = Gs2SerialKeySerialKeyDomain.new(
        _gs2,
        namespace_name,
        request.user_id,
        (null if ref == null else ref.code)
    )
    return Gs2AsyncResult.new(domain, null)


func serial_keys(
    campaign_model_name,
    issue_job_name = null
) -> Gs2SerialKeyDescribeSerialKeysIterator:
    return Gs2SerialKeyDescribeSerialKeysIterator.new(
        _gs2,
        _client,
        namespace_name,
        campaign_model_name,
        issue_job_name
    )


func subscribe_serial_keys(
    callback: Callable,
    campaign_model_name,
    issue_job_name = null
) -> int:
    return _gs2.cache.list_subscribe(
        "Gs2SerialKeySerialKey",
        Gs2SerialKeySerialKeyCache.cache_parent_key(
            namespace_name,
            user_id,
            null
        ),
        callback
    )


func unsubscribe_serial_keys(
    callback_id: int,
    campaign_model_name,
    issue_job_name = null
) -> void:
    _gs2.cache.list_unsubscribe(
        "Gs2SerialKeySerialKey",
        Gs2SerialKeySerialKeyCache.cache_parent_key(
            namespace_name,
            user_id,
            null
        ),
        callback_id
    )


func invalidate_serial_keys(
    campaign_model_name,
    issue_job_name = null
) -> void:
    _gs2.cache.clear_list_cache(
        "Gs2SerialKeySerialKey",
        Gs2SerialKeySerialKeyCache.cache_parent_key(
            namespace_name,
            user_id,
            null
        )
    )
func serial_key(
    serial_key_code
) -> Gs2SerialKeySerialKeyDomain:
    return Gs2SerialKeySerialKeyDomain.new(
        _gs2,
        namespace_name,
        user_id,
        serial_key_code
    )