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
class_name Gs2NewsPrepareUpdateCurrentNewsMasterResult
extends RefCounted


var upload_token = null
var template_upload_url = null
var metadata = null


func with_upload_token(v) -> Gs2NewsPrepareUpdateCurrentNewsMasterResult:
    upload_token = v
    return self


func with_template_upload_url(v) -> Gs2NewsPrepareUpdateCurrentNewsMasterResult:
    template_upload_url = v
    return self


func with_metadata(v) -> Gs2NewsPrepareUpdateCurrentNewsMasterResult:
    metadata = v
    return self


static func from_dict(data) -> Gs2NewsPrepareUpdateCurrentNewsMasterResult:
    if data == null:
        return null
    var ret = Gs2NewsPrepareUpdateCurrentNewsMasterResult.new()
    ret.upload_token = null if data.get("uploadToken") == null else str(data.get("uploadToken"))
    ret.template_upload_url = null if data.get("templateUploadUrl") == null else str(data.get("templateUploadUrl"))
    ret.metadata = null if data.get("metadata") == null else Gs2ResultMetadata.from_dict(data.get("metadata"))
    return ret


func to_dict() -> Dictionary:
    var ret = {}
    ret["uploadToken"] = upload_token
    ret["templateUploadUrl"] = template_upload_url
    ret["metadata"] = null if metadata == null else metadata.to_dict()
    return ret