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

## サーバー側で自動実行されたスタンプシートの結果 (GS2-Distributor の StampSheetResult) を
## 待機してキャッシュへ反映する。C# の AutoStampSheetDomain / AutoStampSheetAccessTokenDomain 相当。
class_name Gs2AutoStampSheetDomain
extends Gs2TransactionDomain


const TIMEOUT_MS = 10 * 1000

static var _handled: Dictionary = {}


func _init(gs2_, access_token_, user_id_, transaction_id_):
    super._init(gs2_, access_token_, user_id_, [])
    transaction_id = transaction_id_


func _skip_callback() -> bool:
    if _handled.has(transaction_id):
        var now = Gs2CacheDatabase.now_ms()
        var filtered = {}
        for k in _handled:
            if _handled[k] >= now:
                filtered[k] = _handled[k]
        _handled = filtered
        return true
    _handled[transaction_id] = Gs2CacheDatabase.now_ms() + 3 * 60 * 1000
    return false


# 戻り値: Gs2AsyncResult (result = 後続の Gs2TransactionDomain / null)
func _handle_result(result) -> Gs2AsyncResult:
    var skip_callback = _skip_callback()
    var time_offset = _time_offset()
    if result.verify_task_requests != null:
        for i in result.verify_task_requests.size():
            var verify_task = result.verify_task_requests[i]
            if result.verify_task_results != null and i < result.verify_task_results.size():
                var code = result.verify_task_result_codes[i] if result.verify_task_result_codes != null and i < result.verify_task_result_codes.size() and result.verify_task_result_codes[i] != null else 999
                if int(code / 100.0) != 2:
                    return Gs2AsyncResult.new(null, Gs2Exception.extract_error(result.verify_task_results[i], code))
                if not skip_callback:
                    gs2.transaction_configuration.consume_action_event_handler.call(
                        gs2.cache,
                        "%s[%d]" % [str(transaction_id), i],
                        time_offset,
                        verify_task.action,
                        verify_task.request,
                        result.verify_task_results[i]
                    )
    if result.task_requests != null:
        for i in result.task_requests.size():
            var stamp_task = result.task_requests[i]
            if result.task_results != null and i < result.task_results.size():
                var code = result.task_result_codes[i] if result.task_result_codes != null and i < result.task_result_codes.size() and result.task_result_codes[i] != null else 999
                if int(code / 100.0) != 2:
                    return Gs2AsyncResult.new(null, Gs2Exception.extract_error(result.task_results[i], code))
                if not skip_callback:
                    gs2.transaction_configuration.consume_action_event_handler.call(
                        gs2.cache,
                        "%s[%d]" % [str(transaction_id), i],
                        time_offset,
                        stamp_task.action,
                        stamp_task.request,
                        result.task_results[i]
                    )
    if result.sheet_result != null:
        var code = result.sheet_result_code if result.sheet_result_code != null else 999
        if int(code / 100.0) != 2:
            return Gs2AsyncResult.new(null, Gs2Exception.extract_error(result.sheet_result, code))
        if not skip_callback:
            gs2.transaction_configuration.acquire_action_event_handler.call(
                gs2.cache,
                transaction_id,
                time_offset,
                result.sheet_request.action,
                result.sheet_request.request,
                result.sheet_result
            )
        var next_transactions = []
        _append_next_transactions(result.sheet_request.action, result.sheet_result, next_transactions)
        if next_transactions.size() > 0:
            return Gs2AsyncResult.new(Gs2TransactionDomain.new(gs2, access_token, _user_id, next_transactions), null)
    return Gs2AsyncResult.new(null, null)


func wait(all: bool = false) -> Gs2AsyncResult:
    var begin = Gs2CacheDatabase.now_ms()
    while true:
        if Gs2CacheDatabase.now_ms() - begin > TIMEOUT_MS:
            return Gs2AsyncResult.new(null, Gs2TransactionDomainFactory.timeout_error(
                "Failed to retrieve transaction results, either because there is some failure in GS2, or the GS2-Gateway used to notify the GS2-Distributor used to execute the transaction is not yet configured, or the GS2-Gateway has a user ID to receive notifications The configuration API may not have been invoked."
            ))
        var namespace_name = gs2.transaction_configuration.namespace_name
        if namespace_name == null:
            namespace_name = "default"
        var user_domain = null
        if access_token != null:
            user_domain = Gs2Distributor.new(gs2).namespace_(namespace_name).access_token(access_token)
        else:
            user_domain = Gs2Distributor.new(gs2).namespace_(namespace_name).user(_user_id)
        var domain = user_domain.stamp_sheet_result(transaction_id)
        var model_result = await domain.model()
        if model_result.error != null:
            domain.invalidate()
            if not Gs2TransactionDomainFactory.recommend_auto_retry(model_result.error):
                return model_result
            await Gs2Domain.yield_frame()
            continue
        if model_result.result == null:
            await Gs2Domain.yield_frame()
            if access_token != null:
                var dispatch_result = await Gs2Distributor.dispatch(gs2, access_token)
                if dispatch_result.error != null:
                    return dispatch_result
            continue
        var transaction_result = _handle_result(model_result.result)
        if transaction_result.error != null:
            return transaction_result
        if all and transaction_result.result != null:
            return await transaction_result.result.wait(true)
        return transaction_result
    return Gs2AsyncResult.new(null, null)
