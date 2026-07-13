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
class_name Gs2DistributorDistributeResult
extends RefCounted


var distribute_resource = null
var inbox_namespace_id = null
var result = null
var metadata = null


func with_distribute_resource(v) -> Gs2DistributorDistributeResult:
    distribute_resource = v
    return self


func with_inbox_namespace_id(v) -> Gs2DistributorDistributeResult:
    inbox_namespace_id = v
    return self


func with_result(v) -> Gs2DistributorDistributeResult:
    result = v
    return self


func with_metadata(v) -> Gs2DistributorDistributeResult:
    metadata = v
    return self


static func from_dict(data) -> Gs2DistributorDistributeResult:
    if data == null:
        return null
    var ret = Gs2DistributorDistributeResult.new()
    ret.distribute_resource = null if data.get("distributeResource") == null else Gs2DistributorDistributeResource.from_dict(data.get("distributeResource"))
    ret.inbox_namespace_id = null if data.get("inboxNamespaceId") == null else str(data.get("inboxNamespaceId"))
    ret.result = null if data.get("result") == null else str(data.get("result"))
    ret.metadata = null if data.get("metadata") == null else Gs2ResultMetadata.from_dict(data.get("metadata"))
    return ret


func to_dict() -> Dictionary:
    var ret = {}
    ret["distributeResource"] = null if distribute_resource == null else distribute_resource.to_dict()
    ret["inboxNamespaceId"] = inbox_namespace_id
    ret["result"] = result
    ret["metadata"] = null if metadata == null else metadata.to_dict()
    return ret