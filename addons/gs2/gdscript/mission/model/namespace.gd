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
class_name Gs2MissionNamespace
extends RefCounted


var namespace_id = null
var name = null
var description = null
var transaction_setting = null
var mission_complete_script = null
var counter_increment_script = null
var receive_rewards_script = null
var complete_notification = null
var log_setting = null
var created_at = null
var updated_at = null
var queue_namespace_id = null
var key_id = null
var revision = null


func with_namespace_id(v) -> Gs2MissionNamespace:
    namespace_id = v
    return self


func with_name(v) -> Gs2MissionNamespace:
    name = v
    return self


func with_description(v) -> Gs2MissionNamespace:
    description = v
    return self


func with_transaction_setting(v) -> Gs2MissionNamespace:
    transaction_setting = v
    return self


func with_mission_complete_script(v) -> Gs2MissionNamespace:
    mission_complete_script = v
    return self


func with_counter_increment_script(v) -> Gs2MissionNamespace:
    counter_increment_script = v
    return self


func with_receive_rewards_script(v) -> Gs2MissionNamespace:
    receive_rewards_script = v
    return self


func with_complete_notification(v) -> Gs2MissionNamespace:
    complete_notification = v
    return self


func with_log_setting(v) -> Gs2MissionNamespace:
    log_setting = v
    return self


func with_created_at(v) -> Gs2MissionNamespace:
    created_at = v
    return self


func with_updated_at(v) -> Gs2MissionNamespace:
    updated_at = v
    return self


func with_queue_namespace_id(v) -> Gs2MissionNamespace:
    queue_namespace_id = v
    return self


func with_key_id(v) -> Gs2MissionNamespace:
    key_id = v
    return self


func with_revision(v) -> Gs2MissionNamespace:
    revision = v
    return self


static func get_region_from_grn(grn):
    if grn == null:
        return null
    var regex = RegEx.new()
    regex.compile("grn:gs2:(?<region>.+):(?<ownerId>.+):mission:(?<namespaceName>.+)")
    var matched = regex.search(grn)
    if matched == null:
        return null
    return matched.get_string("region")


static func get_owner_id_from_grn(grn):
    if grn == null:
        return null
    var regex = RegEx.new()
    regex.compile("grn:gs2:(?<region>.+):(?<ownerId>.+):mission:(?<namespaceName>.+)")
    var matched = regex.search(grn)
    if matched == null:
        return null
    return matched.get_string("ownerId")


static func get_namespace_name_from_grn(grn):
    if grn == null:
        return null
    var regex = RegEx.new()
    regex.compile("grn:gs2:(?<region>.+):(?<ownerId>.+):mission:(?<namespaceName>.+)")
    var matched = regex.search(grn)
    if matched == null:
        return null
    return matched.get_string("namespaceName")


static func from_dict(data) -> Gs2MissionNamespace:
    if data == null:
        return null
    var ret = Gs2MissionNamespace.new()
    ret.namespace_id = null if data.get("namespaceId") == null else str(data.get("namespaceId"))
    ret.name = null if data.get("name") == null else str(data.get("name"))
    ret.description = null if data.get("description") == null else str(data.get("description"))
    ret.transaction_setting = null if data.get("transactionSetting") == null else Gs2MissionTransactionSetting.from_dict(data.get("transactionSetting"))
    ret.mission_complete_script = null if data.get("missionCompleteScript") == null else Gs2MissionScriptSetting.from_dict(data.get("missionCompleteScript"))
    ret.counter_increment_script = null if data.get("counterIncrementScript") == null else Gs2MissionScriptSetting.from_dict(data.get("counterIncrementScript"))
    ret.receive_rewards_script = null if data.get("receiveRewardsScript") == null else Gs2MissionScriptSetting.from_dict(data.get("receiveRewardsScript"))
    ret.complete_notification = null if data.get("completeNotification") == null else Gs2MissionNotificationSetting.from_dict(data.get("completeNotification"))
    ret.log_setting = null if data.get("logSetting") == null else Gs2MissionLogSetting.from_dict(data.get("logSetting"))
    ret.created_at = null if data.get("createdAt") == null else int(data.get("createdAt"))
    ret.updated_at = null if data.get("updatedAt") == null else int(data.get("updatedAt"))
    ret.queue_namespace_id = null if data.get("queueNamespaceId") == null else str(data.get("queueNamespaceId"))
    ret.key_id = null if data.get("keyId") == null else str(data.get("keyId"))
    ret.revision = null if data.get("revision") == null else int(data.get("revision"))
    return ret


func to_dict() -> Dictionary:
    var ret = {}
    ret["namespaceId"] = namespace_id
    ret["name"] = name
    ret["description"] = description
    ret["transactionSetting"] = null if transaction_setting == null else transaction_setting.to_dict()
    ret["missionCompleteScript"] = null if mission_complete_script == null else mission_complete_script.to_dict()
    ret["counterIncrementScript"] = null if counter_increment_script == null else counter_increment_script.to_dict()
    ret["receiveRewardsScript"] = null if receive_rewards_script == null else receive_rewards_script.to_dict()
    ret["completeNotification"] = null if complete_notification == null else complete_notification.to_dict()
    ret["logSetting"] = null if log_setting == null else log_setting.to_dict()
    ret["createdAt"] = created_at
    ret["updatedAt"] = updated_at
    ret["queueNamespaceId"] = queue_namespace_id
    ret["keyId"] = key_id
    ret["revision"] = revision
    return ret