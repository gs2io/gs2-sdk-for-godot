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
class_name Gs2StaminaRecoverValueTableMaster
extends RefCounted


var recover_value_table_id = null
var name = null
var metadata = null
var description = null
var experience_model_id = null
var values = null
var created_at = null
var updated_at = null
var revision = null


func with_recover_value_table_id(v) -> Gs2StaminaRecoverValueTableMaster:
    recover_value_table_id = v
    return self


func with_name(v) -> Gs2StaminaRecoverValueTableMaster:
    name = v
    return self


func with_metadata(v) -> Gs2StaminaRecoverValueTableMaster:
    metadata = v
    return self


func with_description(v) -> Gs2StaminaRecoverValueTableMaster:
    description = v
    return self


func with_experience_model_id(v) -> Gs2StaminaRecoverValueTableMaster:
    experience_model_id = v
    return self


func with_values(v) -> Gs2StaminaRecoverValueTableMaster:
    values = v
    return self


func with_created_at(v) -> Gs2StaminaRecoverValueTableMaster:
    created_at = v
    return self


func with_updated_at(v) -> Gs2StaminaRecoverValueTableMaster:
    updated_at = v
    return self


func with_revision(v) -> Gs2StaminaRecoverValueTableMaster:
    revision = v
    return self


static func get_region_from_grn(grn):
    if grn == null:
        return null
    var regex = RegEx.new()
    regex.compile("grn:gs2:(?<region>.+):(?<ownerId>.+):stamina:(?<namespaceName>.+):recoverValueTable:(?<recoverValueTableName>.+)")
    var matched = regex.search(grn)
    if matched == null:
        return null
    return matched.get_string("region")


static func get_owner_id_from_grn(grn):
    if grn == null:
        return null
    var regex = RegEx.new()
    regex.compile("grn:gs2:(?<region>.+):(?<ownerId>.+):stamina:(?<namespaceName>.+):recoverValueTable:(?<recoverValueTableName>.+)")
    var matched = regex.search(grn)
    if matched == null:
        return null
    return matched.get_string("ownerId")


static func get_namespace_name_from_grn(grn):
    if grn == null:
        return null
    var regex = RegEx.new()
    regex.compile("grn:gs2:(?<region>.+):(?<ownerId>.+):stamina:(?<namespaceName>.+):recoverValueTable:(?<recoverValueTableName>.+)")
    var matched = regex.search(grn)
    if matched == null:
        return null
    return matched.get_string("namespaceName")


static func get_recover_value_table_name_from_grn(grn):
    if grn == null:
        return null
    var regex = RegEx.new()
    regex.compile("grn:gs2:(?<region>.+):(?<ownerId>.+):stamina:(?<namespaceName>.+):recoverValueTable:(?<recoverValueTableName>.+)")
    var matched = regex.search(grn)
    if matched == null:
        return null
    return matched.get_string("recoverValueTableName")


static func from_dict(data) -> Gs2StaminaRecoverValueTableMaster:
    if data == null:
        return null
    var ret = Gs2StaminaRecoverValueTableMaster.new()
    ret.recover_value_table_id = null if data.get("recoverValueTableId") == null else str(data.get("recoverValueTableId"))
    ret.name = null if data.get("name") == null else str(data.get("name"))
    ret.metadata = null if data.get("metadata") == null else str(data.get("metadata"))
    ret.description = null if data.get("description") == null else str(data.get("description"))
    ret.experience_model_id = null if data.get("experienceModelId") == null else str(data.get("experienceModelId"))
    ret.values = null if data.get("values") == null else data.get("values").map(func(v): return int(v))
    ret.created_at = null if data.get("createdAt") == null else int(data.get("createdAt"))
    ret.updated_at = null if data.get("updatedAt") == null else int(data.get("updatedAt"))
    ret.revision = null if data.get("revision") == null else int(data.get("revision"))
    return ret


func to_dict() -> Dictionary:
    var ret = {}
    ret["recoverValueTableId"] = recover_value_table_id
    ret["name"] = name
    ret["metadata"] = metadata
    ret["description"] = description
    ret["experienceModelId"] = experience_model_id
    ret["values"] = values
    ret["createdAt"] = created_at
    ret["updatedAt"] = updated_at
    ret["revision"] = revision
    return ret