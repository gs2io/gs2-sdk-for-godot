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
class_name Gs2DistributorDistributeWithoutOverflowProcessResult
extends RefCounted


var distribute_resource = null
var result = null
var metadata = null


func with_distribute_resource(v) -> Gs2DistributorDistributeWithoutOverflowProcessResult:
    distribute_resource = v
    return self


func with_result(v) -> Gs2DistributorDistributeWithoutOverflowProcessResult:
    result = v
    return self


func with_metadata(v) -> Gs2DistributorDistributeWithoutOverflowProcessResult:
    metadata = v
    return self


static func from_dict(data) -> Gs2DistributorDistributeWithoutOverflowProcessResult:
    if data == null:
        return null
    var ret = Gs2DistributorDistributeWithoutOverflowProcessResult.new()
    ret.distribute_resource = null if data.get("distributeResource") == null else Gs2DistributorDistributeResource.from_dict(data.get("distributeResource"))
    ret.result = null if data.get("result") == null else str(data.get("result"))
    ret.metadata = null if data.get("metadata") == null else Gs2ResultMetadata.from_dict(data.get("metadata"))
    return ret


func to_dict() -> Dictionary:
    var ret = {}
    ret["distributeResource"] = null if distribute_resource == null else distribute_resource.to_dict()
    ret["result"] = result
    ret["metadata"] = null if metadata == null else metadata.to_dict()
    return ret