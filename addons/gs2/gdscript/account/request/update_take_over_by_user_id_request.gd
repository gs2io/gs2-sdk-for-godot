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
class_name Gs2AccountUpdateTakeOverByUserIdRequest
extends Gs2Request


var namespace_name = null
var user_id = null
var type = null
var old_password = null
var password = null
var time_offset_token = null
var duplication_avoider = null


func with_namespace_name(v) -> Gs2AccountUpdateTakeOverByUserIdRequest:
    namespace_name = v
    return self


func with_user_id(v) -> Gs2AccountUpdateTakeOverByUserIdRequest:
    user_id = v
    return self


func with_type(v) -> Gs2AccountUpdateTakeOverByUserIdRequest:
    type = v
    return self


func with_old_password(v) -> Gs2AccountUpdateTakeOverByUserIdRequest:
    old_password = v
    return self


func with_password(v) -> Gs2AccountUpdateTakeOverByUserIdRequest:
    password = v
    return self


func with_time_offset_token(v) -> Gs2AccountUpdateTakeOverByUserIdRequest:
    time_offset_token = v
    return self


func with_duplication_avoider(v) -> Gs2AccountUpdateTakeOverByUserIdRequest:
    duplication_avoider = v
    return self


static func from_dict(data) -> Gs2AccountUpdateTakeOverByUserIdRequest:
    if data == null:
        return null
    var ret = Gs2AccountUpdateTakeOverByUserIdRequest.new()
    ret.namespace_name = null if data.get("namespaceName") == null else str(data.get("namespaceName"))
    ret.user_id = null if data.get("userId") == null else str(data.get("userId"))
    ret.type = null if data.get("type") == null else int(data.get("type"))
    ret.old_password = null if data.get("oldPassword") == null else str(data.get("oldPassword"))
    ret.password = null if data.get("password") == null else str(data.get("password"))
    ret.time_offset_token = null if data.get("timeOffsetToken") == null else str(data.get("timeOffsetToken"))
    return ret


func to_dict() -> Dictionary:
    var ret = {}
    ret["namespaceName"] = namespace_name
    ret["userId"] = user_id
    ret["type"] = type
    ret["oldPassword"] = old_password
    ret["password"] = password
    ret["timeOffsetToken"] = time_offset_token
    return ret