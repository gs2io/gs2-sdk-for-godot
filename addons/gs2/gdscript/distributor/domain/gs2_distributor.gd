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
static var _completed_transactions: Array = []


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
        namespace_(notification.namespace_name).user(notification.user_id) \
            .stamp_sheet_result(notification.transaction_id).invalidate()
        _completed_stamp_sheets.append(notification)
        auto_run_stamp_sheet_notification.emit(notification)
        return
    if action == "AutoRunTransactionNotification":
        var notification: Gs2DistributorAutoRunTransactionNotification = Gs2DistributorAutoRunTransactionNotification.from_dict(data)
        if notification == null:
            return
        namespace_(notification.namespace_name).user(notification.user_id) \
            .transaction_result(notification.transaction_id).invalidate()
        _completed_transactions.append(notification)
        auto_run_transaction_notification.emit(notification)
        return
    pass


func load_user_data(access_token) -> Gs2AsyncResult:
    assert(access_token != null)
    var loaded = 0
    var list_cached = {}  # "service\nkind\nparent_key" -> [service, kind, parent_key]
    var page_token = null
    while true:
        var request = Gs2DistributorDescribeUserDataRequest.new()
        request.context_stack = _gs2.default_context_stack
        request.access_token = access_token.token
        request.page_token = page_token
        request.limit = 100
        var async_result = await _client.describe_user_data(request)
        if async_result.error != null:
            return async_result
        var result = async_result.result
        if result != null and result.items != null:
            for entry in result.items:
                if entry == null:
                    continue
                var parent_key = _gs2.put_user_data(
                    entry.service,
                    entry.namespace_name,
                    access_token.user_id,
                    access_token.time_offset,
                    entry.kind,
                    entry.payload
                )
                if parent_key == null:
                    continue
                loaded += 1
                list_cached["\n".join([entry.service, entry.kind, parent_key])] = [entry.service, entry.kind, parent_key]
        page_token = null if result == null else result.next_page_token
        if page_token == null or page_token == "":
            break
    for triple in list_cached.values():
        _gs2.set_list_cached(triple[0], access_token.time_offset, triple[1], triple[2])
    return Gs2AsyncResult.new(loaded, null)


static func dispatch(
    gs2,
    access_token
) -> Gs2AsyncResult:
    if _completed_stamp_sheets.size() == 0 and _completed_transactions.size() == 0:
        return Gs2AsyncResult.new(null, null)
    var copied = []
    for v in _completed_stamp_sheets:
        if v != null and v.user_id == access_token.user_id:
            copied.append(v)
    for v in copied:
        _completed_stamp_sheets.erase(v)
    for completed_stamp_sheet in copied:
        var auto_run = Gs2AutoStampSheetAccessTokenDomain.new(
            gs2,
            access_token,
            completed_stamp_sheet.transaction_id,
            completed_stamp_sheet.namespace_name
        )
        Gs2Distributor.new(gs2).namespace_(
            completed_stamp_sheet.namespace_name
        ).access_token(access_token).stamp_sheet_result(
            completed_stamp_sheet.transaction_id
        ).invalidate()
        var run_result = await auto_run.run()
        if run_result.error != null and not (run_result.error is Gs2NotFoundException):
            return run_result
    copied = []
    for v in _completed_transactions:
        if v != null and v.user_id == access_token.user_id:
            copied.append(v)
    for v in copied:
        _completed_transactions.erase(v)
    for completed_transaction in copied:
        var auto_run = Gs2AutoTransactionDomain.new(
            gs2,
            access_token,
            null,
            completed_transaction.transaction_id,
            completed_transaction.namespace_name
        )
        Gs2Distributor.new(gs2).namespace_(
            completed_transaction.namespace_name
        ).access_token(access_token).transaction_result(
            completed_transaction.transaction_id
        ).invalidate()
        var run_result = await auto_run.wait()
        if run_result.error != null and not (run_result.error is Gs2NotFoundException):
            return run_result
    return Gs2AsyncResult.new(null, null)