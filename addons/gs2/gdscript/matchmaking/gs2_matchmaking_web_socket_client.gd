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
class_name Gs2MatchmakingWebSocketClient
extends Gs2AbstractWebSocketClient


func create_namespace(request: Gs2MatchmakingCreateNamespaceRequest) -> Gs2AsyncResult:
    var body = {}
    if request.name != null:
        body["name"] = request.name
    if request.description != null:
        body["description"] = request.description
    if request.transaction_setting != null:
        body["transactionSetting"] = request.transaction_setting.to_dict()
    if request.enable_rating != null:
        body["enableRating"] = request.enable_rating
    if request.enable_disconnect_detection != null:
        body["enableDisconnectDetection"] = request.enable_disconnect_detection
    if request.disconnect_detection_timeout_seconds != null:
        body["disconnectDetectionTimeoutSeconds"] = request.disconnect_detection_timeout_seconds
    if request.create_gathering_trigger_type != null:
        body["createGatheringTriggerType"] = request.create_gathering_trigger_type
    if request.create_gathering_trigger_realtime_namespace_id != null:
        body["createGatheringTriggerRealtimeNamespaceId"] = request.create_gathering_trigger_realtime_namespace_id
    if request.create_gathering_trigger_script_id != null:
        body["createGatheringTriggerScriptId"] = request.create_gathering_trigger_script_id
    if request.complete_matchmaking_trigger_type != null:
        body["completeMatchmakingTriggerType"] = request.complete_matchmaking_trigger_type
    if request.complete_matchmaking_trigger_realtime_namespace_id != null:
        body["completeMatchmakingTriggerRealtimeNamespaceId"] = request.complete_matchmaking_trigger_realtime_namespace_id
    if request.complete_matchmaking_trigger_script_id != null:
        body["completeMatchmakingTriggerScriptId"] = request.complete_matchmaking_trigger_script_id
    if request.enable_collaborate_season_rating != null:
        body["enableCollaborateSeasonRating"] = request.enable_collaborate_season_rating
    if request.collaborate_season_rating_namespace_id != null:
        body["collaborateSeasonRatingNamespaceId"] = request.collaborate_season_rating_namespace_id
    if request.collaborate_season_rating_ttl != null:
        body["collaborateSeasonRatingTtl"] = request.collaborate_season_rating_ttl
    if request.change_rating_script != null:
        body["changeRatingScript"] = request.change_rating_script.to_dict()
    if request.join_notification != null:
        body["joinNotification"] = request.join_notification.to_dict()
    if request.leave_notification != null:
        body["leaveNotification"] = request.leave_notification.to_dict()
    if request.complete_notification != null:
        body["completeNotification"] = request.complete_notification.to_dict()
    if request.change_rating_notification != null:
        body["changeRatingNotification"] = request.change_rating_notification.to_dict()
    if request.log_setting != null:
        body["logSetting"] = request.log_setting.to_dict()
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.dry_run:
        body["xGs2DryRun"] = "true"
    var response = await session.send("matchmaking", "namespace", "createNamespace", body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2MatchmakingCreateNamespaceResult.from_dict(response.body), null)


func get_namespace_status(request: Gs2MatchmakingGetNamespaceStatusRequest) -> Gs2AsyncResult:
    var body = {}
    if request.namespace_name != null:
        body["namespaceName"] = request.namespace_name
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.dry_run:
        body["xGs2DryRun"] = "true"
    var response = await session.send("matchmaking", "namespace", "getNamespaceStatus", body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2MatchmakingGetNamespaceStatusResult.from_dict(response.body), null)


func get_namespace(request: Gs2MatchmakingGetNamespaceRequest) -> Gs2AsyncResult:
    var body = {}
    if request.namespace_name != null:
        body["namespaceName"] = request.namespace_name
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.dry_run:
        body["xGs2DryRun"] = "true"
    var response = await session.send("matchmaking", "namespace", "getNamespace", body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2MatchmakingGetNamespaceResult.from_dict(response.body), null)


