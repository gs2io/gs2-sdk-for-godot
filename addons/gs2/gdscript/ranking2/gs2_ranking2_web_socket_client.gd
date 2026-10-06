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
class_name Gs2Ranking2WebSocketClient
extends Gs2AbstractWebSocketClient


func create_namespace(request: Gs2Ranking2CreateNamespaceRequest) -> Gs2AsyncResult:
    var body = {}
    if request.name != null:
        body["name"] = request.name
    if request.description != null:
        body["description"] = request.description
    if request.transaction_setting != null:
        body["transactionSetting"] = request.transaction_setting.to_dict()
    if request.transaction_setting_v2 != null:
        body["transactionSettingV2"] = request.transaction_setting_v2.to_dict()
    if request.log_setting != null:
        body["logSetting"] = request.log_setting.to_dict()
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.dry_run:
        body["xGs2DryRun"] = "true"
    var response = await session.send("ranking2", "namespace", "createNamespace", body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2Ranking2CreateNamespaceResult.from_dict(response.body), null)


func get_namespace_status(request: Gs2Ranking2GetNamespaceStatusRequest) -> Gs2AsyncResult:
    var body = {}
    if request.namespace_name != null:
        body["namespaceName"] = request.namespace_name
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.dry_run:
        body["xGs2DryRun"] = "true"
    var response = await session.send("ranking2", "namespace", "getNamespaceStatus", body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2Ranking2GetNamespaceStatusResult.from_dict(response.body), null)


func get_namespace(request: Gs2Ranking2GetNamespaceRequest) -> Gs2AsyncResult:
    var body = {}
    if request.namespace_name != null:
        body["namespaceName"] = request.namespace_name
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.dry_run:
        body["xGs2DryRun"] = "true"
    var response = await session.send("ranking2", "namespace", "getNamespace", body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2Ranking2GetNamespaceResult.from_dict(response.body), null)


func update_namespace(request: Gs2Ranking2UpdateNamespaceRequest) -> Gs2AsyncResult:
    var body = {}
    if request.namespace_name != null:
        body["namespaceName"] = request.namespace_name
    if request.description != null:
        body["description"] = request.description
    if request.transaction_setting != null:
        body["transactionSetting"] = request.transaction_setting.to_dict()
    if request.transaction_setting_v2 != null:
        body["transactionSettingV2"] = request.transaction_setting_v2.to_dict()
    if request.log_setting != null:
        body["logSetting"] = request.log_setting.to_dict()
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.dry_run:
        body["xGs2DryRun"] = "true"
    var response = await session.send("ranking2", "namespace", "updateNamespace", body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2Ranking2UpdateNamespaceResult.from_dict(response.body), null)


func delete_namespace(request: Gs2Ranking2DeleteNamespaceRequest) -> Gs2AsyncResult:
    var body = {}
    if request.namespace_name != null:
        body["namespaceName"] = request.namespace_name
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.dry_run:
        body["xGs2DryRun"] = "true"
    var response = await session.send("ranking2", "namespace", "deleteNamespace", body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2Ranking2DeleteNamespaceResult.from_dict(response.body), null)


func get_service_version(request: Gs2Ranking2GetServiceVersionRequest) -> Gs2AsyncResult:
    var body = {}
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.dry_run:
        body["xGs2DryRun"] = "true"
    var response = await session.send("ranking2", "namespace", "getServiceVersion", body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2Ranking2GetServiceVersionResult.from_dict(response.body), null)


func dump_user_data_by_user_id(request: Gs2Ranking2DumpUserDataByUserIdRequest) -> Gs2AsyncResult:
    var body = {}
    if request.user_id != null:
        body["userId"] = request.user_id
    if request.time_offset_token != null:
        body["timeOffsetToken"] = request.time_offset_token
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.dry_run:
        body["xGs2DryRun"] = "true"
    var response = await session.send("ranking2", "namespace", "dumpUserDataByUserId", body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2Ranking2DumpUserDataByUserIdResult.from_dict(response.body), null)


func check_dump_user_data_by_user_id(request: Gs2Ranking2CheckDumpUserDataByUserIdRequest) -> Gs2AsyncResult:
    var body = {}
    if request.user_id != null:
        body["userId"] = request.user_id
    if request.time_offset_token != null:
        body["timeOffsetToken"] = request.time_offset_token
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.dry_run:
        body["xGs2DryRun"] = "true"
    var response = await session.send("ranking2", "namespace", "checkDumpUserDataByUserId", body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2Ranking2CheckDumpUserDataByUserIdResult.from_dict(response.body), null)


func clean_user_data_by_user_id(request: Gs2Ranking2CleanUserDataByUserIdRequest) -> Gs2AsyncResult:
    var body = {}
    if request.user_id != null:
        body["userId"] = request.user_id
    if request.time_offset_token != null:
        body["timeOffsetToken"] = request.time_offset_token
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.dry_run:
        body["xGs2DryRun"] = "true"
    var response = await session.send("ranking2", "namespace", "cleanUserDataByUserId", body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2Ranking2CleanUserDataByUserIdResult.from_dict(response.body), null)


func check_clean_user_data_by_user_id(request: Gs2Ranking2CheckCleanUserDataByUserIdRequest) -> Gs2AsyncResult:
    var body = {}
    if request.user_id != null:
        body["userId"] = request.user_id
    if request.time_offset_token != null:
        body["timeOffsetToken"] = request.time_offset_token
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.dry_run:
        body["xGs2DryRun"] = "true"
    var response = await session.send("ranking2", "namespace", "checkCleanUserDataByUserId", body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2Ranking2CheckCleanUserDataByUserIdResult.from_dict(response.body), null)


func prepare_import_user_data_by_user_id(request: Gs2Ranking2PrepareImportUserDataByUserIdRequest) -> Gs2AsyncResult:
    var body = {}
    if request.user_id != null:
        body["userId"] = request.user_id
    if request.time_offset_token != null:
        body["timeOffsetToken"] = request.time_offset_token
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.dry_run:
        body["xGs2DryRun"] = "true"
    var response = await session.send("ranking2", "namespace", "prepareImportUserDataByUserId", body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2Ranking2PrepareImportUserDataByUserIdResult.from_dict(response.body), null)


func import_user_data_by_user_id(request: Gs2Ranking2ImportUserDataByUserIdRequest) -> Gs2AsyncResult:
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
    var response = await session.send("ranking2", "namespace", "importUserDataByUserId", body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2Ranking2ImportUserDataByUserIdResult.from_dict(response.body), null)


