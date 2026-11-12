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

class_name Gs2AutoTransactionDomain
extends Gs2TransactionDomain


static var _handled: Dictionary = {}

var _namespace_name = null


func _init(gs2_, access_token_, user_id_, transaction_id_, namespace_name_ = null):
    super._init(gs2_, access_token_, user_id_, [])
    transaction_id = transaction_id_
    _namespace_name = namespace_name_


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


func _handle_result(result) -> Gs2AsyncResult:
    var skip_callback = _skip_callback()
    var time_offset = _time_offset()
    for i in (result.verify_results.size() if result.verify_results != null else 0):
        var action_result = result.verify_results[i]
        var code = action_result.status_code if action_result.status_code != null else 999
        if int(code / 100.0) != 2:
            return Gs2AsyncResult.new(null, gs2.transaction_configuration.extract_verify_error(gs2.cache, "%s[%d]" % [str(transaction_id), i], time_offset, action_result.action, action_result.verify_request, action_result.verify_result, code, not skip_callback))
    for action_result in (result.consume_results if result.consume_results != null else []):
        var code = action_result.status_code if action_result.status_code != null else 999
        if int(code / 100.0) != 2:
            return Gs2AsyncResult.new(null, Gs2Exception.extract_error_for_action(action_result.action, action_result.consume_result, code))
    for action_result in (result.acquire_results if result.acquire_results != null else []):
        var code = action_result.status_code if action_result.status_code != null else 999
        if int(code / 100.0) != 2:
            return Gs2AsyncResult.new(null, Gs2Exception.extract_error_for_action(action_result.action, action_result.acquire_result, code))
    if result.verify_results != null:
        for i in result.verify_results.size():
            var action_result = result.verify_results[i]
            if not skip_callback:
                gs2.transaction_configuration.verify_action_event_handler.call(
                    gs2.cache,
                    "%s[%d]" % [str(transaction_id), i],
                    time_offset,
                    action_result.action,
                    action_result.verify_request,
                    action_result.verify_result
                )
    if result.consume_results != null:
        for i in result.consume_results.size():
            var action_result = result.consume_results[i]
            if not skip_callback:
                gs2.transaction_configuration.consume_action_event_handler.call(
                    gs2.cache,
                    "%s[%d]" % [str(transaction_id), i],
                    time_offset,
                    action_result.action,
                    action_result.consume_request,
                    action_result.consume_result
                )
    if result.acquire_results != null:
        for action_result in result.acquire_results:
            if not skip_callback:
                gs2.transaction_configuration.acquire_action_event_handler.call(
                    gs2.cache,
                    transaction_id,
                    time_offset,
                    action_result.action,
                    action_result.acquire_request,
                    action_result.acquire_result
                )
            var next_transactions = []
            _append_next_transactions(action_result.action, action_result.acquire_result, next_transactions)
            if next_transactions.size() > 0:
                return Gs2AsyncResult.new(Gs2TransactionDomain.new(gs2, access_token, _user_id, next_transactions), null)
    return Gs2AsyncResult.new(null, null)


func wait(all: bool = false) -> Gs2AsyncResult:
    var begin = Gs2CacheDatabase.now_ms()
    var timeout_msec = gs2.transaction_configuration.auto_transaction_result_timeout_msec
    while true:
        if timeout_msec > 0 and Gs2CacheDatabase.now_ms() - begin > timeout_msec:
            return Gs2AsyncResult.new(null, Gs2TransactionDomainFactory.timeout_error(
                "Failed to retrieve transaction results, either because there is some failure in GS2, or the GS2-Gateway used to notify the GS2-Distributor used to execute the transaction is not yet configured, or the GS2-Gateway has a user ID to receive notifications The configuration API may not have been invoked."
            ))
        var namespace_name = _namespace_name
        if namespace_name == null:
            namespace_name = gs2.transaction_configuration.namespace_name
        if namespace_name == null:
            namespace_name = "default"
        var user_domain = null
        if access_token != null:
            user_domain = Gs2Distributor.new(gs2).namespace_(namespace_name).access_token(access_token)
        else:
            user_domain = Gs2Distributor.new(gs2).namespace_(namespace_name).user(_user_id)
        var domain = user_domain.transaction_result(transaction_id)
        var model_result = await domain.model()
        if model_result.error != null:
            domain.invalidate()
            if not Gs2TransactionDomainFactory.recommend_auto_retry(model_result.error):
                return model_result
            await Gs2DomainCore.yield_frame()
            continue
        if model_result.result == null:
            domain.invalidate()
            await Gs2DomainCore.wait_ms(Gs2Constant.RETRY_WAIT)
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
