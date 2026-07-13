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
class_name Gs2SerialKeyUpdateCampaignModelMasterRequest
extends Gs2Request


var namespace_name = null
var campaign_model_name = null
var description = null
var metadata = null
var enable_campaign_code = null


func with_namespace_name(v) -> Gs2SerialKeyUpdateCampaignModelMasterRequest:
    namespace_name = v
    return self


func with_campaign_model_name(v) -> Gs2SerialKeyUpdateCampaignModelMasterRequest:
    campaign_model_name = v
    return self


func with_description(v) -> Gs2SerialKeyUpdateCampaignModelMasterRequest:
    description = v
    return self


func with_metadata(v) -> Gs2SerialKeyUpdateCampaignModelMasterRequest:
    metadata = v
    return self


func with_enable_campaign_code(v) -> Gs2SerialKeyUpdateCampaignModelMasterRequest:
    enable_campaign_code = v
    return self


static func from_dict(data) -> Gs2SerialKeyUpdateCampaignModelMasterRequest:
    if data == null:
        return null
    var ret = Gs2SerialKeyUpdateCampaignModelMasterRequest.new()
    ret.namespace_name = null if data.get("namespaceName") == null else str(data.get("namespaceName"))
    ret.campaign_model_name = null if data.get("campaignModelName") == null else str(data.get("campaignModelName"))
    ret.description = null if data.get("description") == null else str(data.get("description"))
    ret.metadata = null if data.get("metadata") == null else str(data.get("metadata"))
    ret.enable_campaign_code = null if data.get("enableCampaignCode") == null else bool(data.get("enableCampaignCode"))
    return ret


func to_dict() -> Dictionary:
    var ret = {}
    ret["namespaceName"] = namespace_name
    ret["campaignModelName"] = campaign_model_name
    ret["description"] = description
    ret["metadata"] = metadata
    ret["enableCampaignCode"] = enable_campaign_code
    return ret