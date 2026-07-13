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
class_name Gs2MatchmakingRestClient
extends Gs2AbstractRestClient


func describe_namespaces(request: Gs2MatchmakingDescribeNamespacesRequest) -> Gs2AsyncResult:
    var url = Gs2Constant.ENDPOINT_HOST.replace("{service}", "matchmaking").replace("{region}", session.region) + "/"
    var headers = create_authorized_headers()
    var query_strings = {}
    if request.context_stack != null:
        query_strings["contextStack"] = request.context_stack
    if request.name_prefix != null:
        query_strings["namePrefix"] = request.name_prefix
    if request.page_token != null:
        query_strings["pageToken"] = request.page_token
    if request.limit != null:
        query_strings["limit"] = request.limit
    if request.request_id != null:
        headers["X-GS2-REQUEST-ID"] = request.request_id
    if request.dry_run:
        headers["X-GS2-DRY-RUN"] = "true"
    var response = await session.send("GET", url, headers, query_strings, null)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2MatchmakingDescribeNamespacesResult.from_dict(response.body), null)


func create_namespace(request: Gs2MatchmakingCreateNamespaceRequest) -> Gs2AsyncResult:
    var url = Gs2Constant.ENDPOINT_HOST.replace("{service}", "matchmaking").replace("{region}", session.region) + "/"
    var headers = create_authorized_headers()
    var body = {}
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
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
    if request.request_id != null:
        headers["X-GS2-REQUEST-ID"] = request.request_id
    if request.dry_run:
        headers["X-GS2-DRY-RUN"] = "true"
    var response = await session.send("POST", url, headers, {}, body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2MatchmakingCreateNamespaceResult.from_dict(response.body), null)


func get_namespace_status(request: Gs2MatchmakingGetNamespaceStatusRequest) -> Gs2AsyncResult:
    var url = Gs2Constant.ENDPOINT_HOST.replace("{service}", "matchmaking").replace("{region}", session.region) + "/{namespaceName}/status"
    url = url.replace("{namespaceName}", "null" if (request.namespace_name == null or str(request.namespace_name) == "") else str(request.namespace_name))
    var headers = create_authorized_headers()
    var query_strings = {}
    if request.context_stack != null:
        query_strings["contextStack"] = request.context_stack
    if request.request_id != null:
        headers["X-GS2-REQUEST-ID"] = request.request_id
    if request.dry_run:
        headers["X-GS2-DRY-RUN"] = "true"
    var response = await session.send("GET", url, headers, query_strings, null)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2MatchmakingGetNamespaceStatusResult.from_dict(response.body), null)


func get_namespace(request: Gs2MatchmakingGetNamespaceRequest) -> Gs2AsyncResult:
    var url = Gs2Constant.ENDPOINT_HOST.replace("{service}", "matchmaking").replace("{region}", session.region) + "/{namespaceName}"
    url = url.replace("{namespaceName}", "null" if (request.namespace_name == null or str(request.namespace_name) == "") else str(request.namespace_name))
    var headers = create_authorized_headers()
    var query_strings = {}
    if request.context_stack != null:
        query_strings["contextStack"] = request.context_stack
    if request.request_id != null:
        headers["X-GS2-REQUEST-ID"] = request.request_id
    if request.dry_run:
        headers["X-GS2-DRY-RUN"] = "true"
    var response = await session.send("GET", url, headers, query_strings, null)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2MatchmakingGetNamespaceResult.from_dict(response.body), null)


func update_namespace(request: Gs2MatchmakingUpdateNamespaceRequest) -> Gs2AsyncResult:
    var url = Gs2Constant.ENDPOINT_HOST.replace("{service}", "matchmaking").replace("{region}", session.region) + "/{namespaceName}"
    url = url.replace("{namespaceName}", "null" if (request.namespace_name == null or str(request.namespace_name) == "") else str(request.namespace_name))
    var headers = create_authorized_headers()
    var body = {}
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
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
    if request.request_id != null:
        headers["X-GS2-REQUEST-ID"] = request.request_id
    if request.dry_run:
        headers["X-GS2-DRY-RUN"] = "true"
    var response = await session.send("PUT", url, headers, {}, body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2MatchmakingUpdateNamespaceResult.from_dict(response.body), null)


func delete_namespace(request: Gs2MatchmakingDeleteNamespaceRequest) -> Gs2AsyncResult:
    var url = Gs2Constant.ENDPOINT_HOST.replace("{service}", "matchmaking").replace("{region}", session.region) + "/{namespaceName}"
    url = url.replace("{namespaceName}", "null" if (request.namespace_name == null or str(request.namespace_name) == "") else str(request.namespace_name))
    var headers = create_authorized_headers()
    var query_strings = {}
    if request.context_stack != null:
        query_strings["contextStack"] = request.context_stack
    if request.request_id != null:
        headers["X-GS2-REQUEST-ID"] = request.request_id
    if request.dry_run:
        headers["X-GS2-DRY-RUN"] = "true"
    var response = await session.send("DELETE", url, headers, query_strings, null)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2MatchmakingDeleteNamespaceResult.from_dict(response.body), null)


func get_service_version(request: Gs2MatchmakingGetServiceVersionRequest) -> Gs2AsyncResult:
    var url = Gs2Constant.ENDPOINT_HOST.replace("{service}", "matchmaking").replace("{region}", session.region) + "/system/version"
    var headers = create_authorized_headers()
    var query_strings = {}
    if request.context_stack != null:
        query_strings["contextStack"] = request.context_stack
    if request.request_id != null:
        headers["X-GS2-REQUEST-ID"] = request.request_id
    if request.dry_run:
        headers["X-GS2-DRY-RUN"] = "true"
    var response = await session.send("GET", url, headers, query_strings, null)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2MatchmakingGetServiceVersionResult.from_dict(response.body), null)


func dump_user_data_by_user_id(request: Gs2MatchmakingDumpUserDataByUserIdRequest) -> Gs2AsyncResult:
    var url = Gs2Constant.ENDPOINT_HOST.replace("{service}", "matchmaking").replace("{region}", session.region) + "/system/dump/user/{userId}"
    url = url.replace("{userId}", "null" if (request.user_id == null or str(request.user_id) == "") else str(request.user_id))
    var headers = create_authorized_headers()
    var body = {}
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.request_id != null:
        headers["X-GS2-REQUEST-ID"] = request.request_id
    if request.time_offset_token != null:
        headers["X-GS2-TIME-OFFSET-TOKEN"] = request.time_offset_token
    if request.dry_run:
        headers["X-GS2-DRY-RUN"] = "true"
    var response = await session.send("POST", url, headers, {}, body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2MatchmakingDumpUserDataByUserIdResult.from_dict(response.body), null)


func check_dump_user_data_by_user_id(request: Gs2MatchmakingCheckDumpUserDataByUserIdRequest) -> Gs2AsyncResult:
    var url = Gs2Constant.ENDPOINT_HOST.replace("{service}", "matchmaking").replace("{region}", session.region) + "/system/dump/user/{userId}"
    url = url.replace("{userId}", "null" if (request.user_id == null or str(request.user_id) == "") else str(request.user_id))
    var headers = create_authorized_headers()
    var query_strings = {}
    if request.context_stack != null:
        query_strings["contextStack"] = request.context_stack
    if request.request_id != null:
        headers["X-GS2-REQUEST-ID"] = request.request_id
    if request.time_offset_token != null:
        headers["X-GS2-TIME-OFFSET-TOKEN"] = request.time_offset_token
    if request.dry_run:
        headers["X-GS2-DRY-RUN"] = "true"
    var response = await session.send("GET", url, headers, query_strings, null)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2MatchmakingCheckDumpUserDataByUserIdResult.from_dict(response.body), null)


func clean_user_data_by_user_id(request: Gs2MatchmakingCleanUserDataByUserIdRequest) -> Gs2AsyncResult:
    var url = Gs2Constant.ENDPOINT_HOST.replace("{service}", "matchmaking").replace("{region}", session.region) + "/system/clean/user/{userId}"
    url = url.replace("{userId}", "null" if (request.user_id == null or str(request.user_id) == "") else str(request.user_id))
    var headers = create_authorized_headers()
    var body = {}
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.request_id != null:
        headers["X-GS2-REQUEST-ID"] = request.request_id
    if request.time_offset_token != null:
        headers["X-GS2-TIME-OFFSET-TOKEN"] = request.time_offset_token
    if request.dry_run:
        headers["X-GS2-DRY-RUN"] = "true"
    var response = await session.send("POST", url, headers, {}, body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2MatchmakingCleanUserDataByUserIdResult.from_dict(response.body), null)


func check_clean_user_data_by_user_id(request: Gs2MatchmakingCheckCleanUserDataByUserIdRequest) -> Gs2AsyncResult:
    var url = Gs2Constant.ENDPOINT_HOST.replace("{service}", "matchmaking").replace("{region}", session.region) + "/system/clean/user/{userId}"
    url = url.replace("{userId}", "null" if (request.user_id == null or str(request.user_id) == "") else str(request.user_id))
    var headers = create_authorized_headers()
    var query_strings = {}
    if request.context_stack != null:
        query_strings["contextStack"] = request.context_stack
    if request.request_id != null:
        headers["X-GS2-REQUEST-ID"] = request.request_id
    if request.time_offset_token != null:
        headers["X-GS2-TIME-OFFSET-TOKEN"] = request.time_offset_token
    if request.dry_run:
        headers["X-GS2-DRY-RUN"] = "true"
    var response = await session.send("GET", url, headers, query_strings, null)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2MatchmakingCheckCleanUserDataByUserIdResult.from_dict(response.body), null)


func prepare_import_user_data_by_user_id(request: Gs2MatchmakingPrepareImportUserDataByUserIdRequest) -> Gs2AsyncResult:
    var url = Gs2Constant.ENDPOINT_HOST.replace("{service}", "matchmaking").replace("{region}", session.region) + "/system/import/user/{userId}/prepare"
    url = url.replace("{userId}", "null" if (request.user_id == null or str(request.user_id) == "") else str(request.user_id))
    var headers = create_authorized_headers()
    var body = {}
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.request_id != null:
        headers["X-GS2-REQUEST-ID"] = request.request_id
    if request.time_offset_token != null:
        headers["X-GS2-TIME-OFFSET-TOKEN"] = request.time_offset_token
    if request.dry_run:
        headers["X-GS2-DRY-RUN"] = "true"
    var response = await session.send("POST", url, headers, {}, body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2MatchmakingPrepareImportUserDataByUserIdResult.from_dict(response.body), null)


