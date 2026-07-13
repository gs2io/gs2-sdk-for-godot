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
class_name Gs2GuardUpdateNamespaceRequest
extends Gs2Request


var namespace_name = null
var description = null
var blocking_policy = null


func with_namespace_name(v) -> Gs2GuardUpdateNamespaceRequest:
    namespace_name = v
    return self


func with_description(v) -> Gs2GuardUpdateNamespaceRequest:
    description = v
    return self


func with_blocking_policy(v) -> Gs2GuardUpdateNamespaceRequest:
    blocking_policy = v
    return self


static func from_dict(data) -> Gs2GuardUpdateNamespaceRequest:
    if data == null:
        return null
    var ret = Gs2GuardUpdateNamespaceRequest.new()
    ret.namespace_name = null if data.get("namespaceName") == null else str(data.get("namespaceName"))
    ret.description = null if data.get("description") == null else str(data.get("description"))
    ret.blocking_policy = null if data.get("blockingPolicy") == null else Gs2GuardBlockingPolicyModel.from_dict(data.get("blockingPolicy"))
    return ret


func to_dict() -> Dictionary:
    var ret = {}
    ret["namespaceName"] = namespace_name
    ret["description"] = description
    ret["blockingPolicy"] = null if blocking_policy == null else blocking_policy.to_dict()
    return ret