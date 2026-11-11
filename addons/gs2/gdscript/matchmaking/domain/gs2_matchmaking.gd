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
class_name Gs2Matchmaking
extends RefCounted

signal join_notification(
    notification: Gs2MatchmakingJoinNotification
)

signal leave_notification(
    notification: Gs2MatchmakingLeaveNotification
)

signal complete_notification(
    notification: Gs2MatchmakingCompleteNotification
)

signal change_rating_notification(
    notification: Gs2MatchmakingChangeRatingNotification
)



var _gs2: Gs2Domain
var _client: Gs2MatchmakingRestClient
var url: Variant = null
var upload_token: Variant = null
var upload_url: Variant = null


func _init(
    gs2: Gs2Domain
):
    _gs2 = gs2
    _client = Gs2MatchmakingRestClient.new(gs2.rest_session)


func create_namespace(
    request: Gs2MatchmakingCreateNamespaceRequest
) -> Gs2AsyncResult:
    var async_result = await Gs2MatchmakingCreateNamespaceMethodCache.invoke(
        _gs2.cache,
        null,
        null,
        request,
        func(): return await _client.create_namespace(request)
    )
    if async_result.error != null:
        return async_result
    var result = async_result.result
    var ref = null if result == null else result.item
    var domain = Gs2MatchmakingNamespaceDomain.new(
        _gs2,
        (null if ref == null else ref.name)
    )
    return Gs2AsyncResult.new(domain, null)


func dump_user_data(
    request: Gs2MatchmakingDumpUserDataByUserIdRequest
) -> Gs2AsyncResult:
    var async_result = await Gs2MatchmakingDumpUserDataByUserIdMethodCache.invoke(
        _gs2.cache,
        null,
        null,
        request,
        func(): return await _client.dump_user_data_by_user_id(request)
    )
    if async_result.error != null:
        return async_result
    var result = async_result.result
    var domain = self
    return Gs2AsyncResult.new(domain, null)


func check_dump_user_data(
    request: Gs2MatchmakingCheckDumpUserDataByUserIdRequest
) -> Gs2AsyncResult:
    var async_result = await Gs2MatchmakingCheckDumpUserDataByUserIdMethodCache.invoke(
        _gs2.cache,
        null,
        null,
        request,
        func(): return await _client.check_dump_user_data_by_user_id(request)
    )
    if async_result.error != null:
        return async_result
    var result = async_result.result
    var domain = self
    self.url = null if result == null else result.url
    domain.url = self.url
    return Gs2AsyncResult.new(domain, null)


func clean_user_data(
    request: Gs2MatchmakingCleanUserDataByUserIdRequest
) -> Gs2AsyncResult:
    var async_result = await Gs2MatchmakingCleanUserDataByUserIdMethodCache.invoke(
        _gs2.cache,
        null,
        null,
        request,
        func(): return await _client.clean_user_data_by_user_id(request)
    )
    if async_result.error != null:
        return async_result
    var result = async_result.result
    var domain = self
    return Gs2AsyncResult.new(domain, null)


func check_clean_user_data(
    request: Gs2MatchmakingCheckCleanUserDataByUserIdRequest
) -> Gs2AsyncResult:
    var async_result = await Gs2MatchmakingCheckCleanUserDataByUserIdMethodCache.invoke(
        _gs2.cache,
        null,
        null,
        request,
        func(): return await _client.check_clean_user_data_by_user_id(request)
    )
    if async_result.error != null:
        return async_result
    var result = async_result.result
    var domain = self
    return Gs2AsyncResult.new(domain, null)


