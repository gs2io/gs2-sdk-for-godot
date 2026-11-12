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
class_name Gs2Freeze
extends RefCounted



var _gs2: Gs2DomainCore
var _client: Gs2FreezeRestClient


func _init(
    gs2: Gs2DomainCore
):
    _gs2 = gs2
    _client = Gs2FreezeRestClient.new(gs2.rest_session)


func stages(
) -> Gs2FreezeDescribeStagesIterator:
    return Gs2FreezeDescribeStagesIterator.new(
        _gs2,
        _client
    )


func subscribe_stages(
    callback: Callable
) -> int:
    return _gs2.cache.list_subscribe(
        "Gs2FreezeStage",
        Gs2FreezeStageCache.cache_parent_key(
            null
        ),
        callback
    )


func unsubscribe_stages(
    callback_id: int
) -> void:
    _gs2.cache.list_unsubscribe(
        "Gs2FreezeStage",
        Gs2FreezeStageCache.cache_parent_key(
            null
        ),
        callback_id
    )


func invalidate_stages(
) -> void:
    _gs2.cache.clear_list_cache(
        "Gs2FreezeStage",
        Gs2FreezeStageCache.cache_parent_key(
            null
        )
    )
func stage(
    stage_name
) -> Gs2FreezeStageDomain:
    return Gs2FreezeStageDomain.new(
        _gs2,
        stage_name
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