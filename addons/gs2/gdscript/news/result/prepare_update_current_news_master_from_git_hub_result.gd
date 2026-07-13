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
class_name Gs2NewsPrepareUpdateCurrentNewsMasterFromGitHubResult
extends RefCounted


var upload_token = null
var metadata = null


func with_upload_token(v) -> Gs2NewsPrepareUpdateCurrentNewsMasterFromGitHubResult:
    upload_token = v
    return self


func with_metadata(v) -> Gs2NewsPrepareUpdateCurrentNewsMasterFromGitHubResult:
    metadata = v
    return self


static func from_dict(data) -> Gs2NewsPrepareUpdateCurrentNewsMasterFromGitHubResult:
    if data == null:
        return null
    var ret = Gs2NewsPrepareUpdateCurrentNewsMasterFromGitHubResult.new()
    ret.upload_token = null if data.get("uploadToken") == null else str(data.get("uploadToken"))
    ret.metadata = null if data.get("metadata") == null else Gs2ResultMetadata.from_dict(data.get("metadata"))
    return ret


func to_dict() -> Dictionary:
    var ret = {}
    ret["uploadToken"] = upload_token
    ret["metadata"] = null if metadata == null else metadata.to_dict()
    return ret