func import_user_data_by_user_id(request: Gs2MatchmakingImportUserDataByUserIdRequest) -> Gs2AsyncResult:
    var url = Gs2Constant.ENDPOINT_HOST.replace("{service}", "matchmaking").replace("{region}", session.region) + "/system/import/user/{userId}"
    url = url.replace("{userId}", "null" if (request.user_id == null or str(request.user_id) == "") else str(request.user_id))
    var headers = create_authorized_headers()
    var body = {}
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.upload_token != null:
        body["uploadToken"] = request.upload_token
    if request.request_id != null:
        headers["X-GS2-REQUEST-ID"] = request.request_id
    if request.time_offset_token != null:
        headers["X-GS2-TIME-OFFSET-TOKEN"] = request.time_offset_token
    if request.dry_run:
        headers["X-GS2-DRY-RUN"] = "true"
    var response = await session.send("POST", url, headers, {}, body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2MatchmakingImportUserDataByUserIdResult.from_dict(response.body), null)


func check_import_user_data_by_user_id(request: Gs2MatchmakingCheckImportUserDataByUserIdRequest) -> Gs2AsyncResult:
    var url = Gs2Constant.ENDPOINT_HOST.replace("{service}", "matchmaking").replace("{region}", session.region) + "/system/import/user/{userId}/{uploadToken}"
    url = url.replace("{userId}", "null" if (request.user_id == null or str(request.user_id) == "") else str(request.user_id))
    url = url.replace("{uploadToken}", "null" if (request.upload_token == null or str(request.upload_token) == "") else str(request.upload_token))
    var headers = create_authorized_headers()
    var query_strings = {}
    if request.context_stack != null:
        query_strings["contextStack"] = request.context_stack
    if request.request_id != null:
        headers["X-GS2-REQUEST-ID"] = request.request_id
    if request.time_offset_token != null:
        headers["X-GS2-TIME-OFFSET-TOKEN"] = request.time_offset_token
    if request.dry_run:
        headers["X-GS2-DRY-RUN"] = "true"
    var response = await session.send("GET", url, headers, query_strings, null)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2MatchmakingCheckImportUserDataByUserIdResult.from_dict(response.body), null)


func describe_gatherings(request: Gs2MatchmakingDescribeGatheringsRequest) -> Gs2AsyncResult:
    var url = Gs2Constant.ENDPOINT_HOST.replace("{service}", "matchmaking").replace("{region}", session.region) + "/{namespaceName}/gathering"
    url = url.replace("{namespaceName}", "null" if (request.namespace_name == null or str(request.namespace_name) == "") else str(request.namespace_name))
    var headers = create_authorized_headers()
    var query_strings = {}
    if request.context_stack != null:
        query_strings["contextStack"] = request.context_stack
    if request.page_token != null:
        query_strings["pageToken"] = request.page_token
    if request.limit != null:
        query_strings["limit"] = request.limit
    if request.request_id != null:
        headers["X-GS2-REQUEST-ID"] = request.request_id
    if request.dry_run:
        headers["X-GS2-DRY-RUN"] = "true"
    var response = await session.send("GET", url, headers, query_strings, null)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2MatchmakingDescribeGatheringsResult.from_dict(response.body), null)


func create_gathering(request: Gs2MatchmakingCreateGatheringRequest) -> Gs2AsyncResult:
    var url = Gs2Constant.ENDPOINT_HOST.replace("{service}", "matchmaking").replace("{region}", session.region) + "/{namespaceName}/gathering"
    url = url.replace("{namespaceName}", "null" if (request.namespace_name == null or str(request.namespace_name) == "") else str(request.namespace_name))
    var headers = create_authorized_headers()
    var body = {}
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.player != null:
        body["player"] = request.player.to_dict()
    if request.attribute_ranges != null:
        body["attributeRanges"] = request.attribute_ranges.map(func(v): return null if v == null else v.to_dict())
    if request.capacity_of_roles != null:
        body["capacityOfRoles"] = request.capacity_of_roles.map(func(v): return null if v == null else v.to_dict())
    if request.allow_user_ids != null:
        body["allowUserIds"] = request.allow_user_ids
    if request.expires_at != null:
        body["expiresAt"] = request.expires_at
    if request.expires_at_time_span != null:
        body["expiresAtTimeSpan"] = request.expires_at_time_span.to_dict()
    if request.request_id != null:
        headers["X-GS2-REQUEST-ID"] = request.request_id
    if request.access_token != null:
        headers["X-GS2-ACCESS-TOKEN"] = request.access_token
    if request.duplication_avoider != null:
        headers["X-GS2-DUPLICATION-AVOIDER"] = request.duplication_avoider
    if request.dry_run:
        headers["X-GS2-DRY-RUN"] = "true"
    var response = await session.send("POST", url, headers, {}, body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2MatchmakingCreateGatheringResult.from_dict(response.body), null)


func create_gathering_by_user_id(request: Gs2MatchmakingCreateGatheringByUserIdRequest) -> Gs2AsyncResult:
    var url = Gs2Constant.ENDPOINT_HOST.replace("{service}", "matchmaking").replace("{region}", session.region) + "/{namespaceName}/gathering/user/{userId}"
    url = url.replace("{namespaceName}", "null" if (request.namespace_name == null or str(request.namespace_name) == "") else str(request.namespace_name))
    url = url.replace("{userId}", "null" if (request.user_id == null or str(request.user_id) == "") else str(request.user_id))
    var headers = create_authorized_headers()
    var body = {}
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.player != null:
        body["player"] = request.player.to_dict()
    if request.attribute_ranges != null:
        body["attributeRanges"] = request.attribute_ranges.map(func(v): return null if v == null else v.to_dict())
    if request.capacity_of_roles != null:
        body["capacityOfRoles"] = request.capacity_of_roles.map(func(v): return null if v == null else v.to_dict())
    if request.allow_user_ids != null:
        body["allowUserIds"] = request.allow_user_ids
    if request.expires_at != null:
        body["expiresAt"] = request.expires_at
    if request.expires_at_time_span != null:
        body["expiresAtTimeSpan"] = request.expires_at_time_span.to_dict()
    if request.request_id != null:
        headers["X-GS2-REQUEST-ID"] = request.request_id
    if request.duplication_avoider != null:
        headers["X-GS2-DUPLICATION-AVOIDER"] = request.duplication_avoider
    if request.time_offset_token != null:
        headers["X-GS2-TIME-OFFSET-TOKEN"] = request.time_offset_token
    if request.dry_run:
        headers["X-GS2-DRY-RUN"] = "true"
    var response = await session.send("POST", url, headers, {}, body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2MatchmakingCreateGatheringByUserIdResult.from_dict(response.body), null)


func update_gathering(request: Gs2MatchmakingUpdateGatheringRequest) -> Gs2AsyncResult:
    var url = Gs2Constant.ENDPOINT_HOST.replace("{service}", "matchmaking").replace("{region}", session.region) + "/{namespaceName}/gathering/{gatheringName}"
    url = url.replace("{namespaceName}", "null" if (request.namespace_name == null or str(request.namespace_name) == "") else str(request.namespace_name))
    url = url.replace("{gatheringName}", "null" if (request.gathering_name == null or str(request.gathering_name) == "") else str(request.gathering_name))
    var headers = create_authorized_headers()
    var body = {}
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.attribute_ranges != null:
        body["attributeRanges"] = request.attribute_ranges.map(func(v): return null if v == null else v.to_dict())
    if request.request_id != null:
        headers["X-GS2-REQUEST-ID"] = request.request_id
    if request.access_token != null:
        headers["X-GS2-ACCESS-TOKEN"] = request.access_token
    if request.duplication_avoider != null:
        headers["X-GS2-DUPLICATION-AVOIDER"] = request.duplication_avoider
    if request.dry_run:
        headers["X-GS2-DRY-RUN"] = "true"
    var response = await session.send("POST", url, headers, {}, body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2MatchmakingUpdateGatheringResult.from_dict(response.body), null)


func update_gathering_by_user_id(request: Gs2MatchmakingUpdateGatheringByUserIdRequest) -> Gs2AsyncResult:
    var url = Gs2Constant.ENDPOINT_HOST.replace("{service}", "matchmaking").replace("{region}", session.region) + "/{namespaceName}/gathering/{gatheringName}/user/{userId}"
    url = url.replace("{namespaceName}", "null" if (request.namespace_name == null or str(request.namespace_name) == "") else str(request.namespace_name))
    url = url.replace("{gatheringName}", "null" if (request.gathering_name == null or str(request.gathering_name) == "") else str(request.gathering_name))
    url = url.replace("{userId}", "null" if (request.user_id == null or str(request.user_id) == "") else str(request.user_id))
    var headers = create_authorized_headers()
    var body = {}
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.attribute_ranges != null:
        body["attributeRanges"] = request.attribute_ranges.map(func(v): return null if v == null else v.to_dict())
    if request.request_id != null:
        headers["X-GS2-REQUEST-ID"] = request.request_id
    if request.duplication_avoider != null:
        headers["X-GS2-DUPLICATION-AVOIDER"] = request.duplication_avoider
    if request.time_offset_token != null:
        headers["X-GS2-TIME-OFFSET-TOKEN"] = request.time_offset_token
    if request.dry_run:
        headers["X-GS2-DRY-RUN"] = "true"
    var response = await session.send("POST", url, headers, {}, body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2MatchmakingUpdateGatheringByUserIdResult.from_dict(response.body), null)


func do_matchmaking_by_player(request: Gs2MatchmakingDoMatchmakingByPlayerRequest) -> Gs2AsyncResult:
    var url = Gs2Constant.ENDPOINT_HOST.replace("{service}", "matchmaking").replace("{region}", session.region) + "/{namespaceName}/gathering/player/do"
    url = url.replace("{namespaceName}", "null" if (request.namespace_name == null or str(request.namespace_name) == "") else str(request.namespace_name))
    var headers = create_authorized_headers()
    var body = {}
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.player != null:
        body["player"] = request.player.to_dict()
    if request.matchmaking_context_token != null:
        body["matchmakingContextToken"] = request.matchmaking_context_token
    if request.request_id != null:
        headers["X-GS2-REQUEST-ID"] = request.request_id
    if request.dry_run:
        headers["X-GS2-DRY-RUN"] = "true"
    var response = await session.send("POST", url, headers, {}, body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2MatchmakingDoMatchmakingByPlayerResult.from_dict(response.body), null)


