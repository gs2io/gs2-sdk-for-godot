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
class_name Gs2PaymentUpdateNamespaceRequest
extends Gs2Request


var namespace_name = null
var description = null
var transaction_setting = null
var priority = null
var apple_key = null
var google_key = null
var enable_fake_receipt = null
var create_wallet_script = null
var deposit_script = null
var withdraw_script = null
var log_setting = null


func with_namespace_name(v) -> Gs2PaymentUpdateNamespaceRequest:
    namespace_name = v
    return self


func with_description(v) -> Gs2PaymentUpdateNamespaceRequest:
    description = v
    return self


func with_transaction_setting(v) -> Gs2PaymentUpdateNamespaceRequest:
    transaction_setting = v
    return self


func with_priority(v) -> Gs2PaymentUpdateNamespaceRequest:
    priority = v
    return self


func with_apple_key(v) -> Gs2PaymentUpdateNamespaceRequest:
    apple_key = v
    return self


func with_google_key(v) -> Gs2PaymentUpdateNamespaceRequest:
    google_key = v
    return self


func with_enable_fake_receipt(v) -> Gs2PaymentUpdateNamespaceRequest:
    enable_fake_receipt = v
    return self


func with_create_wallet_script(v) -> Gs2PaymentUpdateNamespaceRequest:
    create_wallet_script = v
    return self


func with_deposit_script(v) -> Gs2PaymentUpdateNamespaceRequest:
    deposit_script = v
    return self


func with_withdraw_script(v) -> Gs2PaymentUpdateNamespaceRequest:
    withdraw_script = v
    return self


func with_log_setting(v) -> Gs2PaymentUpdateNamespaceRequest:
    log_setting = v
    return self


static func from_dict(data) -> Gs2PaymentUpdateNamespaceRequest:
    if data == null:
        return null
    var ret = Gs2PaymentUpdateNamespaceRequest.new()
    ret.namespace_name = null if data.get("namespaceName") == null else str(data.get("namespaceName"))
    ret.description = null if data.get("description") == null else str(data.get("description"))
    ret.transaction_setting = null if data.get("transactionSetting") == null else Gs2MoneyTransactionSetting.from_dict(data.get("transactionSetting"))
    ret.priority = null if data.get("priority") == null else str(data.get("priority"))
    ret.apple_key = null if data.get("appleKey") == null else str(data.get("appleKey"))
    ret.google_key = null if data.get("googleKey") == null else str(data.get("googleKey"))
    ret.enable_fake_receipt = null if data.get("enableFakeReceipt") == null else bool(data.get("enableFakeReceipt"))
    ret.create_wallet_script = null if data.get("createWalletScript") == null else Gs2MoneyScriptSetting.from_dict(data.get("createWalletScript"))
    ret.deposit_script = null if data.get("depositScript") == null else Gs2MoneyScriptSetting.from_dict(data.get("depositScript"))
    ret.withdraw_script = null if data.get("withdrawScript") == null else Gs2MoneyScriptSetting.from_dict(data.get("withdrawScript"))
    ret.log_setting = null if data.get("logSetting") == null else Gs2MoneyLogSetting.from_dict(data.get("logSetting"))
    return ret


func to_dict() -> Dictionary:
    var ret = {}
    ret["namespaceName"] = namespace_name
    ret["description"] = description
    ret["transactionSetting"] = null if transaction_setting == null else transaction_setting.to_dict()
    ret["priority"] = priority
    ret["appleKey"] = apple_key
    ret["googleKey"] = google_key
    ret["enableFakeReceipt"] = enable_fake_receipt
    ret["createWalletScript"] = null if create_wallet_script == null else create_wallet_script.to_dict()
    ret["depositScript"] = null if deposit_script == null else deposit_script.to_dict()
    ret["withdrawScript"] = null if withdraw_script == null else withdraw_script.to_dict()
    ret["logSetting"] = null if log_setting == null else log_setting.to_dict()
    return ret