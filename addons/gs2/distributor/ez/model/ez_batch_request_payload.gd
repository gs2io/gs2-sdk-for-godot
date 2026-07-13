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
class_name Gs2DistributorEzBatchRequestPayload
extends RefCounted


var request_id = null
var service = null
var method_name = null
var parameter = null


func with_request_id(v) -> Gs2DistributorEzBatchRequestPayload:
    request_id = v
    return self


func with_service(v) -> Gs2DistributorEzBatchRequestPayload:
    service = v
    return self


func with_method_name(v) -> Gs2DistributorEzBatchRequestPayload:
    method_name = v
    return self


func with_parameter(v) -> Gs2DistributorEzBatchRequestPayload:
    parameter = v
    return self


func to_model() -> Gs2DistributorBatchRequestPayload:
    var ret = Gs2DistributorBatchRequestPayload.new()
    ret.request_id = request_id
    ret.service = service
    ret.method_name = method_name
    ret.parameter = parameter
    return ret


static func from_model(model) -> Gs2DistributorEzBatchRequestPayload:
    var ret = Gs2DistributorEzBatchRequestPayload.new()
    ret.request_id = model.request_id
    ret.service = model.service
    ret.method_name = model.method_name
    ret.parameter = model.parameter
    return ret