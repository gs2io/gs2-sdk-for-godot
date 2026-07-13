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
class_name Gs2AccountFindPlatformIdByUserIdRequest
extends Gs2Request


var namespace_name = null
var user_id = null
var type = null
var user_identifier = null
var dont_resolve_data_owner = null
var time_offset_token = null


func with_namespace_name(v) -> Gs2AccountFindPlatformIdByUserIdRequest:
    namespace_name = v
    return self


func with_user_id(v) -> Gs2AccountFindPlatformIdByUserIdRequest:
    user_id = v
    return self


func with_type(v) -> Gs2AccountFindPlatformIdByUserIdRequest:
    type = v
    return self


func with_user_identifier(v) -> Gs2AccountFindPlatformIdByUserIdRequest:
    user_identifier = v
    return self


func with_dont_resolve_data_owner(v) -> Gs2AccountFindPlatformIdByUserIdRequest:
    dont_resolve_data_owner = v
    return self


func with_time_offset_token(v) -> Gs2AccountFindPlatformIdByUserIdRequest:
    time_offset_token = v
    return self


static func from_dict(data) -> Gs2AccountFindPlatformIdByUserIdRequest:
    if data == null:
        return null
    var ret = Gs2AccountFindPlatformIdByUserIdRequest.new()
    ret.namespace_name = null if data.get("namespaceName") == null else str(data.get("namespaceName"))
    ret.user_id = null if data.get("userId") == null else str(data.get("userId"))
    ret.type = null if data.get("type") == null else int(data.get("type"))
    ret.user_identifier = null if data.get("userIdentifier") == null else str(data.get("userIdentifier"))
    ret.dont_resolve_data_owner = null if data.get("dontResolveDataOwner") == null else bool(data.get("dontResolveDataOwner"))
    ret.time_offset_token = null if data.get("timeOffsetToken") == null else str(data.get("timeOffsetToken"))
    return ret


func to_dict() -> Dictionary:
    var ret = {}
    ret["namespaceName"] = namespace_name
    ret["userId"] = user_id
    ret["type"] = type
    ret["userIdentifier"] = user_identifier
    ret["dontResolveDataOwner"] = dont_resolve_data_owner
    ret["timeOffsetToken"] = time_offset_token
    return ret