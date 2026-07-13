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
class_name Gs2ScriptScript
extends RefCounted


var script_id = null
var name = null
var description = null
var script_ = null
var disable_string_number_to_number = null
var created_at = null
var updated_at = null
var revision = null


func with_script_id(v) -> Gs2ScriptScript:
    script_id = v
    return self


func with_name(v) -> Gs2ScriptScript:
    name = v
    return self


func with_description(v) -> Gs2ScriptScript:
    description = v
    return self


func with_script(v) -> Gs2ScriptScript:
    script_ = v
    return self


func with_disable_string_number_to_number(v) -> Gs2ScriptScript:
    disable_string_number_to_number = v
    return self


func with_created_at(v) -> Gs2ScriptScript:
    created_at = v
    return self


func with_updated_at(v) -> Gs2ScriptScript:
    updated_at = v
    return self


func with_revision(v) -> Gs2ScriptScript:
    revision = v
    return self


static func get_region_from_grn(grn):
    if grn == null:
        return null
    var regex = RegEx.new()
    regex.compile("grn:gs2:(?<region>.+):(?<ownerId>.+):script:(?<namespaceName>.+):script:(?<scriptName>.+)")
    var matched = regex.search(grn)
    if matched == null:
        return null
    return matched.get_string("region")


static func get_owner_id_from_grn(grn):
    if grn == null:
        return null
    var regex = RegEx.new()
    regex.compile("grn:gs2:(?<region>.+):(?<ownerId>.+):script:(?<namespaceName>.+):script:(?<scriptName>.+)")
    var matched = regex.search(grn)
    if matched == null:
        return null
    return matched.get_string("ownerId")


static func get_namespace_name_from_grn(grn):
    if grn == null:
        return null
    var regex = RegEx.new()
    regex.compile("grn:gs2:(?<region>.+):(?<ownerId>.+):script:(?<namespaceName>.+):script:(?<scriptName>.+)")
    var matched = regex.search(grn)
    if matched == null:
        return null
    return matched.get_string("namespaceName")


static func get_script_name_from_grn(grn):
    if grn == null:
        return null
    var regex = RegEx.new()
    regex.compile("grn:gs2:(?<region>.+):(?<ownerId>.+):script:(?<namespaceName>.+):script:(?<scriptName>.+)")
    var matched = regex.search(grn)
    if matched == null:
        return null
    return matched.get_string("scriptName")


static func from_dict(data) -> Gs2ScriptScript:
    if data == null:
        return null
    var ret = Gs2ScriptScript.new()
    ret.script_id = null if data.get("scriptId") == null else str(data.get("scriptId"))
    ret.name = null if data.get("name") == null else str(data.get("name"))
    ret.description = null if data.get("description") == null else str(data.get("description"))
    ret.script_ = null if data.get("script") == null else str(data.get("script"))
    ret.disable_string_number_to_number = null if data.get("disableStringNumberToNumber") == null else bool(data.get("disableStringNumberToNumber"))
    ret.created_at = null if data.get("createdAt") == null else int(data.get("createdAt"))
    ret.updated_at = null if data.get("updatedAt") == null else int(data.get("updatedAt"))
    ret.revision = null if data.get("revision") == null else int(data.get("revision"))
    return ret


func to_dict() -> Dictionary:
    var ret = {}
    ret["scriptId"] = script_id
    ret["name"] = name
    ret["description"] = description
    ret["script"] = script_
    ret["disableStringNumberToNumber"] = disable_string_number_to_number
    ret["createdAt"] = created_at
    ret["updatedAt"] = updated_at
    ret["revision"] = revision
    return ret