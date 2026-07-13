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
class_name Gs2RankingWebSocketClient
extends Gs2AbstractWebSocketClient


func get_namespace_status(request: Gs2RankingGetNamespaceStatusRequest) -> Gs2AsyncResult:
    var body = {}
    if request.namespace_name != null:
        body["namespaceName"] = request.namespace_name
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.dry_run:
        body["xGs2DryRun"] = "true"
    var response = await session.send("ranking", "namespace", "getNamespaceStatus", body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2RankingGetNamespaceStatusResult.from_dict(response.body), null)


func get_service_version(request: Gs2RankingGetServiceVersionRequest) -> Gs2AsyncResult:
    var body = {}
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.dry_run:
        body["xGs2DryRun"] = "true"
    var response = await session.send("ranking", "namespace", "getServiceVersion", body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2RankingGetServiceVersionResult.from_dict(response.body), null)


func dump_user_data_by_user_id(request: Gs2RankingDumpUserDataByUserIdRequest) -> Gs2AsyncResult:
    var body = {}
    if request.user_id != null:
        body["userId"] = request.user_id
    if request.time_offset_token != null:
        body["timeOffsetToken"] = request.time_offset_token
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.dry_run:
        body["xGs2DryRun"] = "true"
    var response = await session.send("ranking", "namespace", "dumpUserDataByUserId", body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2RankingDumpUserDataByUserIdResult.from_dict(response.body), null)


func check_dump_user_data_by_user_id(request: Gs2RankingCheckDumpUserDataByUserIdRequest) -> Gs2AsyncResult:
    var body = {}
    if request.user_id != null:
        body["userId"] = request.user_id
    if request.time_offset_token != null:
        body["timeOffsetToken"] = request.time_offset_token
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.dry_run:
        body["xGs2DryRun"] = "true"
    var response = await session.send("ranking", "namespace", "checkDumpUserDataByUserId", body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2RankingCheckDumpUserDataByUserIdResult.from_dict(response.body), null)


func clean_user_data_by_user_id(request: Gs2RankingCleanUserDataByUserIdRequest) -> Gs2AsyncResult:
    var body = {}
    if request.user_id != null:
        body["userId"] = request.user_id
    if request.time_offset_token != null:
        body["timeOffsetToken"] = request.time_offset_token
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.dry_run:
        body["xGs2DryRun"] = "true"
    var response = await session.send("ranking", "namespace", "cleanUserDataByUserId", body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2RankingCleanUserDataByUserIdResult.from_dict(response.body), null)


func check_clean_user_data_by_user_id(request: Gs2RankingCheckCleanUserDataByUserIdRequest) -> Gs2AsyncResult:
    var body = {}
    if request.user_id != null:
        body["userId"] = request.user_id
    if request.time_offset_token != null:
        body["timeOffsetToken"] = request.time_offset_token
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.dry_run:
        body["xGs2DryRun"] = "true"
    var response = await session.send("ranking", "namespace", "checkCleanUserDataByUserId", body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2RankingCheckCleanUserDataByUserIdResult.from_dict(response.body), null)


func prepare_import_user_data_by_user_id(request: Gs2RankingPrepareImportUserDataByUserIdRequest) -> Gs2AsyncResult:
    var body = {}
    if request.user_id != null:
        body["userId"] = request.user_id
    if request.time_offset_token != null:
        body["timeOffsetToken"] = request.time_offset_token
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.dry_run:
        body["xGs2DryRun"] = "true"
    var response = await session.send("ranking", "namespace", "prepareImportUserDataByUserId", body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2RankingPrepareImportUserDataByUserIdResult.from_dict(response.body), null)


func import_user_data_by_user_id(request: Gs2RankingImportUserDataByUserIdRequest) -> Gs2AsyncResult:
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
    var response = await session.send("ranking", "namespace", "importUserDataByUserId", body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2RankingImportUserDataByUserIdResult.from_dict(response.body), null)