func update_namespace(request: Gs2MatchmakingUpdateNamespaceRequest) -> Gs2AsyncResult:
    var body = {}
    if request.namespace_name != null:
        body["namespaceName"] = request.namespace_name
    if request.description != null:
        body["description"] = request.description
    if request.transaction_setting != null:
        body["transactionSetting"] = request.transaction_setting.to_dict()
    if request.enable_rating != null:
        body["enableRating"] = request.enable_rating
    if request.enable_disconnect_detection != null:
        body["enableDisconnectDetection"] = request.enable_disconnect_detection
    if request.disconnect_detection_timeout_seconds != null:
        body["disconnectDetectionTimeoutSeconds"] = request.disconnect_detection_timeout_seconds
    if request.create_gathering_trigger_type != null:
        body["createGatheringTriggerType"] = request.create_gathering_trigger_type
    if request.create_gathering_trigger_realtime_namespace_id != null:
        body["createGatheringTriggerRealtimeNamespaceId"] = request.create_gathering_trigger_realtime_namespace_id
    if request.create_gathering_trigger_script_id != null:
        body["createGatheringTriggerScriptId"] = request.create_gathering_trigger_script_id
    if request.complete_matchmaking_trigger_type != null:
        body["completeMatchmakingTriggerType"] = request.complete_matchmaking_trigger_type
    if request.complete_matchmaking_trigger_realtime_namespace_id != null:
        body["completeMatchmakingTriggerRealtimeNamespaceId"] = request.complete_matchmaking_trigger_realtime_namespace_id
    if request.complete_matchmaking_trigger_script_id != null:
        body["completeMatchmakingTriggerScriptId"] = request.complete_matchmaking_trigger_script_id
    if request.enable_collaborate_season_rating != null:
        body["enableCollaborateSeasonRating"] = request.enable_collaborate_season_rating
    if request.collaborate_season_rating_namespace_id != null:
        body["collaborateSeasonRatingNamespaceId"] = request.collaborate_season_rating_namespace_id
    if request.collaborate_season_rating_ttl != null:
        body["collaborateSeasonRatingTtl"] = request.collaborate_season_rating_ttl
    if request.change_rating_script != null:
        body["changeRatingScript"] = request.change_rating_script.to_dict()
    if request.join_notification != null:
        body["joinNotification"] = request.join_notification.to_dict()
    if request.leave_notification != null:
        body["leaveNotification"] = request.leave_notification.to_dict()
    if request.complete_notification != null:
        body["completeNotification"] = request.complete_notification.to_dict()
    if request.change_rating_notification != null:
        body["changeRatingNotification"] = request.change_rating_notification.to_dict()
    if request.log_setting != null:
        body["logSetting"] = request.log_setting.to_dict()
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.dry_run:
        body["xGs2DryRun"] = "true"
    var response = await session.send("matchmaking", "namespace", "updateNamespace", body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2MatchmakingUpdateNamespaceResult.from_dict(response.body), null)


func delete_namespace(request: Gs2MatchmakingDeleteNamespaceRequest) -> Gs2AsyncResult:
    var body = {}
    if request.namespace_name != null:
        body["namespaceName"] = request.namespace_name
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.dry_run:
        body["xGs2DryRun"] = "true"
    var response = await session.send("matchmaking", "namespace", "deleteNamespace", body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2MatchmakingDeleteNamespaceResult.from_dict(response.body), null)


func get_service_version(request: Gs2MatchmakingGetServiceVersionRequest) -> Gs2AsyncResult:
    var body = {}
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.dry_run:
        body["xGs2DryRun"] = "true"
    var response = await session.send("matchmaking", "namespace", "getServiceVersion", body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2MatchmakingGetServiceVersionResult.from_dict(response.body), null)


func dump_user_data_by_user_id(request: Gs2MatchmakingDumpUserDataByUserIdRequest) -> Gs2AsyncResult:
    var body = {}
    if request.user_id != null:
        body["userId"] = request.user_id
    if request.time_offset_token != null:
        body["timeOffsetToken"] = request.time_offset_token
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.dry_run:
        body["xGs2DryRun"] = "true"
    var response = await session.send("matchmaking", "namespace", "dumpUserDataByUserId", body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2MatchmakingDumpUserDataByUserIdResult.from_dict(response.body), null)


