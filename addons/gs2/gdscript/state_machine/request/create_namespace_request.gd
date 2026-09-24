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
class_name Gs2StateMachineCreateNamespaceRequest
extends Gs2Request


var name = null
var description = null
var support_speculative_execution = null
var transaction_setting = null
var transaction_setting_v2 = null
var start_script = null
var pass_script = null
var error_script = null
var lowest_state_machine_version = null
var log_setting = null


func with_name(v) -> Gs2StateMachineCreateNamespaceRequest:
    name = v
    return self


func with_description(v) -> Gs2StateMachineCreateNamespaceRequest:
    description = v
    return self


func with_support_speculative_execution(v) -> Gs2StateMachineCreateNamespaceRequest:
    support_speculative_execution = v
    return self


func with_transaction_setting(v) -> Gs2StateMachineCreateNamespaceRequest:
    transaction_setting = v
    return self


func with_transaction_setting_v2(v) -> Gs2StateMachineCreateNamespaceRequest:
    transaction_setting_v2 = v
    return self


func with_start_script(v) -> Gs2StateMachineCreateNamespaceRequest:
    start_script = v
    return self


func with_pass_script(v) -> Gs2StateMachineCreateNamespaceRequest:
    pass_script = v
    return self


func with_error_script(v) -> Gs2StateMachineCreateNamespaceRequest:
    error_script = v
    return self


func with_lowest_state_machine_version(v) -> Gs2StateMachineCreateNamespaceRequest:
    lowest_state_machine_version = v
    return self


func with_log_setting(v) -> Gs2StateMachineCreateNamespaceRequest:
    log_setting = v
    return self


static func from_dict(data) -> Gs2StateMachineCreateNamespaceRequest:
    if data == null:
        return null
    var ret = Gs2StateMachineCreateNamespaceRequest.new()
    ret.name = null if data.get("name") == null else str(data.get("name"))
    ret.description = null if data.get("description") == null else str(data.get("description"))
    ret.support_speculative_execution = null if data.get("supportSpeculativeExecution") == null else str(data.get("supportSpeculativeExecution"))
    ret.transaction_setting = null if data.get("transactionSetting") == null else Gs2StateMachineTransactionSetting.from_dict(data.get("transactionSetting"))
    ret.transaction_setting_v2 = null if data.get("transactionSettingV2") == null else Gs2StateMachineTransactionSettingV2.from_dict(data.get("transactionSettingV2"))
    ret.start_script = null if data.get("startScript") == null else Gs2StateMachineScriptSetting.from_dict(data.get("startScript"))
    ret.pass_script = null if data.get("passScript") == null else Gs2StateMachineScriptSetting.from_dict(data.get("passScript"))
    ret.error_script = null if data.get("errorScript") == null else Gs2StateMachineScriptSetting.from_dict(data.get("errorScript"))
    ret.lowest_state_machine_version = null if data.get("lowestStateMachineVersion") == null else int(data.get("lowestStateMachineVersion"))
    ret.log_setting = null if data.get("logSetting") == null else Gs2StateMachineLogSetting.from_dict(data.get("logSetting"))
    return ret


func to_dict() -> Dictionary:
    var ret = {}
    ret["name"] = name
    ret["description"] = description
    ret["supportSpeculativeExecution"] = support_speculative_execution
    ret["transactionSetting"] = null if transaction_setting == null else transaction_setting.to_dict()
    ret["transactionSettingV2"] = null if transaction_setting_v2 == null else transaction_setting_v2.to_dict()
    ret["startScript"] = null if start_script == null else start_script.to_dict()
    ret["passScript"] = null if pass_script == null else pass_script.to_dict()
    ret["errorScript"] = null if error_script == null else error_script.to_dict()
    ret["lowestStateMachineVersion"] = lowest_state_machine_version
    ret["logSetting"] = null if log_setting == null else log_setting.to_dict()
    return ret