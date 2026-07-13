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
# diff +++ start
class_name Gs2ScheduleRepeatScheduleDomain
extends RefCounted

var _gs2
var _client
var namespace_name = null
var user_id = null
var event_name = null
var in_schedule = null


func _init(
    gs2,
    namespace_name_,
    user_id_,
    event_name_,
    in_schedule_ = null
):
    _gs2 = gs2
    _client = Gs2ScheduleRestClient.new(gs2.rest_session)
    namespace_name = namespace_name_
    user_id = user_id_
    event_name = event_name_
    in_schedule = in_schedule_


func get_(
    request: Gs2ScheduleGetEventByUserIdRequest
) -> Gs2AsyncResult:
    request = request.with_context_stack(_gs2.default_context_stack if request.context_stack == null or request.context_stack == "" else request.context_stack)
    request = request.with_namespace_name(namespace_name)
    request = request.with_event_name(event_name)
    request = request.with_user_id(user_id)
    request = request.with_is_in_schedule(in_schedule)
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
    return Gs2AsyncResult.new(null if result == null else result.repeat_schedule, null)


func model() -> Gs2AsyncResult:
    var pair = Gs2ScheduleRepeatScheduleCache.get_cache(
        _gs2.cache,
        namespace_name,
        user_id,
        event_name,
        true if in_schedule == null else in_schedule
    )
    if pair[1]:
        return Gs2AsyncResult.new(pair[0], null)
    return await Gs2ScheduleRepeatScheduleCache.fetch(
        _gs2.cache,
        namespace_name,
        user_id,
        event_name,
        true if in_schedule == null else in_schedule,
        func(): return await get_(Gs2ScheduleGetEventByUserIdRequest.new())
    )


func invalidate() -> void:
    Gs2ScheduleRepeatScheduleCache.delete_cache(
        _gs2.cache,
        namespace_name,
        user_id,
        event_name
    )


func subscribe_model(callback: Callable) -> int:
    return _gs2.cache.subscribe(
        "Gs2ScheduleRepeatSchedule",
        Gs2ScheduleRepeatScheduleCache.cache_parent_key(
            namespace_name,
            user_id,
            true if in_schedule == null else in_schedule
        ),
        Gs2ScheduleRepeatScheduleCache.cache_key(
            event_name
        ),
        callback,
        func(): await model()
    )


func unsubscribe_model(callback_id: int) -> void:
    _gs2.cache.unsubscribe(
        "Gs2ScheduleRepeatSchedule",
        Gs2ScheduleRepeatScheduleCache.cache_parent_key(
            namespace_name,
            user_id,
            true if in_schedule == null else in_schedule
        ),
        Gs2ScheduleRepeatScheduleCache.cache_key(
            event_name
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
# diff +++ end
