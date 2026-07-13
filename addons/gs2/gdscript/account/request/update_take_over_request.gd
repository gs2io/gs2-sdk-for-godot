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
class_name Gs2AccountUpdateTakeOverRequest
extends Gs2Request


var namespace_name = null
var access_token = null
var type = null
var old_password = null
var password = null
var duplication_avoider = null


func with_namespace_name(v) -> Gs2AccountUpdateTakeOverRequest:
    namespace_name = v
    return self


func with_access_token(v) -> Gs2AccountUpdateTakeOverRequest:
    access_token = v
    return self


func with_type(v) -> Gs2AccountUpdateTakeOverRequest:
    type = v
    return self


func with_old_password(v) -> Gs2AccountUpdateTakeOverRequest:
    old_password = v
    return self


func with_password(v) -> Gs2AccountUpdateTakeOverRequest:
    password = v
    return self


func with_duplication_avoider(v) -> Gs2AccountUpdateTakeOverRequest:
    duplication_avoider = v
    return self


static func from_dict(data) -> Gs2AccountUpdateTakeOverRequest:
    if data == null:
        return null
    var ret = Gs2AccountUpdateTakeOverRequest.new()
    ret.namespace_name = null if data.get("namespaceName") == null else str(data.get("namespaceName"))
    ret.access_token = null if data.get("accessToken") == null else str(data.get("accessToken"))
    ret.type = null if data.get("type") == null else int(data.get("type"))
    ret.old_password = null if data.get("oldPassword") == null else str(data.get("oldPassword"))
    ret.password = null if data.get("password") == null else str(data.get("password"))
    return ret


func to_dict() -> Dictionary:
    var ret = {}
    ret["namespaceName"] = namespace_name
    ret["accessToken"] = access_token
    ret["type"] = type
    ret["oldPassword"] = old_password
    ret["password"] = password
    return ret