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
class_name Gs2Money2EzWalletSummary
extends RefCounted


var paid = 0
var free_ = 0
var total = 0


func with_paid(v) -> Gs2Money2EzWalletSummary:
    paid = v
    return self


func with_free(v) -> Gs2Money2EzWalletSummary:
    free_ = v
    return self


func with_total(v) -> Gs2Money2EzWalletSummary:
    total = v
    return self


func to_model() -> Gs2Money2WalletSummary:
    var ret = Gs2Money2WalletSummary.new()
    ret.paid = paid
    ret.free_ = free_
    ret.total = total
    return ret


static func from_model(model) -> Gs2Money2EzWalletSummary:
    var ret = Gs2Money2EzWalletSummary.new()
    ret.paid = 0 if model.paid == null else model.paid
    ret.free_ = 0 if model.free_ == null else model.free_
    ret.total = 0 if model.total == null else model.total
    return ret