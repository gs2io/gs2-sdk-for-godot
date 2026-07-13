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
class_name Gs2DatastorePrepareDownloadByUserIdRequest
extends Gs2Request


var namespace_name = null
var user_id = null
var data_object_id = null
var time_offset_token = null
var duplication_avoider = null


func with_namespace_name(v) -> Gs2DatastorePrepareDownloadByUserIdRequest:
    namespace_name = v
    return self


func with_user_id(v) -> Gs2DatastorePrepareDownloadByUserIdRequest:
    user_id = v
    return self


func with_data_object_id(v) -> Gs2DatastorePrepareDownloadByUserIdRequest:
    data_object_id = v
    return self


func with_time_offset_token(v) -> Gs2DatastorePrepareDownloadByUserIdRequest:
    time_offset_token = v
    return self


func with_duplication_avoider(v) -> Gs2DatastorePrepareDownloadByUserIdRequest:
    duplication_avoider = v
    return self


static func from_dict(data) -> Gs2DatastorePrepareDownloadByUserIdRequest:
    if data == null:
        return null
    var ret = Gs2DatastorePrepareDownloadByUserIdRequest.new()
    ret.namespace_name = null if data.get("namespaceName") == null else str(data.get("namespaceName"))
    ret.user_id = null if data.get("userId") == null else str(data.get("userId"))
    ret.data_object_id = null if data.get("dataObjectId") == null else str(data.get("dataObjectId"))
    ret.time_offset_token = null if data.get("timeOffsetToken") == null else str(data.get("timeOffsetToken"))
    return ret


func to_dict() -> Dictionary:
    var ret = {}
    ret["namespaceName"] = namespace_name
    ret["userId"] = user_id
    ret["dataObjectId"] = data_object_id
    ret["timeOffsetToken"] = time_offset_token
    return ret