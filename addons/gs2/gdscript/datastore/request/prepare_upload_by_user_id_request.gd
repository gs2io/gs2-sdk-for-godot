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
class_name Gs2DatastorePrepareUploadByUserIdRequest
extends Gs2Request


var namespace_name = null
var user_id = null
var name = null
var content_type = null
var scope = null
var allow_user_ids = null
var update_if_exists = null
var time_offset_token = null
var duplication_avoider = null


func with_namespace_name(v) -> Gs2DatastorePrepareUploadByUserIdRequest:
    namespace_name = v
    return self


func with_user_id(v) -> Gs2DatastorePrepareUploadByUserIdRequest:
    user_id = v
    return self


func with_name(v) -> Gs2DatastorePrepareUploadByUserIdRequest:
    name = v
    return self


func with_content_type(v) -> Gs2DatastorePrepareUploadByUserIdRequest:
    content_type = v
    return self


func with_scope(v) -> Gs2DatastorePrepareUploadByUserIdRequest:
    scope = v
    return self


func with_allow_user_ids(v) -> Gs2DatastorePrepareUploadByUserIdRequest:
    allow_user_ids = v
    return self


func with_update_if_exists(v) -> Gs2DatastorePrepareUploadByUserIdRequest:
    update_if_exists = v
    return self


func with_time_offset_token(v) -> Gs2DatastorePrepareUploadByUserIdRequest:
    time_offset_token = v
    return self


func with_duplication_avoider(v) -> Gs2DatastorePrepareUploadByUserIdRequest:
    duplication_avoider = v
    return self


static func from_dict(data) -> Gs2DatastorePrepareUploadByUserIdRequest:
    if data == null:
        return null
    var ret = Gs2DatastorePrepareUploadByUserIdRequest.new()
    ret.namespace_name = null if data.get("namespaceName") == null else str(data.get("namespaceName"))
    ret.user_id = null if data.get("userId") == null else str(data.get("userId"))
    ret.name = null if data.get("name") == null else str(data.get("name"))
    ret.content_type = null if data.get("contentType") == null else str(data.get("contentType"))
    ret.scope = null if data.get("scope") == null else str(data.get("scope"))
    ret.allow_user_ids = null if data.get("allowUserIds") == null else data.get("allowUserIds").map(func(v): return str(v))
    ret.update_if_exists = null if data.get("updateIfExists") == null else bool(data.get("updateIfExists"))
    ret.time_offset_token = null if data.get("timeOffsetToken") == null else str(data.get("timeOffsetToken"))
    return ret


func to_dict() -> Dictionary:
    var ret = {}
    ret["namespaceName"] = namespace_name
    ret["userId"] = user_id
    ret["name"] = name
    ret["contentType"] = content_type
    ret["scope"] = scope
    ret["allowUserIds"] = allow_user_ids
    ret["updateIfExists"] = update_if_exists
    ret["timeOffsetToken"] = time_offset_token
    return ret