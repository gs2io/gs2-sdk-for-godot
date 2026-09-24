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
class_name Gs2QuestCreateNamespaceRequest
extends Gs2Request


var name = null
var description = null
var transaction_setting = null
var transaction_setting_v2 = null
var start_quest_script = null
var complete_quest_script = null
var failed_quest_script = null
var log_setting = null
var queue_namespace_id = null
var key_id = null


func with_name(v) -> Gs2QuestCreateNamespaceRequest:
    name = v
    return self


func with_description(v) -> Gs2QuestCreateNamespaceRequest:
    description = v
    return self


func with_transaction_setting(v) -> Gs2QuestCreateNamespaceRequest:
    transaction_setting = v
    return self


func with_transaction_setting_v2(v) -> Gs2QuestCreateNamespaceRequest:
    transaction_setting_v2 = v
    return self


func with_start_quest_script(v) -> Gs2QuestCreateNamespaceRequest:
    start_quest_script = v
    return self


func with_complete_quest_script(v) -> Gs2QuestCreateNamespaceRequest:
    complete_quest_script = v
    return self


func with_failed_quest_script(v) -> Gs2QuestCreateNamespaceRequest:
    failed_quest_script = v
    return self


func with_log_setting(v) -> Gs2QuestCreateNamespaceRequest:
    log_setting = v
    return self


func with_queue_namespace_id(v) -> Gs2QuestCreateNamespaceRequest:
    queue_namespace_id = v
    return self


func with_key_id(v) -> Gs2QuestCreateNamespaceRequest:
    key_id = v
    return self


static func from_dict(data) -> Gs2QuestCreateNamespaceRequest:
    if data == null:
        return null
    var ret = Gs2QuestCreateNamespaceRequest.new()
    ret.name = null if data.get("name") == null else str(data.get("name"))
    ret.description = null if data.get("description") == null else str(data.get("description"))
    ret.transaction_setting = null if data.get("transactionSetting") == null else Gs2QuestTransactionSetting.from_dict(data.get("transactionSetting"))
    ret.transaction_setting_v2 = null if data.get("transactionSettingV2") == null else Gs2QuestTransactionSettingV2.from_dict(data.get("transactionSettingV2"))
    ret.start_quest_script = null if data.get("startQuestScript") == null else Gs2QuestScriptSetting.from_dict(data.get("startQuestScript"))
    ret.complete_quest_script = null if data.get("completeQuestScript") == null else Gs2QuestScriptSetting.from_dict(data.get("completeQuestScript"))
    ret.failed_quest_script = null if data.get("failedQuestScript") == null else Gs2QuestScriptSetting.from_dict(data.get("failedQuestScript"))
    ret.log_setting = null if data.get("logSetting") == null else Gs2QuestLogSetting.from_dict(data.get("logSetting"))
    ret.queue_namespace_id = null if data.get("queueNamespaceId") == null else str(data.get("queueNamespaceId"))
    ret.key_id = null if data.get("keyId") == null else str(data.get("keyId"))
    return ret


func to_dict() -> Dictionary:
    var ret = {}
    ret["name"] = name
    ret["description"] = description
    ret["transactionSetting"] = null if transaction_setting == null else transaction_setting.to_dict()
    ret["transactionSettingV2"] = null if transaction_setting_v2 == null else transaction_setting_v2.to_dict()
    ret["startQuestScript"] = null if start_quest_script == null else start_quest_script.to_dict()
    ret["completeQuestScript"] = null if complete_quest_script == null else complete_quest_script.to_dict()
    ret["failedQuestScript"] = null if failed_quest_script == null else failed_quest_script.to_dict()
    ret["logSetting"] = null if log_setting == null else log_setting.to_dict()
    ret["queueNamespaceId"] = queue_namespace_id
    ret["keyId"] = key_id
    return ret