func do_matchmaking(request: Gs2MatchmakingDoMatchmakingRequest) -> Gs2AsyncResult:
    var url = Gs2Constant.ENDPOINT_HOST.replace("{service}", "matchmaking").replace("{region}", session.region) + "/{namespaceName}/gathering/do"
    url = url.replace("{namespaceName}", "null" if (request.namespace_name == null or str(request.namespace_name) == "") else str(request.namespace_name))
    var headers = create_authorized_headers()
    var body = {}
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.player != null:
        body["player"] = request.player.to_dict()
    if request.matchmaking_context_token != null:
        body["matchmakingContextToken"] = request.matchmaking_context_token
    if request.request_id != null:
        headers["X-GS2-REQUEST-ID"] = request.request_id
    if request.access_token != null:
        headers["X-GS2-ACCESS-TOKEN"] = request.access_token
    if request.duplication_avoider != null:
        headers["X-GS2-DUPLICATION-AVOIDER"] = request.duplication_avoider
    if request.dry_run:
        headers["X-GS2-DRY-RUN"] = "true"
    var response = await session.send("POST", url, headers, {}, body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2MatchmakingDoMatchmakingResult.from_dict(response.body), null)


func do_matchmaking_by_user_id(request: Gs2MatchmakingDoMatchmakingByUserIdRequest) -> Gs2AsyncResult:
    var url = Gs2Constant.ENDPOINT_HOST.replace("{service}", "matchmaking").replace("{region}", session.region) + "/{namespaceName}/user/{userId}/gathering/do"
    url = url.replace("{namespaceName}", "null" if (request.namespace_name == null or str(request.namespace_name) == "") else str(request.namespace_name))
    url = url.replace("{userId}", "null" if (request.user_id == null or str(request.user_id) == "") else str(request.user_id))
    var headers = create_authorized_headers()
    var body = {}
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.player != null:
        body["player"] = request.player.to_dict()
    if request.matchmaking_context_token != null:
        body["matchmakingContextToken"] = request.matchmaking_context_token
    if request.request_id != null:
        headers["X-GS2-REQUEST-ID"] = request.request_id
    if request.duplication_avoider != null:
        headers["X-GS2-DUPLICATION-AVOIDER"] = request.duplication_avoider
    if request.time_offset_token != null:
        headers["X-GS2-TIME-OFFSET-TOKEN"] = request.time_offset_token
    if request.dry_run:
        headers["X-GS2-DRY-RUN"] = "true"
    var response = await session.send("POST", url, headers, {}, body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2MatchmakingDoMatchmakingByUserIdResult.from_dict(response.body), null)


func ping(request: Gs2MatchmakingPingRequest) -> Gs2AsyncResult:
    var url = Gs2Constant.ENDPOINT_HOST.replace("{service}", "matchmaking").replace("{region}", session.region) + "/{namespaceName}/gathering/{gatheringName}/ping"
    url = url.replace("{namespaceName}", "null" if (request.namespace_name == null or str(request.namespace_name) == "") else str(request.namespace_name))
    url = url.replace("{gatheringName}", "null" if (request.gathering_name == null or str(request.gathering_name) == "") else str(request.gathering_name))
    var headers = create_authorized_headers()
    var body = {}
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.request_id != null:
        headers["X-GS2-REQUEST-ID"] = request.request_id
    if request.access_token != null:
        headers["X-GS2-ACCESS-TOKEN"] = request.access_token
    if request.duplication_avoider != null:
        headers["X-GS2-DUPLICATION-AVOIDER"] = request.duplication_avoider
    if request.dry_run:
        headers["X-GS2-DRY-RUN"] = "true"
    var response = await session.send("POST", url, headers, {}, body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2MatchmakingPingResult.from_dict(response.body), null)


func ping_by_user_id(request: Gs2MatchmakingPingByUserIdRequest) -> Gs2AsyncResult:
    var url = Gs2Constant.ENDPOINT_HOST.replace("{service}", "matchmaking").replace("{region}", session.region) + "/{namespaceName}/gathering/{gatheringName}/user/{userId}/ping"
    url = url.replace("{namespaceName}", "null" if (request.namespace_name == null or str(request.namespace_name) == "") else str(request.namespace_name))
    url = url.replace("{gatheringName}", "null" if (request.gathering_name == null or str(request.gathering_name) == "") else str(request.gathering_name))
    url = url.replace("{userId}", "null" if (request.user_id == null or str(request.user_id) == "") else str(request.user_id))
    var headers = create_authorized_headers()
    var body = {}
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.request_id != null:
        headers["X-GS2-REQUEST-ID"] = request.request_id
    if request.duplication_avoider != null:
        headers["X-GS2-DUPLICATION-AVOIDER"] = request.duplication_avoider
    if request.time_offset_token != null:
        headers["X-GS2-TIME-OFFSET-TOKEN"] = request.time_offset_token
    if request.dry_run:
        headers["X-GS2-DRY-RUN"] = "true"
    var response = await session.send("POST", url, headers, {}, body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2MatchmakingPingByUserIdResult.from_dict(response.body), null)


func get_gathering(request: Gs2MatchmakingGetGatheringRequest) -> Gs2AsyncResult:
    var url = Gs2Constant.ENDPOINT_HOST.replace("{service}", "matchmaking").replace("{region}", session.region) + "/{namespaceName}/gathering/{gatheringName}"
    url = url.replace("{namespaceName}", "null" if (request.namespace_name == null or str(request.namespace_name) == "") else str(request.namespace_name))
    url = url.replace("{gatheringName}", "null" if (request.gathering_name == null or str(request.gathering_name) == "") else str(request.gathering_name))
    var headers = create_authorized_headers()
    var query_strings = {}
    if request.context_stack != null:
        query_strings["contextStack"] = request.context_stack
    if request.request_id != null:
        headers["X-GS2-REQUEST-ID"] = request.request_id
    if request.dry_run:
        headers["X-GS2-DRY-RUN"] = "true"
    var response = await session.send("GET", url, headers, query_strings, null)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2MatchmakingGetGatheringResult.from_dict(response.body), null)


func cancel_matchmaking(request: Gs2MatchmakingCancelMatchmakingRequest) -> Gs2AsyncResult:
    var url = Gs2Constant.ENDPOINT_HOST.replace("{service}", "matchmaking").replace("{region}", session.region) + "/{namespaceName}/gathering/{gatheringName}/user/me"
    url = url.replace("{namespaceName}", "null" if (request.namespace_name == null or str(request.namespace_name) == "") else str(request.namespace_name))
    url = url.replace("{gatheringName}", "null" if (request.gathering_name == null or str(request.gathering_name) == "") else str(request.gathering_name))
    var headers = create_authorized_headers()
    var query_strings = {}
    if request.context_stack != null:
        query_strings["contextStack"] = request.context_stack
    if request.request_id != null:
        headers["X-GS2-REQUEST-ID"] = request.request_id
    if request.access_token != null:
        headers["X-GS2-ACCESS-TOKEN"] = request.access_token
    if request.duplication_avoider != null:
        headers["X-GS2-DUPLICATION-AVOIDER"] = request.duplication_avoider
    if request.dry_run:
        headers["X-GS2-DRY-RUN"] = "true"
    var response = await session.send("DELETE", url, headers, query_strings, null)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2MatchmakingCancelMatchmakingResult.from_dict(response.body), null)


func cancel_matchmaking_by_user_id(request: Gs2MatchmakingCancelMatchmakingByUserIdRequest) -> Gs2AsyncResult:
    var url = Gs2Constant.ENDPOINT_HOST.replace("{service}", "matchmaking").replace("{region}", session.region) + "/{namespaceName}/gathering/{gatheringName}/user/{userId}"
    url = url.replace("{namespaceName}", "null" if (request.namespace_name == null or str(request.namespace_name) == "") else str(request.namespace_name))
    url = url.replace("{gatheringName}", "null" if (request.gathering_name == null or str(request.gathering_name) == "") else str(request.gathering_name))
    url = url.replace("{userId}", "null" if (request.user_id == null or str(request.user_id) == "") else str(request.user_id))
    var headers = create_authorized_headers()
    var query_strings = {}
    if request.context_stack != null:
        query_strings["contextStack"] = request.context_stack
    if request.request_id != null:
        headers["X-GS2-REQUEST-ID"] = request.request_id
    if request.duplication_avoider != null:
        headers["X-GS2-DUPLICATION-AVOIDER"] = request.duplication_avoider
    if request.time_offset_token != null:
        headers["X-GS2-TIME-OFFSET-TOKEN"] = request.time_offset_token
    if request.dry_run:
        headers["X-GS2-DRY-RUN"] = "true"
    var response = await session.send("DELETE", url, headers, query_strings, null)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2MatchmakingCancelMatchmakingByUserIdResult.from_dict(response.body), null)


func early_complete(request: Gs2MatchmakingEarlyCompleteRequest) -> Gs2AsyncResult:
    var url = Gs2Constant.ENDPOINT_HOST.replace("{service}", "matchmaking").replace("{region}", session.region) + "/{namespaceName}/gathering/{gatheringName}/user/me/early"
    url = url.replace("{namespaceName}", "null" if (request.namespace_name == null or str(request.namespace_name) == "") else str(request.namespace_name))
    url = url.replace("{gatheringName}", "null" if (request.gathering_name == null or str(request.gathering_name) == "") else str(request.gathering_name))
    var headers = create_authorized_headers()
    var query_strings = {}
    if request.context_stack != null:
        query_strings["contextStack"] = request.context_stack
    if request.request_id != null:
        headers["X-GS2-REQUEST-ID"] = request.request_id
    if request.access_token != null:
        headers["X-GS2-ACCESS-TOKEN"] = request.access_token
    if request.duplication_avoider != null:
        headers["X-GS2-DUPLICATION-AVOIDER"] = request.duplication_avoider
    if request.dry_run:
        headers["X-GS2-DRY-RUN"] = "true"
    var response = await session.send("DELETE", url, headers, query_strings, null)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2MatchmakingEarlyCompleteResult.from_dict(response.body), null)


