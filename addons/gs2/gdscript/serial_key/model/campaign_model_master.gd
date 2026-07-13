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
class_name Gs2SerialKeyCampaignModelMaster
extends RefCounted


var campaign_id = null
var name = null
var description = null
var metadata = null
var enable_campaign_code = null
var created_at = null
var updated_at = null
var revision = null


func with_campaign_id(v) -> Gs2SerialKeyCampaignModelMaster:
    campaign_id = v
    return self


func with_name(v) -> Gs2SerialKeyCampaignModelMaster:
    name = v
    return self


func with_description(v) -> Gs2SerialKeyCampaignModelMaster:
    description = v
    return self


func with_metadata(v) -> Gs2SerialKeyCampaignModelMaster:
    metadata = v
    return self


func with_enable_campaign_code(v) -> Gs2SerialKeyCampaignModelMaster:
    enable_campaign_code = v
    return self


func with_created_at(v) -> Gs2SerialKeyCampaignModelMaster:
    created_at = v
    return self


func with_updated_at(v) -> Gs2SerialKeyCampaignModelMaster:
    updated_at = v
    return self


func with_revision(v) -> Gs2SerialKeyCampaignModelMaster:
    revision = v
    return self


static func get_region_from_grn(grn):
    if grn == null:
        return null
    var regex = RegEx.new()
    regex.compile("grn:gs2:(?<region>.+):(?<ownerId>.+):serialKey:(?<namespaceName>.+):master:campaign:(?<campaignModelName>.+)")
    var matched = regex.search(grn)
    if matched == null:
        return null
    return matched.get_string("region")


static func get_owner_id_from_grn(grn):
    if grn == null:
        return null
    var regex = RegEx.new()
    regex.compile("grn:gs2:(?<region>.+):(?<ownerId>.+):serialKey:(?<namespaceName>.+):master:campaign:(?<campaignModelName>.+)")
    var matched = regex.search(grn)
    if matched == null:
        return null
    return matched.get_string("ownerId")


static func get_namespace_name_from_grn(grn):
    if grn == null:
        return null
    var regex = RegEx.new()
    regex.compile("grn:gs2:(?<region>.+):(?<ownerId>.+):serialKey:(?<namespaceName>.+):master:campaign:(?<campaignModelName>.+)")
    var matched = regex.search(grn)
    if matched == null:
        return null
    return matched.get_string("namespaceName")


static func get_campaign_model_name_from_grn(grn):
    if grn == null:
        return null
    var regex = RegEx.new()
    regex.compile("grn:gs2:(?<region>.+):(?<ownerId>.+):serialKey:(?<namespaceName>.+):master:campaign:(?<campaignModelName>.+)")
    var matched = regex.search(grn)
    if matched == null:
        return null
    return matched.get_string("campaignModelName")


static func from_dict(data) -> Gs2SerialKeyCampaignModelMaster:
    if data == null:
        return null
    var ret = Gs2SerialKeyCampaignModelMaster.new()
    ret.campaign_id = null if data.get("campaignId") == null else str(data.get("campaignId"))
    ret.name = null if data.get("name") == null else str(data.get("name"))
    ret.description = null if data.get("description") == null else str(data.get("description"))
    ret.metadata = null if data.get("metadata") == null else str(data.get("metadata"))
    ret.enable_campaign_code = null if data.get("enableCampaignCode") == null else bool(data.get("enableCampaignCode"))
    ret.created_at = null if data.get("createdAt") == null else int(data.get("createdAt"))
    ret.updated_at = null if data.get("updatedAt") == null else int(data.get("updatedAt"))
    ret.revision = null if data.get("revision") == null else int(data.get("revision"))
    return ret


func to_dict() -> Dictionary:
    var ret = {}
    ret["campaignId"] = campaign_id
    ret["name"] = name
    ret["description"] = description
    ret["metadata"] = metadata
    ret["enableCampaignCode"] = enable_campaign_code
    ret["createdAt"] = created_at
    ret["updatedAt"] = updated_at
    ret["revision"] = revision
    return ret