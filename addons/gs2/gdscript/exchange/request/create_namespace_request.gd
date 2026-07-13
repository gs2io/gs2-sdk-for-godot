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
class_name Gs2ExchangeCreateNamespaceRequest
extends Gs2Request


var name = null
var description = null
var enable_await_exchange = null
var enable_direct_exchange = null
var transaction_setting = null
var exchange_script = null
var incremental_exchange_script = null
var acquire_await_script = null
var log_setting = null
var queue_namespace_id = null
var key_id = null


func with_name(v) -> Gs2ExchangeCreateNamespaceRequest:
    name = v
    return self


func with_description(v) -> Gs2ExchangeCreateNamespaceRequest:
    description = v
    return self


func with_enable_await_exchange(v) -> Gs2ExchangeCreateNamespaceRequest:
    enable_await_exchange = v
    return self


func with_enable_direct_exchange(v) -> Gs2ExchangeCreateNamespaceRequest:
    enable_direct_exchange = v
    return self


func with_transaction_setting(v) -> Gs2ExchangeCreateNamespaceRequest:
    transaction_setting = v
    return self


func with_exchange_script(v) -> Gs2ExchangeCreateNamespaceRequest:
    exchange_script = v
    return self


func with_incremental_exchange_script(v) -> Gs2ExchangeCreateNamespaceRequest:
    incremental_exchange_script = v
    return self


func with_acquire_await_script(v) -> Gs2ExchangeCreateNamespaceRequest:
    acquire_await_script = v
    return self


func with_log_setting(v) -> Gs2ExchangeCreateNamespaceRequest:
    log_setting = v
    return self


func with_queue_namespace_id(v) -> Gs2ExchangeCreateNamespaceRequest:
    queue_namespace_id = v
    return self


func with_key_id(v) -> Gs2ExchangeCreateNamespaceRequest:
    key_id = v
    return self


static func from_dict(data) -> Gs2ExchangeCreateNamespaceRequest:
    if data == null:
        return null
    var ret = Gs2ExchangeCreateNamespaceRequest.new()
    ret.name = null if data.get("name") == null else str(data.get("name"))
    ret.description = null if data.get("description") == null else str(data.get("description"))
    ret.enable_await_exchange = null if data.get("enableAwaitExchange") == null else bool(data.get("enableAwaitExchange"))
    ret.enable_direct_exchange = null if data.get("enableDirectExchange") == null else bool(data.get("enableDirectExchange"))
    ret.transaction_setting = null if data.get("transactionSetting") == null else Gs2ExchangeTransactionSetting.from_dict(data.get("transactionSetting"))
    ret.exchange_script = null if data.get("exchangeScript") == null else Gs2ExchangeScriptSetting.from_dict(data.get("exchangeScript"))
    ret.incremental_exchange_script = null if data.get("incrementalExchangeScript") == null else Gs2ExchangeScriptSetting.from_dict(data.get("incrementalExchangeScript"))
    ret.acquire_await_script = null if data.get("acquireAwaitScript") == null else Gs2ExchangeScriptSetting.from_dict(data.get("acquireAwaitScript"))
    ret.log_setting = null if data.get("logSetting") == null else Gs2ExchangeLogSetting.from_dict(data.get("logSetting"))
    ret.queue_namespace_id = null if data.get("queueNamespaceId") == null else str(data.get("queueNamespaceId"))
    ret.key_id = null if data.get("keyId") == null else str(data.get("keyId"))
    return ret


func to_dict() -> Dictionary:
    var ret = {}
    ret["name"] = name
    ret["description"] = description
    ret["enableAwaitExchange"] = enable_await_exchange
    ret["enableDirectExchange"] = enable_direct_exchange
    ret["transactionSetting"] = null if transaction_setting == null else transaction_setting.to_dict()
    ret["exchangeScript"] = null if exchange_script == null else exchange_script.to_dict()
    ret["incrementalExchangeScript"] = null if incremental_exchange_script == null else incremental_exchange_script.to_dict()
    ret["acquireAwaitScript"] = null if acquire_await_script == null else acquire_await_script.to_dict()
    ret["logSetting"] = null if log_setting == null else log_setting.to_dict()
    ret["queueNamespaceId"] = queue_namespace_id
    ret["keyId"] = key_id
    return ret