func early_complete_by_user_id(request: Gs2MatchmakingEarlyCompleteByUserIdRequest) -> Gs2AsyncResult:
    var url = Gs2Constant.ENDPOINT_HOST.replace("{service}", "matchmaking").replace("{region}", session.region) + "/{namespaceName}/gathering/{gatheringName}/user/{userId}/early"
    url = url.replace("{namespaceName}", "null" if (request.namespace_name == null or str(request.namespace_name) == "") else str(request.namespace_name))
    url = url.replace("{gatheringName}", "null" if (request.gathering_name == null or str(request.gathering_name) == "") else str(request.gathering_name))
    url = url.replace("{userId}", "null" if (request.user_id == null or str(request.user_id) == "") else str(request.user_id))
    var headers = create_authorized_headers()
    var query_strings = {}
    if request.context_stack != null:
        query_strings["contextStack"] = request.context_stack
    if request.request_id != null:
        headers["X-GS2-REQUEST-ID"] = request.request_id
    if request.duplication_avoider != null:
        headers["X-GS2-DUPLICATION-AVOIDER"] = request.duplication_avoider
    if request.time_offset_token != null:
        headers["X-GS2-TIME-OFFSET-TOKEN"] = request.time_offset_token
    if request.dry_run:
        headers["X-GS2-DRY-RUN"] = "true"
    var response = await session.send("DELETE", url, headers, query_strings, null)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2MatchmakingEarlyCompleteByUserIdResult.from_dict(response.body), null)


func delete_gathering(request: Gs2MatchmakingDeleteGatheringRequest) -> Gs2AsyncResult:
    var url = Gs2Constant.ENDPOINT_HOST.replace("{service}", "matchmaking").replace("{region}", session.region) + "/{namespaceName}/gathering/{gatheringName}"
    url = url.replace("{namespaceName}", "null" if (request.namespace_name == null or str(request.namespace_name) == "") else str(request.namespace_name))
    url = url.replace("{gatheringName}", "null" if (request.gathering_name == null or str(request.gathering_name) == "") else str(request.gathering_name))
    var headers = create_authorized_headers()
    var query_strings = {}
    if request.context_stack != null:
        query_strings["contextStack"] = request.context_stack
    if request.request_id != null:
        headers["X-GS2-REQUEST-ID"] = request.request_id
    if request.dry_run:
        headers["X-GS2-DRY-RUN"] = "true"
    var response = await session.send("DELETE", url, headers, query_strings, null)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2MatchmakingDeleteGatheringResult.from_dict(response.body), null)


func describe_rating_model_masters(request: Gs2MatchmakingDescribeRatingModelMastersRequest) -> Gs2AsyncResult:
    var url = Gs2Constant.ENDPOINT_HOST.replace("{service}", "matchmaking").replace("{region}", session.region) + "/{namespaceName}/master/rating"
    url = url.replace("{namespaceName}", "null" if (request.namespace_name == null or str(request.namespace_name) == "") else str(request.namespace_name))
    var headers = create_authorized_headers()
    var query_strings = {}
    if request.context_stack != null:
        query_strings["contextStack"] = request.context_stack
    if request.name_prefix != null:
        query_strings["namePrefix"] = request.name_prefix
    if request.page_token != null:
        query_strings["pageToken"] = request.page_token
    if request.limit != null:
        query_strings["limit"] = request.limit
    if request.request_id != null:
        headers["X-GS2-REQUEST-ID"] = request.request_id
    if request.dry_run:
        headers["X-GS2-DRY-RUN"] = "true"
    var response = await session.send("GET", url, headers, query_strings, null)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2MatchmakingDescribeRatingModelMastersResult.from_dict(response.body), null)


func create_rating_model_master(request: Gs2MatchmakingCreateRatingModelMasterRequest) -> Gs2AsyncResult:
    var url = Gs2Constant.ENDPOINT_HOST.replace("{service}", "matchmaking").replace("{region}", session.region) + "/{namespaceName}/master/rating"
    url = url.replace("{namespaceName}", "null" if (request.namespace_name == null or str(request.namespace_name) == "") else str(request.namespace_name))
    var headers = create_authorized_headers()
    var body = {}
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
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
    if request.request_id != null:
        headers["X-GS2-REQUEST-ID"] = request.request_id
    if request.dry_run:
        headers["X-GS2-DRY-RUN"] = "true"
    var response = await session.send("POST", url, headers, {}, body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2MatchmakingCreateRatingModelMasterResult.from_dict(response.body), null)


func get_rating_model_master(request: Gs2MatchmakingGetRatingModelMasterRequest) -> Gs2AsyncResult:
    var url = Gs2Constant.ENDPOINT_HOST.replace("{service}", "matchmaking").replace("{region}", session.region) + "/{namespaceName}/master/rating/{ratingName}"
    url = url.replace("{namespaceName}", "null" if (request.namespace_name == null or str(request.namespace_name) == "") else str(request.namespace_name))
    url = url.replace("{ratingName}", "null" if (request.rating_name == null or str(request.rating_name) == "") else str(request.rating_name))
    var headers = create_authorized_headers()
    var query_strings = {}
    if request.context_stack != null:
        query_strings["contextStack"] = request.context_stack
    if request.request_id != null:
        headers["X-GS2-REQUEST-ID"] = request.request_id
    if request.dry_run:
        headers["X-GS2-DRY-RUN"] = "true"
    var response = await session.send("GET", url, headers, query_strings, null)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2MatchmakingGetRatingModelMasterResult.from_dict(response.body), null)


func update_rating_model_master(request: Gs2MatchmakingUpdateRatingModelMasterRequest) -> Gs2AsyncResult:
    var url = Gs2Constant.ENDPOINT_HOST.replace("{service}", "matchmaking").replace("{region}", session.region) + "/{namespaceName}/master/rating/{ratingName}"
    url = url.replace("{namespaceName}", "null" if (request.namespace_name == null or str(request.namespace_name) == "") else str(request.namespace_name))
    url = url.replace("{ratingName}", "null" if (request.rating_name == null or str(request.rating_name) == "") else str(request.rating_name))
    var headers = create_authorized_headers()
    var body = {}
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.description != null:
        body["description"] = request.description
    if request.metadata != null:
        body["metadata"] = request.metadata
    if request.initial_value != null:
        body["initialValue"] = request.initial_value
    if request.volatility != null:
        body["volatility"] = request.volatility
    if request.request_id != null:
        headers["X-GS2-REQUEST-ID"] = request.request_id
    if request.dry_run:
        headers["X-GS2-DRY-RUN"] = "true"
    var response = await session.send("PUT", url, headers, {}, body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2MatchmakingUpdateRatingModelMasterResult.from_dict(response.body), null)


func delete_rating_model_master(request: Gs2MatchmakingDeleteRatingModelMasterRequest) -> Gs2AsyncResult:
    var url = Gs2Constant.ENDPOINT_HOST.replace("{service}", "matchmaking").replace("{region}", session.region) + "/{namespaceName}/master/rating/{ratingName}"
    url = url.replace("{namespaceName}", "null" if (request.namespace_name == null or str(request.namespace_name) == "") else str(request.namespace_name))
    url = url.replace("{ratingName}", "null" if (request.rating_name == null or str(request.rating_name) == "") else str(request.rating_name))
    var headers = create_authorized_headers()
    var query_strings = {}
    if request.context_stack != null:
        query_strings["contextStack"] = request.context_stack
    if request.request_id != null:
        headers["X-GS2-REQUEST-ID"] = request.request_id
    if request.dry_run:
        headers["X-GS2-DRY-RUN"] = "true"
    var response = await session.send("DELETE", url, headers, query_strings, null)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2MatchmakingDeleteRatingModelMasterResult.from_dict(response.body), null)


func describe_rating_models(request: Gs2MatchmakingDescribeRatingModelsRequest) -> Gs2AsyncResult:
    var url = Gs2Constant.ENDPOINT_HOST.replace("{service}", "matchmaking").replace("{region}", session.region) + "/{namespaceName}/rating"
    url = url.replace("{namespaceName}", "null" if (request.namespace_name == null or str(request.namespace_name) == "") else str(request.namespace_name))
    var headers = create_authorized_headers()
    var query_strings = {}
    if request.context_stack != null:
        query_strings["contextStack"] = request.context_stack
    if request.request_id != null:
        headers["X-GS2-REQUEST-ID"] = request.request_id
    if request.dry_run:
        headers["X-GS2-DRY-RUN"] = "true"
    var response = await session.send("GET", url, headers, query_strings, null)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2MatchmakingDescribeRatingModelsResult.from_dict(response.body), null)


func get_rating_model(request: Gs2MatchmakingGetRatingModelRequest) -> Gs2AsyncResult:
    var url = Gs2Constant.ENDPOINT_HOST.replace("{service}", "matchmaking").replace("{region}", session.region) + "/{namespaceName}/rating/{ratingName}"
    url = url.replace("{namespaceName}", "null" if (request.namespace_name == null or str(request.namespace_name) == "") else str(request.namespace_name))
    url = url.replace("{ratingName}", "null" if (request.rating_name == null or str(request.rating_name) == "") else str(request.rating_name))
    var headers = create_authorized_headers()
    var query_strings = {}
    if request.context_stack != null:
        query_strings["contextStack"] = request.context_stack
    if request.request_id != null:
        headers["X-GS2-REQUEST-ID"] = request.request_id
    if request.dry_run:
        headers["X-GS2-DRY-RUN"] = "true"
    var response = await session.send("GET", url, headers, query_strings, null)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2MatchmakingGetRatingModelResult.from_dict(response.body), null)


func export_master(request: Gs2MatchmakingExportMasterRequest) -> Gs2AsyncResult:
    var url = Gs2Constant.ENDPOINT_HOST.replace("{service}", "matchmaking").replace("{region}", session.region) + "/{namespaceName}/master/export"
    url = url.replace("{namespaceName}", "null" if (request.namespace_name == null or str(request.namespace_name) == "") else str(request.namespace_name))
    var headers = create_authorized_headers()
    var query_strings = {}
    if request.context_stack != null:
        query_strings["contextStack"] = request.context_stack
    if request.request_id != null:
        headers["X-GS2-REQUEST-ID"] = request.request_id
    if request.dry_run:
        headers["X-GS2-DRY-RUN"] = "true"
    var response = await session.send("GET", url, headers, query_strings, null)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2MatchmakingExportMasterResult.from_dict(response.body), null)


func get_current_model_master(request: Gs2MatchmakingGetCurrentModelMasterRequest) -> Gs2AsyncResult:
    var url = Gs2Constant.ENDPOINT_HOST.replace("{service}", "matchmaking").replace("{region}", session.region) + "/{namespaceName}/master"
    url = url.replace("{namespaceName}", "null" if (request.namespace_name == null or str(request.namespace_name) == "") else str(request.namespace_name))
    var headers = create_authorized_headers()
    var query_strings = {}
    if request.context_stack != null:
        query_strings["contextStack"] = request.context_stack
    if request.request_id != null:
        headers["X-GS2-REQUEST-ID"] = request.request_id
    if request.dry_run:
        headers["X-GS2-DRY-RUN"] = "true"
    var response = await session.send("GET", url, headers, query_strings, null)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2MatchmakingGetCurrentModelMasterResult.from_dict(response.body), null)


