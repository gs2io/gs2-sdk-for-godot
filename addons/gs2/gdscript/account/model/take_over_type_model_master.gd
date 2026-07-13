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
class_name Gs2AccountTakeOverTypeModelMaster
extends RefCounted


var take_over_type_model_id = null
var type = null
var description = null
var metadata = null
var open_id_connect_setting = null
var created_at = null
var updated_at = null
var revision = null


func with_take_over_type_model_id(v) -> Gs2AccountTakeOverTypeModelMaster:
    take_over_type_model_id = v
    return self


func with_type(v) -> Gs2AccountTakeOverTypeModelMaster:
    type = v
    return self


func with_description(v) -> Gs2AccountTakeOverTypeModelMaster:
    description = v
    return self


func with_metadata(v) -> Gs2AccountTakeOverTypeModelMaster:
    metadata = v
    return self


func with_open_id_connect_setting(v) -> Gs2AccountTakeOverTypeModelMaster:
    open_id_connect_setting = v
    return self


func with_created_at(v) -> Gs2AccountTakeOverTypeModelMaster:
    created_at = v
    return self


func with_updated_at(v) -> Gs2AccountTakeOverTypeModelMaster:
    updated_at = v
    return self


func with_revision(v) -> Gs2AccountTakeOverTypeModelMaster:
    revision = v
    return self


static func get_region_from_grn(grn):
    if grn == null:
        return null
    var regex = RegEx.new()
    regex.compile("grn:gs2:(?<region>.+):(?<ownerId>.+):account:(?<namespaceName>.+):model:takeOver:(?<type>.+)")
    var matched = regex.search(grn)
    if matched == null:
        return null
    return matched.get_string("region")


static func get_owner_id_from_grn(grn):
    if grn == null:
        return null
    var regex = RegEx.new()
    regex.compile("grn:gs2:(?<region>.+):(?<ownerId>.+):account:(?<namespaceName>.+):model:takeOver:(?<type>.+)")
    var matched = regex.search(grn)
    if matched == null:
        return null
    return matched.get_string("ownerId")


static func get_namespace_name_from_grn(grn):
    if grn == null:
        return null
    var regex = RegEx.new()
    regex.compile("grn:gs2:(?<region>.+):(?<ownerId>.+):account:(?<namespaceName>.+):model:takeOver:(?<type>.+)")
    var matched = regex.search(grn)
    if matched == null:
        return null
    return matched.get_string("namespaceName")


static func get_type_from_grn(grn):
    if grn == null:
        return null
    var regex = RegEx.new()
    regex.compile("grn:gs2:(?<region>.+):(?<ownerId>.+):account:(?<namespaceName>.+):model:takeOver:(?<type>.+)")
    var matched = regex.search(grn)
    if matched == null:
        return null
    return matched.get_string("type")


static func from_dict(data) -> Gs2AccountTakeOverTypeModelMaster:
    if data == null:
        return null
    var ret = Gs2AccountTakeOverTypeModelMaster.new()
    ret.take_over_type_model_id = null if data.get("takeOverTypeModelId") == null else str(data.get("takeOverTypeModelId"))
    ret.type = null if data.get("type") == null else int(data.get("type"))
    ret.description = null if data.get("description") == null else str(data.get("description"))
    ret.metadata = null if data.get("metadata") == null else str(data.get("metadata"))
    ret.open_id_connect_setting = null if data.get("openIdConnectSetting") == null else Gs2AccountOpenIdConnectSetting.from_dict(data.get("openIdConnectSetting"))
    ret.created_at = null if data.get("createdAt") == null else int(data.get("createdAt"))
    ret.updated_at = null if data.get("updatedAt") == null else int(data.get("updatedAt"))
    ret.revision = null if data.get("revision") == null else int(data.get("revision"))
    return ret


func to_dict() -> Dictionary:
    var ret = {}
    ret["takeOverTypeModelId"] = take_over_type_model_id
    ret["type"] = type
    ret["description"] = description
    ret["metadata"] = metadata
    ret["openIdConnectSetting"] = null if open_id_connect_setting == null else open_id_connect_setting.to_dict()
    ret["createdAt"] = created_at
    ret["updatedAt"] = updated_at
    ret["revision"] = revision
    return ret