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
class_name Gs2MatchmakingServiceCache
extends RefCounted


static func _parse(payload):
    if payload == null:
        return null
    if payload is Dictionary:
        return payload
    if payload is String and payload != "":
        return JSON.parse_string(payload)
    return null


static func put_cache(
    cache: Gs2CacheDatabase,
    user_id,
    method: String,
    request_payload,
    result_payload
) -> void:
    if method == "describeNamespaces":
        Gs2MatchmakingDescribeNamespacesMethodCache.put_cache(
            Gs2MatchmakingDescribeNamespacesResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2MatchmakingDescribeNamespacesRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "createNamespace":
        Gs2MatchmakingCreateNamespaceMethodCache.put_cache(
            Gs2MatchmakingCreateNamespaceResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2MatchmakingCreateNamespaceRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "getNamespaceStatus":
        Gs2MatchmakingGetNamespaceStatusMethodCache.put_cache(
            Gs2MatchmakingGetNamespaceStatusResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2MatchmakingGetNamespaceStatusRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "getNamespace":
        Gs2MatchmakingGetNamespaceMethodCache.put_cache(
            Gs2MatchmakingGetNamespaceResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2MatchmakingGetNamespaceRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "updateNamespace":
        Gs2MatchmakingUpdateNamespaceMethodCache.put_cache(
            Gs2MatchmakingUpdateNamespaceResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2MatchmakingUpdateNamespaceRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "deleteNamespace":
        Gs2MatchmakingDeleteNamespaceMethodCache.put_cache(
            Gs2MatchmakingDeleteNamespaceResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2MatchmakingDeleteNamespaceRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "getServiceVersion":
        Gs2MatchmakingGetServiceVersionMethodCache.put_cache(
            Gs2MatchmakingGetServiceVersionResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2MatchmakingGetServiceVersionRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "dumpUserDataByUserId":
        Gs2MatchmakingDumpUserDataByUserIdMethodCache.put_cache(
            Gs2MatchmakingDumpUserDataByUserIdResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2MatchmakingDumpUserDataByUserIdRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "checkDumpUserDataByUserId":
        Gs2MatchmakingCheckDumpUserDataByUserIdMethodCache.put_cache(
            Gs2MatchmakingCheckDumpUserDataByUserIdResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2MatchmakingCheckDumpUserDataByUserIdRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "cleanUserDataByUserId":
        Gs2MatchmakingCleanUserDataByUserIdMethodCache.put_cache(
            Gs2MatchmakingCleanUserDataByUserIdResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2MatchmakingCleanUserDataByUserIdRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "checkCleanUserDataByUserId":
        Gs2MatchmakingCheckCleanUserDataByUserIdMethodCache.put_cache(
            Gs2MatchmakingCheckCleanUserDataByUserIdResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2MatchmakingCheckCleanUserDataByUserIdRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "prepareImportUserDataByUserId":
        Gs2MatchmakingPrepareImportUserDataByUserIdMethodCache.put_cache(
            Gs2MatchmakingPrepareImportUserDataByUserIdResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2MatchmakingPrepareImportUserDataByUserIdRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "importUserDataByUserId":
        Gs2MatchmakingImportUserDataByUserIdMethodCache.put_cache(
            Gs2MatchmakingImportUserDataByUserIdResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2MatchmakingImportUserDataByUserIdRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "checkImportUserDataByUserId":
        Gs2MatchmakingCheckImportUserDataByUserIdMethodCache.put_cache(
            Gs2MatchmakingCheckImportUserDataByUserIdResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2MatchmakingCheckImportUserDataByUserIdRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "describeGatherings":
        Gs2MatchmakingDescribeGatheringsMethodCache.put_cache(
            Gs2MatchmakingDescribeGatheringsResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2MatchmakingDescribeGatheringsRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "createGathering":
        Gs2MatchmakingCreateGatheringMethodCache.put_cache(
            Gs2MatchmakingCreateGatheringResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2MatchmakingCreateGatheringRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "createGatheringByUserId":
        Gs2MatchmakingCreateGatheringByUserIdMethodCache.put_cache(
            Gs2MatchmakingCreateGatheringByUserIdResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2MatchmakingCreateGatheringByUserIdRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "updateGathering":
        Gs2MatchmakingUpdateGatheringMethodCache.put_cache(
            Gs2MatchmakingUpdateGatheringResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2MatchmakingUpdateGatheringRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "updateGatheringByUserId":
        Gs2MatchmakingUpdateGatheringByUserIdMethodCache.put_cache(
            Gs2MatchmakingUpdateGatheringByUserIdResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2MatchmakingUpdateGatheringByUserIdRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "doMatchmakingByPlayer":
        Gs2MatchmakingDoMatchmakingByPlayerMethodCache.put_cache(
            Gs2MatchmakingDoMatchmakingByPlayerResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2MatchmakingDoMatchmakingByPlayerRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "doMatchmaking":
        Gs2MatchmakingDoMatchmakingMethodCache.put_cache(
            Gs2MatchmakingDoMatchmakingResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2MatchmakingDoMatchmakingRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "doMatchmakingByUserId":
        Gs2MatchmakingDoMatchmakingByUserIdMethodCache.put_cache(
            Gs2MatchmakingDoMatchmakingByUserIdResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2MatchmakingDoMatchmakingByUserIdRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "ping":
        Gs2MatchmakingPingMethodCache.put_cache(
            Gs2MatchmakingPingResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2MatchmakingPingRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "pingByUserId":
        Gs2MatchmakingPingByUserIdMethodCache.put_cache(
            Gs2MatchmakingPingByUserIdResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2MatchmakingPingByUserIdRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "getGathering":
        Gs2MatchmakingGetGatheringMethodCache.put_cache(
            Gs2MatchmakingGetGatheringResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2MatchmakingGetGatheringRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "cancelMatchmaking":
        Gs2MatchmakingCancelMatchmakingMethodCache.put_cache(
            Gs2MatchmakingCancelMatchmakingResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2MatchmakingCancelMatchmakingRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "cancelMatchmakingByUserId":
        Gs2MatchmakingCancelMatchmakingByUserIdMethodCache.put_cache(
            Gs2MatchmakingCancelMatchmakingByUserIdResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2MatchmakingCancelMatchmakingByUserIdRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "earlyComplete":
        Gs2MatchmakingEarlyCompleteMethodCache.put_cache(
            Gs2MatchmakingEarlyCompleteResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2MatchmakingEarlyCompleteRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "earlyCompleteByUserId":
        Gs2MatchmakingEarlyCompleteByUserIdMethodCache.put_cache(
            Gs2MatchmakingEarlyCompleteByUserIdResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2MatchmakingEarlyCompleteByUserIdRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "deleteGathering":
        Gs2MatchmakingDeleteGatheringMethodCache.put_cache(
            Gs2MatchmakingDeleteGatheringResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2MatchmakingDeleteGatheringRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "describeRatingModelMasters":
        Gs2MatchmakingDescribeRatingModelMastersMethodCache.put_cache(
            Gs2MatchmakingDescribeRatingModelMastersResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2MatchmakingDescribeRatingModelMastersRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "createRatingModelMaster":
        Gs2MatchmakingCreateRatingModelMasterMethodCache.put_cache(
            Gs2MatchmakingCreateRatingModelMasterResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2MatchmakingCreateRatingModelMasterRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "getRatingModelMaster":
        Gs2MatchmakingGetRatingModelMasterMethodCache.put_cache(
            Gs2MatchmakingGetRatingModelMasterResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2MatchmakingGetRatingModelMasterRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "updateRatingModelMaster":
        Gs2MatchmakingUpdateRatingModelMasterMethodCache.put_cache(
            Gs2MatchmakingUpdateRatingModelMasterResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2MatchmakingUpdateRatingModelMasterRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "deleteRatingModelMaster":
        Gs2MatchmakingDeleteRatingModelMasterMethodCache.put_cache(
            Gs2MatchmakingDeleteRatingModelMasterResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2MatchmakingDeleteRatingModelMasterRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "describeRatingModels":
        Gs2MatchmakingDescribeRatingModelsMethodCache.put_cache(
            Gs2MatchmakingDescribeRatingModelsResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2MatchmakingDescribeRatingModelsRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "getRatingModel":
        Gs2MatchmakingGetRatingModelMethodCache.put_cache(
            Gs2MatchmakingGetRatingModelResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2MatchmakingGetRatingModelRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "exportMaster":
        Gs2MatchmakingExportMasterMethodCache.put_cache(
            Gs2MatchmakingExportMasterResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2MatchmakingExportMasterRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "getCurrentModelMaster":
        Gs2MatchmakingGetCurrentModelMasterMethodCache.put_cache(
            Gs2MatchmakingGetCurrentModelMasterResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2MatchmakingGetCurrentModelMasterRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "preUpdateCurrentModelMaster":
        Gs2MatchmakingPreUpdateCurrentModelMasterMethodCache.put_cache(
            Gs2MatchmakingPreUpdateCurrentModelMasterResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2MatchmakingPreUpdateCurrentModelMasterRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "updateCurrentModelMaster":
        Gs2MatchmakingUpdateCurrentModelMasterMethodCache.put_cache(
            Gs2MatchmakingUpdateCurrentModelMasterResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2MatchmakingUpdateCurrentModelMasterRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "updateCurrentModelMasterFromGitHub":
        Gs2MatchmakingUpdateCurrentModelMasterFromGitHubMethodCache.put_cache(
            Gs2MatchmakingUpdateCurrentModelMasterFromGitHubResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2MatchmakingUpdateCurrentModelMasterFromGitHubRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "describeSeasonModels":
        Gs2MatchmakingDescribeSeasonModelsMethodCache.put_cache(
            Gs2MatchmakingDescribeSeasonModelsResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2MatchmakingDescribeSeasonModelsRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "getSeasonModel":
        Gs2MatchmakingGetSeasonModelMethodCache.put_cache(
            Gs2MatchmakingGetSeasonModelResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2MatchmakingGetSeasonModelRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "describeSeasonModelMasters":
        Gs2MatchmakingDescribeSeasonModelMastersMethodCache.put_cache(
            Gs2MatchmakingDescribeSeasonModelMastersResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2MatchmakingDescribeSeasonModelMastersRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "createSeasonModelMaster":
        Gs2MatchmakingCreateSeasonModelMasterMethodCache.put_cache(
            Gs2MatchmakingCreateSeasonModelMasterResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2MatchmakingCreateSeasonModelMasterRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "getSeasonModelMaster":
        Gs2MatchmakingGetSeasonModelMasterMethodCache.put_cache(
            Gs2MatchmakingGetSeasonModelMasterResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2MatchmakingGetSeasonModelMasterRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "updateSeasonModelMaster":
        Gs2MatchmakingUpdateSeasonModelMasterMethodCache.put_cache(
            Gs2MatchmakingUpdateSeasonModelMasterResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2MatchmakingUpdateSeasonModelMasterRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "deleteSeasonModelMaster":
        Gs2MatchmakingDeleteSeasonModelMasterMethodCache.put_cache(
            Gs2MatchmakingDeleteSeasonModelMasterResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2MatchmakingDeleteSeasonModelMasterRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "describeSeasonGatherings":
        Gs2MatchmakingDescribeSeasonGatheringsMethodCache.put_cache(
            Gs2MatchmakingDescribeSeasonGatheringsResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2MatchmakingDescribeSeasonGatheringsRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "describeMatchmakingSeasonGatherings":
        Gs2MatchmakingDescribeMatchmakingSeasonGatheringsMethodCache.put_cache(
            Gs2MatchmakingDescribeMatchmakingSeasonGatheringsResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2MatchmakingDescribeMatchmakingSeasonGatheringsRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "doSeasonMatchmaking":
        Gs2MatchmakingDoSeasonMatchmakingMethodCache.put_cache(
            Gs2MatchmakingDoSeasonMatchmakingResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2MatchmakingDoSeasonMatchmakingRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "doSeasonMatchmakingByUserId":
        Gs2MatchmakingDoSeasonMatchmakingByUserIdMethodCache.put_cache(
            Gs2MatchmakingDoSeasonMatchmakingByUserIdResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2MatchmakingDoSeasonMatchmakingByUserIdRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "getSeasonGathering":
        Gs2MatchmakingGetSeasonGatheringMethodCache.put_cache(
            Gs2MatchmakingGetSeasonGatheringResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2MatchmakingGetSeasonGatheringRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "verifyIncludeParticipant":
        Gs2MatchmakingVerifyIncludeParticipantMethodCache.put_cache(
            Gs2MatchmakingVerifyIncludeParticipantResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2MatchmakingVerifyIncludeParticipantRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "verifyIncludeParticipantByUserId":
        Gs2MatchmakingVerifyIncludeParticipantByUserIdMethodCache.put_cache(
            Gs2MatchmakingVerifyIncludeParticipantByUserIdResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2MatchmakingVerifyIncludeParticipantByUserIdRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "deleteSeasonGathering":
        Gs2MatchmakingDeleteSeasonGatheringMethodCache.put_cache(
            Gs2MatchmakingDeleteSeasonGatheringResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2MatchmakingDeleteSeasonGatheringRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "describeJoinedSeasonGatherings":
        Gs2MatchmakingDescribeJoinedSeasonGatheringsMethodCache.put_cache(
            Gs2MatchmakingDescribeJoinedSeasonGatheringsResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2MatchmakingDescribeJoinedSeasonGatheringsRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "describeJoinedSeasonGatheringsByUserId":
        Gs2MatchmakingDescribeJoinedSeasonGatheringsByUserIdMethodCache.put_cache(
            Gs2MatchmakingDescribeJoinedSeasonGatheringsByUserIdResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2MatchmakingDescribeJoinedSeasonGatheringsByUserIdRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "getJoinedSeasonGathering":
        Gs2MatchmakingGetJoinedSeasonGatheringMethodCache.put_cache(
            Gs2MatchmakingGetJoinedSeasonGatheringResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2MatchmakingGetJoinedSeasonGatheringRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "getJoinedSeasonGatheringByUserId":
        Gs2MatchmakingGetJoinedSeasonGatheringByUserIdMethodCache.put_cache(
            Gs2MatchmakingGetJoinedSeasonGatheringByUserIdResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2MatchmakingGetJoinedSeasonGatheringByUserIdRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "describeRatings":
        Gs2MatchmakingDescribeRatingsMethodCache.put_cache(
            Gs2MatchmakingDescribeRatingsResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2MatchmakingDescribeRatingsRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "describeRatingsByUserId":
        Gs2MatchmakingDescribeRatingsByUserIdMethodCache.put_cache(
            Gs2MatchmakingDescribeRatingsByUserIdResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2MatchmakingDescribeRatingsByUserIdRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "getRating":
        Gs2MatchmakingGetRatingMethodCache.put_cache(
            Gs2MatchmakingGetRatingResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2MatchmakingGetRatingRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "getRatingByUserId":
        Gs2MatchmakingGetRatingByUserIdMethodCache.put_cache(
            Gs2MatchmakingGetRatingByUserIdResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2MatchmakingGetRatingByUserIdRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "putResult":
        Gs2MatchmakingPutResultMethodCache.put_cache(
            Gs2MatchmakingPutResultResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2MatchmakingPutResultRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "deleteRating":
        Gs2MatchmakingDeleteRatingMethodCache.put_cache(
            Gs2MatchmakingDeleteRatingResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2MatchmakingDeleteRatingRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "getBallot":
        Gs2MatchmakingGetBallotMethodCache.put_cache(
            Gs2MatchmakingGetBallotResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2MatchmakingGetBallotRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "getBallotByUserId":
        Gs2MatchmakingGetBallotByUserIdMethodCache.put_cache(
            Gs2MatchmakingGetBallotByUserIdResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2MatchmakingGetBallotByUserIdRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "vote":
        Gs2MatchmakingVoteMethodCache.put_cache(
            Gs2MatchmakingVoteResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2MatchmakingVoteRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "voteMultiple":
        Gs2MatchmakingVoteMultipleMethodCache.put_cache(
            Gs2MatchmakingVoteMultipleResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2MatchmakingVoteMultipleRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "commitVote":
        Gs2MatchmakingCommitVoteMethodCache.put_cache(
            Gs2MatchmakingCommitVoteResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2MatchmakingCommitVoteRequest.from_dict(_parse(request_payload))
        )
        return
    pass