func pre_update_current_model_master(request: Gs2MatchmakingPreUpdateCurrentModelMasterRequest) -> Gs2AsyncResult:
    var url = Gs2Constant.ENDPOINT_HOST.replace("{service}", "matchmaking").replace("{region}", session.region) + "/{namespaceName}/master"
    url = url.replace("{namespaceName}", "null" if (request.namespace_name == null or str(request.namespace_name) == "") else str(request.namespace_name))
    var headers = create_authorized_headers()
    var body = {}
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.request_id != null:
        headers["X-GS2-REQUEST-ID"] = request.request_id
    if request.dry_run:
        headers["X-GS2-DRY-RUN"] = "true"
    var response = await session.send("POST", url, headers, {}, body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2MatchmakingPreUpdateCurrentModelMasterResult.from_dict(response.body), null)


func update_current_model_master(request: Gs2MatchmakingUpdateCurrentModelMasterRequest) -> Gs2AsyncResult:
    if request.settings != null:
        var pre_request = Gs2MatchmakingPreUpdateCurrentModelMasterRequest.new()
        pre_request.context_stack = request.context_stack
        pre_request.namespace_name = request.namespace_name
        var pre_async_result = await pre_update_current_model_master(pre_request)
        if pre_async_result.error != null:
            return pre_async_result
        var upload_response = await session.upload(pre_async_result.result.upload_url, request.settings)
        if upload_response.error != null:
            return Gs2AsyncResult.new(null, upload_response.error)
        request.mode = "preUpload"
        request.upload_token = pre_async_result.result.upload_token
        request.settings = null
    var url = Gs2Constant.ENDPOINT_HOST.replace("{service}", "matchmaking").replace("{region}", session.region) + "/{namespaceName}/master"
    url = url.replace("{namespaceName}", "null" if (request.namespace_name == null or str(request.namespace_name) == "") else str(request.namespace_name))
    var headers = create_authorized_headers()
    var body = {}
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.mode != null:
        body["mode"] = request.mode
    if request.settings != null:
        body["settings"] = request.settings
    if request.upload_token != null:
        body["uploadToken"] = request.upload_token
    if request.request_id != null:
        headers["X-GS2-REQUEST-ID"] = request.request_id
    if request.dry_run:
        headers["X-GS2-DRY-RUN"] = "true"
    var response = await session.send("PUT", url, headers, {}, body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2MatchmakingUpdateCurrentModelMasterResult.from_dict(response.body), null)


func update_current_model_master_from_git_hub(request: Gs2MatchmakingUpdateCurrentModelMasterFromGitHubRequest) -> Gs2AsyncResult:
    var url = Gs2Constant.ENDPOINT_HOST.replace("{service}", "matchmaking").replace("{region}", session.region) + "/{namespaceName}/master/from_git_hub"
    url = url.replace("{namespaceName}", "null" if (request.namespace_name == null or str(request.namespace_name) == "") else str(request.namespace_name))
    var headers = create_authorized_headers()
    var body = {}
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.checkout_setting != null:
        body["checkoutSetting"] = request.checkout_setting.to_dict()
    if request.request_id != null:
        headers["X-GS2-REQUEST-ID"] = request.request_id
    if request.dry_run:
        headers["X-GS2-DRY-RUN"] = "true"
    var response = await session.send("PUT", url, headers, {}, body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2MatchmakingUpdateCurrentModelMasterFromGitHubResult.from_dict(response.body), null)


func describe_season_models(request: Gs2MatchmakingDescribeSeasonModelsRequest) -> Gs2AsyncResult:
    var url = Gs2Constant.ENDPOINT_HOST.replace("{service}", "matchmaking").replace("{region}", session.region) + "/{namespaceName}/season"
    url = url.replace("{namespaceName}", "null" if (request.namespace_name == null or str(request.namespace_name) == "") else str(request.namespace_name))
    var headers = create_authorized_headers()
    var query_strings = {}
    if request.context_stack != null:
        query_strings["contextStack"] = request.context_stack
    if request.request_id != null:
        headers["X-GS2-REQUEST-ID"] = request.request_id
    if request.dry_run:
        headers["X-GS2-DRY-RUN"] = "true"
    var response = await session.send("GET", url, headers, query_strings, null)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2MatchmakingDescribeSeasonModelsResult.from_dict(response.body), null)


func get_season_model(request: Gs2MatchmakingGetSeasonModelRequest) -> Gs2AsyncResult:
    var url = Gs2Constant.ENDPOINT_HOST.replace("{service}", "matchmaking").replace("{region}", session.region) + "/{namespaceName}/season/{seasonName}"
    url = url.replace("{namespaceName}", "null" if (request.namespace_name == null or str(request.namespace_name) == "") else str(request.namespace_name))
    url = url.replace("{seasonName}", "null" if (request.season_name == null or str(request.season_name) == "") else str(request.season_name))
    var headers = create_authorized_headers()
    var query_strings = {}
    if request.context_stack != null:
        query_strings["contextStack"] = request.context_stack
    if request.request_id != null:
        headers["X-GS2-REQUEST-ID"] = request.request_id
    if request.dry_run:
        headers["X-GS2-DRY-RUN"] = "true"
    var response = await session.send("GET", url, headers, query_strings, null)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2MatchmakingGetSeasonModelResult.from_dict(response.body), null)


func describe_season_model_masters(request: Gs2MatchmakingDescribeSeasonModelMastersRequest) -> Gs2AsyncResult:
    var url = Gs2Constant.ENDPOINT_HOST.replace("{service}", "matchmaking").replace("{region}", session.region) + "/{namespaceName}/master/season"
    url = url.replace("{namespaceName}", "null" if (request.namespace_name == null or str(request.namespace_name) == "") else str(request.namespace_name))
    var headers = create_authorized_headers()
    var query_strings = {}
    if request.context_stack != null:
        query_strings["contextStack"] = request.context_stack
    if request.name_prefix != null:
        query_strings["namePrefix"] = request.name_prefix
    if request.page_token != null:
        query_strings["pageToken"] = request.page_token
    if request.limit != null:
        query_strings["limit"] = request.limit
    if request.request_id != null:
        headers["X-GS2-REQUEST-ID"] = request.request_id
    if request.dry_run:
        headers["X-GS2-DRY-RUN"] = "true"
    var response = await session.send("GET", url, headers, query_strings, null)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2MatchmakingDescribeSeasonModelMastersResult.from_dict(response.body), null)


func create_season_model_master(request: Gs2MatchmakingCreateSeasonModelMasterRequest) -> Gs2AsyncResult:
    var url = Gs2Constant.ENDPOINT_HOST.replace("{service}", "matchmaking").replace("{region}", session.region) + "/{namespaceName}/master/season"
    url = url.replace("{namespaceName}", "null" if (request.namespace_name == null or str(request.namespace_name) == "") else str(request.namespace_name))
    var headers = create_authorized_headers()
    var body = {}
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
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
    if request.request_id != null:
        headers["X-GS2-REQUEST-ID"] = request.request_id
    if request.dry_run:
        headers["X-GS2-DRY-RUN"] = "true"
    var response = await session.send("POST", url, headers, {}, body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2MatchmakingCreateSeasonModelMasterResult.from_dict(response.body), null)


func get_season_model_master(request: Gs2MatchmakingGetSeasonModelMasterRequest) -> Gs2AsyncResult:
    var url = Gs2Constant.ENDPOINT_HOST.replace("{service}", "matchmaking").replace("{region}", session.region) + "/{namespaceName}/master/season/{seasonName}"
    url = url.replace("{namespaceName}", "null" if (request.namespace_name == null or str(request.namespace_name) == "") else str(request.namespace_name))
    url = url.replace("{seasonName}", "null" if (request.season_name == null or str(request.season_name) == "") else str(request.season_name))
    var headers = create_authorized_headers()
    var query_strings = {}
    if request.context_stack != null:
        query_strings["contextStack"] = request.context_stack
    if request.request_id != null:
        headers["X-GS2-REQUEST-ID"] = request.request_id
    if request.dry_run:
        headers["X-GS2-DRY-RUN"] = "true"
    var response = await session.send("GET", url, headers, query_strings, null)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2MatchmakingGetSeasonModelMasterResult.from_dict(response.body), null)


func update_season_model_master(request: Gs2MatchmakingUpdateSeasonModelMasterRequest) -> Gs2AsyncResult:
    var url = Gs2Constant.ENDPOINT_HOST.replace("{service}", "matchmaking").replace("{region}", session.region) + "/{namespaceName}/master/season/{seasonName}"
    url = url.replace("{namespaceName}", "null" if (request.namespace_name == null or str(request.namespace_name) == "") else str(request.namespace_name))
    url = url.replace("{seasonName}", "null" if (request.season_name == null or str(request.season_name) == "") else str(request.season_name))
    var headers = create_authorized_headers()
    var body = {}
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
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
    if request.request_id != null:
        headers["X-GS2-REQUEST-ID"] = request.request_id
    if request.dry_run:
        headers["X-GS2-DRY-RUN"] = "true"
    var response = await session.send("PUT", url, headers, {}, body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2MatchmakingUpdateSeasonModelMasterResult.from_dict(response.body), null)


func delete_season_model_master(request: Gs2MatchmakingDeleteSeasonModelMasterRequest) -> Gs2AsyncResult:
    var url = Gs2Constant.ENDPOINT_HOST.replace("{service}", "matchmaking").replace("{region}", session.region) + "/{namespaceName}/master/season/{seasonName}"
    url = url.replace("{namespaceName}", "null" if (request.namespace_name == null or str(request.namespace_name) == "") else str(request.namespace_name))
    url = url.replace("{seasonName}", "null" if (request.season_name == null or str(request.season_name) == "") else str(request.season_name))
    var headers = create_authorized_headers()
    var query_strings = {}
    if request.context_stack != null:
        query_strings["contextStack"] = request.context_stack
    if request.request_id != null:
        headers["X-GS2-REQUEST-ID"] = request.request_id
    if request.dry_run:
        headers["X-GS2-DRY-RUN"] = "true"
    var response = await session.send("DELETE", url, headers, query_strings, null)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2MatchmakingDeleteSeasonModelMasterResult.from_dict(response.body), null)