func check_import_user_data_by_user_id(request: Gs2RankingCheckImportUserDataByUserIdRequest) -> Gs2AsyncResult:
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
    var response = await session.send("ranking", "namespace", "checkImportUserDataByUserId", body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2RankingCheckImportUserDataByUserIdResult.from_dict(response.body), null)


func subscribe(request: Gs2RankingSubscribeRequest) -> Gs2AsyncResult:
    var body = {}
    if request.namespace_name != null:
        body["namespaceName"] = request.namespace_name
    if request.category_name != null:
        body["categoryName"] = request.category_name
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
    var response = await session.send("ranking", "subscribe", "subscribe", body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2RankingSubscribeResult.from_dict(response.body), null)


func subscribe_by_user_id(request: Gs2RankingSubscribeByUserIdRequest) -> Gs2AsyncResult:
    var body = {}
    if request.namespace_name != null:
        body["namespaceName"] = request.namespace_name
    if request.category_name != null:
        body["categoryName"] = request.category_name
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
    var response = await session.send("ranking", "subscribe", "subscribeByUserId", body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2RankingSubscribeByUserIdResult.from_dict(response.body), null)


func get_score(request: Gs2RankingGetScoreRequest) -> Gs2AsyncResult:
    var body = {}
    if request.namespace_name != null:
        body["namespaceName"] = request.namespace_name
    if request.category_name != null:
        body["categoryName"] = request.category_name
    if request.access_token != null:
        body["accessToken"] = request.access_token
    if request.scorer_user_id != null:
        body["scorerUserId"] = request.scorer_user_id
    if request.unique_id != null:
        body["uniqueId"] = request.unique_id
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.access_token != null:
        body["xGs2AccessToken"] = request.access_token
    if request.dry_run:
        body["xGs2DryRun"] = "true"
    var response = await session.send("ranking", "score", "getScore", body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2RankingGetScoreResult.from_dict(response.body), null)


func get_score_by_user_id(request: Gs2RankingGetScoreByUserIdRequest) -> Gs2AsyncResult:
    var body = {}
    if request.namespace_name != null:
        body["namespaceName"] = request.namespace_name
    if request.category_name != null:
        body["categoryName"] = request.category_name
    if request.user_id != null:
        body["userId"] = request.user_id
    if request.scorer_user_id != null:
        body["scorerUserId"] = request.scorer_user_id
    if request.unique_id != null:
        body["uniqueId"] = request.unique_id
    if request.time_offset_token != null:
        body["timeOffsetToken"] = request.time_offset_token
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.dry_run:
        body["xGs2DryRun"] = "true"
    var response = await session.send("ranking", "score", "getScoreByUserId", body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2RankingGetScoreByUserIdResult.from_dict(response.body), null)


func get_ranking(request: Gs2RankingGetRankingRequest) -> Gs2AsyncResult:
    var body = {}
    if request.namespace_name != null:
        body["namespaceName"] = request.namespace_name
    if request.category_name != null:
        body["categoryName"] = request.category_name
    if request.access_token != null:
        body["accessToken"] = request.access_token
    if request.scorer_user_id != null:
        body["scorerUserId"] = request.scorer_user_id
    if request.unique_id != null:
        body["uniqueId"] = request.unique_id
    if request.additional_scope_name != null:
        body["additionalScopeName"] = request.additional_scope_name
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.access_token != null:
        body["xGs2AccessToken"] = request.access_token
    if request.dry_run:
        body["xGs2DryRun"] = "true"
    var response = await session.send("ranking", "ranking", "getRanking", body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2RankingGetRankingResult.from_dict(response.body), null)


func get_ranking_by_user_id(request: Gs2RankingGetRankingByUserIdRequest) -> Gs2AsyncResult:
    var body = {}
    if request.namespace_name != null:
        body["namespaceName"] = request.namespace_name
    if request.category_name != null:
        body["categoryName"] = request.category_name
    if request.user_id != null:
        body["userId"] = request.user_id
    if request.scorer_user_id != null:
        body["scorerUserId"] = request.scorer_user_id
    if request.unique_id != null:
        body["uniqueId"] = request.unique_id
    if request.additional_scope_name != null:
        body["additionalScopeName"] = request.additional_scope_name
    if request.time_offset_token != null:
        body["timeOffsetToken"] = request.time_offset_token
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.dry_run:
        body["xGs2DryRun"] = "true"
    var response = await session.send("ranking", "ranking", "getRankingByUserId", body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2RankingGetRankingByUserIdResult.from_dict(response.body), null)