func check_import_user_data_by_user_id(request: Gs2Ranking2CheckImportUserDataByUserIdRequest) -> Gs2AsyncResult:
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
    var response = await session.send("ranking2", "namespace", "checkImportUserDataByUserId", body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2Ranking2CheckImportUserDataByUserIdResult.from_dict(response.body), null)


func put_global_ranking_score(request: Gs2Ranking2PutGlobalRankingScoreRequest) -> Gs2AsyncResult:
    var body = {}
    if request.namespace_name != null:
        body["namespaceName"] = request.namespace_name
    if request.ranking_name != null:
        body["rankingName"] = request.ranking_name
    if request.access_token != null:
        body["accessToken"] = request.access_token
    if request.score != null:
        body["score"] = request.score
    if request.metadata != null:
        body["metadata"] = request.metadata
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.access_token != null:
        body["xGs2AccessToken"] = request.access_token
    if request.duplication_avoider != null:
        body["xGs2DuplicationAvoider"] = request.duplication_avoider
    if request.dry_run:
        body["xGs2DryRun"] = "true"
    var response = await session.send("ranking2", "globalRankingScore", "putGlobalRankingScore", body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2Ranking2PutGlobalRankingScoreResult.from_dict(response.body), null)


func put_global_ranking_score_by_user_id(request: Gs2Ranking2PutGlobalRankingScoreByUserIdRequest) -> Gs2AsyncResult:
    var body = {}
    if request.namespace_name != null:
        body["namespaceName"] = request.namespace_name
    if request.ranking_name != null:
        body["rankingName"] = request.ranking_name
    if request.user_id != null:
        body["userId"] = request.user_id
    if request.score != null:
        body["score"] = request.score
    if request.metadata != null:
        body["metadata"] = request.metadata
    if request.time_offset_token != null:
        body["timeOffsetToken"] = request.time_offset_token
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.duplication_avoider != null:
        body["xGs2DuplicationAvoider"] = request.duplication_avoider
    if request.dry_run:
        body["xGs2DryRun"] = "true"
    var response = await session.send("ranking2", "globalRankingScore", "putGlobalRankingScoreByUserId", body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2Ranking2PutGlobalRankingScoreByUserIdResult.from_dict(response.body), null)


func get_global_ranking_score(request: Gs2Ranking2GetGlobalRankingScoreRequest) -> Gs2AsyncResult:
    var body = {}
    if request.namespace_name != null:
        body["namespaceName"] = request.namespace_name
    if request.ranking_name != null:
        body["rankingName"] = request.ranking_name
    if request.access_token != null:
        body["accessToken"] = request.access_token
    if request.season != null:
        body["season"] = request.season
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.access_token != null:
        body["xGs2AccessToken"] = request.access_token
    if request.dry_run:
        body["xGs2DryRun"] = "true"
    var response = await session.send("ranking2", "globalRankingScore", "getGlobalRankingScore", body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2Ranking2GetGlobalRankingScoreResult.from_dict(response.body), null)


func get_global_ranking_score_by_user_id(request: Gs2Ranking2GetGlobalRankingScoreByUserIdRequest) -> Gs2AsyncResult:
    var body = {}
    if request.namespace_name != null:
        body["namespaceName"] = request.namespace_name
    if request.ranking_name != null:
        body["rankingName"] = request.ranking_name
    if request.user_id != null:
        body["userId"] = request.user_id
    if request.season != null:
        body["season"] = request.season
    if request.time_offset_token != null:
        body["timeOffsetToken"] = request.time_offset_token
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.dry_run:
        body["xGs2DryRun"] = "true"
    var response = await session.send("ranking2", "globalRankingScore", "getGlobalRankingScoreByUserId", body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2Ranking2GetGlobalRankingScoreByUserIdResult.from_dict(response.body), null)


func delete_global_ranking_score_by_user_id(request: Gs2Ranking2DeleteGlobalRankingScoreByUserIdRequest) -> Gs2AsyncResult:
    var body = {}
    if request.namespace_name != null:
        body["namespaceName"] = request.namespace_name
    if request.ranking_name != null:
        body["rankingName"] = request.ranking_name
    if request.user_id != null:
        body["userId"] = request.user_id
    if request.season != null:
        body["season"] = request.season
    if request.time_offset_token != null:
        body["timeOffsetToken"] = request.time_offset_token
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.duplication_avoider != null:
        body["xGs2DuplicationAvoider"] = request.duplication_avoider
    if request.dry_run:
        body["xGs2DryRun"] = "true"
    var response = await session.send("ranking2", "globalRankingScore", "deleteGlobalRankingScoreByUserId", body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2Ranking2DeleteGlobalRankingScoreByUserIdResult.from_dict(response.body), null)


func verify_global_ranking_score(request: Gs2Ranking2VerifyGlobalRankingScoreRequest) -> Gs2AsyncResult:
    var body = {}
    if request.namespace_name != null:
        body["namespaceName"] = request.namespace_name
    if request.access_token != null:
        body["accessToken"] = request.access_token
    if request.ranking_name != null:
        body["rankingName"] = request.ranking_name
    if request.verify_type != null:
        body["verifyType"] = request.verify_type
    if request.season != null:
        body["season"] = request.season
    if request.score != null:
        body["score"] = request.score
    if request.multiply_value_specifying_quantity != null:
        body["multiplyValueSpecifyingQuantity"] = request.multiply_value_specifying_quantity
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.access_token != null:
        body["xGs2AccessToken"] = request.access_token
    if request.duplication_avoider != null:
        body["xGs2DuplicationAvoider"] = request.duplication_avoider
    if request.dry_run:
        body["xGs2DryRun"] = "true"
    var response = await session.send("ranking2", "globalRankingScore", "verifyGlobalRankingScore", body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2Ranking2VerifyGlobalRankingScoreResult.from_dict(response.body), null)


func verify_global_ranking_score_by_user_id(request: Gs2Ranking2VerifyGlobalRankingScoreByUserIdRequest) -> Gs2AsyncResult:
    var body = {}
    if request.namespace_name != null:
        body["namespaceName"] = request.namespace_name
    if request.user_id != null:
        body["userId"] = request.user_id
    if request.ranking_name != null:
        body["rankingName"] = request.ranking_name
    if request.verify_type != null:
        body["verifyType"] = request.verify_type
    if request.season != null:
        body["season"] = request.season
    if request.score != null:
        body["score"] = request.score
    if request.multiply_value_specifying_quantity != null:
        body["multiplyValueSpecifyingQuantity"] = request.multiply_value_specifying_quantity
    if request.time_offset_token != null:
        body["timeOffsetToken"] = request.time_offset_token
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.duplication_avoider != null:
        body["xGs2DuplicationAvoider"] = request.duplication_avoider
    if request.dry_run:
        body["xGs2DryRun"] = "true"
    var response = await session.send("ranking2", "globalRankingScore", "verifyGlobalRankingScoreByUserId", body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2Ranking2VerifyGlobalRankingScoreByUserIdResult.from_dict(response.body), null)


