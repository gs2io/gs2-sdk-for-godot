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
## AutoTransaction の結果を待つ上限。0 以下を指定すると上限なしで待機する。
var auto_transaction_result_timeout_msec: int = 3 * 60 * 1000
# Callable(cache, transaction_id, time_offset, action, request, result)
var verify_action_event_handler: Callable
var consume_action_event_handler: Callable
var acquire_action_event_handler: Callable
