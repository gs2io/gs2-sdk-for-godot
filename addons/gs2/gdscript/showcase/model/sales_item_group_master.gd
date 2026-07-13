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
class_name Gs2ShowcaseSalesItemGroupMaster
extends RefCounted


var sales_item_group_id = null
var name = null
var description = null
var metadata = null
var sales_item_names = null
var created_at = null
var updated_at = null
var revision = null


func with_sales_item_group_id(v) -> Gs2ShowcaseSalesItemGroupMaster:
    sales_item_group_id = v
    return self


func with_name(v) -> Gs2ShowcaseSalesItemGroupMaster:
    name = v
    return self


func with_description(v) -> Gs2ShowcaseSalesItemGroupMaster:
    description = v
    return self


func with_metadata(v) -> Gs2ShowcaseSalesItemGroupMaster:
    metadata = v
    return self


func with_sales_item_names(v) -> Gs2ShowcaseSalesItemGroupMaster:
    sales_item_names = v
    return self


func with_created_at(v) -> Gs2ShowcaseSalesItemGroupMaster:
    created_at = v
    return self


func with_updated_at(v) -> Gs2ShowcaseSalesItemGroupMaster:
    updated_at = v
    return self


func with_revision(v) -> Gs2ShowcaseSalesItemGroupMaster:
    revision = v
    return self


static func get_region_from_grn(grn):
    if grn == null:
        return null
    var regex = RegEx.new()
    regex.compile("grn:gs2:(?<region>.+):(?<ownerId>.+):showcase:(?<namespaceName>.+):salesItemGroup:(?<salesItemGroupName>.+)")
    var matched = regex.search(grn)
    if matched == null:
        return null
    return matched.get_string("region")


static func get_owner_id_from_grn(grn):
    if grn == null:
        return null
    var regex = RegEx.new()
    regex.compile("grn:gs2:(?<region>.+):(?<ownerId>.+):showcase:(?<namespaceName>.+):salesItemGroup:(?<salesItemGroupName>.+)")
    var matched = regex.search(grn)
    if matched == null:
        return null
    return matched.get_string("ownerId")


static func get_namespace_name_from_grn(grn):
    if grn == null:
        return null
    var regex = RegEx.new()
    regex.compile("grn:gs2:(?<region>.+):(?<ownerId>.+):showcase:(?<namespaceName>.+):salesItemGroup:(?<salesItemGroupName>.+)")
    var matched = regex.search(grn)
    if matched == null:
        return null
    return matched.get_string("namespaceName")


static func get_sales_item_group_name_from_grn(grn):
    if grn == null:
        return null
    var regex = RegEx.new()
    regex.compile("grn:gs2:(?<region>.+):(?<ownerId>.+):showcase:(?<namespaceName>.+):salesItemGroup:(?<salesItemGroupName>.+)")
    var matched = regex.search(grn)
    if matched == null:
        return null
    return matched.get_string("salesItemGroupName")


static func from_dict(data) -> Gs2ShowcaseSalesItemGroupMaster:
    if data == null:
        return null
    var ret = Gs2ShowcaseSalesItemGroupMaster.new()
    ret.sales_item_group_id = null if data.get("salesItemGroupId") == null else str(data.get("salesItemGroupId"))
    ret.name = null if data.get("name") == null else str(data.get("name"))
    ret.description = null if data.get("description") == null else str(data.get("description"))
    ret.metadata = null if data.get("metadata") == null else str(data.get("metadata"))
    ret.sales_item_names = null if data.get("salesItemNames") == null else data.get("salesItemNames").map(func(v): return str(v))
    ret.created_at = null if data.get("createdAt") == null else int(data.get("createdAt"))
    ret.updated_at = null if data.get("updatedAt") == null else int(data.get("updatedAt"))
    ret.revision = null if data.get("revision") == null else int(data.get("revision"))
    return ret


func to_dict() -> Dictionary:
    var ret = {}
    ret["salesItemGroupId"] = sales_item_group_id
    ret["name"] = name
    ret["description"] = description
    ret["metadata"] = metadata
    ret["salesItemNames"] = sales_item_names
    ret["createdAt"] = created_at
    ret["updatedAt"] = updated_at
    ret["revision"] = revision
    return ret