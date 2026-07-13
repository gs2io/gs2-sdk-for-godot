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
class_name Gs2Money2UpdateNamespaceRequest
extends Gs2Request


var namespace_name = null
var currency_usage_priority = null
var description = null
var transaction_setting = null
var platform_setting = null
var deposit_balance_script = null
var withdraw_balance_script = null
var verify_receipt_script = null
var subscribe_script = null
var renew_script = null
var unsubscribe_script = null
var take_over_script = null
var change_subscription_status_notification = null
var log_setting = null


func with_namespace_name(v) -> Gs2Money2UpdateNamespaceRequest:
    namespace_name = v
    return self


func with_currency_usage_priority(v) -> Gs2Money2UpdateNamespaceRequest:
    currency_usage_priority = v
    return self


func with_description(v) -> Gs2Money2UpdateNamespaceRequest:
    description = v
    return self


func with_transaction_setting(v) -> Gs2Money2UpdateNamespaceRequest:
    transaction_setting = v
    return self


func with_platform_setting(v) -> Gs2Money2UpdateNamespaceRequest:
    platform_setting = v
    return self


func with_deposit_balance_script(v) -> Gs2Money2UpdateNamespaceRequest:
    deposit_balance_script = v
    return self


func with_withdraw_balance_script(v) -> Gs2Money2UpdateNamespaceRequest:
    withdraw_balance_script = v
    return self


func with_verify_receipt_script(v) -> Gs2Money2UpdateNamespaceRequest:
    verify_receipt_script = v
    return self


func with_subscribe_script(v) -> Gs2Money2UpdateNamespaceRequest:
    subscribe_script = v
    return self


func with_renew_script(v) -> Gs2Money2UpdateNamespaceRequest:
    renew_script = v
    return self


func with_unsubscribe_script(v) -> Gs2Money2UpdateNamespaceRequest:
    unsubscribe_script = v
    return self


func with_take_over_script(v) -> Gs2Money2UpdateNamespaceRequest:
    take_over_script = v
    return self


func with_change_subscription_status_notification(v) -> Gs2Money2UpdateNamespaceRequest:
    change_subscription_status_notification = v
    return self


func with_log_setting(v) -> Gs2Money2UpdateNamespaceRequest:
    log_setting = v
    return self


static func from_dict(data) -> Gs2Money2UpdateNamespaceRequest:
    if data == null:
        return null
    var ret = Gs2Money2UpdateNamespaceRequest.new()
    ret.namespace_name = null if data.get("namespaceName") == null else str(data.get("namespaceName"))
    ret.currency_usage_priority = null if data.get("currencyUsagePriority") == null else str(data.get("currencyUsagePriority"))
    ret.description = null if data.get("description") == null else str(data.get("description"))
    ret.transaction_setting = null if data.get("transactionSetting") == null else Gs2Money2TransactionSetting.from_dict(data.get("transactionSetting"))
    ret.platform_setting = null if data.get("platformSetting") == null else Gs2Money2PlatformSetting.from_dict(data.get("platformSetting"))
    ret.deposit_balance_script = null if data.get("depositBalanceScript") == null else Gs2Money2ScriptSetting.from_dict(data.get("depositBalanceScript"))
    ret.withdraw_balance_script = null if data.get("withdrawBalanceScript") == null else Gs2Money2ScriptSetting.from_dict(data.get("withdrawBalanceScript"))
    ret.verify_receipt_script = null if data.get("verifyReceiptScript") == null else Gs2Money2ScriptSetting.from_dict(data.get("verifyReceiptScript"))
    ret.subscribe_script = null if data.get("subscribeScript") == null else str(data.get("subscribeScript"))
    ret.renew_script = null if data.get("renewScript") == null else str(data.get("renewScript"))
    ret.unsubscribe_script = null if data.get("unsubscribeScript") == null else str(data.get("unsubscribeScript"))
    ret.take_over_script = null if data.get("takeOverScript") == null else Gs2Money2ScriptSetting.from_dict(data.get("takeOverScript"))
    ret.change_subscription_status_notification = null if data.get("changeSubscriptionStatusNotification") == null else Gs2Money2NotificationSetting.from_dict(data.get("changeSubscriptionStatusNotification"))
    ret.log_setting = null if data.get("logSetting") == null else Gs2Money2LogSetting.from_dict(data.get("logSetting"))
    return ret


func to_dict() -> Dictionary:
    var ret = {}
    ret["namespaceName"] = namespace_name
    ret["currencyUsagePriority"] = currency_usage_priority
    ret["description"] = description
    ret["transactionSetting"] = null if transaction_setting == null else transaction_setting.to_dict()
    ret["platformSetting"] = null if platform_setting == null else platform_setting.to_dict()
    ret["depositBalanceScript"] = null if deposit_balance_script == null else deposit_balance_script.to_dict()
    ret["withdrawBalanceScript"] = null if withdraw_balance_script == null else withdraw_balance_script.to_dict()
    ret["verifyReceiptScript"] = null if verify_receipt_script == null else verify_receipt_script.to_dict()
    ret["subscribeScript"] = subscribe_script
    ret["renewScript"] = renew_script
    ret["unsubscribeScript"] = unsubscribe_script
    ret["takeOverScript"] = null if take_over_script == null else take_over_script.to_dict()
    ret["changeSubscriptionStatusNotification"] = null if change_subscription_status_notification == null else change_subscription_status_notification.to_dict()
    ret["logSetting"] = null if log_setting == null else log_setting.to_dict()
    return ret