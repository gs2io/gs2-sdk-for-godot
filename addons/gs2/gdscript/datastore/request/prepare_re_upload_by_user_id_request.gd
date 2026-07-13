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
class_name Gs2DatastorePrepareReUploadByUserIdRequest
extends Gs2Request


var namespace_name = null
var data_object_name = null
var user_id = null
var content_type = null
var time_offset_token = null
var duplication_avoider = null


func with_namespace_name(v) -> Gs2DatastorePrepareReUploadByUserIdRequest:
    namespace_name = v
    return self


func with_data_object_name(v) -> Gs2DatastorePrepareReUploadByUserIdRequest:
    data_object_name = v
    return self


func with_user_id(v) -> Gs2DatastorePrepareReUploadByUserIdRequest:
    user_id = v
    return self


func with_content_type(v) -> Gs2DatastorePrepareReUploadByUserIdRequest:
    content_type = v
    return self


func with_time_offset_token(v) -> Gs2DatastorePrepareReUploadByUserIdRequest:
    time_offset_token = v
    return self


func with_duplication_avoider(v) -> Gs2DatastorePrepareReUploadByUserIdRequest:
    duplication_avoider = v
    return self


static func from_dict(data) -> Gs2DatastorePrepareReUploadByUserIdRequest:
    if data == null:
        return null
    var ret = Gs2DatastorePrepareReUploadByUserIdRequest.new()
    ret.namespace_name = null if data.get("namespaceName") == null else str(data.get("namespaceName"))
    ret.data_object_name = null if data.get("dataObjectName") == null else str(data.get("dataObjectName"))
    ret.user_id = null if data.get("userId") == null else str(data.get("userId"))
    ret.content_type = null if data.get("contentType") == null else str(data.get("contentType"))
    ret.time_offset_token = null if data.get("timeOffsetToken") == null else str(data.get("timeOffsetToken"))
    return ret


func to_dict() -> Dictionary:
    var ret = {}
    ret["namespaceName"] = namespace_name
    ret["dataObjectName"] = data_object_name
    ret["userId"] = user_id
    ret["contentType"] = content_type
    ret["timeOffsetToken"] = time_offset_token
    return ret