func create_global_ranking_received_reward(request: Gs2Ranking2CreateGlobalRankingReceivedRewardRequest) -> Gs2AsyncResult:
    var body = {}
    if request.namespace_name != null:
        body["namespaceName"] = request.namespace_name
    if request.ranking_name != null:
        body["rankingName"] = request.ranking_name
    if request.access_token != null:
        body["accessToken"] = request.access_token
    if request.season != null:
        body["season"] = request.season
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.access_token != null:
        body["xGs2AccessToken"] = request.access_token
    if request.duplication_avoider != null:
        body["xGs2DuplicationAvoider"] = request.duplication_avoider
    if request.dry_run:
        body["xGs2DryRun"] = "true"
    var response = await session.send("ranking2", "globalRankingReceivedReward", "createGlobalRankingReceivedReward", body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2Ranking2CreateGlobalRankingReceivedRewardResult.from_dict(response.body), null)


func create_global_ranking_received_reward_by_user_id(request: Gs2Ranking2CreateGlobalRankingReceivedRewardByUserIdRequest) -> Gs2AsyncResult:
    var body = {}
    if request.namespace_name != null:
        body["namespaceName"] = request.namespace_name
    if request.ranking_name != null:
        body["rankingName"] = request.ranking_name
    if request.user_id != null:
        body["userId"] = request.user_id
    if request.season != null:
        body["season"] = request.season
    if request.time_offset_token != null:
        body["timeOffsetToken"] = request.time_offset_token
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.duplication_avoider != null:
        body["xGs2DuplicationAvoider"] = request.duplication_avoider
    if request.dry_run:
        body["xGs2DryRun"] = "true"
    var response = await session.send("ranking2", "globalRankingReceivedReward", "createGlobalRankingReceivedRewardByUserId", body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2Ranking2CreateGlobalRankingReceivedRewardByUserIdResult.from_dict(response.body), null)


func get_global_ranking_received_reward(request: Gs2Ranking2GetGlobalRankingReceivedRewardRequest) -> Gs2AsyncResult:
    var body = {}
    if request.namespace_name != null:
        body["namespaceName"] = request.namespace_name
    if request.ranking_name != null:
        body["rankingName"] = request.ranking_name
    if request.access_token != null:
        body["accessToken"] = request.access_token
    if request.season != null:
        body["season"] = request.season
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.access_token != null:
        body["xGs2AccessToken"] = request.access_token
    if request.dry_run:
        body["xGs2DryRun"] = "true"
    var response = await session.send("ranking2", "globalRankingReceivedReward", "getGlobalRankingReceivedReward", body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2Ranking2GetGlobalRankingReceivedRewardResult.from_dict(response.body), null)


func get_global_ranking_received_reward_by_user_id(request: Gs2Ranking2GetGlobalRankingReceivedRewardByUserIdRequest) -> Gs2AsyncResult:
    var body = {}
    if request.namespace_name != null:
        body["namespaceName"] = request.namespace_name
    if request.ranking_name != null:
        body["rankingName"] = request.ranking_name
    if request.user_id != null:
        body["userId"] = request.user_id
    if request.season != null:
        body["season"] = request.season
    if request.time_offset_token != null:
        body["timeOffsetToken"] = request.time_offset_token
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.dry_run:
        body["xGs2DryRun"] = "true"
    var response = await session.send("ranking2", "globalRankingReceivedReward", "getGlobalRankingReceivedRewardByUserId", body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2Ranking2GetGlobalRankingReceivedRewardByUserIdResult.from_dict(response.body), null)


func delete_global_ranking_received_reward_by_user_id(request: Gs2Ranking2DeleteGlobalRankingReceivedRewardByUserIdRequest) -> Gs2AsyncResult:
    var body = {}
    if request.namespace_name != null:
        body["namespaceName"] = request.namespace_name
    if request.ranking_name != null:
        body["rankingName"] = request.ranking_name
    if request.user_id != null:
        body["userId"] = request.user_id
    if request.season != null:
        body["season"] = request.season
    if request.time_offset_token != null:
        body["timeOffsetToken"] = request.time_offset_token
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.duplication_avoider != null:
        body["xGs2DuplicationAvoider"] = request.duplication_avoider
    if request.dry_run:
        body["xGs2DryRun"] = "true"
    var response = await session.send("ranking2", "globalRankingReceivedReward", "deleteGlobalRankingReceivedRewardByUserId", body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2Ranking2DeleteGlobalRankingReceivedRewardByUserIdResult.from_dict(response.body), null)


func get_global_ranking(request: Gs2Ranking2GetGlobalRankingRequest) -> Gs2AsyncResult:
    var body = {}
    if request.namespace_name != null:
        body["namespaceName"] = request.namespace_name
    if request.ranking_name != null:
        body["rankingName"] = request.ranking_name
    if request.access_token != null:
        body["accessToken"] = request.access_token
    if request.season != null:
        body["season"] = request.season
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.access_token != null:
        body["xGs2AccessToken"] = request.access_token
    if request.dry_run:
        body["xGs2DryRun"] = "true"
    var response = await session.send("ranking2", "globalRankingData", "getGlobalRanking", body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2Ranking2GetGlobalRankingResult.from_dict(response.body), null)


func get_global_ranking_by_user_id(request: Gs2Ranking2GetGlobalRankingByUserIdRequest) -> Gs2AsyncResult:
    var body = {}
    if request.namespace_name != null:
        body["namespaceName"] = request.namespace_name
    if request.ranking_name != null:
        body["rankingName"] = request.ranking_name
    if request.user_id != null:
        body["userId"] = request.user_id
    if request.season != null:
        body["season"] = request.season
    if request.time_offset_token != null:
        body["timeOffsetToken"] = request.time_offset_token
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.dry_run:
        body["xGs2DryRun"] = "true"
    var response = await session.send("ranking2", "globalRankingData", "getGlobalRankingByUserId", body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2Ranking2GetGlobalRankingByUserIdResult.from_dict(response.body), null)


