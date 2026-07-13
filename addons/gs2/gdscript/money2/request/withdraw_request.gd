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
class_name Gs2Money2WithdrawRequest
extends Gs2Request


var namespace_name = null
var access_token = null
var slot = null
var withdraw_count = null
var paid_only = null
var duplication_avoider = null


func with_namespace_name(v) -> Gs2Money2WithdrawRequest:
    namespace_name = v
    return self


func with_access_token(v) -> Gs2Money2WithdrawRequest:
    access_token = v
    return self


func with_slot(v) -> Gs2Money2WithdrawRequest:
    slot = v
    return self


func with_withdraw_count(v) -> Gs2Money2WithdrawRequest:
    withdraw_count = v
    return self


func with_paid_only(v) -> Gs2Money2WithdrawRequest:
    paid_only = v
    return self


func with_duplication_avoider(v) -> Gs2Money2WithdrawRequest:
    duplication_avoider = v
    return self


static func from_dict(data) -> Gs2Money2WithdrawRequest:
    if data == null:
        return null
    var ret = Gs2Money2WithdrawRequest.new()
    ret.namespace_name = null if data.get("namespaceName") == null else str(data.get("namespaceName"))
    ret.access_token = null if data.get("accessToken") == null else str(data.get("accessToken"))
    ret.slot = null if data.get("slot") == null else int(data.get("slot"))
    ret.withdraw_count = null if data.get("withdrawCount") == null else int(data.get("withdrawCount"))
    ret.paid_only = null if data.get("paidOnly") == null else bool(data.get("paidOnly"))
    return ret


func to_dict() -> Dictionary:
    var ret = {}
    ret["namespaceName"] = namespace_name
    ret["accessToken"] = access_token
    ret["slot"] = slot
    ret["withdrawCount"] = withdraw_count
    ret["paidOnly"] = paid_only
    return ret