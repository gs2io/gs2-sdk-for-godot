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
class_name Gs2MissionUpdateNamespaceRequest
extends Gs2Request


var namespace_name = null
var description = null
var transaction_setting = null
var transaction_setting_v2 = null
var mission_complete_script = null
var counter_increment_script = null
var receive_rewards_script = null
var complete_notification = null
var log_setting = null
var queue_namespace_id = null
var key_id = null


func with_namespace_name(v) -> Gs2MissionUpdateNamespaceRequest:
    namespace_name = v
    return self


func with_description(v) -> Gs2MissionUpdateNamespaceRequest:
    description = v
    return self


func with_transaction_setting(v) -> Gs2MissionUpdateNamespaceRequest:
    transaction_setting = v
    return self


func with_transaction_setting_v2(v) -> Gs2MissionUpdateNamespaceRequest:
    transaction_setting_v2 = v
    return self


func with_mission_complete_script(v) -> Gs2MissionUpdateNamespaceRequest:
    mission_complete_script = v
    return self


func with_counter_increment_script(v) -> Gs2MissionUpdateNamespaceRequest:
    counter_increment_script = v
    return self


func with_receive_rewards_script(v) -> Gs2MissionUpdateNamespaceRequest:
    receive_rewards_script = v
    return self


func with_complete_notification(v) -> Gs2MissionUpdateNamespaceRequest:
    complete_notification = v
    return self


func with_log_setting(v) -> Gs2MissionUpdateNamespaceRequest:
    log_setting = v
    return self


func with_queue_namespace_id(v) -> Gs2MissionUpdateNamespaceRequest:
    queue_namespace_id = v
    return self


func with_key_id(v) -> Gs2MissionUpdateNamespaceRequest:
    key_id = v
    return self


static func from_dict(data) -> Gs2MissionUpdateNamespaceRequest:
    if data == null:
        return null
    var ret = Gs2MissionUpdateNamespaceRequest.new()
    ret.namespace_name = null if data.get("namespaceName") == null else str(data.get("namespaceName"))
    ret.description = null if data.get("description") == null else str(data.get("description"))
    ret.transaction_setting = null if data.get("transactionSetting") == null else Gs2MissionTransactionSetting.from_dict(data.get("transactionSetting"))
    ret.transaction_setting_v2 = null if data.get("transactionSettingV2") == null else Gs2MissionTransactionSettingV2.from_dict(data.get("transactionSettingV2"))
    ret.mission_complete_script = null if data.get("missionCompleteScript") == null else Gs2MissionScriptSetting.from_dict(data.get("missionCompleteScript"))
    ret.counter_increment_script = null if data.get("counterIncrementScript") == null else Gs2MissionScriptSetting.from_dict(data.get("counterIncrementScript"))
    ret.receive_rewards_script = null if data.get("receiveRewardsScript") == null else Gs2MissionScriptSetting.from_dict(data.get("receiveRewardsScript"))
    ret.complete_notification = null if data.get("completeNotification") == null else Gs2MissionNotificationSetting.from_dict(data.get("completeNotification"))
    ret.log_setting = null if data.get("logSetting") == null else Gs2MissionLogSetting.from_dict(data.get("logSetting"))
    ret.queue_namespace_id = null if data.get("queueNamespaceId") == null else str(data.get("queueNamespaceId"))
    ret.key_id = null if data.get("keyId") == null else str(data.get("keyId"))
    return ret


func to_dict() -> Dictionary:
    var ret = {}
    ret["namespaceName"] = namespace_name
    ret["description"] = description
    ret["transactionSetting"] = null if transaction_setting == null else transaction_setting.to_dict()
    ret["transactionSettingV2"] = null if transaction_setting_v2 == null else transaction_setting_v2.to_dict()
    ret["missionCompleteScript"] = null if mission_complete_script == null else mission_complete_script.to_dict()
    ret["counterIncrementScript"] = null if counter_increment_script == null else counter_increment_script.to_dict()
    ret["receiveRewardsScript"] = null if receive_rewards_script == null else receive_rewards_script.to_dict()
    ret["completeNotification"] = null if complete_notification == null else complete_notification.to_dict()
    ret["logSetting"] = null if log_setting == null else log_setting.to_dict()
    ret["queueNamespaceId"] = queue_namespace_id
    ret["keyId"] = key_id
    return ret