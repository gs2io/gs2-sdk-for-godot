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
class_name Gs2FormationForm
extends RefCounted


var form_id = null
var name = null
var index = null
var slots = null
var created_at = null
var updated_at = null
var revision = null


func with_form_id(v) -> Gs2FormationForm:
    form_id = v
    return self


func with_name(v) -> Gs2FormationForm:
    name = v
    return self


func with_index(v) -> Gs2FormationForm:
    index = v
    return self


func with_slots(v) -> Gs2FormationForm:
    slots = v
    return self


func with_created_at(v) -> Gs2FormationForm:
    created_at = v
    return self


func with_updated_at(v) -> Gs2FormationForm:
    updated_at = v
    return self


func with_revision(v) -> Gs2FormationForm:
    revision = v
    return self


static func get_region_from_grn(grn):
    if grn == null:
        return null
    var regex = RegEx.new()
    regex.compile("grn:gs2:(?<region>.+):(?<ownerId>.+):formation:(?<namespaceName>.+):user:(?<userId>.+):mold:(?<moldModelName>.+):form:(?<index>.+)")
    var matched = regex.search(grn)
    if matched == null:
        return null
    return matched.get_string("region")


static func get_owner_id_from_grn(grn):
    if grn == null:
        return null
    var regex = RegEx.new()
    regex.compile("grn:gs2:(?<region>.+):(?<ownerId>.+):formation:(?<namespaceName>.+):user:(?<userId>.+):mold:(?<moldModelName>.+):form:(?<index>.+)")
    var matched = regex.search(grn)
    if matched == null:
        return null
    return matched.get_string("ownerId")


static func get_namespace_name_from_grn(grn):
    if grn == null:
        return null
    var regex = RegEx.new()
    regex.compile("grn:gs2:(?<region>.+):(?<ownerId>.+):formation:(?<namespaceName>.+):user:(?<userId>.+):mold:(?<moldModelName>.+):form:(?<index>.+)")
    var matched = regex.search(grn)
    if matched == null:
        return null
    return matched.get_string("namespaceName")


static func get_user_id_from_grn(grn):
    if grn == null:
        return null
    var regex = RegEx.new()
    regex.compile("grn:gs2:(?<region>.+):(?<ownerId>.+):formation:(?<namespaceName>.+):user:(?<userId>.+):mold:(?<moldModelName>.+):form:(?<index>.+)")
    var matched = regex.search(grn)
    if matched == null:
        return null
    return matched.get_string("userId")


static func get_mold_model_name_from_grn(grn):
    if grn == null:
        return null
    var regex = RegEx.new()
    regex.compile("grn:gs2:(?<region>.+):(?<ownerId>.+):formation:(?<namespaceName>.+):user:(?<userId>.+):mold:(?<moldModelName>.+):form:(?<index>.+)")
    var matched = regex.search(grn)
    if matched == null:
        return null
    return matched.get_string("moldModelName")


static func get_index_from_grn(grn):
    if grn == null:
        return null
    var regex = RegEx.new()
    regex.compile("grn:gs2:(?<region>.+):(?<ownerId>.+):formation:(?<namespaceName>.+):user:(?<userId>.+):mold:(?<moldModelName>.+):form:(?<index>.+)")
    var matched = regex.search(grn)
    if matched == null:
        return null
    return matched.get_string("index")


static func from_dict(data) -> Gs2FormationForm:
    if data == null:
        return null
    var ret = Gs2FormationForm.new()
    ret.form_id = null if data.get("formId") == null else str(data.get("formId"))
    ret.name = null if data.get("name") == null else str(data.get("name"))
    ret.index = null if data.get("index") == null else int(data.get("index"))
    ret.slots = null if data.get("slots") == null else data.get("slots").map(func(v): return Gs2FormationSlot.from_dict(v))
    ret.created_at = null if data.get("createdAt") == null else int(data.get("createdAt"))
    ret.updated_at = null if data.get("updatedAt") == null else int(data.get("updatedAt"))
    ret.revision = null if data.get("revision") == null else int(data.get("revision"))
    return ret


func to_dict() -> Dictionary:
    var ret = {}
    ret["formId"] = form_id
    ret["name"] = name
    ret["index"] = index
    ret["slots"] = null if slots == null else slots.map(func(v): return null if v == null else v.to_dict())
    ret["createdAt"] = created_at
    ret["updatedAt"] = updated_at
    ret["revision"] = revision
    return ret