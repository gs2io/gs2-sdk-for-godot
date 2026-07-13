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
class_name Gs2DistributorCreateDistributorModelMasterRequest
extends Gs2Request


var namespace_name = null
var name = null
var description = null
var metadata = null
var inbox_namespace_id = null
var white_list_target_ids = null


func with_namespace_name(v) -> Gs2DistributorCreateDistributorModelMasterRequest:
    namespace_name = v
    return self


func with_name(v) -> Gs2DistributorCreateDistributorModelMasterRequest:
    name = v
    return self


func with_description(v) -> Gs2DistributorCreateDistributorModelMasterRequest:
    description = v
    return self


func with_metadata(v) -> Gs2DistributorCreateDistributorModelMasterRequest:
    metadata = v
    return self


func with_inbox_namespace_id(v) -> Gs2DistributorCreateDistributorModelMasterRequest:
    inbox_namespace_id = v
    return self


func with_white_list_target_ids(v) -> Gs2DistributorCreateDistributorModelMasterRequest:
    white_list_target_ids = v
    return self


static func from_dict(data) -> Gs2DistributorCreateDistributorModelMasterRequest:
    if data == null:
        return null
    var ret = Gs2DistributorCreateDistributorModelMasterRequest.new()
    ret.namespace_name = null if data.get("namespaceName") == null else str(data.get("namespaceName"))
    ret.name = null if data.get("name") == null else str(data.get("name"))
    ret.description = null if data.get("description") == null else str(data.get("description"))
    ret.metadata = null if data.get("metadata") == null else str(data.get("metadata"))
    ret.inbox_namespace_id = null if data.get("inboxNamespaceId") == null else str(data.get("inboxNamespaceId"))
    ret.white_list_target_ids = null if data.get("whiteListTargetIds") == null else data.get("whiteListTargetIds").map(func(v): return str(v))
    return ret


func to_dict() -> Dictionary:
    var ret = {}
    ret["namespaceName"] = namespace_name
    ret["name"] = name
    ret["description"] = description
    ret["metadata"] = metadata
    ret["inboxNamespaceId"] = inbox_namespace_id
    ret["whiteListTargetIds"] = white_list_target_ids
    return ret