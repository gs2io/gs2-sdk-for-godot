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
class_name Gs2LotteryCreateNamespaceRequest
extends Gs2Request


var name = null
var description = null
var transaction_setting = null
var transaction_setting_v2 = null
var lottery_trigger_script_id = null
var log_setting = null
var queue_namespace_id = null
var key_id = null


func with_name(v) -> Gs2LotteryCreateNamespaceRequest:
    name = v
    return self


func with_description(v) -> Gs2LotteryCreateNamespaceRequest:
    description = v
    return self


func with_transaction_setting(v) -> Gs2LotteryCreateNamespaceRequest:
    transaction_setting = v
    return self


func with_transaction_setting_v2(v) -> Gs2LotteryCreateNamespaceRequest:
    transaction_setting_v2 = v
    return self


func with_lottery_trigger_script_id(v) -> Gs2LotteryCreateNamespaceRequest:
    lottery_trigger_script_id = v
    return self


func with_log_setting(v) -> Gs2LotteryCreateNamespaceRequest:
    log_setting = v
    return self


func with_queue_namespace_id(v) -> Gs2LotteryCreateNamespaceRequest:
    queue_namespace_id = v
    return self


func with_key_id(v) -> Gs2LotteryCreateNamespaceRequest:
    key_id = v
    return self


static func from_dict(data) -> Gs2LotteryCreateNamespaceRequest:
    if data == null:
        return null
    var ret = Gs2LotteryCreateNamespaceRequest.new()
    ret.name = null if data.get("name") == null else str(data.get("name"))
    ret.description = null if data.get("description") == null else str(data.get("description"))
    ret.transaction_setting = null if data.get("transactionSetting") == null else Gs2LotteryTransactionSetting.from_dict(data.get("transactionSetting"))
    ret.transaction_setting_v2 = null if data.get("transactionSettingV2") == null else Gs2LotteryTransactionSettingV2.from_dict(data.get("transactionSettingV2"))
    ret.lottery_trigger_script_id = null if data.get("lotteryTriggerScriptId") == null else str(data.get("lotteryTriggerScriptId"))
    ret.log_setting = null if data.get("logSetting") == null else Gs2LotteryLogSetting.from_dict(data.get("logSetting"))
    ret.queue_namespace_id = null if data.get("queueNamespaceId") == null else str(data.get("queueNamespaceId"))
    ret.key_id = null if data.get("keyId") == null else str(data.get("keyId"))
    return ret


func to_dict() -> Dictionary:
    var ret = {}
    ret["name"] = name
    ret["description"] = description
    ret["transactionSetting"] = null if transaction_setting == null else transaction_setting.to_dict()
    ret["transactionSettingV2"] = null if transaction_setting_v2 == null else transaction_setting_v2.to_dict()
    ret["lotteryTriggerScriptId"] = lottery_trigger_script_id
    ret["logSetting"] = null if log_setting == null else log_setting.to_dict()
    ret["queueNamespaceId"] = queue_namespace_id
    ret["keyId"] = key_id
    return ret