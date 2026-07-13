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
class_name Gs2DatastorePrepareDownloadOwnDataByGenerationRequest
extends Gs2Request


var namespace_name = null
var access_token = null
var data_object_name = null
var generation = null
var duplication_avoider = null


func with_namespace_name(v) -> Gs2DatastorePrepareDownloadOwnDataByGenerationRequest:
    namespace_name = v
    return self


func with_access_token(v) -> Gs2DatastorePrepareDownloadOwnDataByGenerationRequest:
    access_token = v
    return self


func with_data_object_name(v) -> Gs2DatastorePrepareDownloadOwnDataByGenerationRequest:
    data_object_name = v
    return self


func with_generation(v) -> Gs2DatastorePrepareDownloadOwnDataByGenerationRequest:
    generation = v
    return self


func with_duplication_avoider(v) -> Gs2DatastorePrepareDownloadOwnDataByGenerationRequest:
    duplication_avoider = v
    return self


static func from_dict(data) -> Gs2DatastorePrepareDownloadOwnDataByGenerationRequest:
    if data == null:
        return null
    var ret = Gs2DatastorePrepareDownloadOwnDataByGenerationRequest.new()
    ret.namespace_name = null if data.get("namespaceName") == null else str(data.get("namespaceName"))
    ret.access_token = null if data.get("accessToken") == null else str(data.get("accessToken"))
    ret.data_object_name = null if data.get("dataObjectName") == null else str(data.get("dataObjectName"))
    ret.generation = null if data.get("generation") == null else str(data.get("generation"))
    return ret


func to_dict() -> Dictionary:
    var ret = {}
    ret["namespaceName"] = namespace_name
    ret["accessToken"] = access_token
    ret["dataObjectName"] = data_object_name
    ret["generation"] = generation
    return ret