func check_dump_user_data_by_user_id(request: Gs2MatchmakingCheckDumpUserDataByUserIdRequest) -> Gs2AsyncResult:
    var body = {}
    if request.user_id != null:
        body["userId"] = request.user_id
    if request.time_offset_token != null:
        body["timeOffsetToken"] = request.time_offset_token
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.dry_run:
        body["xGs2DryRun"] = "true"
    var response = await session.send("matchmaking", "namespace", "checkDumpUserDataByUserId", body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2MatchmakingCheckDumpUserDataByUserIdResult.from_dict(response.body), null)


func clean_user_data_by_user_id(request: Gs2MatchmakingCleanUserDataByUserIdRequest) -> Gs2AsyncResult:
    var body = {}
    if request.user_id != null:
        body["userId"] = request.user_id
    if request.time_offset_token != null:
        body["timeOffsetToken"] = request.time_offset_token
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.dry_run:
        body["xGs2DryRun"] = "true"
    var response = await session.send("matchmaking", "namespace", "cleanUserDataByUserId", body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2MatchmakingCleanUserDataByUserIdResult.from_dict(response.body), null)


func check_clean_user_data_by_user_id(request: Gs2MatchmakingCheckCleanUserDataByUserIdRequest) -> Gs2AsyncResult:
    var body = {}
    if request.user_id != null:
        body["userId"] = request.user_id
    if request.time_offset_token != null:
        body["timeOffsetToken"] = request.time_offset_token
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.dry_run:
        body["xGs2DryRun"] = "true"
    var response = await session.send("matchmaking", "namespace", "checkCleanUserDataByUserId", body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2MatchmakingCheckCleanUserDataByUserIdResult.from_dict(response.body), null)


func prepare_import_user_data_by_user_id(request: Gs2MatchmakingPrepareImportUserDataByUserIdRequest) -> Gs2AsyncResult:
    var body = {}
    if request.user_id != null:
        body["userId"] = request.user_id
    if request.time_offset_token != null:
        body["timeOffsetToken"] = request.time_offset_token
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.dry_run:
        body["xGs2DryRun"] = "true"
    var response = await session.send("matchmaking", "namespace", "prepareImportUserDataByUserId", body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2MatchmakingPrepareImportUserDataByUserIdResult.from_dict(response.body), null)


func import_user_data_by_user_id(request: Gs2MatchmakingImportUserDataByUserIdRequest) -> Gs2AsyncResult:
    var body = {}
    if request.user_id != null:
        body["userId"] = request.user_id
    if request.upload_token != null:
        body["uploadToken"] = request.upload_token
    if request.time_offset_token != null:
        body["timeOffsetToken"] = request.time_offset_token
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.dry_run:
        body["xGs2DryRun"] = "true"
    var response = await session.send("matchmaking", "namespace", "importUserDataByUserId", body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2MatchmakingImportUserDataByUserIdResult.from_dict(response.body), null)


func check_import_user_data_by_user_id(request: Gs2MatchmakingCheckImportUserDataByUserIdRequest) -> Gs2AsyncResult:
    var body = {}
    if request.user_id != null:
        body["userId"] = request.user_id
    if request.upload_token != null:
        body["uploadToken"] = request.upload_token
    if request.time_offset_token != null:
        body["timeOffsetToken"] = request.time_offset_token
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.dry_run:
        body["xGs2DryRun"] = "true"
    var response = await session.send("matchmaking", "namespace", "checkImportUserDataByUserId", body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2MatchmakingCheckImportUserDataByUserIdResult.from_dict(response.body), null)


func create_rating_model_master(request: Gs2MatchmakingCreateRatingModelMasterRequest) -> Gs2AsyncResult:
    var body = {}
    if request.namespace_name != null:
        body["namespaceName"] = request.namespace_name
    if request.name != null:
        body["name"] = request.name
    if request.description != null:
        body["description"] = request.description
    if request.metadata != null:
        body["metadata"] = request.metadata
    if request.initial_value != null:
        body["initialValue"] = request.initial_value
    if request.volatility != null:
        body["volatility"] = request.volatility
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.dry_run:
        body["xGs2DryRun"] = "true"
    var response = await session.send("matchmaking", "ratingModelMaster", "createRatingModelMaster", body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2MatchmakingCreateRatingModelMasterResult.from_dict(response.body), null)


