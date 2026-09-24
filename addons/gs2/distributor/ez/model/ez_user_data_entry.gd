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
class_name Gs2DistributorEzUserDataEntry
extends RefCounted


var service = null
var namespace_name = null
var kind = null
var payload = null


func with_service(v) -> Gs2DistributorEzUserDataEntry:
    service = v
    return self


func with_namespace_name(v) -> Gs2DistributorEzUserDataEntry:
    namespace_name = v
    return self


func with_kind(v) -> Gs2DistributorEzUserDataEntry:
    kind = v
    return self


func with_payload(v) -> Gs2DistributorEzUserDataEntry:
    payload = v
    return self


func to_model() -> Gs2DistributorUserDataEntry:
    var ret = Gs2DistributorUserDataEntry.new()
    ret.service = service
    ret.namespace_name = namespace_name
    ret.kind = kind
    ret.payload = payload
    return ret


static func from_model(model) -> Gs2DistributorEzUserDataEntry:
    var ret = Gs2DistributorEzUserDataEntry.new()
    ret.service = model.service
    ret.namespace_name = model.namespace_name
    ret.kind = model.kind
    ret.payload = model.payload
    return ret