func describe_season_gatherings(request: Gs2MatchmakingDescribeSeasonGatheringsRequest) -> Gs2AsyncResult:
    var url = Gs2Constant.ENDPOINT_HOST.replace("{service}", "matchmaking").replace("{region}", session.region) + "/{namespaceName}/season/{seasonName}/{season}/gathering"
    url = url.replace("{namespaceName}", "null" if (request.namespace_name == null or str(request.namespace_name) == "") else str(request.namespace_name))
    url = url.replace("{seasonName}", "null" if (request.season_name == null or str(request.season_name) == "") else str(request.season_name))
    url = url.replace("{season}", "null" if (request.season == null or str(request.season) == "") else str(request.season))
    var headers = create_authorized_headers()
    var query_strings = {}
    if request.context_stack != null:
        query_strings["contextStack"] = request.context_stack
    if request.tier != null:
        query_strings["tier"] = request.tier
    if request.page_token != null:
        query_strings["pageToken"] = request.page_token
    if request.limit != null:
        query_strings["limit"] = request.limit
    if request.request_id != null:
        headers["X-GS2-REQUEST-ID"] = request.request_id
    if request.dry_run:
        headers["X-GS2-DRY-RUN"] = "true"
    var response = await session.send("GET", url, headers, query_strings, null)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2MatchmakingDescribeSeasonGatheringsResult.from_dict(response.body), null)


func describe_matchmaking_season_gatherings(request: Gs2MatchmakingDescribeMatchmakingSeasonGatheringsRequest) -> Gs2AsyncResult:
    var url = Gs2Constant.ENDPOINT_HOST.replace("{service}", "matchmaking").replace("{region}", session.region) + "/{namespaceName}/season/{seasonName}/{season}/gathering/matchmaking"
    url = url.replace("{namespaceName}", "null" if (request.namespace_name == null or str(request.namespace_name) == "") else str(request.namespace_name))
    url = url.replace("{seasonName}", "null" if (request.season_name == null or str(request.season_name) == "") else str(request.season_name))
    url = url.replace("{season}", "null" if (request.season == null or str(request.season) == "") else str(request.season))
    var headers = create_authorized_headers()
    var query_strings = {}
    if request.context_stack != null:
        query_strings["contextStack"] = request.context_stack
    if request.tier != null:
        query_strings["tier"] = request.tier
    if request.page_token != null:
        query_strings["pageToken"] = request.page_token
    if request.limit != null:
        query_strings["limit"] = request.limit
    if request.request_id != null:
        headers["X-GS2-REQUEST-ID"] = request.request_id
    if request.dry_run:
        headers["X-GS2-DRY-RUN"] = "true"
    var response = await session.send("GET", url, headers, query_strings, null)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2MatchmakingDescribeMatchmakingSeasonGatheringsResult.from_dict(response.body), null)


func do_season_matchmaking(request: Gs2MatchmakingDoSeasonMatchmakingRequest) -> Gs2AsyncResult:
    var url = Gs2Constant.ENDPOINT_HOST.replace("{service}", "matchmaking").replace("{region}", session.region) + "/{namespaceName}/user/me/season/{seasonName}/gathering/do"
    url = url.replace("{namespaceName}", "null" if (request.namespace_name == null or str(request.namespace_name) == "") else str(request.namespace_name))
    url = url.replace("{seasonName}", "null" if (request.season_name == null or str(request.season_name) == "") else str(request.season_name))
    var headers = create_authorized_headers()
    var body = {}
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.matchmaking_context_token != null:
        body["matchmakingContextToken"] = request.matchmaking_context_token
    if request.request_id != null:
        headers["X-GS2-REQUEST-ID"] = request.request_id
    if request.access_token != null:
        headers["X-GS2-ACCESS-TOKEN"] = request.access_token
    if request.duplication_avoider != null:
        headers["X-GS2-DUPLICATION-AVOIDER"] = request.duplication_avoider
    if request.dry_run:
        headers["X-GS2-DRY-RUN"] = "true"
    var response = await session.send("POST", url, headers, {}, body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2MatchmakingDoSeasonMatchmakingResult.from_dict(response.body), null)


func do_season_matchmaking_by_user_id(request: Gs2MatchmakingDoSeasonMatchmakingByUserIdRequest) -> Gs2AsyncResult:
    var url = Gs2Constant.ENDPOINT_HOST.replace("{service}", "matchmaking").replace("{region}", session.region) + "/{namespaceName}/user/{userId}/season/{seasonName}/gathering/do"
    url = url.replace("{namespaceName}", "null" if (request.namespace_name == null or str(request.namespace_name) == "") else str(request.namespace_name))
    url = url.replace("{seasonName}", "null" if (request.season_name == null or str(request.season_name) == "") else str(request.season_name))
    url = url.replace("{userId}", "null" if (request.user_id == null or str(request.user_id) == "") else str(request.user_id))
    var headers = create_authorized_headers()
    var body = {}
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.matchmaking_context_token != null:
        body["matchmakingContextToken"] = request.matchmaking_context_token
    if request.request_id != null:
        headers["X-GS2-REQUEST-ID"] = request.request_id
    if request.duplication_avoider != null:
        headers["X-GS2-DUPLICATION-AVOIDER"] = request.duplication_avoider
    if request.time_offset_token != null:
        headers["X-GS2-TIME-OFFSET-TOKEN"] = request.time_offset_token
    if request.dry_run:
        headers["X-GS2-DRY-RUN"] = "true"
    var response = await session.send("POST", url, headers, {}, body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2MatchmakingDoSeasonMatchmakingByUserIdResult.from_dict(response.body), null)


func get_season_gathering(request: Gs2MatchmakingGetSeasonGatheringRequest) -> Gs2AsyncResult:
    var url = Gs2Constant.ENDPOINT_HOST.replace("{service}", "matchmaking").replace("{region}", session.region) + "/{namespaceName}/season/{seasonName}/{season}/{tier}/gathering/{seasonGatheringName}"
    url = url.replace("{namespaceName}", "null" if (request.namespace_name == null or str(request.namespace_name) == "") else str(request.namespace_name))
    url = url.replace("{seasonName}", "null" if (request.season_name == null or str(request.season_name) == "") else str(request.season_name))
    url = url.replace("{season}", "null" if (request.season == null or str(request.season) == "") else str(request.season))
    url = url.replace("{tier}", "null" if (request.tier == null or str(request.tier) == "") else str(request.tier))
    url = url.replace("{seasonGatheringName}", "null" if (request.season_gathering_name == null or str(request.season_gathering_name) == "") else str(request.season_gathering_name))
    var headers = create_authorized_headers()
    var query_strings = {}
    if request.context_stack != null:
        query_strings["contextStack"] = request.context_stack
    if request.request_id != null:
        headers["X-GS2-REQUEST-ID"] = request.request_id
    if request.dry_run:
        headers["X-GS2-DRY-RUN"] = "true"
    var response = await session.send("GET", url, headers, query_strings, null)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2MatchmakingGetSeasonGatheringResult.from_dict(response.body), null)


func verify_include_participant(request: Gs2MatchmakingVerifyIncludeParticipantRequest) -> Gs2AsyncResult:
    var url = Gs2Constant.ENDPOINT_HOST.replace("{service}", "matchmaking").replace("{region}", session.region) + "/{namespaceName}/season/{seasonName}/{season}/{tier}/gathering/{seasonGatheringName}/participant/me/verify"
    url = url.replace("{namespaceName}", "null" if (request.namespace_name == null or str(request.namespace_name) == "") else str(request.namespace_name))
    url = url.replace("{seasonName}", "null" if (request.season_name == null or str(request.season_name) == "") else str(request.season_name))
    url = url.replace("{season}", "null" if (request.season == null or str(request.season) == "") else str(request.season))
    url = url.replace("{tier}", "null" if (request.tier == null or str(request.tier) == "") else str(request.tier))
    url = url.replace("{seasonGatheringName}", "null" if (request.season_gathering_name == null or str(request.season_gathering_name) == "") else str(request.season_gathering_name))
    var headers = create_authorized_headers()
    var body = {}
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.verify_type != null:
        body["verifyType"] = request.verify_type
    if request.request_id != null:
        headers["X-GS2-REQUEST-ID"] = request.request_id
    if request.access_token != null:
        headers["X-GS2-ACCESS-TOKEN"] = request.access_token
    if request.duplication_avoider != null:
        headers["X-GS2-DUPLICATION-AVOIDER"] = request.duplication_avoider
    if request.dry_run:
        headers["X-GS2-DRY-RUN"] = "true"
    var response = await session.send("POST", url, headers, {}, body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2MatchmakingVerifyIncludeParticipantResult.from_dict(response.body), null)


func verify_include_participant_by_user_id(request: Gs2MatchmakingVerifyIncludeParticipantByUserIdRequest) -> Gs2AsyncResult:
    var url = Gs2Constant.ENDPOINT_HOST.replace("{service}", "matchmaking").replace("{region}", session.region) + "/{namespaceName}/season/{seasonName}/{season}/{tier}/gathering/{seasonGatheringName}/participant/{userId}/verify"
    url = url.replace("{namespaceName}", "null" if (request.namespace_name == null or str(request.namespace_name) == "") else str(request.namespace_name))
    url = url.replace("{seasonName}", "null" if (request.season_name == null or str(request.season_name) == "") else str(request.season_name))
    url = url.replace("{season}", "null" if (request.season == null or str(request.season) == "") else str(request.season))
    url = url.replace("{tier}", "null" if (request.tier == null or str(request.tier) == "") else str(request.tier))
    url = url.replace("{seasonGatheringName}", "null" if (request.season_gathering_name == null or str(request.season_gathering_name) == "") else str(request.season_gathering_name))
    url = url.replace("{userId}", "null" if (request.user_id == null or str(request.user_id) == "") else str(request.user_id))
    var headers = create_authorized_headers()
    var body = {}
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.verify_type != null:
        body["verifyType"] = request.verify_type
    if request.request_id != null:
        headers["X-GS2-REQUEST-ID"] = request.request_id
    if request.duplication_avoider != null:
        headers["X-GS2-DUPLICATION-AVOIDER"] = request.duplication_avoider
    if request.time_offset_token != null:
        headers["X-GS2-TIME-OFFSET-TOKEN"] = request.time_offset_token
    if request.dry_run:
        headers["X-GS2-DRY-RUN"] = "true"
    var response = await session.send("POST", url, headers, {}, body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2MatchmakingVerifyIncludeParticipantByUserIdResult.from_dict(response.body), null)