func put_cluster_ranking_score(request: Gs2Ranking2PutClusterRankingScoreRequest) -> Gs2AsyncResult:
    var body = {}
    if request.namespace_name != null:
        body["namespaceName"] = request.namespace_name
    if request.ranking_name != null:
        body["rankingName"] = request.ranking_name
    if request.cluster_name != null:
        body["clusterName"] = request.cluster_name
    if request.access_token != null:
        body["accessToken"] = request.access_token
    if request.score != null:
        body["score"] = request.score
    if request.metadata != null:
        body["metadata"] = request.metadata
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.access_token != null:
        body["xGs2AccessToken"] = request.access_token
    if request.duplication_avoider != null:
        body["xGs2DuplicationAvoider"] = request.duplication_avoider
    if request.dry_run:
        body["xGs2DryRun"] = "true"
    var response = await session.send("ranking2", "clusterRankingScore", "putClusterRankingScore", body)
    if response.error != null:
        return Gs2AsyncResult.new(null, Gs2Ranking2ErrorResolver.resolve("PutClusterRankingScore", response.error))
    return Gs2AsyncResult.new(Gs2Ranking2PutClusterRankingScoreResult.from_dict(response.body), null)


func put_cluster_ranking_score_by_user_id(request: Gs2Ranking2PutClusterRankingScoreByUserIdRequest) -> Gs2AsyncResult:
    var body = {}
    if request.namespace_name != null:
        body["namespaceName"] = request.namespace_name
    if request.ranking_name != null:
        body["rankingName"] = request.ranking_name
    if request.cluster_name != null:
        body["clusterName"] = request.cluster_name
    if request.user_id != null:
        body["userId"] = request.user_id
    if request.score != null:
        body["score"] = request.score
    if request.metadata != null:
        body["metadata"] = request.metadata
    if request.time_offset_token != null:
        body["timeOffsetToken"] = request.time_offset_token
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.duplication_avoider != null:
        body["xGs2DuplicationAvoider"] = request.duplication_avoider
    if request.dry_run:
        body["xGs2DryRun"] = "true"
    var response = await session.send("ranking2", "clusterRankingScore", "putClusterRankingScoreByUserId", body)
    if response.error != null:
        return Gs2AsyncResult.new(null, Gs2Ranking2ErrorResolver.resolve("PutClusterRankingScoreByUserId", response.error))
    return Gs2AsyncResult.new(Gs2Ranking2PutClusterRankingScoreByUserIdResult.from_dict(response.body), null)


func get_cluster_ranking_score(request: Gs2Ranking2GetClusterRankingScoreRequest) -> Gs2AsyncResult:
    var body = {}
    if request.namespace_name != null:
        body["namespaceName"] = request.namespace_name
    if request.ranking_name != null:
        body["rankingName"] = request.ranking_name
    if request.cluster_name != null:
        body["clusterName"] = request.cluster_name
    if request.access_token != null:
        body["accessToken"] = request.access_token
    if request.season != null:
        body["season"] = request.season
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.access_token != null:
        body["xGs2AccessToken"] = request.access_token
    if request.dry_run:
        body["xGs2DryRun"] = "true"
    var response = await session.send("ranking2", "clusterRankingScore", "getClusterRankingScore", body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2Ranking2GetClusterRankingScoreResult.from_dict(response.body), null)


func get_cluster_ranking_score_by_user_id(request: Gs2Ranking2GetClusterRankingScoreByUserIdRequest) -> Gs2AsyncResult:
    var body = {}
    if request.namespace_name != null:
        body["namespaceName"] = request.namespace_name
    if request.ranking_name != null:
        body["rankingName"] = request.ranking_name
    if request.cluster_name != null:
        body["clusterName"] = request.cluster_name
    if request.user_id != null:
        body["userId"] = request.user_id
    if request.season != null:
        body["season"] = request.season
    if request.time_offset_token != null:
        body["timeOffsetToken"] = request.time_offset_token
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.dry_run:
        body["xGs2DryRun"] = "true"
    var response = await session.send("ranking2", "clusterRankingScore", "getClusterRankingScoreByUserId", body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2Ranking2GetClusterRankingScoreByUserIdResult.from_dict(response.body), null)


func delete_cluster_ranking_score_by_user_id(request: Gs2Ranking2DeleteClusterRankingScoreByUserIdRequest) -> Gs2AsyncResult:
    var body = {}
    if request.namespace_name != null:
        body["namespaceName"] = request.namespace_name
    if request.ranking_name != null:
        body["rankingName"] = request.ranking_name
    if request.cluster_name != null:
        body["clusterName"] = request.cluster_name
    if request.user_id != null:
        body["userId"] = request.user_id
    if request.season != null:
        body["season"] = request.season
    if request.time_offset_token != null:
        body["timeOffsetToken"] = request.time_offset_token
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.duplication_avoider != null:
        body["xGs2DuplicationAvoider"] = request.duplication_avoider
    if request.dry_run:
        body["xGs2DryRun"] = "true"
    var response = await session.send("ranking2", "clusterRankingScore", "deleteClusterRankingScoreByUserId", body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2Ranking2DeleteClusterRankingScoreByUserIdResult.from_dict(response.body), null)


func verify_cluster_ranking_score(request: Gs2Ranking2VerifyClusterRankingScoreRequest) -> Gs2AsyncResult:
    var body = {}
    if request.namespace_name != null:
        body["namespaceName"] = request.namespace_name
    if request.access_token != null:
        body["accessToken"] = request.access_token
    if request.ranking_name != null:
        body["rankingName"] = request.ranking_name
    if request.cluster_name != null:
        body["clusterName"] = request.cluster_name
    if request.verify_type != null:
        body["verifyType"] = request.verify_type
    if request.season != null:
        body["season"] = request.season
    if request.score != null:
        body["score"] = request.score
    if request.multiply_value_specifying_quantity != null:
        body["multiplyValueSpecifyingQuantity"] = request.multiply_value_specifying_quantity
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.access_token != null:
        body["xGs2AccessToken"] = request.access_token
    if request.duplication_avoider != null:
        body["xGs2DuplicationAvoider"] = request.duplication_avoider
    if request.dry_run:
        body["xGs2DryRun"] = "true"
    var response = await session.send("ranking2", "clusterRankingScore", "verifyClusterRankingScore", body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2Ranking2VerifyClusterRankingScoreResult.from_dict(response.body), null)


