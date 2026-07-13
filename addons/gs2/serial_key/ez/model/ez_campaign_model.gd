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
class_name Gs2SerialKeyEzCampaignModel
extends RefCounted


var name = null
var metadata = null
var enable_campaign_code = false


func with_name(v) -> Gs2SerialKeyEzCampaignModel:
    name = v
    return self


func with_metadata(v) -> Gs2SerialKeyEzCampaignModel:
    metadata = v
    return self


func with_enable_campaign_code(v) -> Gs2SerialKeyEzCampaignModel:
    enable_campaign_code = v
    return self


func to_model() -> Gs2SerialKeyCampaignModel:
    var ret = Gs2SerialKeyCampaignModel.new()
    ret.name = name
    ret.metadata = metadata
    ret.enable_campaign_code = enable_campaign_code
    return ret


static func from_model(model) -> Gs2SerialKeyEzCampaignModel:
    var ret = Gs2SerialKeyEzCampaignModel.new()
    ret.name = model.name
    ret.metadata = model.metadata
    ret.enable_campaign_code = false if model.enable_campaign_code == null else model.enable_campaign_code
    return ret