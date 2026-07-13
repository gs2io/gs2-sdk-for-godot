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
class_name Gs2AccountTakeOverTypeModel
extends RefCounted


var take_over_type_model_id = null
var type = null
var metadata = null
var open_id_connect_setting = null


func with_take_over_type_model_id(v) -> Gs2AccountTakeOverTypeModel:
    take_over_type_model_id = v
    return self


func with_type(v) -> Gs2AccountTakeOverTypeModel:
    type = v
    return self


func with_metadata(v) -> Gs2AccountTakeOverTypeModel:
    metadata = v
    return self


func with_open_id_connect_setting(v) -> Gs2AccountTakeOverTypeModel:
    open_id_connect_setting = v
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


static func from_dict(data) -> Gs2AccountTakeOverTypeModel:
    if data == null:
        return null
    var ret = Gs2AccountTakeOverTypeModel.new()
    ret.take_over_type_model_id = null if data.get("takeOverTypeModelId") == null else str(data.get("takeOverTypeModelId"))
    ret.type = null if data.get("type") == null else int(data.get("type"))
    ret.metadata = null if data.get("metadata") == null else str(data.get("metadata"))
    ret.open_id_connect_setting = null if data.get("openIdConnectSetting") == null else Gs2AccountOpenIdConnectSetting.from_dict(data.get("openIdConnectSetting"))
    return ret


func to_dict() -> Dictionary:
    var ret = {}
    ret["takeOverTypeModelId"] = take_over_type_model_id
    ret["type"] = type
    ret["metadata"] = metadata
    ret["openIdConnectSetting"] = null if open_id_connect_setting == null else open_id_connect_setting.to_dict()
    return ret