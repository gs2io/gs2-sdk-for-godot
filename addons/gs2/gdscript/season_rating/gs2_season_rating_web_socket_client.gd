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
class_name Gs2SeasonRatingWebSocketClient
extends Gs2AbstractWebSocketClient


func create_namespace(request: Gs2SeasonRatingCreateNamespaceRequest) -> Gs2AsyncResult:
    var body = {}
    if request.name != null:
        body["name"] = request.name
    if request.description != null:
        body["description"] = request.description
    if request.transaction_setting != null:
        body["transactionSetting"] = request.transaction_setting.to_dict()
    if request.log_setting != null:
        body["logSetting"] = request.log_setting.to_dict()
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.dry_run:
        body["xGs2DryRun"] = "true"
    var response = await session.send("seasonRating", "namespace", "createNamespace", body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2SeasonRatingCreateNamespaceResult.from_dict(response.body), null)


func get_namespace_status(request: Gs2SeasonRatingGetNamespaceStatusRequest) -> Gs2AsyncResult:
    var body = {}
    if request.namespace_name != null:
        body["namespaceName"] = request.namespace_name
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.dry_run:
        body["xGs2DryRun"] = "true"
    var response = await session.send("seasonRating", "namespace", "getNamespaceStatus", body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2SeasonRatingGetNamespaceStatusResult.from_dict(response.body), null)


func get_namespace(request: Gs2SeasonRatingGetNamespaceRequest) -> Gs2AsyncResult:
    var body = {}
    if request.namespace_name != null:
        body["namespaceName"] = request.namespace_name
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.dry_run:
        body["xGs2DryRun"] = "true"
    var response = await session.send("seasonRating", "namespace", "getNamespace", body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2SeasonRatingGetNamespaceResult.from_dict(response.body), null)


func update_namespace(request: Gs2SeasonRatingUpdateNamespaceRequest) -> Gs2AsyncResult:
    var body = {}
    if request.namespace_name != null:
        body["namespaceName"] = request.namespace_name
    if request.description != null:
        body["description"] = request.description
    if request.transaction_setting != null:
        body["transactionSetting"] = request.transaction_setting.to_dict()
    if request.log_setting != null:
        body["logSetting"] = request.log_setting.to_dict()
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.dry_run:
        body["xGs2DryRun"] = "true"
    var response = await session.send("seasonRating", "namespace", "updateNamespace", body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2SeasonRatingUpdateNamespaceResult.from_dict(response.body), null)


func delete_namespace(request: Gs2SeasonRatingDeleteNamespaceRequest) -> Gs2AsyncResult:
    var body = {}
    if request.namespace_name != null:
        body["namespaceName"] = request.namespace_name
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.dry_run:
        body["xGs2DryRun"] = "true"
    var response = await session.send("seasonRating", "namespace", "deleteNamespace", body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2SeasonRatingDeleteNamespaceResult.from_dict(response.body), null)


func get_service_version(request: Gs2SeasonRatingGetServiceVersionRequest) -> Gs2AsyncResult:
    var body = {}
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.dry_run:
        body["xGs2DryRun"] = "true"
    var response = await session.send("seasonRating", "namespace", "getServiceVersion", body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2SeasonRatingGetServiceVersionResult.from_dict(response.body), null)


func dump_user_data_by_user_id(request: Gs2SeasonRatingDumpUserDataByUserIdRequest) -> Gs2AsyncResult:
    var body = {}
    if request.user_id != null:
        body["userId"] = request.user_id
    if request.time_offset_token != null:
        body["timeOffsetToken"] = request.time_offset_token
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.dry_run:
        body["xGs2DryRun"] = "true"
    var response = await session.send("seasonRating", "namespace", "dumpUserDataByUserId", body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2SeasonRatingDumpUserDataByUserIdResult.from_dict(response.body), null)


func check_dump_user_data_by_user_id(request: Gs2SeasonRatingCheckDumpUserDataByUserIdRequest) -> Gs2AsyncResult:
    var body = {}
    if request.user_id != null:
        body["userId"] = request.user_id
    if request.time_offset_token != null:
        body["timeOffsetToken"] = request.time_offset_token
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.dry_run:
        body["xGs2DryRun"] = "true"
    var response = await session.send("seasonRating", "namespace", "checkDumpUserDataByUserId", body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2SeasonRatingCheckDumpUserDataByUserIdResult.from_dict(response.body), null)


