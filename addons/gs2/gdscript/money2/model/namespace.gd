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
class_name Gs2Money2Namespace
extends RefCounted


var namespace_id = null
var name = null
var description = null
var transaction_setting = null
var transaction_setting_v2 = null
var currency_usage_priority = null
var shared_free_currency = null
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
var created_at = null
var updated_at = null
var revision = null


func with_namespace_id(v) -> Gs2Money2Namespace:
    namespace_id = v
    return self


func with_name(v) -> Gs2Money2Namespace:
    name = v
    return self


func with_description(v) -> Gs2Money2Namespace:
    description = v
    return self


func with_transaction_setting(v) -> Gs2Money2Namespace:
    transaction_setting = v
    return self


func with_transaction_setting_v2(v) -> Gs2Money2Namespace:
    transaction_setting_v2 = v
    return self


func with_currency_usage_priority(v) -> Gs2Money2Namespace:
    currency_usage_priority = v
    return self


func with_shared_free_currency(v) -> Gs2Money2Namespace:
    shared_free_currency = v
    return self


func with_platform_setting(v) -> Gs2Money2Namespace:
    platform_setting = v
    return self


func with_deposit_balance_script(v) -> Gs2Money2Namespace:
    deposit_balance_script = v
    return self


func with_withdraw_balance_script(v) -> Gs2Money2Namespace:
    withdraw_balance_script = v
    return self


func with_verify_receipt_script(v) -> Gs2Money2Namespace:
    verify_receipt_script = v
    return self


func with_subscribe_script(v) -> Gs2Money2Namespace:
    subscribe_script = v
    return self


func with_renew_script(v) -> Gs2Money2Namespace:
    renew_script = v
    return self


func with_unsubscribe_script(v) -> Gs2Money2Namespace:
    unsubscribe_script = v
    return self


func with_take_over_script(v) -> Gs2Money2Namespace:
    take_over_script = v
    return self


func with_change_subscription_status_notification(v) -> Gs2Money2Namespace:
    change_subscription_status_notification = v
    return self


func with_log_setting(v) -> Gs2Money2Namespace:
    log_setting = v
    return self


func with_created_at(v) -> Gs2Money2Namespace:
    created_at = v
    return self


func with_updated_at(v) -> Gs2Money2Namespace:
    updated_at = v
    return self


func with_revision(v) -> Gs2Money2Namespace:
    revision = v
    return self


static func get_region_from_grn(grn):
    if grn == null:
        return null
    var regex = RegEx.new()
    regex.compile("grn:gs2:(?<region>.+):(?<ownerId>.+):money2:(?<namespaceName>.+)")
    var matched = regex.search(grn)
    if matched == null:
        return null
    return matched.get_string("region")


static func get_owner_id_from_grn(grn):
    if grn == null:
        return null
    var regex = RegEx.new()
    regex.compile("grn:gs2:(?<region>.+):(?<ownerId>.+):money2:(?<namespaceName>.+)")
    var matched = regex.search(grn)
    if matched == null:
        return null
    return matched.get_string("ownerId")


static func get_namespace_name_from_grn(grn):
    if grn == null:
        return null
    var regex = RegEx.new()
    regex.compile("grn:gs2:(?<region>.+):(?<ownerId>.+):money2:(?<namespaceName>.+)")
    var matched = regex.search(grn)
    if matched == null:
        return null
    return matched.get_string("namespaceName")


static func from_dict(data) -> Gs2Money2Namespace:
    if data == null:
        return null
    var ret = Gs2Money2Namespace.new()
    ret.namespace_id = null if data.get("namespaceId") == null else str(data.get("namespaceId"))
    ret.name = null if data.get("name") == null else str(data.get("name"))
    ret.description = null if data.get("description") == null else str(data.get("description"))
    ret.transaction_setting = null if data.get("transactionSetting") == null else Gs2Money2TransactionSetting.from_dict(data.get("transactionSetting"))
    ret.transaction_setting_v2 = null if data.get("transactionSettingV2") == null else Gs2Money2TransactionSettingV2.from_dict(data.get("transactionSettingV2"))
    ret.currency_usage_priority = null if data.get("currencyUsagePriority") == null else str(data.get("currencyUsagePriority"))
    ret.shared_free_currency = null if data.get("sharedFreeCurrency") == null else bool(data.get("sharedFreeCurrency"))
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
    ret["transactionSettingV2"] = null if transaction_setting_v2 == null else transaction_setting_v2.to_dict()
    ret["currencyUsagePriority"] = currency_usage_priority
    ret["sharedFreeCurrency"] = shared_free_currency
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
    ret["createdAt"] = created_at
    ret["updatedAt"] = updated_at
    ret["revision"] = revision
    return ret