func get_rating_model_master(request: Gs2MatchmakingGetRatingModelMasterRequest) -> Gs2AsyncResult:
    var body = {}
    if request.namespace_name != null:
        body["namespaceName"] = request.namespace_name
    if request.rating_name != null:
        body["ratingName"] = request.rating_name
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.dry_run:
        body["xGs2DryRun"] = "true"
    var response = await session.send("matchmaking", "ratingModelMaster", "getRatingModelMaster", body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2MatchmakingGetRatingModelMasterResult.from_dict(response.body), null)


func update_rating_model_master(request: Gs2MatchmakingUpdateRatingModelMasterRequest) -> Gs2AsyncResult:
    var body = {}
    if request.namespace_name != null:
        body["namespaceName"] = request.namespace_name
    if request.rating_name != null:
        body["ratingName"] = request.rating_name
    if request.description != null:
        body["description"] = request.description
    if request.metadata != null:
        body["metadata"] = request.metadata
    if request.initial_value != null:
        body["initialValue"] = request.initial_value
    if request.volatility != null:
        body["volatility"] = request.volatility
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.dry_run:
        body["xGs2DryRun"] = "true"
    var response = await session.send("matchmaking", "ratingModelMaster", "updateRatingModelMaster", body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2MatchmakingUpdateRatingModelMasterResult.from_dict(response.body), null)


func delete_rating_model_master(request: Gs2MatchmakingDeleteRatingModelMasterRequest) -> Gs2AsyncResult:
    var body = {}
    if request.namespace_name != null:
        body["namespaceName"] = request.namespace_name
    if request.rating_name != null:
        body["ratingName"] = request.rating_name
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.dry_run:
        body["xGs2DryRun"] = "true"
    var response = await session.send("matchmaking", "ratingModelMaster", "deleteRatingModelMaster", body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2MatchmakingDeleteRatingModelMasterResult.from_dict(response.body), null)


func get_rating_model(request: Gs2MatchmakingGetRatingModelRequest) -> Gs2AsyncResult:
    var body = {}
    if request.namespace_name != null:
        body["namespaceName"] = request.namespace_name
    if request.rating_name != null:
        body["ratingName"] = request.rating_name
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.dry_run:
        body["xGs2DryRun"] = "true"
    var response = await session.send("matchmaking", "ratingModel", "getRatingModel", body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2MatchmakingGetRatingModelResult.from_dict(response.body), null)


func pre_update_current_model_master(request: Gs2MatchmakingPreUpdateCurrentModelMasterRequest) -> Gs2AsyncResult:
    var body = {}
    if request.namespace_name != null:
        body["namespaceName"] = request.namespace_name
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.dry_run:
        body["xGs2DryRun"] = "true"
    var response = await session.send("matchmaking", "currentModelMaster", "preUpdateCurrentModelMaster", body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2MatchmakingPreUpdateCurrentModelMasterResult.from_dict(response.body), null)


func get_season_model(request: Gs2MatchmakingGetSeasonModelRequest) -> Gs2AsyncResult:
    var body = {}
    if request.namespace_name != null:
        body["namespaceName"] = request.namespace_name
    if request.season_name != null:
        body["seasonName"] = request.season_name
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.dry_run:
        body["xGs2DryRun"] = "true"
    var response = await session.send("matchmaking", "seasonModel", "getSeasonModel", body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2MatchmakingGetSeasonModelResult.from_dict(response.body), null)


