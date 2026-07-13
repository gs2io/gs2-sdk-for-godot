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
class_name Gs2Money2Receipt
extends RefCounted


var store = null
var transaction_i_d = null
var payload = null


func with_store(v) -> Gs2Money2Receipt:
    store = v
    return self


func with_transaction_i_d(v) -> Gs2Money2Receipt:
    transaction_i_d = v
    return self


func with_payload(v) -> Gs2Money2Receipt:
    payload = v
    return self


static func from_dict(data) -> Gs2Money2Receipt:
    if data == null:
        return null
    var ret = Gs2Money2Receipt.new()
    ret.store = null if data.get("Store") == null else str(data.get("Store"))
    ret.transaction_i_d = null if data.get("TransactionID") == null else str(data.get("TransactionID"))
    ret.payload = null if data.get("Payload") == null else str(data.get("Payload"))
    return ret


func to_dict() -> Dictionary:
    var ret = {}
    ret["Store"] = store
    ret["TransactionID"] = transaction_i_d
    ret["Payload"] = payload
    return ret