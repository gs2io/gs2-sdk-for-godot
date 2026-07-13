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
class_name Gs2KeyCreateKeyRequest
extends Gs2Request


var namespace_name = null
var name = null
var description = null


func with_namespace_name(v) -> Gs2KeyCreateKeyRequest:
    namespace_name = v
    return self


func with_name(v) -> Gs2KeyCreateKeyRequest:
    name = v
    return self


func with_description(v) -> Gs2KeyCreateKeyRequest:
    description = v
    return self


static func from_dict(data) -> Gs2KeyCreateKeyRequest:
    if data == null:
        return null
    var ret = Gs2KeyCreateKeyRequest.new()
    ret.namespace_name = null if data.get("namespaceName") == null else str(data.get("namespaceName"))
    ret.name = null if data.get("name") == null else str(data.get("name"))
    ret.description = null if data.get("description") == null else str(data.get("description"))
    return ret


func to_dict() -> Dictionary:
    var ret = {}
    ret["namespaceName"] = namespace_name
    ret["name"] = name
    ret["description"] = description
    return ret