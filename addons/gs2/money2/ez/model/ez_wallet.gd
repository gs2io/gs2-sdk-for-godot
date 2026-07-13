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
class_name Gs2Money2EzWallet
extends RefCounted


var slot = 0
var summary = null
var shared_free_currency = false
var updated_at = 0


func with_slot(v) -> Gs2Money2EzWallet:
    slot = v
    return self


func with_summary(v) -> Gs2Money2EzWallet:
    summary = v
    return self


func with_shared_free_currency(v) -> Gs2Money2EzWallet:
    shared_free_currency = v
    return self


func with_updated_at(v) -> Gs2Money2EzWallet:
    updated_at = v
    return self


func to_model() -> Gs2Money2Wallet:
    var ret = Gs2Money2Wallet.new()
    ret.slot = slot
    ret.summary = null if summary == null else summary.to_model()
    ret.shared_free_currency = shared_free_currency
    ret.updated_at = updated_at
    return ret


static func from_model(model) -> Gs2Money2EzWallet:
    var ret = Gs2Money2EzWallet.new()
    ret.slot = 0 if model.slot == null else model.slot
    ret.summary = null if model.summary == null else Gs2Money2EzWalletSummary.from_model(model.summary)
    ret.shared_free_currency = false if model.shared_free_currency == null else model.shared_free_currency
    ret.updated_at = 0 if model.updated_at == null else model.updated_at
    return ret