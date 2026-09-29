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
class_name Gs2Friend
extends RefCounted

signal follow_notification(
    notification: Gs2FriendFollowNotification
)

signal accept_request_notification(
    notification: Gs2FriendAcceptRequestNotification
)

signal reject_request_notification(
    notification: Gs2FriendRejectRequestNotification
)

signal delete_friend_notification(
    notification: Gs2FriendDeleteFriendNotification
)

signal receive_request_notification(
    notification: Gs2FriendReceiveRequestNotification
)

signal cancel_request_notification(
    notification: Gs2FriendCancelRequestNotification
)



var _gs2: Gs2Domain
var _client: Gs2FriendRestClient
var url: Variant = null
var upload_token: Variant = null
var upload_url: Variant = null


func _init(
    gs2: Gs2Domain
):
    _gs2 = gs2
    _client = Gs2FriendRestClient.new(gs2.rest_session)


func create_namespace(
    request: Gs2FriendCreateNamespaceRequest
) -> Gs2AsyncResult:
    var async_result = await Gs2FriendCreateNamespaceMethodCache.invoke(
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
    var domain = Gs2FriendNamespaceDomain.new(
        _gs2,
        (null if ref == null else ref.name)
    )
    return Gs2AsyncResult.new(domain, null)


func dump_user_data(
    request: Gs2FriendDumpUserDataByUserIdRequest
) -> Gs2AsyncResult:
    var async_result = await Gs2FriendDumpUserDataByUserIdMethodCache.invoke(
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
    request: Gs2FriendCheckDumpUserDataByUserIdRequest
) -> Gs2AsyncResult:
    var async_result = await Gs2FriendCheckDumpUserDataByUserIdMethodCache.invoke(
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
    request: Gs2FriendCleanUserDataByUserIdRequest
) -> Gs2AsyncResult:
    var async_result = await Gs2FriendCleanUserDataByUserIdMethodCache.invoke(
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
    request: Gs2FriendCheckCleanUserDataByUserIdRequest
) -> Gs2AsyncResult:
    var async_result = await Gs2FriendCheckCleanUserDataByUserIdMethodCache.invoke(
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
    request: Gs2FriendPrepareImportUserDataByUserIdRequest
) -> Gs2AsyncResult:
    var async_result = await Gs2FriendPrepareImportUserDataByUserIdMethodCache.invoke(
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
    request: Gs2FriendImportUserDataByUserIdRequest
) -> Gs2AsyncResult:
    var async_result = await Gs2FriendImportUserDataByUserIdMethodCache.invoke(
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
    request: Gs2FriendCheckImportUserDataByUserIdRequest
) -> Gs2AsyncResult:
    var async_result = await Gs2FriendCheckImportUserDataByUserIdMethodCache.invoke(
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
) -> Gs2FriendDescribeNamespacesIterator:
    return Gs2FriendDescribeNamespacesIterator.new(
        _gs2,
        _client,
        name_prefix
    )
func namespace_(
    namespace_name
) -> Gs2FriendNamespaceDomain:
    return Gs2FriendNamespaceDomain.new(
        _gs2,
        namespace_name
    )


static var update_profile_by_user_id_complete_callbacks: Array = []


func update_cache_from_stamp_sheet(
    transaction_id,
    time_offset,
    method: String,
    request,
    result
) -> void:
    if method == "UpdateProfileByUserId":
        var request_model = Gs2FriendUpdateProfileByUserIdRequest.from_dict(JSON.parse_string(request))
        var result_model = Gs2FriendUpdateProfileByUserIdResult.from_dict(JSON.parse_string(result))
        Gs2FriendUpdateProfileByUserIdMethodCache.put_cache(
            result_model,
            _gs2.cache,
            request_model.user_id,
            time_offset,
            request_model
        )
        for callback in update_profile_by_user_id_complete_callbacks:
            if callback is Callable and callback.is_valid():
                callback.call(transaction_id, request_model, result_model)
        return
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
    if method == "update_profile_by_user_id":
        var request_model = Gs2FriendUpdateProfileByUserIdRequest.from_dict(JSON.parse_string(job.args))
        var result_model = Gs2FriendUpdateProfileByUserIdResult.from_dict(JSON.parse_string(result.result))
        Gs2FriendUpdateProfileByUserIdMethodCache.put_cache(
            result_model,
            _gs2.cache,
            request_model.user_id,
            time_offset,
            request_model
        )
        for callback in update_profile_by_user_id_complete_callbacks:
            if callback is Callable and callback.is_valid():
                callback.call(job.job_id, request_model, result_model)
        return
    pass


func handle_notification(
    action: String,
    payload
) -> void:
    var data = JSON.parse_string(payload) if payload is String else payload
    if action == "FollowNotification":
        var notification: Gs2FriendFollowNotification = Gs2FriendFollowNotification.from_dict(data)
        if notification == null:
            return
        follow_notification.emit(notification)
        return
    if action == "AcceptRequestNotification":
        var notification: Gs2FriendAcceptRequestNotification = Gs2FriendAcceptRequestNotification.from_dict(data)
        if notification == null:
            return
        var n = notification
        _gs2.cache.clear_list_cache(
            "Gs2FriendFriendRequest",
            Gs2FriendFriendRequestCache.cache_parent_key(
                n.namespace_name,
                n.user_id,
                null
            )
        )
        _gs2.cache.clear_list_cache(
            "Gs2FriendFriend",
            Gs2FriendFriendCache.cache_parent_key(
                n.namespace_name,
                n.user_id,
                null
            )
        )
        accept_request_notification.emit(notification)
        return
    if action == "RejectRequestNotification":
        var notification: Gs2FriendRejectRequestNotification = Gs2FriendRejectRequestNotification.from_dict(data)
        if notification == null:
            return
        var n = notification
        _gs2.cache.clear_list_cache(
            "Gs2FriendFriendRequest",
            Gs2FriendFriendRequestCache.cache_parent_key(
                n.namespace_name,
                n.user_id,
                null
            )
        )
        _gs2.cache.clear_list_cache(
            "Gs2FriendFriend",
            Gs2FriendFriendCache.cache_parent_key(
                n.namespace_name,
                n.user_id,
                null
            )
        )
        reject_request_notification.emit(notification)
        return
    if action == "DeleteFriendNotification":
        var notification: Gs2FriendDeleteFriendNotification = Gs2FriendDeleteFriendNotification.from_dict(data)
        if notification == null:
            return
        var n = notification
        for with_profile in [false, true, null]:
            Gs2FriendFriendUserCache.delete_cache(
                _gs2.cache,
                n.namespace_name,
                n.user_id,
                with_profile,
                n.from_user_id,
                null
            )
            _gs2.cache.clear_list_cache(
                "Gs2FriendFriendUser",
                Gs2FriendFriendUserCache.cache_parent_key(
                    n.namespace_name,
                    n.user_id,
                    with_profile,
                    null
                )
            )
        delete_friend_notification.emit(notification)
        return
    if action == "ReceiveRequestNotification":
        var notification: Gs2FriendReceiveRequestNotification = Gs2FriendReceiveRequestNotification.from_dict(data)
        if notification == null:
            return
        var n = notification
        _gs2.cache.clear_list_cache(
            "Gs2FriendFriendRequest",
            Gs2FriendSendFriendRequestCache.cache_parent_key(
                n.namespace_name,
                n.user_id,
                null
            )
        )
        _gs2.cache.clear_list_cache(
            "Gs2FriendFriendRequest",
            Gs2FriendReceiveFriendRequestCache.cache_parent_key(
                n.namespace_name,
                n.user_id,
                null
            )
        )
        receive_request_notification.emit(notification)
        return
    if action == "CancelRequestNotification":
        var notification: Gs2FriendCancelRequestNotification = Gs2FriendCancelRequestNotification.from_dict(data)
        if notification == null:
            return
        var n = notification
        _gs2.cache.delete(
            "Gs2FriendFriendRequest",
            Gs2FriendReceiveFriendRequestCache.cache_parent_key(
                n.namespace_name,
                n.user_id,
                null
            ),
            Gs2FriendReceiveFriendRequestCache.cache_key(
                n.from_user_id
            )
        )
        _gs2.cache.clear_list_cache(
            "Gs2FriendFriendRequest",
            Gs2FriendReceiveFriendRequestCache.cache_parent_key(
                n.namespace_name,
                n.user_id,
                null
            )
        )
        cancel_request_notification.emit(notification)
        return
    pass