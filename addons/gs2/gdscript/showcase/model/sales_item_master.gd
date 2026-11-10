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
class_name Gs2ShowcaseSalesItemMaster
extends RefCounted


var sales_item_id = null
var name = null
var description = null
var metadata = null
var verify_actions = null
var consume_actions = null
var acquire_actions = null
var bonuses = null
var created_at = null
var updated_at = null
var revision = null


func with_sales_item_id(v) -> Gs2ShowcaseSalesItemMaster:
    sales_item_id = v
    return self


func with_name(v) -> Gs2ShowcaseSalesItemMaster:
    name = v
    return self


func with_description(v) -> Gs2ShowcaseSalesItemMaster:
    description = v
    return self


func with_metadata(v) -> Gs2ShowcaseSalesItemMaster:
    metadata = v
    return self


func with_verify_actions(v) -> Gs2ShowcaseSalesItemMaster:
    verify_actions = v
    return self


func with_consume_actions(v) -> Gs2ShowcaseSalesItemMaster:
    consume_actions = v
    return self


func with_acquire_actions(v) -> Gs2ShowcaseSalesItemMaster:
    acquire_actions = v
    return self


func with_bonuses(v) -> Gs2ShowcaseSalesItemMaster:
    bonuses = v
    return self


func with_created_at(v) -> Gs2ShowcaseSalesItemMaster:
    created_at = v
    return self


func with_updated_at(v) -> Gs2ShowcaseSalesItemMaster:
    updated_at = v
    return self


func with_revision(v) -> Gs2ShowcaseSalesItemMaster:
    revision = v
    return self


static func get_region_from_grn(grn):
    if grn == null:
        return null
    var regex = RegEx.new()
    regex.compile("grn:gs2:(?<region>.+):(?<ownerId>.+):showcase:(?<namespaceName>.+):salesItem:(?<salesItemName>.+)")
    var matched = regex.search(grn)
    if matched == null:
        return null
    return matched.get_string("region")


static func get_owner_id_from_grn(grn):
    if grn == null:
        return null
    var regex = RegEx.new()
    regex.compile("grn:gs2:(?<region>.+):(?<ownerId>.+):showcase:(?<namespaceName>.+):salesItem:(?<salesItemName>.+)")
    var matched = regex.search(grn)
    if matched == null:
        return null
    return matched.get_string("ownerId")


static func get_namespace_name_from_grn(grn):
    if grn == null:
        return null
    var regex = RegEx.new()
    regex.compile("grn:gs2:(?<region>.+):(?<ownerId>.+):showcase:(?<namespaceName>.+):salesItem:(?<salesItemName>.+)")
    var matched = regex.search(grn)
    if matched == null:
        return null
    return matched.get_string("namespaceName")


static func get_sales_item_name_from_grn(grn):
    if grn == null:
        return null
    var regex = RegEx.new()
    regex.compile("grn:gs2:(?<region>.+):(?<ownerId>.+):showcase:(?<namespaceName>.+):salesItem:(?<salesItemName>.+)")
    var matched = regex.search(grn)
    if matched == null:
        return null
    return matched.get_string("salesItemName")


static func from_dict(data) -> Gs2ShowcaseSalesItemMaster:
    if data == null:
        return null
    var ret = Gs2ShowcaseSalesItemMaster.new()
    ret.sales_item_id = null if data.get("salesItemId") == null else str(data.get("salesItemId"))
    ret.name = null if data.get("name") == null else str(data.get("name"))
    ret.description = null if data.get("description") == null else str(data.get("description"))
    ret.metadata = null if data.get("metadata") == null else str(data.get("metadata"))
    ret.verify_actions = null if data.get("verifyActions") == null else data.get("verifyActions").map(func(v): return Gs2VerifyAction.from_dict(v))
    ret.consume_actions = null if data.get("consumeActions") == null else data.get("consumeActions").map(func(v): return Gs2ConsumeAction.from_dict(v))
    ret.acquire_actions = null if data.get("acquireActions") == null else data.get("acquireActions").map(func(v): return Gs2AcquireAction.from_dict(v))
    ret.bonuses = null if data.get("bonuses") == null else data.get("bonuses").map(func(v): return Gs2ShowcaseBonus.from_dict(v))
    ret.created_at = null if data.get("createdAt") == null else int(data.get("createdAt"))
    ret.updated_at = null if data.get("updatedAt") == null else int(data.get("updatedAt"))
    ret.revision = null if data.get("revision") == null else int(data.get("revision"))
    return ret


func to_dict() -> Dictionary:
    var ret = {}
    ret["salesItemId"] = sales_item_id
    ret["name"] = name
    ret["description"] = description
    ret["metadata"] = metadata
    ret["verifyActions"] = null if verify_actions == null else verify_actions.map(func(v): return null if v == null else v.to_dict())
    ret["consumeActions"] = null if consume_actions == null else consume_actions.map(func(v): return null if v == null else v.to_dict())
    ret["acquireActions"] = null if acquire_actions == null else acquire_actions.map(func(v): return null if v == null else v.to_dict())
    ret["bonuses"] = null if bonuses == null else bonuses.map(func(v): return null if v == null else v.to_dict())
    ret["createdAt"] = created_at
    ret["updatedAt"] = updated_at
    ret["revision"] = revision
    return ret