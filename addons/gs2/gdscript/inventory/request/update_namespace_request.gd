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
class_name Gs2InventoryUpdateNamespaceRequest
extends Gs2Request


var namespace_name = null
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


func with_namespace_name(v) -> Gs2InventoryUpdateNamespaceRequest:
    namespace_name = v
    return self


func with_description(v) -> Gs2InventoryUpdateNamespaceRequest:
    description = v
    return self


func with_transaction_setting(v) -> Gs2InventoryUpdateNamespaceRequest:
    transaction_setting = v
    return self


func with_acquire_script(v) -> Gs2InventoryUpdateNamespaceRequest:
    acquire_script = v
    return self


func with_overflow_script(v) -> Gs2InventoryUpdateNamespaceRequest:
    overflow_script = v
    return self


func with_consume_script(v) -> Gs2InventoryUpdateNamespaceRequest:
    consume_script = v
    return self


func with_simple_item_acquire_script(v) -> Gs2InventoryUpdateNamespaceRequest:
    simple_item_acquire_script = v
    return self


func with_simple_item_consume_script(v) -> Gs2InventoryUpdateNamespaceRequest:
    simple_item_consume_script = v
    return self


func with_big_item_acquire_script(v) -> Gs2InventoryUpdateNamespaceRequest:
    big_item_acquire_script = v
    return self


func with_big_item_consume_script(v) -> Gs2InventoryUpdateNamespaceRequest:
    big_item_consume_script = v
    return self


func with_log_setting(v) -> Gs2InventoryUpdateNamespaceRequest:
    log_setting = v
    return self


static func from_dict(data) -> Gs2InventoryUpdateNamespaceRequest:
    if data == null:
        return null
    var ret = Gs2InventoryUpdateNamespaceRequest.new()
    ret.namespace_name = null if data.get("namespaceName") == null else str(data.get("namespaceName"))
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
    return ret


func to_dict() -> Dictionary:
    var ret = {}
    ret["namespaceName"] = namespace_name
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
    return ret