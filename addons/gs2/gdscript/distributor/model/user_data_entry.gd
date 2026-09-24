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
class_name Gs2DistributorUserDataEntry
extends RefCounted


var service = null
var namespace_name = null
var kind = null
var payload = null


func with_service(v) -> Gs2DistributorUserDataEntry:
    service = v
    return self


func with_namespace_name(v) -> Gs2DistributorUserDataEntry:
    namespace_name = v
    return self


func with_kind(v) -> Gs2DistributorUserDataEntry:
    kind = v
    return self


func with_payload(v) -> Gs2DistributorUserDataEntry:
    payload = v
    return self


static func from_dict(data) -> Gs2DistributorUserDataEntry:
    if data == null:
        return null
    var ret = Gs2DistributorUserDataEntry.new()
    ret.service = null if data.get("service") == null else str(data.get("service"))
    ret.namespace_name = null if data.get("namespaceName") == null else str(data.get("namespaceName"))
    ret.kind = null if data.get("kind") == null else str(data.get("kind"))
    ret.payload = null if data.get("payload") == null else str(data.get("payload"))
    return ret


func to_dict() -> Dictionary:
    var ret = {}
    ret["service"] = service
    ret["namespaceName"] = namespace_name
    ret["kind"] = kind
    ret["payload"] = payload
    return ret