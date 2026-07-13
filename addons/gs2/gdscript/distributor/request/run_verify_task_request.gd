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
class_name Gs2DistributorRunVerifyTaskRequest
extends Gs2Request


var namespace_name = null
var verify_task = null
var key_id = null


func with_namespace_name(v) -> Gs2DistributorRunVerifyTaskRequest:
    namespace_name = v
    return self


func with_verify_task(v) -> Gs2DistributorRunVerifyTaskRequest:
    verify_task = v
    return self


func with_key_id(v) -> Gs2DistributorRunVerifyTaskRequest:
    key_id = v
    return self


static func from_dict(data) -> Gs2DistributorRunVerifyTaskRequest:
    if data == null:
        return null
    var ret = Gs2DistributorRunVerifyTaskRequest.new()
    ret.namespace_name = null if data.get("namespaceName") == null else str(data.get("namespaceName"))
    ret.verify_task = null if data.get("verifyTask") == null else str(data.get("verifyTask"))
    ret.key_id = null if data.get("keyId") == null else str(data.get("keyId"))
    return ret


func to_dict() -> Dictionary:
    var ret = {}
    ret["namespaceName"] = namespace_name
    ret["verifyTask"] = verify_task
    ret["keyId"] = key_id
    return ret