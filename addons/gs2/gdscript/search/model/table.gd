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
class_name Gs2SearchTable
extends RefCounted


var table_id = null
var name = null
var description = null
var primary_key_name = null
var columns = null
var created_at = null
var updated_at = null


func with_table_id(v) -> Gs2SearchTable:
    table_id = v
    return self


func with_name(v) -> Gs2SearchTable:
    name = v
    return self


func with_description(v) -> Gs2SearchTable:
    description = v
    return self


func with_primary_key_name(v) -> Gs2SearchTable:
    primary_key_name = v
    return self


func with_columns(v) -> Gs2SearchTable:
    columns = v
    return self


func with_created_at(v) -> Gs2SearchTable:
    created_at = v
    return self


func with_updated_at(v) -> Gs2SearchTable:
    updated_at = v
    return self


static func get_region_from_grn(grn):
    if grn == null:
        return null
    var regex = RegEx.new()
    regex.compile("grn:gs2:(?<region>.+):(?<ownerId>.+):search:(?<namespaceName>.+):table:(?<tableName>.+)")
    var matched = regex.search(grn)
    if matched == null:
        return null
    return matched.get_string("region")


static func get_owner_id_from_grn(grn):
    if grn == null:
        return null
    var regex = RegEx.new()
    regex.compile("grn:gs2:(?<region>.+):(?<ownerId>.+):search:(?<namespaceName>.+):table:(?<tableName>.+)")
    var matched = regex.search(grn)
    if matched == null:
        return null
    return matched.get_string("ownerId")


static func get_namespace_name_from_grn(grn):
    if grn == null:
        return null
    var regex = RegEx.new()
    regex.compile("grn:gs2:(?<region>.+):(?<ownerId>.+):search:(?<namespaceName>.+):table:(?<tableName>.+)")
    var matched = regex.search(grn)
    if matched == null:
        return null
    return matched.get_string("namespaceName")


static func get_table_name_from_grn(grn):
    if grn == null:
        return null
    var regex = RegEx.new()
    regex.compile("grn:gs2:(?<region>.+):(?<ownerId>.+):search:(?<namespaceName>.+):table:(?<tableName>.+)")
    var matched = regex.search(grn)
    if matched == null:
        return null
    return matched.get_string("tableName")


static func from_dict(data) -> Gs2SearchTable:
    if data == null:
        return null
    var ret = Gs2SearchTable.new()
    ret.table_id = null if data.get("tableId") == null else str(data.get("tableId"))
    ret.name = null if data.get("name") == null else str(data.get("name"))
    ret.description = null if data.get("description") == null else str(data.get("description"))
    ret.primary_key_name = null if data.get("primaryKeyName") == null else str(data.get("primaryKeyName"))
    ret.columns = null if data.get("columns") == null else data.get("columns").map(func(v): return Gs2SearchColumn.from_dict(v))
    ret.created_at = null if data.get("createdAt") == null else int(data.get("createdAt"))
    ret.updated_at = null if data.get("updatedAt") == null else int(data.get("updatedAt"))
    return ret


func to_dict() -> Dictionary:
    var ret = {}
    ret["tableId"] = table_id
    ret["name"] = name
    ret["description"] = description
    ret["primaryKeyName"] = primary_key_name
    ret["columns"] = null if columns == null else columns.map(func(v): return null if v == null else v.to_dict())
    ret["createdAt"] = created_at
    ret["updatedAt"] = updated_at
    return ret