func delete_season_gathering(request: Gs2MatchmakingDeleteSeasonGatheringRequest) -> Gs2AsyncResult:
    var url = Gs2Constant.ENDPOINT_HOST.replace("{service}", "matchmaking").replace("{region}", session.region) + "/{namespaceName}/season/{seasonName}/{season}/{tier}/gathering/{seasonGatheringName}"
    url = url.replace("{namespaceName}", "null" if (request.namespace_name == null or str(request.namespace_name) == "") else str(request.namespace_name))
    url = url.replace("{seasonName}", "null" if (request.season_name == null or str(request.season_name) == "") else str(request.season_name))
    url = url.replace("{season}", "null" if (request.season == null or str(request.season) == "") else str(request.season))
    url = url.replace("{tier}", "null" if (request.tier == null or str(request.tier) == "") else str(request.tier))
    url = url.replace("{seasonGatheringName}", "null" if (request.season_gathering_name == null or str(request.season_gathering_name) == "") else str(request.season_gathering_name))
    var headers = create_authorized_headers()
    var query_strings = {}
    if request.context_stack != null:
        query_strings["contextStack"] = request.context_stack
    if request.request_id != null:
        headers["X-GS2-REQUEST-ID"] = request.request_id
    if request.dry_run:
        headers["X-GS2-DRY-RUN"] = "true"
    var response = await session.send("DELETE", url, headers, query_strings, null)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2MatchmakingDeleteSeasonGatheringResult.from_dict(response.body), null)


func verify_include_participant_by_stamp_task(request: Gs2MatchmakingVerifyIncludeParticipantByStampTaskRequest) -> Gs2AsyncResult:
    var url = Gs2Constant.ENDPOINT_HOST.replace("{service}", "matchmaking").replace("{region}", session.region) + "/stamp/season/gathering/participant/verify"
    var headers = create_authorized_headers()
    var body = {}
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.stamp_task != null:
        body["stampTask"] = request.stamp_task
    if request.key_id != null:
        body["keyId"] = request.key_id
    if request.request_id != null:
        headers["X-GS2-REQUEST-ID"] = request.request_id
    if request.dry_run:
        headers["X-GS2-DRY-RUN"] = "true"
    var response = await session.send("POST", url, headers, {}, body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2MatchmakingVerifyIncludeParticipantByStampTaskResult.from_dict(response.body), null)


func describe_joined_season_gatherings(request: Gs2MatchmakingDescribeJoinedSeasonGatheringsRequest) -> Gs2AsyncResult:
    var url = Gs2Constant.ENDPOINT_HOST.replace("{service}", "matchmaking").replace("{region}", session.region) + "/{namespaceName}/user/me/season/{seasonName}/gathering/join"
    url = url.replace("{namespaceName}", "null" if (request.namespace_name == null or str(request.namespace_name) == "") else str(request.namespace_name))
    url = url.replace("{seasonName}", "null" if (request.season_name == null or str(request.season_name) == "") else str(request.season_name))
    var headers = create_authorized_headers()
    var query_strings = {}
    if request.context_stack != null:
        query_strings["contextStack"] = request.context_stack
    if request.page_token != null:
        query_strings["pageToken"] = request.page_token
    if request.limit != null:
        query_strings["limit"] = request.limit
    if request.request_id != null:
        headers["X-GS2-REQUEST-ID"] = request.request_id
    if request.access_token != null:
        headers["X-GS2-ACCESS-TOKEN"] = request.access_token
    if request.dry_run:
        headers["X-GS2-DRY-RUN"] = "true"
    var response = await session.send("GET", url, headers, query_strings, null)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2MatchmakingDescribeJoinedSeasonGatheringsResult.from_dict(response.body), null)


func describe_joined_season_gatherings_by_user_id(request: Gs2MatchmakingDescribeJoinedSeasonGatheringsByUserIdRequest) -> Gs2AsyncResult:
    var url = Gs2Constant.ENDPOINT_HOST.replace("{service}", "matchmaking").replace("{region}", session.region) + "/{namespaceName}/user/{userId}/season/{seasonName}/gathering/join"
    url = url.replace("{namespaceName}", "null" if (request.namespace_name == null or str(request.namespace_name) == "") else str(request.namespace_name))
    url = url.replace("{userId}", "null" if (request.user_id == null or str(request.user_id) == "") else str(request.user_id))
    url = url.replace("{seasonName}", "null" if (request.season_name == null or str(request.season_name) == "") else str(request.season_name))
    var headers = create_authorized_headers()
    var query_strings = {}
    if request.context_stack != null:
        query_strings["contextStack"] = request.context_stack
    if request.page_token != null:
        query_strings["pageToken"] = request.page_token
    if request.limit != null:
        query_strings["limit"] = request.limit
    if request.request_id != null:
        headers["X-GS2-REQUEST-ID"] = request.request_id
    if request.time_offset_token != null:
        headers["X-GS2-TIME-OFFSET-TOKEN"] = request.time_offset_token
    if request.dry_run:
        headers["X-GS2-DRY-RUN"] = "true"
    var response = await session.send("GET", url, headers, query_strings, null)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2MatchmakingDescribeJoinedSeasonGatheringsByUserIdResult.from_dict(response.body), null)


func get_joined_season_gathering(request: Gs2MatchmakingGetJoinedSeasonGatheringRequest) -> Gs2AsyncResult:
    var url = Gs2Constant.ENDPOINT_HOST.replace("{service}", "matchmaking").replace("{region}", session.region) + "/{namespaceName}/user/me/season/{seasonName}/gathering/join/{season}"
    url = url.replace("{namespaceName}", "null" if (request.namespace_name == null or str(request.namespace_name) == "") else str(request.namespace_name))
    url = url.replace("{seasonName}", "null" if (request.season_name == null or str(request.season_name) == "") else str(request.season_name))
    url = url.replace("{season}", "null" if (request.season == null or str(request.season) == "") else str(request.season))
    var headers = create_authorized_headers()
    var query_strings = {}
    if request.context_stack != null:
        query_strings["contextStack"] = request.context_stack
    if request.request_id != null:
        headers["X-GS2-REQUEST-ID"] = request.request_id
    if request.access_token != null:
        headers["X-GS2-ACCESS-TOKEN"] = request.access_token
    if request.dry_run:
        headers["X-GS2-DRY-RUN"] = "true"
    var response = await session.send("GET", url, headers, query_strings, null)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2MatchmakingGetJoinedSeasonGatheringResult.from_dict(response.body), null)


func get_joined_season_gathering_by_user_id(request: Gs2MatchmakingGetJoinedSeasonGatheringByUserIdRequest) -> Gs2AsyncResult:
    var url = Gs2Constant.ENDPOINT_HOST.replace("{service}", "matchmaking").replace("{region}", session.region) + "/{namespaceName}/user/{userId}/season/{seasonName}/gathering/join/{season}"
    url = url.replace("{namespaceName}", "null" if (request.namespace_name == null or str(request.namespace_name) == "") else str(request.namespace_name))
    url = url.replace("{userId}", "null" if (request.user_id == null or str(request.user_id) == "") else str(request.user_id))
    url = url.replace("{seasonName}", "null" if (request.season_name == null or str(request.season_name) == "") else str(request.season_name))
    url = url.replace("{season}", "null" if (request.season == null or str(request.season) == "") else str(request.season))
    var headers = create_authorized_headers()
    var query_strings = {}
    if request.context_stack != null:
        query_strings["contextStack"] = request.context_stack
    if request.request_id != null:
        headers["X-GS2-REQUEST-ID"] = request.request_id
    if request.time_offset_token != null:
        headers["X-GS2-TIME-OFFSET-TOKEN"] = request.time_offset_token
    if request.dry_run:
        headers["X-GS2-DRY-RUN"] = "true"
    var response = await session.send("GET", url, headers, query_strings, null)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2MatchmakingGetJoinedSeasonGatheringByUserIdResult.from_dict(response.body), null)


func describe_ratings(request: Gs2MatchmakingDescribeRatingsRequest) -> Gs2AsyncResult:
    var url = Gs2Constant.ENDPOINT_HOST.replace("{service}", "matchmaking").replace("{region}", session.region) + "/{namespaceName}/user/me/rating"
    url = url.replace("{namespaceName}", "null" if (request.namespace_name == null or str(request.namespace_name) == "") else str(request.namespace_name))
    var headers = create_authorized_headers()
    var query_strings = {}
    if request.context_stack != null:
        query_strings["contextStack"] = request.context_stack
    if request.page_token != null:
        query_strings["pageToken"] = request.page_token
    if request.limit != null:
        query_strings["limit"] = request.limit
    if request.request_id != null:
        headers["X-GS2-REQUEST-ID"] = request.request_id
    if request.access_token != null:
        headers["X-GS2-ACCESS-TOKEN"] = request.access_token
    if request.dry_run:
        headers["X-GS2-DRY-RUN"] = "true"
    var response = await session.send("GET", url, headers, query_strings, null)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2MatchmakingDescribeRatingsResult.from_dict(response.body), null)


func describe_ratings_by_user_id(request: Gs2MatchmakingDescribeRatingsByUserIdRequest) -> Gs2AsyncResult:
    var url = Gs2Constant.ENDPOINT_HOST.replace("{service}", "matchmaking").replace("{region}", session.region) + "/{namespaceName}/user/{userId}/rating"
    url = url.replace("{namespaceName}", "null" if (request.namespace_name == null or str(request.namespace_name) == "") else str(request.namespace_name))
    url = url.replace("{userId}", "null" if (request.user_id == null or str(request.user_id) == "") else str(request.user_id))
    var headers = create_authorized_headers()
    var query_strings = {}
    if request.context_stack != null:
        query_strings["contextStack"] = request.context_stack
    if request.page_token != null:
        query_strings["pageToken"] = request.page_token
    if request.limit != null:
        query_strings["limit"] = request.limit
    if request.request_id != null:
        headers["X-GS2-REQUEST-ID"] = request.request_id
    if request.time_offset_token != null:
        headers["X-GS2-TIME-OFFSET-TOKEN"] = request.time_offset_token
    if request.dry_run:
        headers["X-GS2-DRY-RUN"] = "true"
    var response = await session.send("GET", url, headers, query_strings, null)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2MatchmakingDescribeRatingsByUserIdResult.from_dict(response.body), null)


