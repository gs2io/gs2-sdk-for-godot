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
class_name Gs2InventoryNamespace
extends RefCounted


var namespace_id = null
var name = null
var description = null
var transaction_setting = null
var acquire_script = null
var overflow_script = null
var consume_script = null
var simple_item_acquire_script = null
var simple_item_consume_script = null
var big_item_acquire_script = null
var big_item_consume_script = null
var log_setting = null
var created_at = null
var updated_at = null
var revision = null


func with_namespace_id(v) -> Gs2InventoryNamespace:
    namespace_id = v
    return self


func with_name(v) -> Gs2InventoryNamespace:
    name = v
    return self


func with_description(v) -> Gs2InventoryNamespace:
    description = v
    return self


func with_transaction_setting(v) -> Gs2InventoryNamespace:
    transaction_setting = v
    return self


func with_acquire_script(v) -> Gs2InventoryNamespace:
    acquire_script = v
    return self


func with_overflow_script(v) -> Gs2InventoryNamespace:
    overflow_script = v
    return self


func with_consume_script(v) -> Gs2InventoryNamespace:
    consume_script = v
    return self


func with_simple_item_acquire_script(v) -> Gs2InventoryNamespace:
    simple_item_acquire_script = v
    return self


func with_simple_item_consume_script(v) -> Gs2InventoryNamespace:
    simple_item_consume_script = v
    return self


func with_big_item_acquire_script(v) -> Gs2InventoryNamespace:
    big_item_acquire_script = v
    return self


func with_big_item_consume_script(v) -> Gs2InventoryNamespace:
    big_item_consume_script = v
    return self


func with_log_setting(v) -> Gs2InventoryNamespace:
    log_setting = v
    return self


func with_created_at(v) -> Gs2InventoryNamespace:
    created_at = v
    return self


func with_updated_at(v) -> Gs2InventoryNamespace:
    updated_at = v
    return self


func with_revision(v) -> Gs2InventoryNamespace:
    revision = v
    return self


static func get_region_from_grn(grn):
    if grn == null:
        return null
    var regex = RegEx.new()
    regex.compile("grn:gs2:(?<region>.+):(?<ownerId>.+):inventory:(?<namespaceName>.+)")
    var matched = regex.search(grn)
    if matched == null:
        return null
    return matched.get_string("region")


static func get_owner_id_from_grn(grn):
    if grn == null:
        return null
    var regex = RegEx.new()
    regex.compile("grn:gs2:(?<region>.+):(?<ownerId>.+):inventory:(?<namespaceName>.+)")
    var matched = regex.search(grn)
    if matched == null:
        return null
    return matched.get_string("ownerId")


static func get_namespace_name_from_grn(grn):
    if grn == null:
        return null
    var regex = RegEx.new()
    regex.compile("grn:gs2:(?<region>.+):(?<ownerId>.+):inventory:(?<namespaceName>.+)")
    var matched = regex.search(grn)
    if matched == null:
        return null
    return matched.get_string("namespaceName")


static func from_dict(data) -> Gs2InventoryNamespace:
    if data == null:
        return null
    var ret = Gs2InventoryNamespace.new()
    ret.namespace_id = null if data.get("namespaceId") == null else str(data.get("namespaceId"))
    ret.name = null if data.get("name") == null else str(data.get("name"))
    ret.description = null if data.get("description") == null else str(data.get("description"))
    ret.transaction_setting = null if data.get("transactionSetting") == null else Gs2InventoryTransactionSetting.from_dict(data.get("transactionSetting"))
    ret.acquire_script = null if data.get("acquireScript") == null else Gs2InventoryScriptSetting.from_dict(data.get("acquireScript"))
    ret.overflow_script = null if data.get("overflowScript") == null else Gs2InventoryScriptSetting.from_dict(data.get("overflowScript"))
    ret.consume_script = null if data.get("consumeScript") == null else Gs2InventoryScriptSetting.from_dict(data.get("consumeScript"))
    ret.simple_item_acquire_script = null if data.get("simpleItemAcquireScript") == null else Gs2InventoryScriptSetting.from_dict(data.get("simpleItemAcquireScript"))
    ret.simple_item_consume_script = null if data.get("simpleItemConsumeScript") == null else Gs2InventoryScriptSetting.from_dict(data.get("simpleItemConsumeScript"))
    ret.big_item_acquire_script = null if data.get("bigItemAcquireScript") == null else Gs2InventoryScriptSetting.from_dict(data.get("bigItemAcquireScript"))
    ret.big_item_consume_script = null if data.get("bigItemConsumeScript") == null else Gs2InventoryScriptSetting.from_dict(data.get("bigItemConsumeScript"))
    ret.log_setting = null if data.get("logSetting") == null else Gs2InventoryLogSetting.from_dict(data.get("logSetting"))
    ret.created_at = null if data.get("createdAt") == null else int(data.get("createdAt"))
    ret.updated_at = null if data.get("updatedAt") == null else int(data.get("updatedAt"))
    ret.revision = null if data.get("revision") == null else int(data.get("revision"))
    return ret


func to_dict() -> Dictionary:
    var ret = {}
    ret["namespaceId"] = namespace_id
    ret["name"] = name
    ret["description"] = description
    ret["transactionSetting"] = null if transaction_setting == null else transaction_setting.to_dict()
    ret["acquireScript"] = null if acquire_script == null else acquire_script.to_dict()
    ret["overflowScript"] = null if overflow_script == null else overflow_script.to_dict()
    ret["consumeScript"] = null if consume_script == null else consume_script.to_dict()
    ret["simpleItemAcquireScript"] = null if simple_item_acquire_script == null else simple_item_acquire_script.to_dict()
    ret["simpleItemConsumeScript"] = null if simple_item_consume_script == null else simple_item_consume_script.to_dict()
    ret["bigItemAcquireScript"] = null if big_item_acquire_script == null else big_item_acquire_script.to_dict()
    ret["bigItemConsumeScript"] = null if big_item_consume_script == null else big_item_consume_script.to_dict()
    ret["logSetting"] = null if log_setting == null else log_setting.to_dict()
    ret["createdAt"] = created_at
    ret["updatedAt"] = updated_at
    ret["revision"] = revision
    return ret