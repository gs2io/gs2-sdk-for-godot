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
class_name Gs2SearchIndex
extends RefCounted


var index_id = null
var name = null
var description = null
var column_names = null
var created_at = null
var updated_at = null


func with_index_id(v) -> Gs2SearchIndex:
    index_id = v
    return self


func with_name(v) -> Gs2SearchIndex:
    name = v
    return self


func with_description(v) -> Gs2SearchIndex:
    description = v
    return self


func with_column_names(v) -> Gs2SearchIndex:
    column_names = v
    return self


func with_created_at(v) -> Gs2SearchIndex:
    created_at = v
    return self


func with_updated_at(v) -> Gs2SearchIndex:
    updated_at = v
    return self


static func get_region_from_grn(grn):
    if grn == null:
        return null
    var regex = RegEx.new()
    regex.compile("grn:gs2:(?<region>.+):(?<ownerId>.+):search:(?<namespaceName>.+):table:(?<tableName>.+):index:(?<indexName>.+)")
    var matched = regex.search(grn)
    if matched == null:
        return null
    return matched.get_string("region")


static func get_owner_id_from_grn(grn):
    if grn == null:
        return null
    var regex = RegEx.new()
    regex.compile("grn:gs2:(?<region>.+):(?<ownerId>.+):search:(?<namespaceName>.+):table:(?<tableName>.+):index:(?<indexName>.+)")
    var matched = regex.search(grn)
    if matched == null:
        return null
    return matched.get_string("ownerId")


static func get_namespace_name_from_grn(grn):
    if grn == null:
        return null
    var regex = RegEx.new()
    regex.compile("grn:gs2:(?<region>.+):(?<ownerId>.+):search:(?<namespaceName>.+):table:(?<tableName>.+):index:(?<indexName>.+)")
    var matched = regex.search(grn)
    if matched == null:
        return null
    return matched.get_string("namespaceName")


static func get_table_name_from_grn(grn):
    if grn == null:
        return null
    var regex = RegEx.new()
    regex.compile("grn:gs2:(?<region>.+):(?<ownerId>.+):search:(?<namespaceName>.+):table:(?<tableName>.+):index:(?<indexName>.+)")
    var matched = regex.search(grn)
    if matched == null:
        return null
    return matched.get_string("tableName")


static func get_index_name_from_grn(grn):
    if grn == null:
        return null
    var regex = RegEx.new()
    regex.compile("grn:gs2:(?<region>.+):(?<ownerId>.+):search:(?<namespaceName>.+):table:(?<tableName>.+):index:(?<indexName>.+)")
    var matched = regex.search(grn)
    if matched == null:
        return null
    return matched.get_string("indexName")


static func from_dict(data) -> Gs2SearchIndex:
    if data == null:
        return null
    var ret = Gs2SearchIndex.new()
    ret.index_id = null if data.get("indexId") == null else str(data.get("indexId"))
    ret.name = null if data.get("name") == null else str(data.get("name"))
    ret.description = null if data.get("description") == null else str(data.get("description"))
    ret.column_names = null if data.get("columnNames") == null else data.get("columnNames").map(func(v): return str(v))
    ret.created_at = null if data.get("createdAt") == null else int(data.get("createdAt"))
    ret.updated_at = null if data.get("updatedAt") == null else int(data.get("updatedAt"))
    return ret


func to_dict() -> Dictionary:
    var ret = {}
    ret["indexId"] = index_id
    ret["name"] = name
    ret["description"] = description
    ret["columnNames"] = column_names
    ret["createdAt"] = created_at
    ret["updatedAt"] = updated_at
    return ret