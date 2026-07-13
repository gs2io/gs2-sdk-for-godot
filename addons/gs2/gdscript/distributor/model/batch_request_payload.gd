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
class_name Gs2DistributorBatchRequestPayload
extends RefCounted


var request_id = null
var service = null
var method_name = null
var parameter = null


func with_request_id(v) -> Gs2DistributorBatchRequestPayload:
    request_id = v
    return self


func with_service(v) -> Gs2DistributorBatchRequestPayload:
    service = v
    return self


func with_method_name(v) -> Gs2DistributorBatchRequestPayload:
    method_name = v
    return self


func with_parameter(v) -> Gs2DistributorBatchRequestPayload:
    parameter = v
    return self


static func from_dict(data) -> Gs2DistributorBatchRequestPayload:
    if data == null:
        return null
    var ret = Gs2DistributorBatchRequestPayload.new()
    ret.request_id = null if data.get("requestId") == null else str(data.get("requestId"))
    ret.service = null if data.get("service") == null else str(data.get("service"))
    ret.method_name = null if data.get("methodName") == null else str(data.get("methodName"))
    ret.parameter = null if data.get("parameter") == null else str(data.get("parameter"))
    return ret


func to_dict() -> Dictionary:
    var ret = {}
    ret["requestId"] = request_id
    ret["service"] = service
    ret["methodName"] = method_name
    ret["parameter"] = parameter
    return ret