func clean_user_data_by_user_id(request: Gs2SeasonRatingCleanUserDataByUserIdRequest) -> Gs2AsyncResult:
    var body = {}
    if request.user_id != null:
        body["userId"] = request.user_id
    if request.time_offset_token != null:
        body["timeOffsetToken"] = request.time_offset_token
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.dry_run:
        body["xGs2DryRun"] = "true"
    var response = await session.send("seasonRating", "namespace", "cleanUserDataByUserId", body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2SeasonRatingCleanUserDataByUserIdResult.from_dict(response.body), null)


func check_clean_user_data_by_user_id(request: Gs2SeasonRatingCheckCleanUserDataByUserIdRequest) -> Gs2AsyncResult:
    var body = {}
    if request.user_id != null:
        body["userId"] = request.user_id
    if request.time_offset_token != null:
        body["timeOffsetToken"] = request.time_offset_token
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.dry_run:
        body["xGs2DryRun"] = "true"
    var response = await session.send("seasonRating", "namespace", "checkCleanUserDataByUserId", body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2SeasonRatingCheckCleanUserDataByUserIdResult.from_dict(response.body), null)


func prepare_import_user_data_by_user_id(request: Gs2SeasonRatingPrepareImportUserDataByUserIdRequest) -> Gs2AsyncResult:
    var body = {}
    if request.user_id != null:
        body["userId"] = request.user_id
    if request.time_offset_token != null:
        body["timeOffsetToken"] = request.time_offset_token
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.dry_run:
        body["xGs2DryRun"] = "true"
    var response = await session.send("seasonRating", "namespace", "prepareImportUserDataByUserId", body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2SeasonRatingPrepareImportUserDataByUserIdResult.from_dict(response.body), null)


func import_user_data_by_user_id(request: Gs2SeasonRatingImportUserDataByUserIdRequest) -> Gs2AsyncResult:
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
    var response = await session.send("seasonRating", "namespace", "importUserDataByUserId", body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2SeasonRatingImportUserDataByUserIdResult.from_dict(response.body), null)


func check_import_user_data_by_user_id(request: Gs2SeasonRatingCheckImportUserDataByUserIdRequest) -> Gs2AsyncResult:
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
    var response = await session.send("seasonRating", "namespace", "checkImportUserDataByUserId", body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2SeasonRatingCheckImportUserDataByUserIdResult.from_dict(response.body), null)


func create_match_session(request: Gs2SeasonRatingCreateMatchSessionRequest) -> Gs2AsyncResult:
    var body = {}
    if request.namespace_name != null:
        body["namespaceName"] = request.namespace_name
    if request.session_name != null:
        body["sessionName"] = request.session_name
    if request.ttl_seconds != null:
        body["ttlSeconds"] = request.ttl_seconds
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.dry_run:
        body["xGs2DryRun"] = "true"
    var response = await session.send("seasonRating", "matchSession", "createMatchSession", body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2SeasonRatingCreateMatchSessionResult.from_dict(response.body), null)


func get_match_session(request: Gs2SeasonRatingGetMatchSessionRequest) -> Gs2AsyncResult:
    var body = {}
    if request.namespace_name != null:
        body["namespaceName"] = request.namespace_name
    if request.session_name != null:
        body["sessionName"] = request.session_name
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.dry_run:
        body["xGs2DryRun"] = "true"
    var response = await session.send("seasonRating", "matchSession", "getMatchSession", body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2SeasonRatingGetMatchSessionResult.from_dict(response.body), null)


func delete_match_session(request: Gs2SeasonRatingDeleteMatchSessionRequest) -> Gs2AsyncResult:
    var body = {}
    if request.namespace_name != null:
        body["namespaceName"] = request.namespace_name
    if request.session_name != null:
        body["sessionName"] = request.session_name
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.dry_run:
        body["xGs2DryRun"] = "true"
    var response = await session.send("seasonRating", "matchSession", "deleteMatchSession", body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2SeasonRatingDeleteMatchSessionResult.from_dict(response.body), null)


func create_season_model_master(request: Gs2SeasonRatingCreateSeasonModelMasterRequest) -> Gs2AsyncResult:
    var body = {}
    if request.namespace_name != null:
        body["namespaceName"] = request.namespace_name
    if request.name != null:
        body["name"] = request.name
    if request.description != null:
        body["description"] = request.description
    if request.metadata != null:
        body["metadata"] = request.metadata
    if request.tiers != null:
        body["tiers"] = request.tiers.map(func(v): return null if v == null else v.to_dict())
    if request.experience_model_id != null:
        body["experienceModelId"] = request.experience_model_id
    if request.challenge_period_event_id != null:
        body["challengePeriodEventId"] = request.challenge_period_event_id
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.dry_run:
        body["xGs2DryRun"] = "true"
    var response = await session.send("seasonRating", "seasonModelMaster", "createSeasonModelMaster", body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2SeasonRatingCreateSeasonModelMasterResult.from_dict(response.body), null)


