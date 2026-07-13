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
class_name Gs2DistributorBatchResultPayload
extends RefCounted


var request_id = null
var status_code = null
var result_payload = null


func with_request_id(v) -> Gs2DistributorBatchResultPayload:
    request_id = v
    return self


func with_status_code(v) -> Gs2DistributorBatchResultPayload:
    status_code = v
    return self


func with_result_payload(v) -> Gs2DistributorBatchResultPayload:
    result_payload = v
    return self


static func from_dict(data) -> Gs2DistributorBatchResultPayload:
    if data == null:
        return null
    var ret = Gs2DistributorBatchResultPayload.new()
    ret.request_id = null if data.get("requestId") == null else str(data.get("requestId"))
    ret.status_code = null if data.get("statusCode") == null else int(data.get("statusCode"))
    ret.result_payload = null if data.get("resultPayload") == null else str(data.get("resultPayload"))
    return ret


func to_dict() -> Dictionary:
    var ret = {}
    ret["requestId"] = request_id
    ret["statusCode"] = status_code
    ret["resultPayload"] = result_payload
    return ret