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
class_name Gs2LotteryNamespace
extends RefCounted


var namespace_id = null
var name = null
var description = null
var transaction_setting = null
var lottery_trigger_script_id = null
var log_setting = null
var created_at = null
var updated_at = null
var queue_namespace_id = null
var key_id = null
var revision = null


func with_namespace_id(v) -> Gs2LotteryNamespace:
    namespace_id = v
    return self


func with_name(v) -> Gs2LotteryNamespace:
    name = v
    return self


func with_description(v) -> Gs2LotteryNamespace:
    description = v
    return self


func with_transaction_setting(v) -> Gs2LotteryNamespace:
    transaction_setting = v
    return self


func with_lottery_trigger_script_id(v) -> Gs2LotteryNamespace:
    lottery_trigger_script_id = v
    return self


func with_log_setting(v) -> Gs2LotteryNamespace:
    log_setting = v
    return self


func with_created_at(v) -> Gs2LotteryNamespace:
    created_at = v
    return self


func with_updated_at(v) -> Gs2LotteryNamespace:
    updated_at = v
    return self


func with_queue_namespace_id(v) -> Gs2LotteryNamespace:
    queue_namespace_id = v
    return self


func with_key_id(v) -> Gs2LotteryNamespace:
    key_id = v
    return self


func with_revision(v) -> Gs2LotteryNamespace:
    revision = v
    return self


static func get_region_from_grn(grn):
    if grn == null:
        return null
    var regex = RegEx.new()
    regex.compile("grn:gs2:(?<region>.+):(?<ownerId>.+):lottery:(?<namespaceName>.+)")
    var matched = regex.search(grn)
    if matched == null:
        return null
    return matched.get_string("region")


static func get_owner_id_from_grn(grn):
    if grn == null:
        return null
    var regex = RegEx.new()
    regex.compile("grn:gs2:(?<region>.+):(?<ownerId>.+):lottery:(?<namespaceName>.+)")
    var matched = regex.search(grn)
    if matched == null:
        return null
    return matched.get_string("ownerId")


static func get_namespace_name_from_grn(grn):
    if grn == null:
        return null
    var regex = RegEx.new()
    regex.compile("grn:gs2:(?<region>.+):(?<ownerId>.+):lottery:(?<namespaceName>.+)")
    var matched = regex.search(grn)
    if matched == null:
        return null
    return matched.get_string("namespaceName")


static func from_dict(data) -> Gs2LotteryNamespace:
    if data == null:
        return null
    var ret = Gs2LotteryNamespace.new()
    ret.namespace_id = null if data.get("namespaceId") == null else str(data.get("namespaceId"))
    ret.name = null if data.get("name") == null else str(data.get("name"))
    ret.description = null if data.get("description") == null else str(data.get("description"))
    ret.transaction_setting = null if data.get("transactionSetting") == null else Gs2LotteryTransactionSetting.from_dict(data.get("transactionSetting"))
    ret.lottery_trigger_script_id = null if data.get("lotteryTriggerScriptId") == null else str(data.get("lotteryTriggerScriptId"))
    ret.log_setting = null if data.get("logSetting") == null else Gs2LotteryLogSetting.from_dict(data.get("logSetting"))
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
    ret["lotteryTriggerScriptId"] = lottery_trigger_script_id
    ret["logSetting"] = null if log_setting == null else log_setting.to_dict()
    ret["createdAt"] = created_at
    ret["updatedAt"] = updated_at
    ret["queueNamespaceId"] = queue_namespace_id
    ret["keyId"] = key_id
    ret["revision"] = revision
    return ret