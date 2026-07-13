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
class_name Gs2NewsGetOutputRequest
extends Gs2Request


var namespace_name = null
var upload_token = null
var output_name = null


func with_namespace_name(v) -> Gs2NewsGetOutputRequest:
    namespace_name = v
    return self


func with_upload_token(v) -> Gs2NewsGetOutputRequest:
    upload_token = v
    return self


func with_output_name(v) -> Gs2NewsGetOutputRequest:
    output_name = v
    return self


static func from_dict(data) -> Gs2NewsGetOutputRequest:
    if data == null:
        return null
    var ret = Gs2NewsGetOutputRequest.new()
    ret.namespace_name = null if data.get("namespaceName") == null else str(data.get("namespaceName"))
    ret.upload_token = null if data.get("uploadToken") == null else str(data.get("uploadToken"))
    ret.output_name = null if data.get("outputName") == null else str(data.get("outputName"))
    return ret


func to_dict() -> Dictionary:
    var ret = {}
    ret["namespaceName"] = namespace_name
    ret["uploadToken"] = upload_token
    ret["outputName"] = output_name
    return ret