func create_season_model_master(request: Gs2MatchmakingCreateSeasonModelMasterRequest) -> Gs2AsyncResult:
    var body = {}
    if request.namespace_name != null:
        body["namespaceName"] = request.namespace_name
    if request.name != null:
        body["name"] = request.name
    if request.description != null:
        body["description"] = request.description
    if request.metadata != null:
        body["metadata"] = request.metadata
    if request.maximum_participants != null:
        body["maximumParticipants"] = request.maximum_participants
    if request.experience_model_id != null:
        body["experienceModelId"] = request.experience_model_id
    if request.challenge_period_event_id != null:
        body["challengePeriodEventId"] = request.challenge_period_event_id
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.dry_run:
        body["xGs2DryRun"] = "true"
    var response = await session.send("matchmaking", "seasonModelMaster", "createSeasonModelMaster", body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2MatchmakingCreateSeasonModelMasterResult.from_dict(response.body), null)


func get_season_model_master(request: Gs2MatchmakingGetSeasonModelMasterRequest) -> Gs2AsyncResult:
    var body = {}
    if request.namespace_name != null:
        body["namespaceName"] = request.namespace_name
    if request.season_name != null:
        body["seasonName"] = request.season_name
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.dry_run:
        body["xGs2DryRun"] = "true"
    var response = await session.send("matchmaking", "seasonModelMaster", "getSeasonModelMaster", body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2MatchmakingGetSeasonModelMasterResult.from_dict(response.body), null)


func update_season_model_master(request: Gs2MatchmakingUpdateSeasonModelMasterRequest) -> Gs2AsyncResult:
    var body = {}
    if request.namespace_name != null:
        body["namespaceName"] = request.namespace_name
    if request.season_name != null:
        body["seasonName"] = request.season_name
    if request.description != null:
        body["description"] = request.description
    if request.metadata != null:
        body["metadata"] = request.metadata
    if request.maximum_participants != null:
        body["maximumParticipants"] = request.maximum_participants
    if request.experience_model_id != null:
        body["experienceModelId"] = request.experience_model_id
    if request.challenge_period_event_id != null:
        body["challengePeriodEventId"] = request.challenge_period_event_id
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.dry_run:
        body["xGs2DryRun"] = "true"
    var response = await session.send("matchmaking", "seasonModelMaster", "updateSeasonModelMaster", body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2MatchmakingUpdateSeasonModelMasterResult.from_dict(response.body), null)


func delete_season_model_master(request: Gs2MatchmakingDeleteSeasonModelMasterRequest) -> Gs2AsyncResult:
    var body = {}
    if request.namespace_name != null:
        body["namespaceName"] = request.namespace_name
    if request.season_name != null:
        body["seasonName"] = request.season_name
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.dry_run:
        body["xGs2DryRun"] = "true"
    var response = await session.send("matchmaking", "seasonModelMaster", "deleteSeasonModelMaster", body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2MatchmakingDeleteSeasonModelMasterResult.from_dict(response.body), null)


func get_joined_season_gathering(request: Gs2MatchmakingGetJoinedSeasonGatheringRequest) -> Gs2AsyncResult:
    var body = {}
    if request.namespace_name != null:
        body["namespaceName"] = request.namespace_name
    if request.access_token != null:
        body["accessToken"] = request.access_token
    if request.season_name != null:
        body["seasonName"] = request.season_name
    if request.season != null:
        body["season"] = request.season
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.access_token != null:
        body["xGs2AccessToken"] = request.access_token
    if request.dry_run:
        body["xGs2DryRun"] = "true"
    var response = await session.send("matchmaking", "joinedSeasonGathering", "getJoinedSeasonGathering", body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2MatchmakingGetJoinedSeasonGatheringResult.from_dict(response.body), null)


func get_joined_season_gathering_by_user_id(request: Gs2MatchmakingGetJoinedSeasonGatheringByUserIdRequest) -> Gs2AsyncResult:
    var body = {}
    if request.namespace_name != null:
        body["namespaceName"] = request.namespace_name
    if request.user_id != null:
        body["userId"] = request.user_id
    if request.season_name != null:
        body["seasonName"] = request.season_name
    if request.season != null:
        body["season"] = request.season
    if request.time_offset_token != null:
        body["timeOffsetToken"] = request.time_offset_token
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.dry_run:
        body["xGs2DryRun"] = "true"
    var response = await session.send("matchmaking", "joinedSeasonGathering", "getJoinedSeasonGatheringByUserId", body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2MatchmakingGetJoinedSeasonGatheringByUserIdResult.from_dict(response.body), null)