func verify_cluster_ranking_score_by_user_id(request: Gs2Ranking2VerifyClusterRankingScoreByUserIdRequest) -> Gs2AsyncResult:
    var body = {}
    if request.namespace_name != null:
        body["namespaceName"] = request.namespace_name
    if request.user_id != null:
        body["userId"] = request.user_id
    if request.ranking_name != null:
        body["rankingName"] = request.ranking_name
    if request.cluster_name != null:
        body["clusterName"] = request.cluster_name
    if request.verify_type != null:
        body["verifyType"] = request.verify_type
    if request.season != null:
        body["season"] = request.season
    if request.score != null:
        body["score"] = request.score
    if request.multiply_value_specifying_quantity != null:
        body["multiplyValueSpecifyingQuantity"] = request.multiply_value_specifying_quantity
    if request.time_offset_token != null:
        body["timeOffsetToken"] = request.time_offset_token
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.duplication_avoider != null:
        body["xGs2DuplicationAvoider"] = request.duplication_avoider
    if request.dry_run:
        body["xGs2DryRun"] = "true"
    var response = await session.send("ranking2", "clusterRankingScore", "verifyClusterRankingScoreByUserId", body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2Ranking2VerifyClusterRankingScoreByUserIdResult.from_dict(response.body), null)


func create_cluster_ranking_received_reward(request: Gs2Ranking2CreateClusterRankingReceivedRewardRequest) -> Gs2AsyncResult:
    var body = {}
    if request.namespace_name != null:
        body["namespaceName"] = request.namespace_name
    if request.ranking_name != null:
        body["rankingName"] = request.ranking_name
    if request.cluster_name != null:
        body["clusterName"] = request.cluster_name
    if request.access_token != null:
        body["accessToken"] = request.access_token
    if request.season != null:
        body["season"] = request.season
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.access_token != null:
        body["xGs2AccessToken"] = request.access_token
    if request.duplication_avoider != null:
        body["xGs2DuplicationAvoider"] = request.duplication_avoider
    if request.dry_run:
        body["xGs2DryRun"] = "true"
    var response = await session.send("ranking2", "clusterRankingReceivedReward", "createClusterRankingReceivedReward", body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2Ranking2CreateClusterRankingReceivedRewardResult.from_dict(response.body), null)


func create_cluster_ranking_received_reward_by_user_id(request: Gs2Ranking2CreateClusterRankingReceivedRewardByUserIdRequest) -> Gs2AsyncResult:
    var body = {}
    if request.namespace_name != null:
        body["namespaceName"] = request.namespace_name
    if request.ranking_name != null:
        body["rankingName"] = request.ranking_name
    if request.cluster_name != null:
        body["clusterName"] = request.cluster_name
    if request.user_id != null:
        body["userId"] = request.user_id
    if request.season != null:
        body["season"] = request.season
    if request.time_offset_token != null:
        body["timeOffsetToken"] = request.time_offset_token
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.duplication_avoider != null:
        body["xGs2DuplicationAvoider"] = request.duplication_avoider
    if request.dry_run:
        body["xGs2DryRun"] = "true"
    var response = await session.send("ranking2", "clusterRankingReceivedReward", "createClusterRankingReceivedRewardByUserId", body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2Ranking2CreateClusterRankingReceivedRewardByUserIdResult.from_dict(response.body), null)


func get_cluster_ranking_received_reward(request: Gs2Ranking2GetClusterRankingReceivedRewardRequest) -> Gs2AsyncResult:
    var body = {}
    if request.namespace_name != null:
        body["namespaceName"] = request.namespace_name
    if request.ranking_name != null:
        body["rankingName"] = request.ranking_name
    if request.cluster_name != null:
        body["clusterName"] = request.cluster_name
    if request.access_token != null:
        body["accessToken"] = request.access_token
    if request.season != null:
        body["season"] = request.season
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.access_token != null:
        body["xGs2AccessToken"] = request.access_token
    if request.dry_run:
        body["xGs2DryRun"] = "true"
    var response = await session.send("ranking2", "clusterRankingReceivedReward", "getClusterRankingReceivedReward", body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2Ranking2GetClusterRankingReceivedRewardResult.from_dict(response.body), null)


func get_cluster_ranking_received_reward_by_user_id(request: Gs2Ranking2GetClusterRankingReceivedRewardByUserIdRequest) -> Gs2AsyncResult:
    var body = {}
    if request.namespace_name != null:
        body["namespaceName"] = request.namespace_name
    if request.ranking_name != null:
        body["rankingName"] = request.ranking_name
    if request.cluster_name != null:
        body["clusterName"] = request.cluster_name
    if request.user_id != null:
        body["userId"] = request.user_id
    if request.season != null:
        body["season"] = request.season
    if request.time_offset_token != null:
        body["timeOffsetToken"] = request.time_offset_token
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.dry_run:
        body["xGs2DryRun"] = "true"
    var response = await session.send("ranking2", "clusterRankingReceivedReward", "getClusterRankingReceivedRewardByUserId", body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2Ranking2GetClusterRankingReceivedRewardByUserIdResult.from_dict(response.body), null)


func delete_cluster_ranking_received_reward_by_user_id(request: Gs2Ranking2DeleteClusterRankingReceivedRewardByUserIdRequest) -> Gs2AsyncResult:
    var body = {}
    if request.namespace_name != null:
        body["namespaceName"] = request.namespace_name
    if request.ranking_name != null:
        body["rankingName"] = request.ranking_name
    if request.cluster_name != null:
        body["clusterName"] = request.cluster_name
    if request.user_id != null:
        body["userId"] = request.user_id
    if request.season != null:
        body["season"] = request.season
    if request.time_offset_token != null:
        body["timeOffsetToken"] = request.time_offset_token
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.duplication_avoider != null:
        body["xGs2DuplicationAvoider"] = request.duplication_avoider
    if request.dry_run:
        body["xGs2DryRun"] = "true"
    var response = await session.send("ranking2", "clusterRankingReceivedReward", "deleteClusterRankingReceivedRewardByUserId", body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2Ranking2DeleteClusterRankingReceivedRewardByUserIdResult.from_dict(response.body), null)


