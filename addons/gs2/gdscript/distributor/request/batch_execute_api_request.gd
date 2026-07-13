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
class_name Gs2DistributorBatchExecuteApiRequest
extends Gs2Request


var request_payloads = null


func with_request_payloads(v) -> Gs2DistributorBatchExecuteApiRequest:
    request_payloads = v
    return self


static func from_dict(data) -> Gs2DistributorBatchExecuteApiRequest:
    if data == null:
        return null
    var ret = Gs2DistributorBatchExecuteApiRequest.new()
    ret.request_payloads = null if data.get("requestPayloads") == null else data.get("requestPayloads").map(func(v): return Gs2DistributorBatchRequestPayload.from_dict(v))
    return ret


func to_dict() -> Dictionary:
    var ret = {}
    ret["requestPayloads"] = null if request_payloads == null else request_payloads.map(func(v): return null if v == null else v.to_dict())
    return ret