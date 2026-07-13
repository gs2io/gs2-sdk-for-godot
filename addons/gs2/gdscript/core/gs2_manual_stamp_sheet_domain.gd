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

## クライアント側でスタンプシートを実行する。C# の ManualStampSheetDomain 相当。
class_name Gs2ManualStampSheetDomain
extends Gs2TransactionDomain


var _stamp_sheet: Variant = null
var _stamp_sheet_encryption_key_id: Variant = null


func _init(gs2_, access_token_, user_id_, transaction_id_, stamp_sheet, stamp_sheet_encryption_key_id):
    super._init(gs2_, access_token_, user_id_, [])
    transaction_id = transaction_id_
    _stamp_sheet = stamp_sheet
    _stamp_sheet_encryption_key_id = stamp_sheet_encryption_key_id


func _handle_result(action_name, result_payload) -> Gs2AsyncResult:
    var next_transactions = []
    _append_next_transactions(action_name, result_payload, next_transactions)
    if next_transactions.size() > 0:
        return Gs2AsyncResult.new(Gs2TransactionDomain.new(gs2, access_token, _user_id, next_transactions), null)
    return Gs2AsyncResult.new(null, null)


func wait(all: bool = false) -> Gs2AsyncResult:
    var client = Gs2DistributorRestClient.new(gs2.rest_session)
    var time_offset = _time_offset()
    if _stamp_sheet == null or not (_stamp_sheet is String):
        return Gs2AsyncResult.new(null, Gs2TransactionDomainFactory.timeout_error("invalid stamp sheet"))
    var stamp_sheet_json = JSON.parse_string(_stamp_sheet)
    if stamp_sheet_json == null or not (stamp_sheet_json is Dictionary) or not stamp_sheet_json.has("body"):
        return Gs2AsyncResult.new(null, Gs2TransactionDomainFactory.timeout_error("invalid stamp sheet"))
    var stamp_sheet_payload = stamp_sheet_json["body"]
    var stamp_sheet_payload_json = JSON.parse_string(stamp_sheet_payload) if stamp_sheet_payload is String else null
    if stamp_sheet_payload_json == null or not (stamp_sheet_payload_json is Dictionary):
        return Gs2AsyncResult.new(null, Gs2TransactionDomainFactory.timeout_error("invalid stamp sheet"))
    var verify_tasks = stamp_sheet_payload_json.get("verifyTasks") if stamp_sheet_payload_json.get("verifyTasks") != null else []
    var stamp_tasks = stamp_sheet_payload_json.get("tasks") if stamp_sheet_payload_json.get("tasks") != null else []
    var context_stack = null
    for i in verify_tasks.size():
        if gs2.transaction_configuration.namespace_name == null or gs2.transaction_configuration.namespace_name == "":
            var async_result = await client.run_verify_task_without_namespace(
                Gs2DistributorRunVerifyTaskWithoutNamespaceRequest.new()
                    .with_context_stack(context_stack)
                    .with_verify_task(verify_tasks[i])
                    .with_key_id(_stamp_sheet_encryption_key_id)
            )
            if async_result.error != null:
                return async_result
            context_stack = async_result.result.context_stack
            var code = async_result.result.status_code if async_result.result.status_code != null else 999
            if int(code / 100.0) != 2:
                return Gs2AsyncResult.new(null, Gs2Exception.extract_error(async_result.result.result, code))
        else:
            var async_result = await client.run_verify_task(
                Gs2DistributorRunVerifyTaskRequest.new()
                    .with_context_stack(context_stack)
                    .with_namespace_name(gs2.transaction_configuration.namespace_name)
                    .with_verify_task(verify_tasks[i])
                    .with_key_id(_stamp_sheet_encryption_key_id)
            )
            if async_result.error != null:
                if async_result.error is Gs2NotFoundException:
                    gs2.transaction_configuration.namespace_name = null
                    return await wait(all)
                return async_result
            context_stack = async_result.result.context_stack
            var code = async_result.result.status_code if async_result.result.status_code != null else 999
            if int(code / 100.0) != 2:
                return Gs2AsyncResult.new(null, Gs2Exception.extract_error(async_result.result.result, code))
    for i in stamp_tasks.size():
        var stamp_task_json = JSON.parse_string(stamp_tasks[i])
        var stamp_task_payload_json = JSON.parse_string(stamp_task_json["body"])
        if gs2.transaction_configuration.namespace_name == null or gs2.transaction_configuration.namespace_name == "":
            var async_result = await client.run_stamp_task_without_namespace(
                Gs2DistributorRunStampTaskWithoutNamespaceRequest.new()
                    .with_context_stack(context_stack)
                    .with_stamp_task(stamp_tasks[i])
                    .with_key_id(_stamp_sheet_encryption_key_id)
            )
            if async_result.error != null:
                return async_result
            context_stack = async_result.result.context_stack
            var code = async_result.result.status_code if async_result.result.status_code != null else 999
            if int(code / 100.0) != 2:
                return Gs2AsyncResult.new(null, Gs2Exception.extract_error(async_result.result.result, code))
            gs2.transaction_configuration.consume_action_event_handler.call(
                gs2.cache,
                "%s[%d]" % [str(stamp_sheet_payload_json.get("transactionId")), i],
                time_offset,
                stamp_task_payload_json.get("action"),
                stamp_task_payload_json.get("args"),
                async_result.result.result
            )
        else:
            var async_result = await client.run_stamp_task(
                Gs2DistributorRunStampTaskRequest.new()
                    .with_context_stack(context_stack)
                    .with_namespace_name(gs2.transaction_configuration.namespace_name)
                    .with_stamp_task(stamp_tasks[i])
                    .with_key_id(_stamp_sheet_encryption_key_id)
            )
            if async_result.error != null:
                if async_result.error is Gs2NotFoundException:
                    gs2.transaction_configuration.namespace_name = null
                    return await wait(all)
                return async_result
            context_stack = async_result.result.context_stack
            var code = async_result.result.status_code if async_result.result.status_code != null else 999
            if int(code / 100.0) != 2:
                return Gs2AsyncResult.new(null, Gs2Exception.extract_error(async_result.result.result, code))
            gs2.transaction_configuration.consume_action_event_handler.call(
                gs2.cache,
                "%s[%d]" % [str(stamp_sheet_payload_json.get("transactionId")), i],
                time_offset,
                stamp_task_payload_json.get("action"),
                stamp_task_payload_json.get("args"),
                async_result.result.result
            )
    var action_name = stamp_sheet_payload_json.get("action")
    var result_payload = null
    if gs2.transaction_configuration.namespace_name == null or gs2.transaction_configuration.namespace_name == "":
        var async_result = await client.run_stamp_sheet_without_namespace(
            Gs2DistributorRunStampSheetWithoutNamespaceRequest.new()
                .with_context_stack(context_stack)
                .with_stamp_sheet(_stamp_sheet)
                .with_key_id(_stamp_sheet_encryption_key_id)
        )
        if async_result.error != null:
            return async_result
        var code = async_result.result.status_code if async_result.result.status_code != null else 999
        if int(code / 100.0) != 2:
            return Gs2AsyncResult.new(null, Gs2Exception.extract_error(async_result.result.result, code))
        gs2.transaction_configuration.acquire_action_event_handler.call(
            gs2.cache,
            stamp_sheet_payload_json.get("transactionId"),
            time_offset,
            stamp_sheet_payload_json.get("action"),
            stamp_sheet_payload_json.get("args"),
            async_result.result.result
        )
        result_payload = async_result.result.result if async_result.result.result != null and async_result.result.result != "" else "{}"
    else:
        var async_result = await client.run_stamp_sheet(
            Gs2DistributorRunStampSheetRequest.new()
                .with_context_stack(context_stack)
                .with_namespace_name(gs2.transaction_configuration.namespace_name)
                .with_stamp_sheet(_stamp_sheet)
                .with_key_id(_stamp_sheet_encryption_key_id)
        )
        if async_result.error != null:
            if async_result.error is Gs2NotFoundException:
                gs2.transaction_configuration.namespace_name = null
                return await wait(all)
            return async_result
        var code = async_result.result.status_code if async_result.result.status_code != null else 999
        if int(code / 100.0) != 2:
            return Gs2AsyncResult.new(null, Gs2Exception.extract_error(async_result.result.result, code))
        gs2.transaction_configuration.acquire_action_event_handler.call(
            gs2.cache,
            stamp_sheet_payload_json.get("transactionId"),
            time_offset,
            stamp_sheet_payload_json.get("action"),
            stamp_sheet_payload_json.get("args"),
            async_result.result.result
        )
        result_payload = async_result.result.result if async_result.result.result != null and async_result.result.result != "" else "{}"
    var transaction_result = _handle_result(action_name, result_payload)
    if transaction_result.error != null:
        return transaction_result
    if all and transaction_result.result != null:
        return await transaction_result.result.wait(true)
    return transaction_result