func get_cluster_ranking(request: Gs2Ranking2GetClusterRankingRequest) -> Gs2AsyncResult:
    var body = {}
    if request.namespace_name != null:
        body["namespaceName"] = request.namespace_name
    if request.ranking_name != null:
        body["rankingName"] = request.ranking_name
    if request.cluster_name != null:
        body["clusterName"] = request.cluster_name
    if request.access_token != null:
        body["accessToken"] = request.access_token
    if request.season != null:
        body["season"] = request.season
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.access_token != null:
        body["xGs2AccessToken"] = request.access_token
    if request.dry_run:
        body["xGs2DryRun"] = "true"
    var response = await session.send("ranking2", "clusterRankingData", "getClusterRanking", body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2Ranking2GetClusterRankingResult.from_dict(response.body), null)


func get_cluster_ranking_by_user_id(request: Gs2Ranking2GetClusterRankingByUserIdRequest) -> Gs2AsyncResult:
    var body = {}
    if request.namespace_name != null:
        body["namespaceName"] = request.namespace_name
    if request.ranking_name != null:
        body["rankingName"] = request.ranking_name
    if request.cluster_name != null:
        body["clusterName"] = request.cluster_name
    if request.user_id != null:
        body["userId"] = request.user_id
    if request.season != null:
        body["season"] = request.season
    if request.time_offset_token != null:
        body["timeOffsetToken"] = request.time_offset_token
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.dry_run:
        body["xGs2DryRun"] = "true"
    var response = await session.send("ranking2", "clusterRankingData", "getClusterRankingByUserId", body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2Ranking2GetClusterRankingByUserIdResult.from_dict(response.body), null)


func get_subscribe_ranking_model(request: Gs2Ranking2GetSubscribeRankingModelRequest) -> Gs2AsyncResult:
    var body = {}
    if request.namespace_name != null:
        body["namespaceName"] = request.namespace_name
    if request.ranking_name != null:
        body["rankingName"] = request.ranking_name
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.dry_run:
        body["xGs2DryRun"] = "true"
    var response = await session.send("ranking2", "subscribeRankingModel", "getSubscribeRankingModel", body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2Ranking2GetSubscribeRankingModelResult.from_dict(response.body), null)


func create_subscribe_ranking_model_master(request: Gs2Ranking2CreateSubscribeRankingModelMasterRequest) -> Gs2AsyncResult:
    var body = {}
    if request.namespace_name != null:
        body["namespaceName"] = request.namespace_name
    if request.name != null:
        body["name"] = request.name
    if request.description != null:
        body["description"] = request.description
    if request.metadata != null:
        body["metadata"] = request.metadata
    if request.minimum_value != null:
        body["minimumValue"] = request.minimum_value
    if request.maximum_value != null:
        body["maximumValue"] = request.maximum_value
    if request.sum != null:
        body["sum"] = request.sum
    if request.order_direction != null:
        body["orderDirection"] = request.order_direction
    if request.entry_period_event_id != null:
        body["entryPeriodEventId"] = request.entry_period_event_id
    if request.access_period_event_id != null:
        body["accessPeriodEventId"] = request.access_period_event_id
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.dry_run:
        body["xGs2DryRun"] = "true"
    var response = await session.send("ranking2", "subscribeRankingModelMaster", "createSubscribeRankingModelMaster", body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2Ranking2CreateSubscribeRankingModelMasterResult.from_dict(response.body), null)


func get_subscribe_ranking_model_master(request: Gs2Ranking2GetSubscribeRankingModelMasterRequest) -> Gs2AsyncResult:
    var body = {}
    if request.namespace_name != null:
        body["namespaceName"] = request.namespace_name
    if request.ranking_name != null:
        body["rankingName"] = request.ranking_name
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.dry_run:
        body["xGs2DryRun"] = "true"
    var response = await session.send("ranking2", "subscribeRankingModelMaster", "getSubscribeRankingModelMaster", body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2Ranking2GetSubscribeRankingModelMasterResult.from_dict(response.body), null)


func update_subscribe_ranking_model_master(request: Gs2Ranking2UpdateSubscribeRankingModelMasterRequest) -> Gs2AsyncResult:
    var body = {}
    if request.namespace_name != null:
        body["namespaceName"] = request.namespace_name
    if request.ranking_name != null:
        body["rankingName"] = request.ranking_name
    if request.description != null:
        body["description"] = request.description
    if request.metadata != null:
        body["metadata"] = request.metadata
    if request.minimum_value != null:
        body["minimumValue"] = request.minimum_value
    if request.maximum_value != null:
        body["maximumValue"] = request.maximum_value
    if request.sum != null:
        body["sum"] = request.sum
    if request.order_direction != null:
        body["orderDirection"] = request.order_direction
    if request.entry_period_event_id != null:
        body["entryPeriodEventId"] = request.entry_period_event_id
    if request.access_period_event_id != null:
        body["accessPeriodEventId"] = request.access_period_event_id
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.dry_run:
        body["xGs2DryRun"] = "true"
    var response = await session.send("ranking2", "subscribeRankingModelMaster", "updateSubscribeRankingModelMaster", body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2Ranking2UpdateSubscribeRankingModelMasterResult.from_dict(response.body), null)


func delete_subscribe_ranking_model_master(request: Gs2Ranking2DeleteSubscribeRankingModelMasterRequest) -> Gs2AsyncResult:
    var body = {}
    if request.namespace_name != null:
        body["namespaceName"] = request.namespace_name
    if request.ranking_name != null:
        body["rankingName"] = request.ranking_name
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.dry_run:
        body["xGs2DryRun"] = "true"
    var response = await session.send("ranking2", "subscribeRankingModelMaster", "deleteSubscribeRankingModelMaster", body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2Ranking2DeleteSubscribeRankingModelMasterResult.from_dict(response.body), null)


func add_subscribe(request: Gs2Ranking2AddSubscribeRequest) -> Gs2AsyncResult:
    var body = {}
    if request.namespace_name != null:
        body["namespaceName"] = request.namespace_name
    if request.ranking_name != null:
        body["rankingName"] = request.ranking_name
    if request.access_token != null:
        body["accessToken"] = request.access_token
    if request.target_user_id != null:
        body["targetUserId"] = request.target_user_id
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.access_token != null:
        body["xGs2AccessToken"] = request.access_token
    if request.duplication_avoider != null:
        body["xGs2DuplicationAvoider"] = request.duplication_avoider
    if request.dry_run:
        body["xGs2DryRun"] = "true"
    var response = await session.send("ranking2", "subscribe", "addSubscribe", body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2Ranking2AddSubscribeResult.from_dict(response.body), null)


