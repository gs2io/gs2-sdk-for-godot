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
class_name Gs2DistributorDistributorModelMaster
extends RefCounted


var distributor_model_id = null
var name = null
var description = null
var metadata = null
var inbox_namespace_id = null
var white_list_target_ids = null
var created_at = null
var updated_at = null
var revision = null


func with_distributor_model_id(v) -> Gs2DistributorDistributorModelMaster:
    distributor_model_id = v
    return self


func with_name(v) -> Gs2DistributorDistributorModelMaster:
    name = v
    return self


func with_description(v) -> Gs2DistributorDistributorModelMaster:
    description = v
    return self


func with_metadata(v) -> Gs2DistributorDistributorModelMaster:
    metadata = v
    return self


func with_inbox_namespace_id(v) -> Gs2DistributorDistributorModelMaster:
    inbox_namespace_id = v
    return self


func with_white_list_target_ids(v) -> Gs2DistributorDistributorModelMaster:
    white_list_target_ids = v
    return self


func with_created_at(v) -> Gs2DistributorDistributorModelMaster:
    created_at = v
    return self


func with_updated_at(v) -> Gs2DistributorDistributorModelMaster:
    updated_at = v
    return self


func with_revision(v) -> Gs2DistributorDistributorModelMaster:
    revision = v
    return self


static func get_region_from_grn(grn):
    if grn == null:
        return null
    var regex = RegEx.new()
    regex.compile("grn:gs2:(?<region>.+):(?<ownerId>.+):distributor:(?<namespaceName>.+):model:(?<distributorName>.+)")
    var matched = regex.search(grn)
    if matched == null:
        return null
    return matched.get_string("region")


static func get_owner_id_from_grn(grn):
    if grn == null:
        return null
    var regex = RegEx.new()
    regex.compile("grn:gs2:(?<region>.+):(?<ownerId>.+):distributor:(?<namespaceName>.+):model:(?<distributorName>.+)")
    var matched = regex.search(grn)
    if matched == null:
        return null
    return matched.get_string("ownerId")


static func get_namespace_name_from_grn(grn):
    if grn == null:
        return null
    var regex = RegEx.new()
    regex.compile("grn:gs2:(?<region>.+):(?<ownerId>.+):distributor:(?<namespaceName>.+):model:(?<distributorName>.+)")
    var matched = regex.search(grn)
    if matched == null:
        return null
    return matched.get_string("namespaceName")


static func get_distributor_name_from_grn(grn):
    if grn == null:
        return null
    var regex = RegEx.new()
    regex.compile("grn:gs2:(?<region>.+):(?<ownerId>.+):distributor:(?<namespaceName>.+):model:(?<distributorName>.+)")
    var matched = regex.search(grn)
    if matched == null:
        return null
    return matched.get_string("distributorName")


static func from_dict(data) -> Gs2DistributorDistributorModelMaster:
    if data == null:
        return null
    var ret = Gs2DistributorDistributorModelMaster.new()
    ret.distributor_model_id = null if data.get("distributorModelId") == null else str(data.get("distributorModelId"))
    ret.name = null if data.get("name") == null else str(data.get("name"))
    ret.description = null if data.get("description") == null else str(data.get("description"))
    ret.metadata = null if data.get("metadata") == null else str(data.get("metadata"))
    ret.inbox_namespace_id = null if data.get("inboxNamespaceId") == null else str(data.get("inboxNamespaceId"))
    ret.white_list_target_ids = null if data.get("whiteListTargetIds") == null else data.get("whiteListTargetIds").map(func(v): return str(v))
    ret.created_at = null if data.get("createdAt") == null else int(data.get("createdAt"))
    ret.updated_at = null if data.get("updatedAt") == null else int(data.get("updatedAt"))
    ret.revision = null if data.get("revision") == null else int(data.get("revision"))
    return ret


func to_dict() -> Dictionary:
    var ret = {}
    ret["distributorModelId"] = distributor_model_id
    ret["name"] = name
    ret["description"] = description
    ret["metadata"] = metadata
    ret["inboxNamespaceId"] = inbox_namespace_id
    ret["whiteListTargetIds"] = white_list_target_ids
    ret["createdAt"] = created_at
    ret["updatedAt"] = updated_at
    ret["revision"] = revision
    return ret