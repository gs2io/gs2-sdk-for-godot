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
class_name Gs2KeyUpdateKeyRequest
extends Gs2Request


var namespace_name = null
var key_name = null
var description = null


func with_namespace_name(v) -> Gs2KeyUpdateKeyRequest:
    namespace_name = v
    return self


func with_key_name(v) -> Gs2KeyUpdateKeyRequest:
    key_name = v
    return self


func with_description(v) -> Gs2KeyUpdateKeyRequest:
    description = v
    return self


static func from_dict(data) -> Gs2KeyUpdateKeyRequest:
    if data == null:
        return null
    var ret = Gs2KeyUpdateKeyRequest.new()
    ret.namespace_name = null if data.get("namespaceName") == null else str(data.get("namespaceName"))
    ret.key_name = null if data.get("keyName") == null else str(data.get("keyName"))
    ret.description = null if data.get("description") == null else str(data.get("description"))
    return ret


func to_dict() -> Dictionary:
    var ret = {}
    ret["namespaceName"] = namespace_name
    ret["keyName"] = key_name
    ret["description"] = description
    return ret