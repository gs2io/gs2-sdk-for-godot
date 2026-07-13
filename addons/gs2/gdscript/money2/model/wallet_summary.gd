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
class_name Gs2Money2WalletSummary
extends RefCounted


var paid = null
var free_ = null
var total = null


func with_paid(v) -> Gs2Money2WalletSummary:
    paid = v
    return self


func with_free(v) -> Gs2Money2WalletSummary:
    free_ = v
    return self


func with_total(v) -> Gs2Money2WalletSummary:
    total = v
    return self


static func from_dict(data) -> Gs2Money2WalletSummary:
    if data == null:
        return null
    var ret = Gs2Money2WalletSummary.new()
    ret.paid = null if data.get("paid") == null else int(data.get("paid"))
    ret.free_ = null if data.get("free") == null else int(data.get("free"))
    ret.total = null if data.get("total") == null else int(data.get("total"))
    return ret


func to_dict() -> Dictionary:
    var ret = {}
    ret["paid"] = paid
    ret["free"] = free_
    ret["total"] = total
    return ret