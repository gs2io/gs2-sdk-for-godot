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
class_name Gs2DistributorEzBatchResultPayload
extends RefCounted


var request_id = null
var status_code = 0
var result_payload = null


func with_request_id(v) -> Gs2DistributorEzBatchResultPayload:
    request_id = v
    return self


func with_status_code(v) -> Gs2DistributorEzBatchResultPayload:
    status_code = v
    return self


func with_result_payload(v) -> Gs2DistributorEzBatchResultPayload:
    result_payload = v
    return self


func to_model() -> Gs2DistributorBatchResultPayload:
    var ret = Gs2DistributorBatchResultPayload.new()
    ret.request_id = request_id
    ret.status_code = status_code
    ret.result_payload = result_payload
    return ret


static func from_model(model) -> Gs2DistributorEzBatchResultPayload:
    var ret = Gs2DistributorEzBatchResultPayload.new()
    ret.request_id = model.request_id
    ret.status_code = 0 if model.status_code == null else model.status_code
    ret.result_payload = model.result_payload
    return ret