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
class_name Gs2TransactionConfiguration
extends RefCounted


var namespace_name: Variant = null
var auto_transaction_result_timeout_msec: int = 3 * 60 * 1000
# Callable(cache, transaction_id, time_offset, action, request, result)
var verify_action_event_handler: Callable
var consume_action_event_handler: Callable
var acquire_action_event_handler: Callable


# 検証が失敗しても、サーバーは検証した時点の状態を result に入れて返す。成功したときと同じくハンドラに渡してから失敗を返す
func extract_verify_error(cache, task_id, time_offset, action, request, body, status_code_, call_handler: bool = true) -> Gs2Exception:
    var error = Gs2Exception.extract_error_for_action(action, body, status_code_)
    if call_handler and error != null and error.result != null and verify_action_event_handler.is_valid():
        verify_action_event_handler.call(cache, task_id, time_offset, action, request, error.result)
    return error
