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
class_name Gs2ExchangeNamespace
extends RefCounted


var namespace_id = null
var name = null
var description = null
var enable_direct_exchange = null
var enable_await_exchange = null
var transaction_setting = null
var transaction_setting_v2 = null
var exchange_script = null
var incremental_exchange_script = null
var acquire_await_script = null
var log_setting = null
var created_at = null
var updated_at = null
var queue_namespace_id = null
var key_id = null
var revision = null


func with_namespace_id(v) -> Gs2ExchangeNamespace:
    namespace_id = v
    return self


func with_name(v) -> Gs2ExchangeNamespace:
    name = v
    return self


func with_description(v) -> Gs2ExchangeNamespace:
    description = v
    return self


func with_enable_direct_exchange(v) -> Gs2ExchangeNamespace:
    enable_direct_exchange = v
    return self


func with_enable_await_exchange(v) -> Gs2ExchangeNamespace:
    enable_await_exchange = v
    return self


func with_transaction_setting(v) -> Gs2ExchangeNamespace:
    transaction_setting = v
    return self


func with_transaction_setting_v2(v) -> Gs2ExchangeNamespace:
    transaction_setting_v2 = v
    return self


func with_exchange_script(v) -> Gs2ExchangeNamespace:
    exchange_script = v
    return self


func with_incremental_exchange_script(v) -> Gs2ExchangeNamespace:
    incremental_exchange_script = v
    return self


func with_acquire_await_script(v) -> Gs2ExchangeNamespace:
    acquire_await_script = v
    return self


func with_log_setting(v) -> Gs2ExchangeNamespace:
    log_setting = v
    return self


func with_created_at(v) -> Gs2ExchangeNamespace:
    created_at = v
    return self


func with_updated_at(v) -> Gs2ExchangeNamespace:
    updated_at = v
    return self


func with_queue_namespace_id(v) -> Gs2ExchangeNamespace:
    queue_namespace_id = v
    return self


func with_key_id(v) -> Gs2ExchangeNamespace:
    key_id = v
    return self


func with_revision(v) -> Gs2ExchangeNamespace:
    revision = v
    return self


static func get_region_from_grn(grn):
    if grn == null:
        return null
    var regex = RegEx.new()
    regex.compile("grn:gs2:(?<region>.+):(?<ownerId>.+):exchange:(?<namespaceName>.+)")
    var matched = regex.search(grn)
    if matched == null:
        return null
    return matched.get_string("region")


static func get_owner_id_from_grn(grn):
    if grn == null:
        return null
    var regex = RegEx.new()
    regex.compile("grn:gs2:(?<region>.+):(?<ownerId>.+):exchange:(?<namespaceName>.+)")
    var matched = regex.search(grn)
    if matched == null:
        return null
    return matched.get_string("ownerId")


static func get_namespace_name_from_grn(grn):
    if grn == null:
        return null
    var regex = RegEx.new()
    regex.compile("grn:gs2:(?<region>.+):(?<ownerId>.+):exchange:(?<namespaceName>.+)")
    var matched = regex.search(grn)
    if matched == null:
        return null
    return matched.get_string("namespaceName")


static func from_dict(data) -> Gs2ExchangeNamespace:
    if data == null:
        return null
    var ret = Gs2ExchangeNamespace.new()
    ret.namespace_id = null if data.get("namespaceId") == null else str(data.get("namespaceId"))
    ret.name = null if data.get("name") == null else str(data.get("name"))
    ret.description = null if data.get("description") == null else str(data.get("description"))
    ret.enable_direct_exchange = null if data.get("enableDirectExchange") == null else bool(data.get("enableDirectExchange"))
    ret.enable_await_exchange = null if data.get("enableAwaitExchange") == null else bool(data.get("enableAwaitExchange"))
    ret.transaction_setting = null if data.get("transactionSetting") == null else Gs2ExchangeTransactionSetting.from_dict(data.get("transactionSetting"))
    ret.transaction_setting_v2 = null if data.get("transactionSettingV2") == null else Gs2ExchangeTransactionSettingV2.from_dict(data.get("transactionSettingV2"))
    ret.exchange_script = null if data.get("exchangeScript") == null else Gs2ExchangeScriptSetting.from_dict(data.get("exchangeScript"))
    ret.incremental_exchange_script = null if data.get("incrementalExchangeScript") == null else Gs2ExchangeScriptSetting.from_dict(data.get("incrementalExchangeScript"))
    ret.acquire_await_script = null if data.get("acquireAwaitScript") == null else Gs2ExchangeScriptSetting.from_dict(data.get("acquireAwaitScript"))
    ret.log_setting = null if data.get("logSetting") == null else Gs2ExchangeLogSetting.from_dict(data.get("logSetting"))
    ret.created_at = null if data.get("createdAt") == null else int(data.get("createdAt"))
    ret.updated_at = null if data.get("updatedAt") == null else int(data.get("updatedAt"))
    ret.queue_namespace_id = null if data.get("queueNamespaceId") == null else str(data.get("queueNamespaceId"))
    ret.key_id = null if data.get("keyId") == null else str(data.get("keyId"))
    ret.revision = null if data.get("revision") == null else int(data.get("revision"))
    return ret


func to_dict() -> Dictionary:
    var ret = {}
    ret["namespaceId"] = namespace_id
    ret["name"] = name
    ret["description"] = description
    ret["enableDirectExchange"] = enable_direct_exchange
    ret["enableAwaitExchange"] = enable_await_exchange
    ret["transactionSetting"] = null if transaction_setting == null else transaction_setting.to_dict()
    ret["transactionSettingV2"] = null if transaction_setting_v2 == null else transaction_setting_v2.to_dict()
    ret["exchangeScript"] = null if exchange_script == null else exchange_script.to_dict()
    ret["incrementalExchangeScript"] = null if incremental_exchange_script == null else incremental_exchange_script.to_dict()
    ret["acquireAwaitScript"] = null if acquire_await_script == null else acquire_await_script.to_dict()
    ret["logSetting"] = null if log_setting == null else log_setting.to_dict()
    ret["createdAt"] = created_at
    ret["updatedAt"] = updated_at
    ret["queueNamespaceId"] = queue_namespace_id
    ret["keyId"] = key_id
    ret["revision"] = revision
    return ret