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
class_name Gs2MatchmakingUpdateNamespaceRequest
extends Gs2Request


var namespace_name = null
var description = null
var transaction_setting = null
var transaction_setting_v2 = null
var enable_rating = null
var enable_disconnect_detection = null
var disconnect_detection_timeout_seconds = null
var create_gathering_trigger_type = null
var create_gathering_trigger_realtime_namespace_id = null
var create_gathering_trigger_script_id = null
var complete_matchmaking_trigger_type = null
var complete_matchmaking_trigger_realtime_namespace_id = null
var complete_matchmaking_trigger_script_id = null
var enable_collaborate_season_rating = null
var collaborate_season_rating_namespace_id = null
var collaborate_season_rating_ttl = null
var change_rating_script = null
var join_notification = null
var leave_notification = null
var complete_notification = null
var change_rating_notification = null
var log_setting = null


func with_namespace_name(v) -> Gs2MatchmakingUpdateNamespaceRequest:
    namespace_name = v
    return self


func with_description(v) -> Gs2MatchmakingUpdateNamespaceRequest:
    description = v
    return self


func with_transaction_setting(v) -> Gs2MatchmakingUpdateNamespaceRequest:
    transaction_setting = v
    return self


func with_transaction_setting_v2(v) -> Gs2MatchmakingUpdateNamespaceRequest:
    transaction_setting_v2 = v
    return self


func with_enable_rating(v) -> Gs2MatchmakingUpdateNamespaceRequest:
    enable_rating = v
    return self


func with_enable_disconnect_detection(v) -> Gs2MatchmakingUpdateNamespaceRequest:
    enable_disconnect_detection = v
    return self


func with_disconnect_detection_timeout_seconds(v) -> Gs2MatchmakingUpdateNamespaceRequest:
    disconnect_detection_timeout_seconds = v
    return self


func with_create_gathering_trigger_type(v) -> Gs2MatchmakingUpdateNamespaceRequest:
    create_gathering_trigger_type = v
    return self


func with_create_gathering_trigger_realtime_namespace_id(v) -> Gs2MatchmakingUpdateNamespaceRequest:
    create_gathering_trigger_realtime_namespace_id = v
    return self


func with_create_gathering_trigger_script_id(v) -> Gs2MatchmakingUpdateNamespaceRequest:
    create_gathering_trigger_script_id = v
    return self


func with_complete_matchmaking_trigger_type(v) -> Gs2MatchmakingUpdateNamespaceRequest:
    complete_matchmaking_trigger_type = v
    return self


func with_complete_matchmaking_trigger_realtime_namespace_id(v) -> Gs2MatchmakingUpdateNamespaceRequest:
    complete_matchmaking_trigger_realtime_namespace_id = v
    return self


func with_complete_matchmaking_trigger_script_id(v) -> Gs2MatchmakingUpdateNamespaceRequest:
    complete_matchmaking_trigger_script_id = v
    return self


func with_enable_collaborate_season_rating(v) -> Gs2MatchmakingUpdateNamespaceRequest:
    enable_collaborate_season_rating = v
    return self


func with_collaborate_season_rating_namespace_id(v) -> Gs2MatchmakingUpdateNamespaceRequest:
    collaborate_season_rating_namespace_id = v
    return self


func with_collaborate_season_rating_ttl(v) -> Gs2MatchmakingUpdateNamespaceRequest:
    collaborate_season_rating_ttl = v
    return self


func with_change_rating_script(v) -> Gs2MatchmakingUpdateNamespaceRequest:
    change_rating_script = v
    return self


func with_join_notification(v) -> Gs2MatchmakingUpdateNamespaceRequest:
    join_notification = v
    return self


func with_leave_notification(v) -> Gs2MatchmakingUpdateNamespaceRequest:
    leave_notification = v
    return self


func with_complete_notification(v) -> Gs2MatchmakingUpdateNamespaceRequest:
    complete_notification = v
    return self


func with_change_rating_notification(v) -> Gs2MatchmakingUpdateNamespaceRequest:
    change_rating_notification = v
    return self


func with_log_setting(v) -> Gs2MatchmakingUpdateNamespaceRequest:
    log_setting = v
    return self


