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
class_name Gs2AccountPlatformUser
extends RefCounted


var type = null
var user_identifier = null
var user_id = null


func with_type(v) -> Gs2AccountPlatformUser:
    type = v
    return self


func with_user_identifier(v) -> Gs2AccountPlatformUser:
    user_identifier = v
    return self


func with_user_id(v) -> Gs2AccountPlatformUser:
    user_id = v
    return self


static func from_dict(data) -> Gs2AccountPlatformUser:
    if data == null:
        return null
    var ret = Gs2AccountPlatformUser.new()
    ret.type = null if data.get("type") == null else int(data.get("type"))
    ret.user_identifier = null if data.get("userIdentifier") == null else str(data.get("userIdentifier"))
    ret.user_id = null if data.get("userId") == null else str(data.get("userId"))
    return ret


func to_dict() -> Dictionary:
    var ret = {}
    ret["type"] = type
    ret["userIdentifier"] = user_identifier
    ret["userId"] = user_id
    return ret