func add_subscribe_by_user_id(request: Gs2Ranking2AddSubscribeByUserIdRequest) -> Gs2AsyncResult:
    var body = {}
    if request.namespace_name != null:
        body["namespaceName"] = request.namespace_name
    if request.ranking_name != null:
        body["rankingName"] = request.ranking_name
    if request.user_id != null:
        body["userId"] = request.user_id
    if request.target_user_id != null:
        body["targetUserId"] = request.target_user_id
    if request.time_offset_token != null:
        body["timeOffsetToken"] = request.time_offset_token
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.duplication_avoider != null:
        body["xGs2DuplicationAvoider"] = request.duplication_avoider
    if request.dry_run:
        body["xGs2DryRun"] = "true"
    var response = await session.send("ranking2", "subscribe", "addSubscribeByUserId", body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2Ranking2AddSubscribeByUserIdResult.from_dict(response.body), null)


func put_subscribe_ranking_score(request: Gs2Ranking2PutSubscribeRankingScoreRequest) -> Gs2AsyncResult:
    var body = {}
    if request.namespace_name != null:
        body["namespaceName"] = request.namespace_name
    if request.ranking_name != null:
        body["rankingName"] = request.ranking_name
    if request.access_token != null:
        body["accessToken"] = request.access_token
    if request.score != null:
        body["score"] = request.score
    if request.metadata != null:
        body["metadata"] = request.metadata
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.access_token != null:
        body["xGs2AccessToken"] = request.access_token
    if request.duplication_avoider != null:
        body["xGs2DuplicationAvoider"] = request.duplication_avoider
    if request.dry_run:
        body["xGs2DryRun"] = "true"
    var response = await session.send("ranking2", "subscribeRankingScore", "putSubscribeRankingScore", body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2Ranking2PutSubscribeRankingScoreResult.from_dict(response.body), null)


func put_subscribe_ranking_score_by_user_id(request: Gs2Ranking2PutSubscribeRankingScoreByUserIdRequest) -> Gs2AsyncResult:
    var body = {}
    if request.namespace_name != null:
        body["namespaceName"] = request.namespace_name
    if request.ranking_name != null:
        body["rankingName"] = request.ranking_name
    if request.user_id != null:
        body["userId"] = request.user_id
    if request.score != null:
        body["score"] = request.score
    if request.metadata != null:
        body["metadata"] = request.metadata
    if request.time_offset_token != null:
        body["timeOffsetToken"] = request.time_offset_token
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.duplication_avoider != null:
        body["xGs2DuplicationAvoider"] = request.duplication_avoider
    if request.dry_run:
        body["xGs2DryRun"] = "true"
    var response = await session.send("ranking2", "subscribeRankingScore", "putSubscribeRankingScoreByUserId", body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2Ranking2PutSubscribeRankingScoreByUserIdResult.from_dict(response.body), null)


func get_subscribe_ranking_score(request: Gs2Ranking2GetSubscribeRankingScoreRequest) -> Gs2AsyncResult:
    var body = {}
    if request.namespace_name != null:
        body["namespaceName"] = request.namespace_name
    if request.ranking_name != null:
        body["rankingName"] = request.ranking_name
    if request.access_token != null:
        body["accessToken"] = request.access_token
    if request.season != null:
        body["season"] = request.season
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.access_token != null:
        body["xGs2AccessToken"] = request.access_token
    if request.dry_run:
        body["xGs2DryRun"] = "true"
    var response = await session.send("ranking2", "subscribeRankingScore", "getSubscribeRankingScore", body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2Ranking2GetSubscribeRankingScoreResult.from_dict(response.body), null)


func get_subscribe_ranking_score_by_user_id(request: Gs2Ranking2GetSubscribeRankingScoreByUserIdRequest) -> Gs2AsyncResult:
    var body = {}
    if request.namespace_name != null:
        body["namespaceName"] = request.namespace_name
    if request.ranking_name != null:
        body["rankingName"] = request.ranking_name
    if request.user_id != null:
        body["userId"] = request.user_id
    if request.season != null:
        body["season"] = request.season
    if request.time_offset_token != null:
        body["timeOffsetToken"] = request.time_offset_token
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.dry_run:
        body["xGs2DryRun"] = "true"
    var response = await session.send("ranking2", "subscribeRankingScore", "getSubscribeRankingScoreByUserId", body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2Ranking2GetSubscribeRankingScoreByUserIdResult.from_dict(response.body), null)


func delete_subscribe_ranking_score_by_user_id(request: Gs2Ranking2DeleteSubscribeRankingScoreByUserIdRequest) -> Gs2AsyncResult:
    var body = {}
    if request.namespace_name != null:
        body["namespaceName"] = request.namespace_name
    if request.ranking_name != null:
        body["rankingName"] = request.ranking_name
    if request.user_id != null:
        body["userId"] = request.user_id
    if request.season != null:
        body["season"] = request.season
    if request.time_offset_token != null:
        body["timeOffsetToken"] = request.time_offset_token
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.duplication_avoider != null:
        body["xGs2DuplicationAvoider"] = request.duplication_avoider
    if request.dry_run:
        body["xGs2DryRun"] = "true"
    var response = await session.send("ranking2", "subscribeRankingScore", "deleteSubscribeRankingScoreByUserId", body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2Ranking2DeleteSubscribeRankingScoreByUserIdResult.from_dict(response.body), null)


func verify_subscribe_ranking_score(request: Gs2Ranking2VerifySubscribeRankingScoreRequest) -> Gs2AsyncResult:
    var body = {}
    if request.namespace_name != null:
        body["namespaceName"] = request.namespace_name
    if request.access_token != null:
        body["accessToken"] = request.access_token
    if request.ranking_name != null:
        body["rankingName"] = request.ranking_name
    if request.verify_type != null:
        body["verifyType"] = request.verify_type
    if request.season != null:
        body["season"] = request.season
    if request.score != null:
        body["score"] = request.score
    if request.multiply_value_specifying_quantity != null:
        body["multiplyValueSpecifyingQuantity"] = request.multiply_value_specifying_quantity
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.access_token != null:
        body["xGs2AccessToken"] = request.access_token
    if request.duplication_avoider != null:
        body["xGs2DuplicationAvoider"] = request.duplication_avoider
    if request.dry_run:
        body["xGs2DryRun"] = "true"
    var response = await session.send("ranking2", "subscribeRankingScore", "verifySubscribeRankingScore", body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2Ranking2VerifySubscribeRankingScoreResult.from_dict(response.body), null)