func prepare_import_user_data(
    request: Gs2MatchmakingPrepareImportUserDataByUserIdRequest
) -> Gs2AsyncResult:
    var async_result = await Gs2MatchmakingPrepareImportUserDataByUserIdMethodCache.invoke(
        _gs2.cache,
        null,
        null,
        request,
        func(): return await _client.prepare_import_user_data_by_user_id(request)
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


func import_user_data(
    request: Gs2MatchmakingImportUserDataByUserIdRequest
) -> Gs2AsyncResult:
    var async_result = await Gs2MatchmakingImportUserDataByUserIdMethodCache.invoke(
        _gs2.cache,
        null,
        null,
        request,
        func(): return await _client.import_user_data_by_user_id(request)
    )
    if async_result.error != null:
        return async_result
    var result = async_result.result
    var domain = self
    return Gs2AsyncResult.new(domain, null)


func check_import_user_data(
    request: Gs2MatchmakingCheckImportUserDataByUserIdRequest
) -> Gs2AsyncResult:
    var async_result = await Gs2MatchmakingCheckImportUserDataByUserIdMethodCache.invoke(
        _gs2.cache,
        null,
        null,
        request,
        func(): return await _client.check_import_user_data_by_user_id(request)
    )
    if async_result.error != null:
        return async_result
    var result = async_result.result
    var domain = self
    self.url = null if result == null else result.url
    domain.url = self.url
    return Gs2AsyncResult.new(domain, null)


func namespaces(
    name_prefix = null
) -> Gs2MatchmakingDescribeNamespacesIterator:
    return Gs2MatchmakingDescribeNamespacesIterator.new(
        _gs2,
        _client,
        name_prefix
    )


func subscribe_namespaces(
    callback: Callable,
    name_prefix = null
) -> int:
    return _gs2.cache.list_subscribe(
        "Gs2MatchmakingNamespace",
        Gs2MatchmakingNamespaceCache.cache_parent_key(
            null
        ),
        callback
    )


func unsubscribe_namespaces(
    callback_id: int,
    name_prefix = null
) -> void:
    _gs2.cache.list_unsubscribe(
        "Gs2MatchmakingNamespace",
        Gs2MatchmakingNamespaceCache.cache_parent_key(
            null
        ),
        callback_id
    )


func invalidate_namespaces(
    name_prefix = null
) -> void:
    _gs2.cache.clear_list_cache(
        "Gs2MatchmakingNamespace",
        Gs2MatchmakingNamespaceCache.cache_parent_key(
            null
        )
    )
func namespace_(
    namespace_name
) -> Gs2MatchmakingNamespaceDomain:
    return Gs2MatchmakingNamespaceDomain.new(
        _gs2,
        namespace_name
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
    if method == "VerifyIncludeParticipantByUserId":
        if result == null:
            return
        var request_model = Gs2MatchmakingVerifyIncludeParticipantByUserIdRequest.from_dict(JSON.parse_string(request))
        var result_model = Gs2MatchmakingVerifyIncludeParticipantByUserIdResult.from_dict(JSON.parse_string(result))
        Gs2MatchmakingVerifyIncludeParticipantByUserIdMethodCache.put_cache(
            result_model,
            _gs2.cache,
            request_model.user_id,
            time_offset,
            request_model
        )
        return
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
    if action == "Join":
        var notification: Gs2MatchmakingJoinNotification = Gs2MatchmakingJoinNotification.from_dict(data)
        if notification == null:
            return
        join_notification.emit(notification)
        return
    if action == "Leave":
        var notification: Gs2MatchmakingLeaveNotification = Gs2MatchmakingLeaveNotification.from_dict(data)
        if notification == null:
            return
        leave_notification.emit(notification)
        return
    if action == "Complete":
        var notification: Gs2MatchmakingCompleteNotification = Gs2MatchmakingCompleteNotification.from_dict(data)
        if notification == null:
            return
        complete_notification.emit(notification)
        return
    if action == "ChangeRatingNotification":
        var notification: Gs2MatchmakingChangeRatingNotification = Gs2MatchmakingChangeRatingNotification.from_dict(data)
        if notification == null:
            return
        var n = notification
        _gs2.cache.clear_list_cache(
            "Gs2MatchmakingRating",
            Gs2MatchmakingRatingCache.cache_parent_key(
                n.namespace_name,
                n.user_id,
                null
            )
        )
        change_rating_notification.emit(notification)
        return
    pass