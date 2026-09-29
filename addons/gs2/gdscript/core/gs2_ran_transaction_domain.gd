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

class_name Gs2RanTransactionDomain
extends Gs2TransactionDomain


var _next_transactions: Array = []
var _error: Gs2Exception


func _init(gs2_, access_token_, user_id_, transaction_id_, result, metadata):
    super._init(gs2_, access_token_, user_id_, [])
    transaction_id = transaction_id_
    if result != null:
        _error = _handle_transaction_result(result)
    if _error == null and metadata != null:
        _error = _handle_metadata(metadata)


func _handle_transaction_result(result):
    var time_offset = _time_offset()
    Gs2DistributorTransactionResultCache.put_cache(
        Gs2DistributorTransactionResult.from_dict(result.to_dict()),
        gs2.cache,
        gs2.transaction_configuration.namespace_name,
        user_id,
        result.transaction_id,
        time_offset
    )
    for action_result in (result.verify_results if result.verify_results != null else []):
        var code = action_result.status_code if action_result.status_code != null else 999
        if int(code / 100.0) != 2:
            return Gs2Exception.extract_error(action_result.verify_result, code)
    for action_result in (result.consume_results if result.consume_results != null else []):
        var code = action_result.status_code if action_result.status_code != null else 999
        if int(code / 100.0) != 2:
            return Gs2Exception.extract_error(action_result.consume_result, code)
    for action_result in (result.acquire_results if result.acquire_results != null else []):
        var code = action_result.status_code if action_result.status_code != null else 999
        if int(code / 100.0) != 2:
            return Gs2Exception.extract_error(action_result.acquire_result, code)
    if result.has_error != null and result.has_error:
        for action_result in (result.acquire_results if result.acquire_results != null else []):
            if action_result.acquire_result == null or action_result.acquire_result == "":
                continue
            var acquire_json = JSON.parse_string(action_result.acquire_result)
            if acquire_json == null or not (acquire_json is Dictionary):
                continue
            var nested = acquire_json.get("transactionResult")
            if nested is String:
                nested = JSON.parse_string(nested)
            if nested != null:
                var nested_result = Gs2TransactionResult.from_dict(nested)
                if nested_result != null and nested_result.has_error != null and nested_result.has_error:
                    var nested_error = _handle_transaction_result(nested_result)
                    if nested_error != null:
                        return nested_error
        var e = Gs2UnknownException.new()
        e.status_code = 500
        var request_error = Gs2RequestError.new()
        request_error.component = "transaction"
        request_error.message = "Ran transaction failed."
        e.errors.append(request_error)
        return e
    if result.verify_results != null:
        for i in result.verify_results.size():
            var action_result = result.verify_results[i]
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
            gs2.transaction_configuration.acquire_action_event_handler.call(
                gs2.cache,
                transaction_id,
                time_offset,
                action_result.action,
                action_result.acquire_request,
                action_result.acquire_result
            )
            _append_next_transactions(action_result.action, action_result.acquire_result, _next_transactions)
    return null


func _handle_metadata(metadata):
    var time_offset = _time_offset()
    if metadata == null or metadata.script_transaction_results == null:
        return null
    for script_result in metadata.script_transaction_results:
        if script_result == null or script_result.transaction_result == null:
            continue
        var transaction_result = script_result.transaction_result
        if transaction_result.verify_results != null:
            for i in transaction_result.verify_results.size():
                var action_result = transaction_result.verify_results[i]
                var code = action_result.status_code if action_result.status_code != null else 999
                if int(code / 100.0) != 2:
                    return Gs2Exception.extract_error(action_result.verify_result, code)
                gs2.transaction_configuration.verify_action_event_handler.call(
                    gs2.cache,
                    "%s[%d]" % [str(transaction_id), i],
                    time_offset,
                    action_result.action,
                    action_result.verify_request,
                    action_result.verify_result
                )
        if transaction_result.consume_results != null:
            for i in transaction_result.consume_results.size():
                var action_result = transaction_result.consume_results[i]
                var code = action_result.status_code if action_result.status_code != null else 999
                if int(code / 100.0) != 2:
                    return Gs2Exception.extract_error(action_result.consume_result, code)
                gs2.transaction_configuration.consume_action_event_handler.call(
                    gs2.cache,
                    "%s[%d]" % [str(transaction_id), i],
                    time_offset,
                    action_result.action,
                    action_result.consume_request,
                    action_result.consume_result
                )
        if transaction_result.acquire_results != null:
            for action_result in transaction_result.acquire_results:
                var code = action_result.status_code if action_result.status_code != null else 999
                if int(code / 100.0) != 2:
                    return Gs2Exception.extract_error(action_result.acquire_result, code)
                gs2.transaction_configuration.acquire_action_event_handler.call(
                    gs2.cache,
                    transaction_id,
                    time_offset,
                    action_result.action,
                    action_result.acquire_request,
                    action_result.acquire_result
                )
                _append_next_transactions(action_result.action, action_result.acquire_result, _next_transactions)
    return null


func wait(all: bool = false) -> Gs2AsyncResult:
    if _error != null:
        return Gs2AsyncResult.new(null, _error)
    var next_transactions = []
    for transaction in _next_transactions:
        var next_result = await transaction.wait(all)
        if next_result.error != null:
            return next_result
        if next_result.result != null:
            next_transactions.append(next_result.result)
    if next_transactions.size() == 0:
        return Gs2AsyncResult.new(null, null)
    return Gs2AsyncResult.new(Gs2TransactionDomain.new(gs2, access_token, _user_id, next_transactions), null)
