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
class_name Gs2DictionaryEntry
extends RefCounted


var entry_id = null
var user_id = null
var name = null
var acquired_at = null


func with_entry_id(v) -> Gs2DictionaryEntry:
    entry_id = v
    return self


func with_user_id(v) -> Gs2DictionaryEntry:
    user_id = v
    return self


func with_name(v) -> Gs2DictionaryEntry:
    name = v
    return self


func with_acquired_at(v) -> Gs2DictionaryEntry:
    acquired_at = v
    return self


static func get_region_from_grn(grn):
    if grn == null:
        return null
    var regex = RegEx.new()
    regex.compile("grn:gs2:(?<region>.+):(?<ownerId>.+):dictionary:(?<namespaceName>.+):user:(?<userId>.+):entry:(?<entryModelName>.+)")
    var matched = regex.search(grn)
    if matched == null:
        return null
    return matched.get_string("region")


static func get_owner_id_from_grn(grn):
    if grn == null:
        return null
    var regex = RegEx.new()
    regex.compile("grn:gs2:(?<region>.+):(?<ownerId>.+):dictionary:(?<namespaceName>.+):user:(?<userId>.+):entry:(?<entryModelName>.+)")
    var matched = regex.search(grn)
    if matched == null:
        return null
    return matched.get_string("ownerId")


static func get_namespace_name_from_grn(grn):
    if grn == null:
        return null
    var regex = RegEx.new()
    regex.compile("grn:gs2:(?<region>.+):(?<ownerId>.+):dictionary:(?<namespaceName>.+):user:(?<userId>.+):entry:(?<entryModelName>.+)")
    var matched = regex.search(grn)
    if matched == null:
        return null
    return matched.get_string("namespaceName")


static func get_user_id_from_grn(grn):
    if grn == null:
        return null
    var regex = RegEx.new()
    regex.compile("grn:gs2:(?<region>.+):(?<ownerId>.+):dictionary:(?<namespaceName>.+):user:(?<userId>.+):entry:(?<entryModelName>.+)")
    var matched = regex.search(grn)
    if matched == null:
        return null
    return matched.get_string("userId")


static func get_entry_model_name_from_grn(grn):
    if grn == null:
        return null
    var regex = RegEx.new()
    regex.compile("grn:gs2:(?<region>.+):(?<ownerId>.+):dictionary:(?<namespaceName>.+):user:(?<userId>.+):entry:(?<entryModelName>.+)")
    var matched = regex.search(grn)
    if matched == null:
        return null
    return matched.get_string("entryModelName")


static func from_dict(data) -> Gs2DictionaryEntry:
    if data == null:
        return null
    var ret = Gs2DictionaryEntry.new()
    ret.entry_id = null if data.get("entryId") == null else str(data.get("entryId"))
    ret.user_id = null if data.get("userId") == null else str(data.get("userId"))
    ret.name = null if data.get("name") == null else str(data.get("name"))
    ret.acquired_at = null if data.get("acquiredAt") == null else int(data.get("acquiredAt"))
    return ret


func to_dict() -> Dictionary:
    var ret = {}
    ret["entryId"] = entry_id
    ret["userId"] = user_id
    ret["name"] = name
    ret["acquiredAt"] = acquired_at
    return ret