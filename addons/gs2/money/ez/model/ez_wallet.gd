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
class_name Gs2MoneyEzWallet
extends RefCounted


var slot = 0
var paid = 0
var free_ = 0
var share_free = false
var updated_at = 0


func with_slot(v) -> Gs2MoneyEzWallet:
    slot = v
    return self


func with_paid(v) -> Gs2MoneyEzWallet:
    paid = v
    return self


func with_free(v) -> Gs2MoneyEzWallet:
    free_ = v
    return self


func with_share_free(v) -> Gs2MoneyEzWallet:
    share_free = v
    return self


func with_updated_at(v) -> Gs2MoneyEzWallet:
    updated_at = v
    return self


func to_model() -> Gs2MoneyWallet:
    var ret = Gs2MoneyWallet.new()
    ret.slot = slot
    ret.paid = paid
    ret.free_ = free_
    ret.share_free = share_free
    ret.updated_at = updated_at
    return ret


static func from_model(model) -> Gs2MoneyEzWallet:
    var ret = Gs2MoneyEzWallet.new()
    ret.slot = 0 if model.slot == null else model.slot
    ret.paid = 0 if model.paid == null else model.paid
    ret.free_ = 0 if model.free_ == null else model.free_
    ret.share_free = false if model.share_free == null else model.share_free
    ret.updated_at = 0 if model.updated_at == null else model.updated_at
    return ret