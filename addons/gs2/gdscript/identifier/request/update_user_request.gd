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
class_name Gs2IdentifierUpdateUserRequest
extends Gs2Request


var user_name = null
var description = null


func with_user_name(v) -> Gs2IdentifierUpdateUserRequest:
    user_name = v
    return self


func with_description(v) -> Gs2IdentifierUpdateUserRequest:
    description = v
    return self


static func from_dict(data) -> Gs2IdentifierUpdateUserRequest:
    if data == null:
        return null
    var ret = Gs2IdentifierUpdateUserRequest.new()
    ret.user_name = null if data.get("userName") == null else str(data.get("userName"))
    ret.description = null if data.get("description") == null else str(data.get("description"))
    return ret


func to_dict() -> Dictionary:
    var ret = {}
    ret["userName"] = user_name
    ret["description"] = description
    return ret