func verify_subscribe_ranking_score_by_user_id(request: Gs2Ranking2VerifySubscribeRankingScoreByUserIdRequest) -> Gs2AsyncResult:
    var body = {}
    if request.namespace_name != null:
        body["namespaceName"] = request.namespace_name
    if request.user_id != null:
        body["userId"] = request.user_id
    if request.ranking_name != null:
        body["rankingName"] = request.ranking_name
    if request.verify_type != null:
        body["verifyType"] = request.verify_type
    if request.season != null:
        body["season"] = request.season
    if request.score != null:
        body["score"] = request.score
    if request.multiply_value_specifying_quantity != null:
        body["multiplyValueSpecifyingQuantity"] = request.multiply_value_specifying_quantity
    if request.time_offset_token != null:
        body["timeOffsetToken"] = request.time_offset_token
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.duplication_avoider != null:
        body["xGs2DuplicationAvoider"] = request.duplication_avoider
    if request.dry_run:
        body["xGs2DryRun"] = "true"
    var response = await session.send("ranking2", "subscribeRankingScore", "verifySubscribeRankingScoreByUserId", body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2Ranking2VerifySubscribeRankingScoreByUserIdResult.from_dict(response.body), null)


func get_subscribe_ranking(request: Gs2Ranking2GetSubscribeRankingRequest) -> Gs2AsyncResult:
    var body = {}
    if request.namespace_name != null:
        body["namespaceName"] = request.namespace_name
    if request.ranking_name != null:
        body["rankingName"] = request.ranking_name
    if request.access_token != null:
        body["accessToken"] = request.access_token
    if request.season != null:
        body["season"] = request.season
    if request.scorer_user_id != null:
        body["scorerUserId"] = request.scorer_user_id
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.access_token != null:
        body["xGs2AccessToken"] = request.access_token
    if request.dry_run:
        body["xGs2DryRun"] = "true"
    var response = await session.send("ranking2", "subscribeRankingData", "getSubscribeRanking", body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2Ranking2GetSubscribeRankingResult.from_dict(response.body), null)


func get_subscribe_ranking_by_user_id(request: Gs2Ranking2GetSubscribeRankingByUserIdRequest) -> Gs2AsyncResult:
    var body = {}
    if request.namespace_name != null:
        body["namespaceName"] = request.namespace_name
    if request.ranking_name != null:
        body["rankingName"] = request.ranking_name
    if request.user_id != null:
        body["userId"] = request.user_id
    if request.season != null:
        body["season"] = request.season
    if request.scorer_user_id != null:
        body["scorerUserId"] = request.scorer_user_id
    if request.time_offset_token != null:
        body["timeOffsetToken"] = request.time_offset_token
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.dry_run:
        body["xGs2DryRun"] = "true"
    var response = await session.send("ranking2", "subscribeRankingData", "getSubscribeRankingByUserId", body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2Ranking2GetSubscribeRankingByUserIdResult.from_dict(response.body), null)


func pre_update_current_ranking_master(request: Gs2Ranking2PreUpdateCurrentRankingMasterRequest) -> Gs2AsyncResult:
    var body = {}
    if request.namespace_name != null:
        body["namespaceName"] = request.namespace_name
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.dry_run:
        body["xGs2DryRun"] = "true"
    var response = await session.send("ranking2", "currentRankingMaster", "preUpdateCurrentRankingMaster", body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2Ranking2PreUpdateCurrentRankingMasterResult.from_dict(response.body), null)


func get_subscribe(request: Gs2Ranking2GetSubscribeRequest) -> Gs2AsyncResult:
    var body = {}
    if request.namespace_name != null:
        body["namespaceName"] = request.namespace_name
    if request.ranking_name != null:
        body["rankingName"] = request.ranking_name
    if request.access_token != null:
        body["accessToken"] = request.access_token
    if request.target_user_id != null:
        body["targetUserId"] = request.target_user_id
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.access_token != null:
        body["xGs2AccessToken"] = request.access_token
    if request.dry_run:
        body["xGs2DryRun"] = "true"
    var response = await session.send("ranking2", "subscribeUser", "getSubscribe", body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2Ranking2GetSubscribeResult.from_dict(response.body), null)


func get_subscribe_by_user_id(request: Gs2Ranking2GetSubscribeByUserIdRequest) -> Gs2AsyncResult:
    var body = {}
    if request.namespace_name != null:
        body["namespaceName"] = request.namespace_name
    if request.ranking_name != null:
        body["rankingName"] = request.ranking_name
    if request.user_id != null:
        body["userId"] = request.user_id
    if request.target_user_id != null:
        body["targetUserId"] = request.target_user_id
    if request.time_offset_token != null:
        body["timeOffsetToken"] = request.time_offset_token
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.dry_run:
        body["xGs2DryRun"] = "true"
    var response = await session.send("ranking2", "subscribeUser", "getSubscribeByUserId", body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2Ranking2GetSubscribeByUserIdResult.from_dict(response.body), null)


func delete_subscribe(request: Gs2Ranking2DeleteSubscribeRequest) -> Gs2AsyncResult:
    var body = {}
    if request.namespace_name != null:
        body["namespaceName"] = request.namespace_name
    if request.ranking_name != null:
        body["rankingName"] = request.ranking_name
    if request.access_token != null:
        body["accessToken"] = request.access_token
    if request.target_user_id != null:
        body["targetUserId"] = request.target_user_id
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.access_token != null:
        body["xGs2AccessToken"] = request.access_token
    if request.duplication_avoider != null:
        body["xGs2DuplicationAvoider"] = request.duplication_avoider
    if request.dry_run:
        body["xGs2DryRun"] = "true"
    var response = await session.send("ranking2", "subscribeUser", "deleteSubscribe", body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2Ranking2DeleteSubscribeResult.from_dict(response.body), null)


func delete_subscribe_by_user_id(request: Gs2Ranking2DeleteSubscribeByUserIdRequest) -> Gs2AsyncResult:
    var body = {}
    if request.namespace_name != null:
        body["namespaceName"] = request.namespace_name
    if request.ranking_name != null:
        body["rankingName"] = request.ranking_name
    if request.user_id != null:
        body["userId"] = request.user_id
    if request.target_user_id != null:
        body["targetUserId"] = request.target_user_id
    if request.time_offset_token != null:
        body["timeOffsetToken"] = request.time_offset_token
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.duplication_avoider != null:
        body["xGs2DuplicationAvoider"] = request.duplication_avoider
    if request.dry_run:
        body["xGs2DryRun"] = "true"
    var response = await session.send("ranking2", "subscribeUser", "deleteSubscribeByUserId", body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2Ranking2DeleteSubscribeByUserIdResult.from_dict(response.body), null)