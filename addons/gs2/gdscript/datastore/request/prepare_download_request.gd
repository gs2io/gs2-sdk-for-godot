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
class_name Gs2DatastorePrepareDownloadRequest
extends Gs2Request


var namespace_name = null
var access_token = null
var data_object_id = null
var duplication_avoider = null


func with_namespace_name(v) -> Gs2DatastorePrepareDownloadRequest:
    namespace_name = v
    return self


func with_access_token(v) -> Gs2DatastorePrepareDownloadRequest:
    access_token = v
    return self


func with_data_object_id(v) -> Gs2DatastorePrepareDownloadRequest:
    data_object_id = v
    return self


func with_duplication_avoider(v) -> Gs2DatastorePrepareDownloadRequest:
    duplication_avoider = v
    return self


static func from_dict(data) -> Gs2DatastorePrepareDownloadRequest:
    if data == null:
        return null
    var ret = Gs2DatastorePrepareDownloadRequest.new()
    ret.namespace_name = null if data.get("namespaceName") == null else str(data.get("namespaceName"))
    ret.access_token = null if data.get("accessToken") == null else str(data.get("accessToken"))
    ret.data_object_id = null if data.get("dataObjectId") == null else str(data.get("dataObjectId"))
    return ret


func to_dict() -> Dictionary:
    var ret = {}
    ret["namespaceName"] = namespace_name
    ret["accessToken"] = access_token
    ret["dataObjectId"] = data_object_id
    return ret