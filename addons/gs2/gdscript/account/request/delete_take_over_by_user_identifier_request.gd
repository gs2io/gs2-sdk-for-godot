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
class_name Gs2AccountDeleteTakeOverByUserIdentifierRequest
extends Gs2Request


var namespace_name = null
var type = null
var user_identifier = null
var duplication_avoider = null


func with_namespace_name(v) -> Gs2AccountDeleteTakeOverByUserIdentifierRequest:
    namespace_name = v
    return self


func with_type(v) -> Gs2AccountDeleteTakeOverByUserIdentifierRequest:
    type = v
    return self


func with_user_identifier(v) -> Gs2AccountDeleteTakeOverByUserIdentifierRequest:
    user_identifier = v
    return self


func with_duplication_avoider(v) -> Gs2AccountDeleteTakeOverByUserIdentifierRequest:
    duplication_avoider = v
    return self


static func from_dict(data) -> Gs2AccountDeleteTakeOverByUserIdentifierRequest:
    if data == null:
        return null
    var ret = Gs2AccountDeleteTakeOverByUserIdentifierRequest.new()
    ret.namespace_name = null if data.get("namespaceName") == null else str(data.get("namespaceName"))
    ret.type = null if data.get("type") == null else int(data.get("type"))
    ret.user_identifier = null if data.get("userIdentifier") == null else str(data.get("userIdentifier"))
    return ret


func to_dict() -> Dictionary:
    var ret = {}
    ret["namespaceName"] = namespace_name
    ret["type"] = type
    ret["userIdentifier"] = user_identifier
    return ret