func get_rating(request: Gs2MatchmakingGetRatingRequest) -> Gs2AsyncResult:
    var url = Gs2Constant.ENDPOINT_HOST.replace("{service}", "matchmaking").replace("{region}", session.region) + "/{namespaceName}/user/me/rating/{ratingName}"
    url = url.replace("{namespaceName}", "null" if (request.namespace_name == null or str(request.namespace_name) == "") else str(request.namespace_name))
    url = url.replace("{ratingName}", "null" if (request.rating_name == null or str(request.rating_name) == "") else str(request.rating_name))
    var headers = create_authorized_headers()
    var query_strings = {}
    if request.context_stack != null:
        query_strings["contextStack"] = request.context_stack
    if request.request_id != null:
        headers["X-GS2-REQUEST-ID"] = request.request_id
    if request.access_token != null:
        headers["X-GS2-ACCESS-TOKEN"] = request.access_token
    if request.dry_run:
        headers["X-GS2-DRY-RUN"] = "true"
    var response = await session.send("GET", url, headers, query_strings, null)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2MatchmakingGetRatingResult.from_dict(response.body), null)


func get_rating_by_user_id(request: Gs2MatchmakingGetRatingByUserIdRequest) -> Gs2AsyncResult:
    var url = Gs2Constant.ENDPOINT_HOST.replace("{service}", "matchmaking").replace("{region}", session.region) + "/{namespaceName}/user/{userId}/rating/{ratingName}"
    url = url.replace("{namespaceName}", "null" if (request.namespace_name == null or str(request.namespace_name) == "") else str(request.namespace_name))
    url = url.replace("{userId}", "null" if (request.user_id == null or str(request.user_id) == "") else str(request.user_id))
    url = url.replace("{ratingName}", "null" if (request.rating_name == null or str(request.rating_name) == "") else str(request.rating_name))
    var headers = create_authorized_headers()
    var query_strings = {}
    if request.context_stack != null:
        query_strings["contextStack"] = request.context_stack
    if request.request_id != null:
        headers["X-GS2-REQUEST-ID"] = request.request_id
    if request.time_offset_token != null:
        headers["X-GS2-TIME-OFFSET-TOKEN"] = request.time_offset_token
    if request.dry_run:
        headers["X-GS2-DRY-RUN"] = "true"
    var response = await session.send("GET", url, headers, query_strings, null)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2MatchmakingGetRatingByUserIdResult.from_dict(response.body), null)


func put_result(request: Gs2MatchmakingPutResultRequest) -> Gs2AsyncResult:
    var url = Gs2Constant.ENDPOINT_HOST.replace("{service}", "matchmaking").replace("{region}", session.region) + "/{namespaceName}/rating/{ratingName}/vote"
    url = url.replace("{namespaceName}", "null" if (request.namespace_name == null or str(request.namespace_name) == "") else str(request.namespace_name))
    url = url.replace("{ratingName}", "null" if (request.rating_name == null or str(request.rating_name) == "") else str(request.rating_name))
    var headers = create_authorized_headers()
    var body = {}
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.game_results != null:
        body["gameResults"] = request.game_results.map(func(v): return null if v == null else v.to_dict())
    if request.request_id != null:
        headers["X-GS2-REQUEST-ID"] = request.request_id
    if request.dry_run:
        headers["X-GS2-DRY-RUN"] = "true"
    var response = await session.send("POST", url, headers, {}, body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2MatchmakingPutResultResult.from_dict(response.body), null)


func delete_rating(request: Gs2MatchmakingDeleteRatingRequest) -> Gs2AsyncResult:
    var url = Gs2Constant.ENDPOINT_HOST.replace("{service}", "matchmaking").replace("{region}", session.region) + "/{namespaceName}/user/{userId}/rating/{ratingName}"
    url = url.replace("{namespaceName}", "null" if (request.namespace_name == null or str(request.namespace_name) == "") else str(request.namespace_name))
    url = url.replace("{userId}", "null" if (request.user_id == null or str(request.user_id) == "") else str(request.user_id))
    url = url.replace("{ratingName}", "null" if (request.rating_name == null or str(request.rating_name) == "") else str(request.rating_name))
    var headers = create_authorized_headers()
    var query_strings = {}
    if request.context_stack != null:
        query_strings["contextStack"] = request.context_stack
    if request.request_id != null:
        headers["X-GS2-REQUEST-ID"] = request.request_id
    if request.duplication_avoider != null:
        headers["X-GS2-DUPLICATION-AVOIDER"] = request.duplication_avoider
    if request.time_offset_token != null:
        headers["X-GS2-TIME-OFFSET-TOKEN"] = request.time_offset_token
    if request.dry_run:
        headers["X-GS2-DRY-RUN"] = "true"
    var response = await session.send("DELETE", url, headers, query_strings, null)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2MatchmakingDeleteRatingResult.from_dict(response.body), null)


func get_ballot(request: Gs2MatchmakingGetBallotRequest) -> Gs2AsyncResult:
    var url = Gs2Constant.ENDPOINT_HOST.replace("{service}", "matchmaking").replace("{region}", session.region) + "/{namespaceName}/user/me/vote/{ratingName}/{gatheringName}/ballot"
    url = url.replace("{namespaceName}", "null" if (request.namespace_name == null or str(request.namespace_name) == "") else str(request.namespace_name))
    url = url.replace("{ratingName}", "null" if (request.rating_name == null or str(request.rating_name) == "") else str(request.rating_name))
    url = url.replace("{gatheringName}", "null" if (request.gathering_name == null or str(request.gathering_name) == "") else str(request.gathering_name))
    var headers = create_authorized_headers()
    var body = {}
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.number_of_player != null:
        body["numberOfPlayer"] = request.number_of_player
    if request.key_id != null:
        body["keyId"] = request.key_id
    if request.request_id != null:
        headers["X-GS2-REQUEST-ID"] = request.request_id
    if request.access_token != null:
        headers["X-GS2-ACCESS-TOKEN"] = request.access_token
    if request.dry_run:
        headers["X-GS2-DRY-RUN"] = "true"
    var response = await session.send("POST", url, headers, {}, body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2MatchmakingGetBallotResult.from_dict(response.body), null)


func get_ballot_by_user_id(request: Gs2MatchmakingGetBallotByUserIdRequest) -> Gs2AsyncResult:
    var url = Gs2Constant.ENDPOINT_HOST.replace("{service}", "matchmaking").replace("{region}", session.region) + "/{namespaceName}/user/{userId}/vote/{ratingName}/{gatheringName}/ballot"
    url = url.replace("{namespaceName}", "null" if (request.namespace_name == null or str(request.namespace_name) == "") else str(request.namespace_name))
    url = url.replace("{ratingName}", "null" if (request.rating_name == null or str(request.rating_name) == "") else str(request.rating_name))
    url = url.replace("{gatheringName}", "null" if (request.gathering_name == null or str(request.gathering_name) == "") else str(request.gathering_name))
    url = url.replace("{userId}", "null" if (request.user_id == null or str(request.user_id) == "") else str(request.user_id))
    var headers = create_authorized_headers()
    var body = {}
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.number_of_player != null:
        body["numberOfPlayer"] = request.number_of_player
    if request.key_id != null:
        body["keyId"] = request.key_id
    if request.request_id != null:
        headers["X-GS2-REQUEST-ID"] = request.request_id
    if request.time_offset_token != null:
        headers["X-GS2-TIME-OFFSET-TOKEN"] = request.time_offset_token
    if request.dry_run:
        headers["X-GS2-DRY-RUN"] = "true"
    var response = await session.send("POST", url, headers, {}, body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2MatchmakingGetBallotByUserIdResult.from_dict(response.body), null)


func vote(request: Gs2MatchmakingVoteRequest) -> Gs2AsyncResult:
    var url = Gs2Constant.ENDPOINT_HOST.replace("{service}", "matchmaking").replace("{region}", session.region) + "/{namespaceName}/action/vote"
    url = url.replace("{namespaceName}", "null" if (request.namespace_name == null or str(request.namespace_name) == "") else str(request.namespace_name))
    var headers = create_authorized_headers()
    var body = {}
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.ballot_body != null:
        body["ballotBody"] = request.ballot_body
    if request.ballot_signature != null:
        body["ballotSignature"] = request.ballot_signature
    if request.game_results != null:
        body["gameResults"] = request.game_results.map(func(v): return null if v == null else v.to_dict())
    if request.key_id != null:
        body["keyId"] = request.key_id
    if request.request_id != null:
        headers["X-GS2-REQUEST-ID"] = request.request_id
    if request.dry_run:
        headers["X-GS2-DRY-RUN"] = "true"
    var response = await session.send("POST", url, headers, {}, body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2MatchmakingVoteResult.from_dict(response.body), null)


func vote_multiple(request: Gs2MatchmakingVoteMultipleRequest) -> Gs2AsyncResult:
    var url = Gs2Constant.ENDPOINT_HOST.replace("{service}", "matchmaking").replace("{region}", session.region) + "/{namespaceName}/action/vote/multiple"
    url = url.replace("{namespaceName}", "null" if (request.namespace_name == null or str(request.namespace_name) == "") else str(request.namespace_name))
    var headers = create_authorized_headers()
    var body = {}
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.signed_ballots != null:
        body["signedBallots"] = request.signed_ballots.map(func(v): return null if v == null else v.to_dict())
    if request.game_results != null:
        body["gameResults"] = request.game_results.map(func(v): return null if v == null else v.to_dict())
    if request.key_id != null:
        body["keyId"] = request.key_id
    if request.request_id != null:
        headers["X-GS2-REQUEST-ID"] = request.request_id
    if request.dry_run:
        headers["X-GS2-DRY-RUN"] = "true"
    var response = await session.send("POST", url, headers, {}, body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2MatchmakingVoteMultipleResult.from_dict(response.body), null)


func commit_vote(request: Gs2MatchmakingCommitVoteRequest) -> Gs2AsyncResult:
    var url = Gs2Constant.ENDPOINT_HOST.replace("{service}", "matchmaking").replace("{region}", session.region) + "/{namespaceName}/vote/{ratingName}/{gatheringName}/action/vote/commit"
    url = url.replace("{namespaceName}", "null" if (request.namespace_name == null or str(request.namespace_name) == "") else str(request.namespace_name))
    url = url.replace("{ratingName}", "null" if (request.rating_name == null or str(request.rating_name) == "") else str(request.rating_name))
    url = url.replace("{gatheringName}", "null" if (request.gathering_name == null or str(request.gathering_name) == "") else str(request.gathering_name))
    var headers = create_authorized_headers()
    var body = {}
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.request_id != null:
        headers["X-GS2-REQUEST-ID"] = request.request_id
    if request.dry_run:
        headers["X-GS2-DRY-RUN"] = "true"
    var response = await session.send("POST", url, headers, {}, body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2MatchmakingCommitVoteResult.from_dict(response.body), null)