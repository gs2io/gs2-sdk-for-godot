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
class_name Gs2SerialKeyEzSerialKey
extends RefCounted


var campaign_model_name = null
var metadata = null
var code = null
var status = null


func with_campaign_model_name(v) -> Gs2SerialKeyEzSerialKey:
    campaign_model_name = v
    return self


func with_metadata(v) -> Gs2SerialKeyEzSerialKey:
    metadata = v
    return self


func with_code(v) -> Gs2SerialKeyEzSerialKey:
    code = v
    return self


func with_status(v) -> Gs2SerialKeyEzSerialKey:
    status = v
    return self


func to_model() -> Gs2SerialKeySerialKey:
    var ret = Gs2SerialKeySerialKey.new()
    ret.campaign_model_name = campaign_model_name
    ret.metadata = metadata
    ret.code = code
    ret.status = status
    return ret


static func from_model(model) -> Gs2SerialKeyEzSerialKey:
    var ret = Gs2SerialKeyEzSerialKey.new()
    ret.campaign_model_name = model.campaign_model_name
    ret.metadata = model.metadata
    ret.code = model.code
    ret.status = model.status
    return ret