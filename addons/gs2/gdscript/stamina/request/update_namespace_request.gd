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
class_name Gs2StaminaUpdateNamespaceRequest
extends Gs2Request


var namespace_name = null
var description = null
var transaction_setting = null
var transaction_setting_v2 = null
var overflow_trigger_script = null
var log_setting = null


func with_namespace_name(v) -> Gs2StaminaUpdateNamespaceRequest:
    namespace_name = v
    return self


func with_description(v) -> Gs2StaminaUpdateNamespaceRequest:
    description = v
    return self


func with_transaction_setting(v) -> Gs2StaminaUpdateNamespaceRequest:
    transaction_setting = v
    return self


func with_transaction_setting_v2(v) -> Gs2StaminaUpdateNamespaceRequest:
    transaction_setting_v2 = v
    return self


func with_overflow_trigger_script(v) -> Gs2StaminaUpdateNamespaceRequest:
    overflow_trigger_script = v
    return self


func with_log_setting(v) -> Gs2StaminaUpdateNamespaceRequest:
    log_setting = v
    return self


static func from_dict(data) -> Gs2StaminaUpdateNamespaceRequest:
    if data == null:
        return null
    var ret = Gs2StaminaUpdateNamespaceRequest.new()
    ret.namespace_name = null if data.get("namespaceName") == null else str(data.get("namespaceName"))
    ret.description = null if data.get("description") == null else str(data.get("description"))
    ret.transaction_setting = null if data.get("transactionSetting") == null else Gs2StaminaTransactionSetting.from_dict(data.get("transactionSetting"))
    ret.transaction_setting_v2 = null if data.get("transactionSettingV2") == null else Gs2StaminaTransactionSettingV2.from_dict(data.get("transactionSettingV2"))
    ret.overflow_trigger_script = null if data.get("overflowTriggerScript") == null else str(data.get("overflowTriggerScript"))
    ret.log_setting = null if data.get("logSetting") == null else Gs2StaminaLogSetting.from_dict(data.get("logSetting"))
    return ret


func to_dict() -> Dictionary:
    var ret = {}
    ret["namespaceName"] = namespace_name
    ret["description"] = description
    ret["transactionSetting"] = null if transaction_setting == null else transaction_setting.to_dict()
    ret["transactionSettingV2"] = null if transaction_setting_v2 == null else transaction_setting_v2.to_dict()
    ret["overflowTriggerScript"] = overflow_trigger_script
    ret["logSetting"] = null if log_setting == null else log_setting.to_dict()
    return ret