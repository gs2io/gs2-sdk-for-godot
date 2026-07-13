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
class_name Gs2FormationMoldModelMaster
extends RefCounted


var mold_model_id = null
var name = null
var description = null
var metadata = null
var initial_max_capacity = null
var max_capacity = null
var form_model_name = null
var created_at = null
var updated_at = null
var revision = null


func with_mold_model_id(v) -> Gs2FormationMoldModelMaster:
    mold_model_id = v
    return self


func with_name(v) -> Gs2FormationMoldModelMaster:
    name = v
    return self


func with_description(v) -> Gs2FormationMoldModelMaster:
    description = v
    return self


func with_metadata(v) -> Gs2FormationMoldModelMaster:
    metadata = v
    return self


func with_initial_max_capacity(v) -> Gs2FormationMoldModelMaster:
    initial_max_capacity = v
    return self


func with_max_capacity(v) -> Gs2FormationMoldModelMaster:
    max_capacity = v
    return self


func with_form_model_name(v) -> Gs2FormationMoldModelMaster:
    form_model_name = v
    return self


func with_created_at(v) -> Gs2FormationMoldModelMaster:
    created_at = v
    return self


func with_updated_at(v) -> Gs2FormationMoldModelMaster:
    updated_at = v
    return self


func with_revision(v) -> Gs2FormationMoldModelMaster:
    revision = v
    return self


static func get_region_from_grn(grn):
    if grn == null:
        return null
    var regex = RegEx.new()
    regex.compile("grn:gs2:(?<region>.+):(?<ownerId>.+):formation:(?<namespaceName>.+):model:mold:(?<moldModelName>.+)")
    var matched = regex.search(grn)
    if matched == null:
        return null
    return matched.get_string("region")


static func get_owner_id_from_grn(grn):
    if grn == null:
        return null
    var regex = RegEx.new()
    regex.compile("grn:gs2:(?<region>.+):(?<ownerId>.+):formation:(?<namespaceName>.+):model:mold:(?<moldModelName>.+)")
    var matched = regex.search(grn)
    if matched == null:
        return null
    return matched.get_string("ownerId")


static func get_namespace_name_from_grn(grn):
    if grn == null:
        return null
    var regex = RegEx.new()
    regex.compile("grn:gs2:(?<region>.+):(?<ownerId>.+):formation:(?<namespaceName>.+):model:mold:(?<moldModelName>.+)")
    var matched = regex.search(grn)
    if matched == null:
        return null
    return matched.get_string("namespaceName")


static func get_mold_model_name_from_grn(grn):
    if grn == null:
        return null
    var regex = RegEx.new()
    regex.compile("grn:gs2:(?<region>.+):(?<ownerId>.+):formation:(?<namespaceName>.+):model:mold:(?<moldModelName>.+)")
    var matched = regex.search(grn)
    if matched == null:
        return null
    return matched.get_string("moldModelName")


static func from_dict(data) -> Gs2FormationMoldModelMaster:
    if data == null:
        return null
    var ret = Gs2FormationMoldModelMaster.new()
    ret.mold_model_id = null if data.get("moldModelId") == null else str(data.get("moldModelId"))
    ret.name = null if data.get("name") == null else str(data.get("name"))
    ret.description = null if data.get("description") == null else str(data.get("description"))
    ret.metadata = null if data.get("metadata") == null else str(data.get("metadata"))
    ret.initial_max_capacity = null if data.get("initialMaxCapacity") == null else int(data.get("initialMaxCapacity"))
    ret.max_capacity = null if data.get("maxCapacity") == null else int(data.get("maxCapacity"))
    ret.form_model_name = null if data.get("formModelName") == null else str(data.get("formModelName"))
    ret.created_at = null if data.get("createdAt") == null else int(data.get("createdAt"))
    ret.updated_at = null if data.get("updatedAt") == null else int(data.get("updatedAt"))
    ret.revision = null if data.get("revision") == null else int(data.get("revision"))
    return ret


func to_dict() -> Dictionary:
    var ret = {}
    ret["moldModelId"] = mold_model_id
    ret["name"] = name
    ret["description"] = description
    ret["metadata"] = metadata
    ret["initialMaxCapacity"] = initial_max_capacity
    ret["maxCapacity"] = max_capacity
    ret["formModelName"] = form_model_name
    ret["createdAt"] = created_at
    ret["updatedAt"] = updated_at
    ret["revision"] = revision
    return ret