func put_score(request: Gs2RankingPutScoreRequest) -> Gs2AsyncResult:
    var body = {}
    if request.namespace_name != null:
        body["namespaceName"] = request.namespace_name
    if request.category_name != null:
        body["categoryName"] = request.category_name
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
    var response = await session.send("ranking", "ranking", "putScore", body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2RankingPutScoreResult.from_dict(response.body), null)


func put_score_by_user_id(request: Gs2RankingPutScoreByUserIdRequest) -> Gs2AsyncResult:
    var body = {}
    if request.namespace_name != null:
        body["namespaceName"] = request.namespace_name
    if request.category_name != null:
        body["categoryName"] = request.category_name
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
    var response = await session.send("ranking", "ranking", "putScoreByUserId", body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2RankingPutScoreByUserIdResult.from_dict(response.body), null)


func calc_ranking(request: Gs2RankingCalcRankingRequest) -> Gs2AsyncResult:
    var body = {}
    if request.namespace_name != null:
        body["namespaceName"] = request.namespace_name
    if request.category_name != null:
        body["categoryName"] = request.category_name
    if request.additional_scope_name != null:
        body["additionalScopeName"] = request.additional_scope_name
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.dry_run:
        body["xGs2DryRun"] = "true"
    var response = await session.send("ranking", "ranking", "calcRanking", body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2RankingCalcRankingResult.from_dict(response.body), null)


func pre_update_current_ranking_master(request: Gs2RankingPreUpdateCurrentRankingMasterRequest) -> Gs2AsyncResult:
    var body = {}
    if request.namespace_name != null:
        body["namespaceName"] = request.namespace_name
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.dry_run:
        body["xGs2DryRun"] = "true"
    var response = await session.send("ranking", "currentRankingMaster", "preUpdateCurrentRankingMaster", body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2RankingPreUpdateCurrentRankingMasterResult.from_dict(response.body), null)


func get_subscribe(request: Gs2RankingGetSubscribeRequest) -> Gs2AsyncResult:
    var body = {}
    if request.namespace_name != null:
        body["namespaceName"] = request.namespace_name
    if request.category_name != null:
        body["categoryName"] = request.category_name
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
    var response = await session.send("ranking", "subscribeUser", "getSubscribe", body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2RankingGetSubscribeResult.from_dict(response.body), null)


func get_subscribe_by_user_id(request: Gs2RankingGetSubscribeByUserIdRequest) -> Gs2AsyncResult:
    var body = {}
    if request.namespace_name != null:
        body["namespaceName"] = request.namespace_name
    if request.category_name != null:
        body["categoryName"] = request.category_name
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
    var response = await session.send("ranking", "subscribeUser", "getSubscribeByUserId", body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2RankingGetSubscribeByUserIdResult.from_dict(response.body), null)


func unsubscribe(request: Gs2RankingUnsubscribeRequest) -> Gs2AsyncResult:
    var body = {}
    if request.namespace_name != null:
        body["namespaceName"] = request.namespace_name
    if request.category_name != null:
        body["categoryName"] = request.category_name
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
    var response = await session.send("ranking", "subscribeUser", "unsubscribe", body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2RankingUnsubscribeResult.from_dict(response.body), null)


func unsubscribe_by_user_id(request: Gs2RankingUnsubscribeByUserIdRequest) -> Gs2AsyncResult:
    var body = {}
    if request.namespace_name != null:
        body["namespaceName"] = request.namespace_name
    if request.category_name != null:
        body["categoryName"] = request.category_name
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
    var response = await session.send("ranking", "subscribeUser", "unsubscribeByUserId", body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2RankingUnsubscribeByUserIdResult.from_dict(response.body), null)