func get_season_model_master(request: Gs2SeasonRatingGetSeasonModelMasterRequest) -> Gs2AsyncResult:
    var body = {}
    if request.namespace_name != null:
        body["namespaceName"] = request.namespace_name
    if request.season_name != null:
        body["seasonName"] = request.season_name
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.dry_run:
        body["xGs2DryRun"] = "true"
    var response = await session.send("seasonRating", "seasonModelMaster", "getSeasonModelMaster", body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2SeasonRatingGetSeasonModelMasterResult.from_dict(response.body), null)


func update_season_model_master(request: Gs2SeasonRatingUpdateSeasonModelMasterRequest) -> Gs2AsyncResult:
    var body = {}
    if request.namespace_name != null:
        body["namespaceName"] = request.namespace_name
    if request.season_name != null:
        body["seasonName"] = request.season_name
    if request.description != null:
        body["description"] = request.description
    if request.metadata != null:
        body["metadata"] = request.metadata
    if request.tiers != null:
        body["tiers"] = request.tiers.map(func(v): return null if v == null else v.to_dict())
    if request.experience_model_id != null:
        body["experienceModelId"] = request.experience_model_id
    if request.challenge_period_event_id != null:
        body["challengePeriodEventId"] = request.challenge_period_event_id
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.dry_run:
        body["xGs2DryRun"] = "true"
    var response = await session.send("seasonRating", "seasonModelMaster", "updateSeasonModelMaster", body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2SeasonRatingUpdateSeasonModelMasterResult.from_dict(response.body), null)


func delete_season_model_master(request: Gs2SeasonRatingDeleteSeasonModelMasterRequest) -> Gs2AsyncResult:
    var body = {}
    if request.namespace_name != null:
        body["namespaceName"] = request.namespace_name
    if request.season_name != null:
        body["seasonName"] = request.season_name
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.dry_run:
        body["xGs2DryRun"] = "true"
    var response = await session.send("seasonRating", "seasonModelMaster", "deleteSeasonModelMaster", body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2SeasonRatingDeleteSeasonModelMasterResult.from_dict(response.body), null)


func get_season_model(request: Gs2SeasonRatingGetSeasonModelRequest) -> Gs2AsyncResult:
    var body = {}
    if request.namespace_name != null:
        body["namespaceName"] = request.namespace_name
    if request.season_name != null:
        body["seasonName"] = request.season_name
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.dry_run:
        body["xGs2DryRun"] = "true"
    var response = await session.send("seasonRating", "seasonModel", "getSeasonModel", body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2SeasonRatingGetSeasonModelResult.from_dict(response.body), null)


func pre_update_current_season_model_master(request: Gs2SeasonRatingPreUpdateCurrentSeasonModelMasterRequest) -> Gs2AsyncResult:
    var body = {}
    if request.namespace_name != null:
        body["namespaceName"] = request.namespace_name
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.dry_run:
        body["xGs2DryRun"] = "true"
    var response = await session.send("seasonRating", "currentSeasonModelMaster", "preUpdateCurrentSeasonModelMaster", body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2SeasonRatingPreUpdateCurrentSeasonModelMasterResult.from_dict(response.body), null)


func vote(request: Gs2SeasonRatingVoteRequest) -> Gs2AsyncResult:
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
    var response = await session.send("seasonRating", "vote", "vote", body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2SeasonRatingVoteResult.from_dict(response.body), null)


func vote_multiple(request: Gs2SeasonRatingVoteMultipleRequest) -> Gs2AsyncResult:
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
    var response = await session.send("seasonRating", "vote", "voteMultiple", body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2SeasonRatingVoteMultipleResult.from_dict(response.body), null)


func commit_vote(request: Gs2SeasonRatingCommitVoteRequest) -> Gs2AsyncResult:
    var body = {}
    if request.namespace_name != null:
        body["namespaceName"] = request.namespace_name
    if request.season_name != null:
        body["seasonName"] = request.season_name
    if request.session_name != null:
        body["sessionName"] = request.session_name
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.dry_run:
        body["xGs2DryRun"] = "true"
    var response = await session.send("seasonRating", "vote", "commitVote", body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2SeasonRatingCommitVoteResult.from_dict(response.body), null)