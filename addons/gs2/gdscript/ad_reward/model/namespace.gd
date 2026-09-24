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
class_name Gs2AdRewardNamespace
extends RefCounted


var namespace_id = null
var name = null
var description = null
var transaction_setting = null
var transaction_setting_v2 = null
var admob = null
var unity_ad = null
var app_lovin_maxes = null
var acquire_point_script = null
var consume_point_script = null
var change_point_notification = null
var log_setting = null
var created_at = null
var updated_at = null
var revision = null


func with_namespace_id(v) -> Gs2AdRewardNamespace:
    namespace_id = v
    return self


func with_name(v) -> Gs2AdRewardNamespace:
    name = v
    return self


func with_description(v) -> Gs2AdRewardNamespace:
    description = v
    return self


func with_transaction_setting(v) -> Gs2AdRewardNamespace:
    transaction_setting = v
    return self


func with_transaction_setting_v2(v) -> Gs2AdRewardNamespace:
    transaction_setting_v2 = v
    return self


func with_admob(v) -> Gs2AdRewardNamespace:
    admob = v
    return self


func with_unity_ad(v) -> Gs2AdRewardNamespace:
    unity_ad = v
    return self


func with_app_lovin_maxes(v) -> Gs2AdRewardNamespace:
    app_lovin_maxes = v
    return self


func with_acquire_point_script(v) -> Gs2AdRewardNamespace:
    acquire_point_script = v
    return self


func with_consume_point_script(v) -> Gs2AdRewardNamespace:
    consume_point_script = v
    return self


func with_change_point_notification(v) -> Gs2AdRewardNamespace:
    change_point_notification = v
    return self


func with_log_setting(v) -> Gs2AdRewardNamespace:
    log_setting = v
    return self


func with_created_at(v) -> Gs2AdRewardNamespace:
    created_at = v
    return self


func with_updated_at(v) -> Gs2AdRewardNamespace:
    updated_at = v
    return self


func with_revision(v) -> Gs2AdRewardNamespace:
    revision = v
    return self


static func get_region_from_grn(grn):
    if grn == null:
        return null
    var regex = RegEx.new()
    regex.compile("grn:gs2:(?<region>.+):(?<ownerId>.+):adReward:(?<namespaceName>.+)")
    var matched = regex.search(grn)
    if matched == null:
        return null
    return matched.get_string("region")


static func get_owner_id_from_grn(grn):
    if grn == null:
        return null
    var regex = RegEx.new()
    regex.compile("grn:gs2:(?<region>.+):(?<ownerId>.+):adReward:(?<namespaceName>.+)")
    var matched = regex.search(grn)
    if matched == null:
        return null
    return matched.get_string("ownerId")


static func get_namespace_name_from_grn(grn):
    if grn == null:
        return null
    var regex = RegEx.new()
    regex.compile("grn:gs2:(?<region>.+):(?<ownerId>.+):adReward:(?<namespaceName>.+)")
    var matched = regex.search(grn)
    if matched == null:
        return null
    return matched.get_string("namespaceName")


static func from_dict(data) -> Gs2AdRewardNamespace:
    if data == null:
        return null
    var ret = Gs2AdRewardNamespace.new()
    ret.namespace_id = null if data.get("namespaceId") == null else str(data.get("namespaceId"))
    ret.name = null if data.get("name") == null else str(data.get("name"))
    ret.description = null if data.get("description") == null else str(data.get("description"))
    ret.transaction_setting = null if data.get("transactionSetting") == null else Gs2AdRewardTransactionSetting.from_dict(data.get("transactionSetting"))
    ret.transaction_setting_v2 = null if data.get("transactionSettingV2") == null else Gs2AdRewardTransactionSettingV2.from_dict(data.get("transactionSettingV2"))
    ret.admob = null if data.get("admob") == null else Gs2AdRewardAdMob.from_dict(data.get("admob"))
    ret.unity_ad = null if data.get("unityAd") == null else Gs2AdRewardUnityAd.from_dict(data.get("unityAd"))
    ret.app_lovin_maxes = null if data.get("appLovinMaxes") == null else data.get("appLovinMaxes").map(func(v): return Gs2AdRewardAppLovinMax.from_dict(v))
    ret.acquire_point_script = null if data.get("acquirePointScript") == null else Gs2AdRewardScriptSetting.from_dict(data.get("acquirePointScript"))
    ret.consume_point_script = null if data.get("consumePointScript") == null else Gs2AdRewardScriptSetting.from_dict(data.get("consumePointScript"))
    ret.change_point_notification = null if data.get("changePointNotification") == null else Gs2AdRewardNotificationSetting.from_dict(data.get("changePointNotification"))
    ret.log_setting = null if data.get("logSetting") == null else Gs2AdRewardLogSetting.from_dict(data.get("logSetting"))
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
    ret["admob"] = null if admob == null else admob.to_dict()
    ret["unityAd"] = null if unity_ad == null else unity_ad.to_dict()
    ret["appLovinMaxes"] = null if app_lovin_maxes == null else app_lovin_maxes.map(func(v): return null if v == null else v.to_dict())
    ret["acquirePointScript"] = null if acquire_point_script == null else acquire_point_script.to_dict()
    ret["consumePointScript"] = null if consume_point_script == null else consume_point_script.to_dict()
    ret["changePointNotification"] = null if change_point_notification == null else change_point_notification.to_dict()
    ret["logSetting"] = null if log_setting == null else log_setting.to_dict()
    ret["createdAt"] = created_at
    ret["updatedAt"] = updated_at
    ret["revision"] = revision
    return ret