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
class_name Gs2MoneyNamespace
extends RefCounted


var namespace_id = null
var name = null
var description = null
var transaction_setting = null
var transaction_setting_v2 = null
var priority = null
var share_free = null
var currency = null
var apple_key = null
var google_key = null
var enable_fake_receipt = null
var create_wallet_script = null
var deposit_script = null
var withdraw_script = null
var balance = null
var log_setting = null
var created_at = null
var updated_at = null
var revision = null


func with_namespace_id(v) -> Gs2MoneyNamespace:
    namespace_id = v
    return self


func with_name(v) -> Gs2MoneyNamespace:
    name = v
    return self


func with_description(v) -> Gs2MoneyNamespace:
    description = v
    return self


func with_transaction_setting(v) -> Gs2MoneyNamespace:
    transaction_setting = v
    return self


func with_transaction_setting_v2(v) -> Gs2MoneyNamespace:
    transaction_setting_v2 = v
    return self


func with_priority(v) -> Gs2MoneyNamespace:
    priority = v
    return self


func with_share_free(v) -> Gs2MoneyNamespace:
    share_free = v
    return self


func with_currency(v) -> Gs2MoneyNamespace:
    currency = v
    return self


func with_apple_key(v) -> Gs2MoneyNamespace:
    apple_key = v
    return self


func with_google_key(v) -> Gs2MoneyNamespace:
    google_key = v
    return self


func with_enable_fake_receipt(v) -> Gs2MoneyNamespace:
    enable_fake_receipt = v
    return self


func with_create_wallet_script(v) -> Gs2MoneyNamespace:
    create_wallet_script = v
    return self


func with_deposit_script(v) -> Gs2MoneyNamespace:
    deposit_script = v
    return self


func with_withdraw_script(v) -> Gs2MoneyNamespace:
    withdraw_script = v
    return self


func with_balance(v) -> Gs2MoneyNamespace:
    balance = v
    return self


func with_log_setting(v) -> Gs2MoneyNamespace:
    log_setting = v
    return self


func with_created_at(v) -> Gs2MoneyNamespace:
    created_at = v
    return self


func with_updated_at(v) -> Gs2MoneyNamespace:
    updated_at = v
    return self


func with_revision(v) -> Gs2MoneyNamespace:
    revision = v
    return self


static func get_region_from_grn(grn):
    if grn == null:
        return null
    var regex = RegEx.new()
    regex.compile("grn:gs2:(?<region>.+):(?<ownerId>.+):money:(?<namespaceName>.+)")
    var matched = regex.search(grn)
    if matched == null:
        return null
    return matched.get_string("region")


static func get_owner_id_from_grn(grn):
    if grn == null:
        return null
    var regex = RegEx.new()
    regex.compile("grn:gs2:(?<region>.+):(?<ownerId>.+):money:(?<namespaceName>.+)")
    var matched = regex.search(grn)
    if matched == null:
        return null
    return matched.get_string("ownerId")


static func get_namespace_name_from_grn(grn):
    if grn == null:
        return null
    var regex = RegEx.new()
    regex.compile("grn:gs2:(?<region>.+):(?<ownerId>.+):money:(?<namespaceName>.+)")
    var matched = regex.search(grn)
    if matched == null:
        return null
    return matched.get_string("namespaceName")


static func from_dict(data) -> Gs2MoneyNamespace:
    if data == null:
        return null
    var ret = Gs2MoneyNamespace.new()
    ret.namespace_id = null if data.get("namespaceId") == null else str(data.get("namespaceId"))
    ret.name = null if data.get("name") == null else str(data.get("name"))
    ret.description = null if data.get("description") == null else str(data.get("description"))
    ret.transaction_setting = null if data.get("transactionSetting") == null else Gs2MoneyTransactionSetting.from_dict(data.get("transactionSetting"))
    ret.transaction_setting_v2 = null if data.get("transactionSettingV2") == null else Gs2MoneyTransactionSettingV2.from_dict(data.get("transactionSettingV2"))
    ret.priority = null if data.get("priority") == null else str(data.get("priority"))
    ret.share_free = null if data.get("shareFree") == null else bool(data.get("shareFree"))
    ret.currency = null if data.get("currency") == null else str(data.get("currency"))
    ret.apple_key = null if data.get("appleKey") == null else str(data.get("appleKey"))
    ret.google_key = null if data.get("googleKey") == null else str(data.get("googleKey"))
    ret.enable_fake_receipt = null if data.get("enableFakeReceipt") == null else bool(data.get("enableFakeReceipt"))
    ret.create_wallet_script = null if data.get("createWalletScript") == null else Gs2MoneyScriptSetting.from_dict(data.get("createWalletScript"))
    ret.deposit_script = null if data.get("depositScript") == null else Gs2MoneyScriptSetting.from_dict(data.get("depositScript"))
    ret.withdraw_script = null if data.get("withdrawScript") == null else Gs2MoneyScriptSetting.from_dict(data.get("withdrawScript"))
    ret.balance = null if data.get("balance") == null else float(data.get("balance"))
    ret.log_setting = null if data.get("logSetting") == null else Gs2MoneyLogSetting.from_dict(data.get("logSetting"))
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
    ret["priority"] = priority
    ret["shareFree"] = share_free
    ret["currency"] = currency
    ret["appleKey"] = apple_key
    ret["googleKey"] = google_key
    ret["enableFakeReceipt"] = enable_fake_receipt
    ret["createWalletScript"] = null if create_wallet_script == null else create_wallet_script.to_dict()
    ret["depositScript"] = null if deposit_script == null else deposit_script.to_dict()
    ret["withdrawScript"] = null if withdraw_script == null else withdraw_script.to_dict()
    ret["balance"] = balance
    ret["logSetting"] = null if log_setting == null else log_setting.to_dict()
    ret["createdAt"] = created_at
    ret["updatedAt"] = updated_at
    ret["revision"] = revision
    return ret