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
class_name Gs2ScheduleEventDomain
extends RefCounted

var _gs2: Gs2DomainCore
var _client: Gs2ScheduleRestClient
var namespace_name: Variant = null
var user_id: Variant = null
var event_name: Variant = null
var is_in_schedule: Variant = null # diff +++
var in_schedule: Variant = null
var schedule_start_at: Variant = null
var schedule_end_at: Variant = null
var is_global_schedule: Variant = null


func _init(
    gs2: Gs2DomainCore,
    namespace_name_,
    user_id_,
# diff --- start
#    event_name_
# diff --- end
# diff +++ start
    event_name_,
    is_in_schedule_ = null
# diff +++ end
):
    _gs2 = gs2
    _client = Gs2ScheduleRestClient.new(gs2.rest_session)
    namespace_name = namespace_name_
    user_id = user_id_
    event_name = event_name_
    is_in_schedule = is_in_schedule_ # diff +++


func get_(
    request: Gs2ScheduleGetEventByUserIdRequest
) -> Gs2AsyncResult:
    request = request.with_context_stack(_gs2.default_context_stack if request.context_stack == null or request.context_stack == "" else request.context_stack)
    request = request.with_namespace_name(namespace_name)
    request = request.with_event_name(event_name)
    request = request.with_is_in_schedule(is_in_schedule) # diff +++
    request = request.with_user_id(user_id)
    var async_result = await Gs2ScheduleGetEventByUserIdMethodCache.invoke(
        _gs2.cache,
        user_id,
        null,
        request,
        func(): return await _client.get_event_by_user_id(request)
    )
    if async_result.error != null:
        return async_result
    var result = async_result.result
    return Gs2AsyncResult.new(null if result == null else result.item, null)


func verify(
    request: Gs2ScheduleVerifyEventByUserIdRequest
) -> Gs2AsyncResult:
    request = request.with_context_stack(_gs2.default_context_stack if request.context_stack == null or request.context_stack == "" else request.context_stack)
    request = request.with_namespace_name(namespace_name)
    request = request.with_user_id(user_id)
    request = request.with_event_name(event_name)
    var async_result = await Gs2ScheduleVerifyEventByUserIdMethodCache.invoke(
        _gs2.cache,
        user_id,
        null,
        request,
        func(): return await _client.verify_event_by_user_id(request)
    )
    if async_result.error != null:
        return async_result
    var result = async_result.result
    var domain = self
    domain.in_schedule = null if result == null else result.in_schedule
    domain.schedule_start_at = null if result == null else result.schedule_start_at
    domain.schedule_end_at = null if result == null else result.schedule_end_at
    domain.is_global_schedule = null if result == null else result.is_global_schedule
    return Gs2AsyncResult.new(domain, null)


func model() -> Gs2AsyncResult:
    var pair = Gs2ScheduleEventCache.get_cache(
        _gs2.cache,
        namespace_name,
        user_id,
        event_name,
# diff --- start
#        null
# diff --- end
# diff +++ start
        null,
        is_in_schedule if is_in_schedule != null else true
# diff +++ end
    )
    if pair[1]:
        return Gs2AsyncResult.new(pair[0], null)
# diff +++ start
    var fetch_impl = func():
        var get_result = await get_(Gs2ScheduleGetEventByUserIdRequest.new())
        return get_result
# diff +++ end
    return await Gs2ScheduleEventCache.fetch(
        _gs2.cache,
        namespace_name,
        user_id,
        event_name,
        null,
# diff --- start
#        func():
#            var get_result = await get_(Gs2ScheduleGetEventByUserIdRequest.new())
#            return get_result
# diff --- end
# diff +++ start
        fetch_impl,
        is_in_schedule if is_in_schedule != null else true
# diff +++ end
    )


func invalidate() -> void:
    Gs2ScheduleEventCache.delete_cache(
        _gs2.cache,
        namespace_name,
        user_id,
        event_name,
# diff --- start
#        null
# diff --- end
# diff +++ start
        null,
        is_in_schedule if is_in_schedule != null else true
# diff +++ end
    )


func subscribe_model(callback: Callable) -> int:
    return _gs2.cache.subscribe(
        "Gs2ScheduleEvent",
        Gs2ScheduleEventCache.cache_parent_key(
            namespace_name,
            user_id,
            null
        ),
        Gs2ScheduleEventCache.cache_key(
# diff --- start
#            event_name
# diff --- end
# diff +++ start
            event_name,
            is_in_schedule if is_in_schedule != null else true
# diff +++ end
        ),
        callback,
        func(): await model()
    )


func unsubscribe_model(callback_id: int) -> void:
    _gs2.cache.unsubscribe(
        "Gs2ScheduleEvent",
        Gs2ScheduleEventCache.cache_parent_key(
            namespace_name,
            user_id,
            null
        ),
        Gs2ScheduleEventCache.cache_key(
# diff --- start
#            event_name
# diff --- end
# diff +++ start
            event_name,
            is_in_schedule if is_in_schedule != null else true
# diff +++ end
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
