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
class_name Gs2MoneyUserDomain
extends RefCounted

var _gs2: Gs2Domain
var _client: Gs2MoneyRestClient
var namespace_name: Variant = null
var user_id: Variant = null
var price: Variant = null
var next_page_token: Variant = null


func _init(
    gs2: Gs2Domain,
    namespace_name_,
    user_id_
):
    _gs2 = gs2
    _client = Gs2MoneyRestClient.new(gs2.rest_session)
    namespace_name = namespace_name_
    user_id = user_id_


func record_receipt(
    request: Gs2MoneyRecordReceiptRequest
) -> Gs2AsyncResult:
    request = request.with_context_stack(_gs2.default_context_stack if request.context_stack == null or request.context_stack == "" else request.context_stack)
    request = request.with_namespace_name(namespace_name)
    request = request.with_user_id(user_id)
    var async_result = await Gs2MoneyRecordReceiptMethodCache.invoke(
        _gs2.cache,
        user_id,
        null,
        request,
        func(): return await _client.record_receipt(request)
    )
    if async_result.error != null:
        return async_result
    var result = async_result.result
    var ref = null if result == null else result.item
    var domain = Gs2MoneyReceiptDomain.new(
        _gs2,
        namespace_name,
        (null if ref == null else ref.user_id),
        (null if ref == null else ref.transaction_id)
    )
    return Gs2AsyncResult.new(domain, null)


func revert_record_receipt(
    request: Gs2MoneyRevertRecordReceiptRequest
) -> Gs2AsyncResult:
    request = request.with_context_stack(_gs2.default_context_stack if request.context_stack == null or request.context_stack == "" else request.context_stack)
    request = request.with_namespace_name(namespace_name)
    request = request.with_user_id(user_id)
    var async_result = await Gs2MoneyRevertRecordReceiptMethodCache.invoke(
        _gs2.cache,
        user_id,
        null,
        request,
        func(): return await _client.revert_record_receipt(request)
    )
    if async_result.error != null:
        return async_result
    var result = async_result.result
    var ref = null if result == null else result.item
    var domain = Gs2MoneyReceiptDomain.new(
        _gs2,
        namespace_name,
        (null if ref == null else ref.user_id),
        (null if ref == null else ref.transaction_id)
    )
    return Gs2AsyncResult.new(domain, null)


func wallets(
    time_offset_token = null
) -> Gs2MoneyDescribeWalletsByUserIdIterator:
    return Gs2MoneyDescribeWalletsByUserIdIterator.new(
        _gs2,
        _client,
        namespace_name,
        user_id,
        time_offset_token
    )


func subscribe_wallets(
    callback: Callable
) -> int:
    return _gs2.cache.list_subscribe(
        "Gs2MoneyWallet",
        Gs2MoneyWalletCache.cache_parent_key(
            namespace_name,
            user_id,
            null
        ),
        callback
    )


func unsubscribe_wallets(
    callback_id: int
) -> void:
    _gs2.cache.list_unsubscribe(
        "Gs2MoneyWallet",
        Gs2MoneyWalletCache.cache_parent_key(
            namespace_name,
            user_id,
            null
        ),
        callback_id
    )


func invalidate_wallets(
) -> void:
    _gs2.cache.clear_list_cache(
        "Gs2MoneyWallet",
        Gs2MoneyWalletCache.cache_parent_key(
            namespace_name,
            user_id,
            null
        )
    )
func wallet(
    slot
) -> Gs2MoneyWalletDomain:
    return Gs2MoneyWalletDomain.new(
        _gs2,
        namespace_name,
        user_id,
        slot
    )


func receipts(
    slot = null,
    begin = null,
    end = null,
    time_offset_token = null
) -> Gs2MoneyDescribeReceiptsIterator:
    return Gs2MoneyDescribeReceiptsIterator.new(
        _gs2,
        _client,
        namespace_name,
        user_id,
        slot,
        begin,
        end,
        time_offset_token
    )


func subscribe_receipts(
    callback: Callable,
    slot = null,
    begin = null,
    end = null
) -> int:
    return _gs2.cache.list_subscribe(
        "Gs2MoneyReceipt",
        Gs2MoneyReceiptCache.cache_parent_key(
            namespace_name,
            user_id,
            null
        ),
        callback
    )


func unsubscribe_receipts(
    callback_id: int,
    slot = null,
    begin = null,
    end = null
) -> void:
    _gs2.cache.list_unsubscribe(
        "Gs2MoneyReceipt",
        Gs2MoneyReceiptCache.cache_parent_key(
            namespace_name,
            user_id,
            null
        ),
        callback_id
    )


func invalidate_receipts(
    slot = null,
    begin = null,
    end = null
) -> void:
    _gs2.cache.clear_list_cache(
        "Gs2MoneyReceipt",
        Gs2MoneyReceiptCache.cache_parent_key(
            namespace_name,
            user_id,
            null
        )
    )
func receipt(
    transaction_id
) -> Gs2MoneyReceiptDomain:
    return Gs2MoneyReceiptDomain.new(
        _gs2,
        namespace_name,
        user_id,
        transaction_id
    )