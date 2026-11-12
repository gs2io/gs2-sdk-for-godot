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
class_name Gs2NewsSetCookieRequestEntryDomain
extends RefCounted

var _gs2: Gs2DomainCore
var _client: Gs2NewsRestClient
var namespace_name: Variant = null
var user_id: Variant = null
var key: Variant = null
var value: Variant = null


func _init(
    gs2: Gs2DomainCore,
    namespace_name_,
    user_id_,
    key_,
    value_
):
    _gs2 = gs2
    _client = Gs2NewsRestClient.new(gs2.rest_session)
    namespace_name = namespace_name_
    user_id = user_id_
    key = key_
    value = value_


func model() -> Gs2AsyncResult:
    var pair = Gs2NewsSetCookieRequestEntryCache.get_cache(
        _gs2.cache,
        namespace_name,
        user_id,
        key,
        value,
        null
    )
    if pair[1]:
        return Gs2AsyncResult.new(pair[0], null)
    return Gs2AsyncResult.new(null, null)


func invalidate() -> void:
    Gs2NewsSetCookieRequestEntryCache.delete_cache(
        _gs2.cache,
        namespace_name,
        user_id,
        key,
        value,
        null
    )


func subscribe_model(callback: Callable) -> int:
    return _gs2.cache.subscribe(
        "Gs2NewsSetCookieRequestEntry",
        Gs2NewsSetCookieRequestEntryCache.cache_parent_key(
            namespace_name,
            user_id,
            null
        ),
        Gs2NewsSetCookieRequestEntryCache.cache_key(
            key,
            value
        ),
        callback,
        func(): await model()
    )


func unsubscribe_model(callback_id: int) -> void:
    _gs2.cache.unsubscribe(
        "Gs2NewsSetCookieRequestEntry",
        Gs2NewsSetCookieRequestEntryCache.cache_parent_key(
            namespace_name,
            user_id,
            null
        ),
        Gs2NewsSetCookieRequestEntryCache.cache_key(
            key,
            value
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