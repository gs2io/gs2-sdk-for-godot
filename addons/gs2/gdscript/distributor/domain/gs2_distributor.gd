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
class_name Gs2Distributor
extends RefCounted

signal auto_run_stamp_sheet_notification(
    notification: Gs2DistributorAutoRunStampSheetNotification
)

signal auto_run_transaction_notification(
    notification: Gs2DistributorAutoRunTransactionNotification
)


static var _completed_stamp_sheets: Array = []


var _gs2: Gs2Domain
var _client: Gs2DistributorRestClient


func _init(
    gs2: Gs2Domain
):
    _gs2 = gs2
    _client = Gs2DistributorRestClient.new(gs2.rest_session)


func create_namespace(
    request: Gs2DistributorCreateNamespaceRequest
) -> Gs2AsyncResult:
    var async_result = await Gs2DistributorCreateNamespaceMethodCache.invoke(
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
    var domain = Gs2DistributorNamespaceDomain.new(
        _gs2,
        (null if ref == null else ref.name)
    )
    return Gs2AsyncResult.new(domain, null)


func namespaces(
    name_prefix = null
) -> Gs2DistributorDescribeNamespacesIterator:
    return Gs2DistributorDescribeNamespacesIterator.new(
        _gs2,
        _client,
        name_prefix
    )


func subscribe_namespaces(
    callback: Callable,
    name_prefix = null
) -> int:
    return _gs2.cache.list_subscribe(
        "Gs2DistributorNamespace",
        Gs2DistributorNamespaceCache.cache_parent_key(
            null
        ),
        callback
    )


func unsubscribe_namespaces(
    callback_id: int,
    name_prefix = null
) -> void:
    _gs2.cache.list_unsubscribe(
        "Gs2DistributorNamespace",
        Gs2DistributorNamespaceCache.cache_parent_key(
            null
        ),
        callback_id
    )


func invalidate_namespaces(
    name_prefix = null
) -> void:
    _gs2.cache.clear_list_cache(
        "Gs2DistributorNamespace",
        Gs2DistributorNamespaceCache.cache_parent_key(
            null
        )
    )
func namespace_(
    namespace_name
) -> Gs2DistributorNamespaceDomain:
    return Gs2DistributorNamespaceDomain.new(
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
    if action == "AutoRunStampSheetNotification":
        var notification: Gs2DistributorAutoRunStampSheetNotification = Gs2DistributorAutoRunStampSheetNotification.from_dict(data)
        if notification == null:
            return
        _completed_stamp_sheets.append(notification)
        auto_run_stamp_sheet_notification.emit(notification)
        return
    if action == "AutoRunTransactionNotification":
        var notification: Gs2DistributorAutoRunTransactionNotification = Gs2DistributorAutoRunTransactionNotification.from_dict(data)
        if notification == null:
            return
        _completed_stamp_sheets.append(notification)
        auto_run_transaction_notification.emit(notification)
        return
    pass


static func dispatch(
    gs2: Gs2Domain,
    access_token
) -> Gs2AsyncResult:
    if _completed_stamp_sheets.size() == 0:
        return Gs2AsyncResult.new(null, null)
    var copied = _completed_stamp_sheets.duplicate()
    _completed_stamp_sheets.clear()
    for completed_stamp_sheet in copied:
        var auto_run = Gs2AutoStampSheetAccessTokenDomain.new(
            gs2,
            access_token,
            completed_stamp_sheet.transaction_id
        )
        var run_result = await auto_run.run()
        if run_result.error != null and not (run_result.error is Gs2NotFoundException):
            return run_result
    return Gs2AsyncResult.new(null, null)