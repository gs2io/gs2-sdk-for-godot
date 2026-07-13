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
class_name Gs2Guild
extends RefCounted

signal receive_request_notification(
    notification: Gs2GuildReceiveRequestNotification
)

signal remove_request_notification(
    notification: Gs2GuildRemoveRequestNotification
)

signal change_notification(
    notification: Gs2GuildChangeNotification
)

signal join_notification(
    notification: Gs2GuildJoinNotification
)

signal leave_notification(
    notification: Gs2GuildLeaveNotification
)

signal change_member_notification(
    notification: Gs2GuildChangeMemberNotification
)



var _gs2: Gs2Domain
var _client: Gs2GuildRestClient
var url: Variant = null
var upload_token: Variant = null
var upload_url: Variant = null


func _init(
    gs2: Gs2Domain
):
    _gs2 = gs2
    _client = Gs2GuildRestClient.new(gs2.rest_session)


func create_namespace(
    request: Gs2GuildCreateNamespaceRequest
) -> Gs2AsyncResult:
    var async_result = await Gs2GuildCreateNamespaceMethodCache.invoke(
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
    var domain = Gs2GuildNamespaceDomain.new(
        _gs2,
        (null if ref == null else ref.name)
    )
    return Gs2AsyncResult.new(domain, null)


func dump_user_data(
    request: Gs2GuildDumpUserDataByUserIdRequest
) -> Gs2AsyncResult:
    var async_result = await Gs2GuildDumpUserDataByUserIdMethodCache.invoke(
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
    request: Gs2GuildCheckDumpUserDataByUserIdRequest
) -> Gs2AsyncResult:
    var async_result = await Gs2GuildCheckDumpUserDataByUserIdMethodCache.invoke(
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
    request: Gs2GuildCleanUserDataByUserIdRequest
) -> Gs2AsyncResult:
    var async_result = await Gs2GuildCleanUserDataByUserIdMethodCache.invoke(
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
    request: Gs2GuildCheckCleanUserDataByUserIdRequest
) -> Gs2AsyncResult:
    var async_result = await Gs2GuildCheckCleanUserDataByUserIdMethodCache.invoke(
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
    request: Gs2GuildPrepareImportUserDataByUserIdRequest
) -> Gs2AsyncResult:
    var async_result = await Gs2GuildPrepareImportUserDataByUserIdMethodCache.invoke(
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
    request: Gs2GuildImportUserDataByUserIdRequest
) -> Gs2AsyncResult:
    var async_result = await Gs2GuildImportUserDataByUserIdMethodCache.invoke(
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
    request: Gs2GuildCheckImportUserDataByUserIdRequest
) -> Gs2AsyncResult:
    var async_result = await Gs2GuildCheckImportUserDataByUserIdMethodCache.invoke(
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
) -> Gs2GuildDescribeNamespacesIterator:
    return Gs2GuildDescribeNamespacesIterator.new(
        _gs2,
        _client,
        name_prefix
    )


func subscribe_namespaces(
    callback: Callable,
    name_prefix = null
) -> int:
    return _gs2.cache.list_subscribe(
        "Gs2GuildNamespace",
        Gs2GuildNamespaceCache.cache_parent_key(
            null
        ),
        callback
    )


func unsubscribe_namespaces(
    callback_id: int,
    name_prefix = null
) -> void:
    _gs2.cache.list_unsubscribe(
        "Gs2GuildNamespace",
        Gs2GuildNamespaceCache.cache_parent_key(
            null
        ),
        callback_id
    )


func invalidate_namespaces(
    name_prefix = null
) -> void:
    _gs2.cache.clear_list_cache(
        "Gs2GuildNamespace",
        Gs2GuildNamespaceCache.cache_parent_key(
            null
        )
    )
func namespace_(
    namespace_name
) -> Gs2GuildNamespaceDomain:
    return Gs2GuildNamespaceDomain.new(
        _gs2,
        namespace_name
    )


static var increase_maximum_current_maximum_member_count_by_guild_name_complete_callbacks: Array = []


static var set_maximum_current_maximum_member_count_by_guild_name_complete_callbacks: Array = []


func update_cache_from_stamp_sheet(
    transaction_id,
    time_offset,
    method: String,
    request,
    result
) -> void:
    if method == "IncreaseMaximumCurrentMaximumMemberCountByGuildName":
        var request_model = Gs2GuildIncreaseMaximumCurrentMaximumMemberCountByGuildNameRequest.from_dict(JSON.parse_string(request))
        var result_model = Gs2GuildIncreaseMaximumCurrentMaximumMemberCountByGuildNameResult.from_dict(JSON.parse_string(result))
        Gs2GuildIncreaseMaximumCurrentMaximumMemberCountByGuildNameMethodCache.put_cache(
            result_model,
            _gs2.cache,
            request_model.guild_name,
            time_offset,
            request_model
        )
        for callback in increase_maximum_current_maximum_member_count_by_guild_name_complete_callbacks:
            if callback is Callable and callback.is_valid():
                callback.call(transaction_id, request_model, result_model)
        return
    if method == "SetMaximumCurrentMaximumMemberCountByGuildName":
        var request_model = Gs2GuildSetMaximumCurrentMaximumMemberCountByGuildNameRequest.from_dict(JSON.parse_string(request))
        var result_model = Gs2GuildSetMaximumCurrentMaximumMemberCountByGuildNameResult.from_dict(JSON.parse_string(result))
        Gs2GuildSetMaximumCurrentMaximumMemberCountByGuildNameMethodCache.put_cache(
            result_model,
            _gs2.cache,
            request_model.guild_name,
            time_offset,
            request_model
        )
        for callback in set_maximum_current_maximum_member_count_by_guild_name_complete_callbacks:
            if callback is Callable and callback.is_valid():
                callback.call(transaction_id, request_model, result_model)
        return
    pass


static var decrease_maximum_current_maximum_member_count_by_guild_name_complete_callbacks: Array = []


func update_cache_from_stamp_task(
    task_id,
    time_offset,
    method: String,
    request,
    result
) -> void:
    if method == "DecreaseMaximumCurrentMaximumMemberCountByGuildName":
        var request_model = Gs2GuildDecreaseMaximumCurrentMaximumMemberCountByGuildNameRequest.from_dict(JSON.parse_string(request))
        var result_model = Gs2GuildDecreaseMaximumCurrentMaximumMemberCountByGuildNameResult.from_dict(JSON.parse_string(result))
        Gs2GuildDecreaseMaximumCurrentMaximumMemberCountByGuildNameMethodCache.put_cache(
            result_model,
            _gs2.cache,
            request_model.guild_name,
            time_offset,
            request_model
        )
        for callback in decrease_maximum_current_maximum_member_count_by_guild_name_complete_callbacks:
            if callback is Callable and callback.is_valid():
                callback.call(task_id, request_model, result_model)
        return
    pass


func update_cache_from_job_result(
    method: String,
    time_offset,
    job,
    result
) -> void:
    if method == "increase_maximum_current_maximum_member_count_by_guild_name":
        var request_model = Gs2GuildIncreaseMaximumCurrentMaximumMemberCountByGuildNameRequest.from_dict(JSON.parse_string(job.args))
        var result_model = Gs2GuildIncreaseMaximumCurrentMaximumMemberCountByGuildNameResult.from_dict(JSON.parse_string(result.result))
        Gs2GuildIncreaseMaximumCurrentMaximumMemberCountByGuildNameMethodCache.put_cache(
            result_model,
            _gs2.cache,
            request_model.guild_name,
            time_offset,
            request_model
        )
        for callback in increase_maximum_current_maximum_member_count_by_guild_name_complete_callbacks:
            if callback is Callable and callback.is_valid():
                callback.call(job.job_id, request_model, result_model)
        return
    if method == "set_maximum_current_maximum_member_count_by_guild_name":
        var request_model = Gs2GuildSetMaximumCurrentMaximumMemberCountByGuildNameRequest.from_dict(JSON.parse_string(job.args))
        var result_model = Gs2GuildSetMaximumCurrentMaximumMemberCountByGuildNameResult.from_dict(JSON.parse_string(result.result))
        Gs2GuildSetMaximumCurrentMaximumMemberCountByGuildNameMethodCache.put_cache(
            result_model,
            _gs2.cache,
            request_model.guild_name,
            time_offset,
            request_model
        )
        for callback in set_maximum_current_maximum_member_count_by_guild_name_complete_callbacks:
            if callback is Callable and callback.is_valid():
                callback.call(job.job_id, request_model, result_model)
        return
    pass


func handle_notification(
    action: String,
    payload
) -> void:
    var data = JSON.parse_string(payload) if payload is String else payload
    if action == "ReceiveRequestNotification":
        var notification: Gs2GuildReceiveRequestNotification = Gs2GuildReceiveRequestNotification.from_dict(data)
        if notification == null:
            return
        var n = notification
        _gs2.cache.clear_list_cache(
            "Gs2GuildReceiveMemberRequest",
            Gs2GuildReceiveMemberRequestCache.cache_parent_key(
                n.namespace_name,
                n.guild_model_name,
                n.guild_name,
                null
            )
        )
        receive_request_notification.emit(notification)
        return
    if action == "RemoveRequestNotification":
        var notification: Gs2GuildRemoveRequestNotification = Gs2GuildRemoveRequestNotification.from_dict(data)
        if notification == null:
            return
        var n = notification
        Gs2GuildReceiveMemberRequestCache.delete_cache(
            _gs2.cache,
            n.namespace_name,
            n.guild_model_name,
            n.guild_name,
            n.from_user_id,
            null
        )
        Gs2GuildSendMemberRequestCache.delete_cache(
            _gs2.cache,
            n.namespace_name,
            n.from_user_id,
            n.guild_model_name,
            n.guild_name,
            null
        )
        _gs2.cache.clear_list_cache(
            "Gs2GuildReceiveMemberRequest",
            Gs2GuildReceiveMemberRequestCache.cache_parent_key(
                n.namespace_name,
                n.guild_model_name,
                n.guild_name,
                null
            )
        )
        _gs2.cache.clear_list_cache(
            "Gs2GuildSendMemberRequest",
            Gs2GuildSendMemberRequestCache.cache_parent_key(
                n.namespace_name,
                n.from_user_id,
                null
            )
        )
        remove_request_notification.emit(notification)
        return
    if action == "ChangeNotification":
        var notification: Gs2GuildChangeNotification = Gs2GuildChangeNotification.from_dict(data)
        if notification == null:
            return
        change_notification.emit(notification)
        return
    if action == "JoinNotification":
        var notification: Gs2GuildJoinNotification = Gs2GuildJoinNotification.from_dict(data)
        if notification == null:
            return
        var n = notification
        Gs2GuildGuildCache.delete_cache(
            _gs2.cache,
            n.namespace_name,
            n.guild_model_name,
            n.guild_name,
            null
        )
        join_notification.emit(notification)
        return
    if action == "LeaveNotification":
        var notification: Gs2GuildLeaveNotification = Gs2GuildLeaveNotification.from_dict(data)
        if notification == null:
            return
        var n = notification
        Gs2GuildGuildCache.delete_cache(
            _gs2.cache,
            n.namespace_name,
            n.guild_model_name,
            n.guild_name,
            null
        )
        leave_notification.emit(notification)
        return
    if action == "ChangeMemberNotification":
        var notification: Gs2GuildChangeMemberNotification = Gs2GuildChangeMemberNotification.from_dict(data)
        if notification == null:
            return
        var n = notification
        Gs2GuildGuildCache.delete_cache(
            _gs2.cache,
            n.namespace_name,
            n.guild_model_name,
            n.guild_name,
            null
        )
        change_member_notification.emit(notification)
        return
    pass