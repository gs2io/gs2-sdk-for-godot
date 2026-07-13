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
class_name Gs2ExchangeEzAcquireResult
extends RefCounted


var item = null
var transaction_id = null
var stamp_sheet = null
var stamp_sheet_encryption_key_id = null
var auto_run_stamp_sheet = false
var atomic_commit = false
var transaction = null
var transaction_result = null


static func from_model(model) -> Gs2ExchangeEzAcquireResult:
    var ret = Gs2ExchangeEzAcquireResult.new()
    ret.item = null if model.item == null else Gs2ExchangeEzAwait.from_model(model.item)
    ret.transaction_id = model.transaction_id
    ret.stamp_sheet = model.stamp_sheet
    ret.stamp_sheet_encryption_key_id = model.stamp_sheet_encryption_key_id
    ret.auto_run_stamp_sheet = false if model.auto_run_stamp_sheet == null else model.auto_run_stamp_sheet
    ret.atomic_commit = false if model.atomic_commit == null else model.atomic_commit
    ret.transaction = model.transaction
    ret.transaction_result = null if model.transaction_result == null else Gs2EzTransactionResult.from_model(model.transaction_result)
    return ret