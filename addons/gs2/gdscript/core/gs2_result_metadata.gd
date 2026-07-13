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
class_name Gs2ResultMetadata
extends RefCounted


var request_id: Variant = null
var uncommitted: Variant = null
var script_transaction_results: Variant = null


func with_request_id(v) -> Gs2ResultMetadata:
    request_id = v
    return self


func with_uncommitted(v) -> Gs2ResultMetadata:
    uncommitted = v
    return self


func with_script_transaction_results(v) -> Gs2ResultMetadata:
    script_transaction_results = v
    return self


static func from_dict(data) -> Gs2ResultMetadata:
    if data == null:
        return null
    var ret = Gs2ResultMetadata.new()
    ret.request_id = data.get("requestId")
    ret.uncommitted = data.get("uncommitted")
    ret.script_transaction_results = null if data.get("scriptTransactionResults") == null else data.get("scriptTransactionResults").map(func(v): return Gs2ScriptTransactionResult.from_dict(v))
    return ret


func to_dict() -> Dictionary:
    var ret = {}
    ret["requestId"] = request_id
    ret["uncommitted"] = uncommitted
    ret["scriptTransactionResults"] = null if script_transaction_results == null else script_transaction_results.map(func(v): return null if v == null else v.to_dict())
    return ret