static func from_dict(data) -> Gs2MatchmakingUpdateNamespaceRequest:
    if data == null:
        return null
    var ret = Gs2MatchmakingUpdateNamespaceRequest.new()
    ret.namespace_name = null if data.get("namespaceName") == null else str(data.get("namespaceName"))
    ret.description = null if data.get("description") == null else str(data.get("description"))
    ret.transaction_setting = null if data.get("transactionSetting") == null else Gs2MatchmakingTransactionSetting.from_dict(data.get("transactionSetting"))
    ret.transaction_setting_v2 = null if data.get("transactionSettingV2") == null else Gs2MatchmakingTransactionSettingV2.from_dict(data.get("transactionSettingV2"))
    ret.enable_rating = null if data.get("enableRating") == null else bool(data.get("enableRating"))
    ret.enable_disconnect_detection = null if data.get("enableDisconnectDetection") == null else str(data.get("enableDisconnectDetection"))
    ret.disconnect_detection_timeout_seconds = null if data.get("disconnectDetectionTimeoutSeconds") == null else int(data.get("disconnectDetectionTimeoutSeconds"))
    ret.create_gathering_trigger_type = null if data.get("createGatheringTriggerType") == null else str(data.get("createGatheringTriggerType"))
    ret.create_gathering_trigger_realtime_namespace_id = null if data.get("createGatheringTriggerRealtimeNamespaceId") == null else str(data.get("createGatheringTriggerRealtimeNamespaceId"))
    ret.create_gathering_trigger_script_id = null if data.get("createGatheringTriggerScriptId") == null else str(data.get("createGatheringTriggerScriptId"))
    ret.complete_matchmaking_trigger_type = null if data.get("completeMatchmakingTriggerType") == null else str(data.get("completeMatchmakingTriggerType"))
    ret.complete_matchmaking_trigger_realtime_namespace_id = null if data.get("completeMatchmakingTriggerRealtimeNamespaceId") == null else str(data.get("completeMatchmakingTriggerRealtimeNamespaceId"))
    ret.complete_matchmaking_trigger_script_id = null if data.get("completeMatchmakingTriggerScriptId") == null else str(data.get("completeMatchmakingTriggerScriptId"))
    ret.enable_collaborate_season_rating = null if data.get("enableCollaborateSeasonRating") == null else str(data.get("enableCollaborateSeasonRating"))
    ret.collaborate_season_rating_namespace_id = null if data.get("collaborateSeasonRatingNamespaceId") == null else str(data.get("collaborateSeasonRatingNamespaceId"))
    ret.collaborate_season_rating_ttl = null if data.get("collaborateSeasonRatingTtl") == null else int(data.get("collaborateSeasonRatingTtl"))
    ret.change_rating_script = null if data.get("changeRatingScript") == null else Gs2MatchmakingScriptSetting.from_dict(data.get("changeRatingScript"))
    ret.join_notification = null if data.get("joinNotification") == null else Gs2MatchmakingNotificationSetting.from_dict(data.get("joinNotification"))
    ret.leave_notification = null if data.get("leaveNotification") == null else Gs2MatchmakingNotificationSetting.from_dict(data.get("leaveNotification"))
    ret.complete_notification = null if data.get("completeNotification") == null else Gs2MatchmakingNotificationSetting.from_dict(data.get("completeNotification"))
    ret.change_rating_notification = null if data.get("changeRatingNotification") == null else Gs2MatchmakingNotificationSetting.from_dict(data.get("changeRatingNotification"))
    ret.log_setting = null if data.get("logSetting") == null else Gs2MatchmakingLogSetting.from_dict(data.get("logSetting"))
    return ret


func to_dict() -> Dictionary:
    var ret = {}
    ret["namespaceName"] = namespace_name
    ret["description"] = description
    ret["transactionSetting"] = null if transaction_setting == null else transaction_setting.to_dict()
    ret["transactionSettingV2"] = null if transaction_setting_v2 == null else transaction_setting_v2.to_dict()
    ret["enableRating"] = enable_rating
    ret["enableDisconnectDetection"] = enable_disconnect_detection
    ret["disconnectDetectionTimeoutSeconds"] = disconnect_detection_timeout_seconds
    ret["createGatheringTriggerType"] = create_gathering_trigger_type
    ret["createGatheringTriggerRealtimeNamespaceId"] = create_gathering_trigger_realtime_namespace_id
    ret["createGatheringTriggerScriptId"] = create_gathering_trigger_script_id
    ret["completeMatchmakingTriggerType"] = complete_matchmaking_trigger_type
    ret["completeMatchmakingTriggerRealtimeNamespaceId"] = complete_matchmaking_trigger_realtime_namespace_id
    ret["completeMatchmakingTriggerScriptId"] = complete_matchmaking_trigger_script_id
    ret["enableCollaborateSeasonRating"] = enable_collaborate_season_rating
    ret["collaborateSeasonRatingNamespaceId"] = collaborate_season_rating_namespace_id
    ret["collaborateSeasonRatingTtl"] = collaborate_season_rating_ttl
    ret["changeRatingScript"] = null if change_rating_script == null else change_rating_script.to_dict()
    ret["joinNotification"] = null if join_notification == null else join_notification.to_dict()
    ret["leaveNotification"] = null if leave_notification == null else leave_notification.to_dict()
    ret["completeNotification"] = null if complete_notification == null else complete_notification.to_dict()
    ret["changeRatingNotification"] = null if change_rating_notification == null else change_rating_notification.to_dict()
    ret["logSetting"] = null if log_setting == null else log_setting.to_dict()
    return ret