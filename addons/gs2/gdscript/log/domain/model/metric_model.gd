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
class_name Gs2LogMetricModelDomain
extends RefCounted

var _gs2: Gs2Domain
var _client: Gs2LogRestClient
var namespace_name: Variant = null
var name: Variant = null


func _init(
    gs2: Gs2Domain,
    namespace_name_,
    name_
):
    _gs2 = gs2
    _client = Gs2LogRestClient.new(gs2.rest_session)
    namespace_name = namespace_name_
    name = name_


func model() -> Gs2AsyncResult:
    var pair = Gs2LogMetricModelCache.get_cache(
        _gs2.cache,
        namespace_name,
        name,
        null
    )
    if pair[1]:
        return Gs2AsyncResult.new(pair[0], null)
    return Gs2AsyncResult.new(null, null)


func invalidate() -> void:
    Gs2LogMetricModelCache.delete_cache(
        _gs2.cache,
        namespace_name,
        name,
        null
    )


func subscribe_model(callback: Callable) -> int:
    return _gs2.cache.subscribe(
        "Gs2LogMetricModel",
        Gs2LogMetricModelCache.cache_parent_key(
            namespace_name,
            null
        ),
        Gs2LogMetricModelCache.cache_key(
            name
        ),
        callback,
        func(): await model()
    )


func unsubscribe_model(callback_id: int) -> void:
    _gs2.cache.unsubscribe(
        "Gs2LogMetricModel",
        Gs2LogMetricModelCache.cache_parent_key(
            namespace_name,
            null
        ),
        Gs2LogMetricModelCache.cache_key(
            name
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