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
class_name Gs2NewsProgressDomain
extends RefCounted

var _gs2: Gs2DomainCore
var _client: Gs2NewsRestClient
var namespace_name: Variant = null
var upload_token: Variant = null
var next_page_token: Variant = null


func _init(
    gs2: Gs2DomainCore,
    namespace_name_,
    upload_token_
):
    _gs2 = gs2
    _client = Gs2NewsRestClient.new(gs2.rest_session)
    namespace_name = namespace_name_
    upload_token = upload_token_


func get_(
    request: Gs2NewsGetProgressRequest
) -> Gs2AsyncResult:
    request = request.with_context_stack(_gs2.default_context_stack if request.context_stack == null or request.context_stack == "" else request.context_stack)
    request = request.with_namespace_name(namespace_name)
    request = request.with_upload_token(upload_token)
    var async_result = await Gs2NewsGetProgressMethodCache.invoke(
        _gs2.cache,
        null,
        null,
        request,
        func(): return await _client.get_progress(request)
    )
    if async_result.error != null:
        return async_result
    var result = async_result.result
    return Gs2AsyncResult.new(null if result == null else result.item, null)


func outputs(
) -> Gs2NewsDescribeOutputsIterator:
    return Gs2NewsDescribeOutputsIterator.new(
        _gs2,
        _client,
        namespace_name,
        upload_token
    )


func subscribe_outputs(
    callback: Callable
) -> int:
    return _gs2.cache.list_subscribe(
        "Gs2NewsOutput",
        Gs2NewsOutputCache.cache_parent_key(
            namespace_name,
            upload_token,
            null
        ),
        callback
    )


func unsubscribe_outputs(
    callback_id: int
) -> void:
    _gs2.cache.list_unsubscribe(
        "Gs2NewsOutput",
        Gs2NewsOutputCache.cache_parent_key(
            namespace_name,
            upload_token,
            null
        ),
        callback_id
    )


func invalidate_outputs(
) -> void:
    _gs2.cache.clear_list_cache(
        "Gs2NewsOutput",
        Gs2NewsOutputCache.cache_parent_key(
            namespace_name,
            upload_token,
            null
        )
    )
func output(
    output_name
) -> Gs2NewsOutputDomain:
    return Gs2NewsOutputDomain.new(
        _gs2,
        namespace_name,
        upload_token,
        output_name
    )


func model() -> Gs2AsyncResult:
    var pair = Gs2NewsProgressCache.get_cache(
        _gs2.cache,
        namespace_name,
        upload_token,
        null
    )
    if pair[1]:
        return Gs2AsyncResult.new(pair[0], null)
    return await Gs2NewsProgressCache.fetch(
        _gs2.cache,
        namespace_name,
        upload_token,
        null,
        func():
            var get_result = await get_(Gs2NewsGetProgressRequest.new())
            return get_result
    )


func invalidate() -> void:
    Gs2NewsProgressCache.delete_cache(
        _gs2.cache,
        namespace_name,
        upload_token,
        null
    )


func subscribe_model(callback: Callable) -> int:
    return _gs2.cache.subscribe(
        "Gs2NewsProgress",
        Gs2NewsProgressCache.cache_parent_key(
            namespace_name,
            null
        ),
        Gs2NewsProgressCache.cache_key(
            upload_token
        ),
        callback,
        func(): await model()
    )


func unsubscribe_model(callback_id: int) -> void:
    _gs2.cache.unsubscribe(
        "Gs2NewsProgress",
        Gs2NewsProgressCache.cache_parent_key(
            namespace_name,
            null
        ),
        Gs2NewsProgressCache.cache_key(
            upload_token
        ),
        callback_id
    )


func subscribe_model_with_initial_call(callback: Callable) -> Gs2AsyncResult:
    var model_result = await model()
    if model_result.error != null:
        return model_result
    var callback_id = subscribe_model(callback)
    callback.call(model_result.result)
    return Gs2AsyncResult.new(callback_id, null)