func get_rating(request: Gs2MatchmakingGetRatingRequest) -> Gs2AsyncResult:
    var body = {}
    if request.namespace_name != null:
        body["namespaceName"] = request.namespace_name
    if request.access_token != null:
        body["accessToken"] = request.access_token
    if request.rating_name != null:
        body["ratingName"] = request.rating_name
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.access_token != null:
        body["xGs2AccessToken"] = request.access_token
    if request.dry_run:
        body["xGs2DryRun"] = "true"
    var response = await session.send("matchmaking", "rating", "getRating", body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2MatchmakingGetRatingResult.from_dict(response.body), null)


func get_rating_by_user_id(request: Gs2MatchmakingGetRatingByUserIdRequest) -> Gs2AsyncResult:
    var body = {}
    if request.namespace_name != null:
        body["namespaceName"] = request.namespace_name
    if request.user_id != null:
        body["userId"] = request.user_id
    if request.rating_name != null:
        body["ratingName"] = request.rating_name
    if request.time_offset_token != null:
        body["timeOffsetToken"] = request.time_offset_token
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.dry_run:
        body["xGs2DryRun"] = "true"
    var response = await session.send("matchmaking", "rating", "getRatingByUserId", body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2MatchmakingGetRatingByUserIdResult.from_dict(response.body), null)


func delete_rating(request: Gs2MatchmakingDeleteRatingRequest) -> Gs2AsyncResult:
    var body = {}
    if request.namespace_name != null:
        body["namespaceName"] = request.namespace_name
    if request.user_id != null:
        body["userId"] = request.user_id
    if request.rating_name != null:
        body["ratingName"] = request.rating_name
    if request.time_offset_token != null:
        body["timeOffsetToken"] = request.time_offset_token
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.duplication_avoider != null:
        body["xGs2DuplicationAvoider"] = request.duplication_avoider
    if request.dry_run:
        body["xGs2DryRun"] = "true"
    var response = await session.send("matchmaking", "rating", "deleteRating", body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2MatchmakingDeleteRatingResult.from_dict(response.body), null)


func vote(request: Gs2MatchmakingVoteRequest) -> Gs2AsyncResult:
    var body = {}
    if request.namespace_name != null:
        body["namespaceName"] = request.namespace_name
    if request.ballot_body != null:
        body["ballotBody"] = request.ballot_body
    if request.ballot_signature != null:
        body["ballotSignature"] = request.ballot_signature
    if request.game_results != null:
        body["gameResults"] = request.game_results.map(func(v): return null if v == null else v.to_dict())
    if request.key_id != null:
        body["keyId"] = request.key_id
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.dry_run:
        body["xGs2DryRun"] = "true"
    var response = await session.send("matchmaking", "vote", "vote", body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2MatchmakingVoteResult.from_dict(response.body), null)


func vote_multiple(request: Gs2MatchmakingVoteMultipleRequest) -> Gs2AsyncResult:
    var body = {}
    if request.namespace_name != null:
        body["namespaceName"] = request.namespace_name
    if request.signed_ballots != null:
        body["signedBallots"] = request.signed_ballots.map(func(v): return null if v == null else v.to_dict())
    if request.game_results != null:
        body["gameResults"] = request.game_results.map(func(v): return null if v == null else v.to_dict())
    if request.key_id != null:
        body["keyId"] = request.key_id
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.dry_run:
        body["xGs2DryRun"] = "true"
    var response = await session.send("matchmaking", "vote", "voteMultiple", body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2MatchmakingVoteMultipleResult.from_dict(response.body), null)


func commit_vote(request: Gs2MatchmakingCommitVoteRequest) -> Gs2AsyncResult:
    var body = {}
    if request.namespace_name != null:
        body["namespaceName"] = request.namespace_name
    if request.rating_name != null:
        body["ratingName"] = request.rating_name
    if request.gathering_name != null:
        body["gatheringName"] = request.gathering_name
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.dry_run:
        body["xGs2DryRun"] = "true"
    var response = await session.send("matchmaking", "vote", "commitVote", body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2MatchmakingCommitVoteResult.from_dict(response.body), null)