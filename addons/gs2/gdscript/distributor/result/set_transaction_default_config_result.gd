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
class_name Gs2DistributorSetTransactionDefaultConfigResult
extends RefCounted


var new_context_stack = null
var metadata = null


func with_new_context_stack(v) -> Gs2DistributorSetTransactionDefaultConfigResult:
    new_context_stack = v
    return self


func with_metadata(v) -> Gs2DistributorSetTransactionDefaultConfigResult:
    metadata = v
    return self


static func from_dict(data) -> Gs2DistributorSetTransactionDefaultConfigResult:
    if data == null:
        return null
    var ret = Gs2DistributorSetTransactionDefaultConfigResult.new()
    ret.new_context_stack = null if data.get("newContextStack") == null else str(data.get("newContextStack"))
    ret.metadata = null if data.get("metadata") == null else Gs2ResultMetadata.from_dict(data.get("metadata"))
    return ret


func to_dict() -> Dictionary:
    var ret = {}
    ret["newContextStack"] = new_context_stack
    ret["metadata"] = null if metadata == null else metadata.to_dict()
    return ret