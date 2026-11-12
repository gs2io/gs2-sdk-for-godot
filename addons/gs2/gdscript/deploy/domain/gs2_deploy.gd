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
class_name Gs2Deploy
extends RefCounted



var _gs2: Gs2DomainCore
var _client: Gs2DeployRestClient
var upload_token: Variant = null
var upload_url: Variant = null


func _init(
    gs2: Gs2DomainCore
):
    _gs2 = gs2
    _client = Gs2DeployRestClient.new(gs2.rest_session)


func pre_create_stack(
    request: Gs2DeployPreCreateStackRequest
) -> Gs2AsyncResult:
    var async_result = await Gs2DeployPreCreateStackMethodCache.invoke(
        _gs2.cache,
        null,
        null,
        request,
        func(): return await _client.pre_create_stack(request)
    )
    if async_result.error != null:
        return async_result
    var result = async_result.result
    var domain = self
    self.upload_token = null if result == null else result.upload_token
    domain.upload_token = self.upload_token
    self.upload_url = null if result == null else result.upload_url
    domain.upload_url = self.upload_url
    return Gs2AsyncResult.new(domain, null)


func create_stack(
    request: Gs2DeployCreateStackRequest
) -> Gs2AsyncResult:
    var async_result = await Gs2DeployCreateStackMethodCache.invoke(
        _gs2.cache,
        null,
        null,
        request,
        func(): return await _client.create_stack(request)
    )
    if async_result.error != null:
        return async_result
    var result = async_result.result
    var ref = null if result == null else result.item
    var domain = Gs2DeployStackDomain.new(
        _gs2,
        (null if ref == null else ref.name)
    )
    return Gs2AsyncResult.new(domain, null)


func create_stack_from_git_hub(
    request: Gs2DeployCreateStackFromGitHubRequest
) -> Gs2AsyncResult:
    var async_result = await Gs2DeployCreateStackFromGitHubMethodCache.invoke(
        _gs2.cache,
        null,
        null,
        request,
        func(): return await _client.create_stack_from_git_hub(request)
    )
    if async_result.error != null:
        return async_result
    var result = async_result.result
    var ref = null if result == null else result.item
    var domain = Gs2DeployStackDomain.new(
        _gs2,
        (null if ref == null else ref.name)
    )
    return Gs2AsyncResult.new(domain, null)


func pre_validate(
    request: Gs2DeployPreValidateRequest
) -> Gs2AsyncResult:
    var async_result = await Gs2DeployPreValidateMethodCache.invoke(
        _gs2.cache,
        null,
        null,
        request,
        func(): return await _client.pre_validate(request)
    )
    if async_result.error != null:
        return async_result
    var result = async_result.result
    var domain = self
    self.upload_token = null if result == null else result.upload_token
    domain.upload_token = self.upload_token
    self.upload_url = null if result == null else result.upload_url
    domain.upload_url = self.upload_url
    return Gs2AsyncResult.new(domain, null)


func validate(
    request: Gs2DeployValidateRequest
) -> Gs2AsyncResult:
    var async_result = await Gs2DeployValidateMethodCache.invoke(
        _gs2.cache,
        null,
        null,
        request,
        func(): return await _client.validate(request)
    )
    if async_result.error != null:
        return async_result
    var result = async_result.result
    var domain = self
    return Gs2AsyncResult.new(domain, null)


func stacks(
    name_prefix = null
) -> Gs2DeployDescribeStacksIterator:
    return Gs2DeployDescribeStacksIterator.new(
        _gs2,
        _client,
        name_prefix
    )


func subscribe_stacks(
    callback: Callable,
    name_prefix = null
) -> int:
    return _gs2.cache.list_subscribe(
        "Gs2DeployStack",
        Gs2DeployStackCache.cache_parent_key(
            null
        ),
        callback
    )


func unsubscribe_stacks(
    callback_id: int,
    name_prefix = null
) -> void:
    _gs2.cache.list_unsubscribe(
        "Gs2DeployStack",
        Gs2DeployStackCache.cache_parent_key(
            null
        ),
        callback_id
    )


func invalidate_stacks(
    name_prefix = null
) -> void:
    _gs2.cache.clear_list_cache(
        "Gs2DeployStack",
        Gs2DeployStackCache.cache_parent_key(
            null
        )
    )
func stack(
    stack_name
) -> Gs2DeployStackDomain:
    return Gs2DeployStackDomain.new(
        _gs2,
        stack_name
    )


func update_cache_from_stamp_sheet(
    transaction_id,
    time_offset,
    method: String,
    request,
    result
) -> void:
    pass


func update_cache_from_stamp_task(
    task_id,
    time_offset,
    method: String,
    request,
    result
) -> void:
    pass


func update_cache_from_job_result(
    method: String,
    time_offset,
    job,
    result
) -> void:
    pass


func handle_notification(
    action: String,
    payload
) -> void:
    var data = JSON.parse_string(payload) if payload is String else payload
    pass