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
class_name Gs2AdRewardWebSocketClient
extends Gs2AbstractWebSocketClient


func create_namespace(request: Gs2AdRewardCreateNamespaceRequest) -> Gs2AsyncResult:
    var body = {}
    if request.name != null:
        body["name"] = request.name
    if request.description != null:
        body["description"] = request.description
    if request.transaction_setting != null:
        body["transactionSetting"] = request.transaction_setting.to_dict()
    if request.admob != null:
        body["admob"] = request.admob.to_dict()
    if request.unity_ad != null:
        body["unityAd"] = request.unity_ad.to_dict()
    if request.app_lovin_maxes != null:
        body["appLovinMaxes"] = request.app_lovin_maxes.map(func(v): return null if v == null else v.to_dict())
    if request.acquire_point_script != null:
        body["acquirePointScript"] = request.acquire_point_script.to_dict()
    if request.consume_point_script != null:
        body["consumePointScript"] = request.consume_point_script.to_dict()
    if request.change_point_notification != null:
        body["changePointNotification"] = request.change_point_notification.to_dict()
    if request.log_setting != null:
        body["logSetting"] = request.log_setting.to_dict()
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.dry_run:
        body["xGs2DryRun"] = "true"
    var response = await session.send("adReward", "namespace", "createNamespace", body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2AdRewardCreateNamespaceResult.from_dict(response.body), null)


func get_namespace_status(request: Gs2AdRewardGetNamespaceStatusRequest) -> Gs2AsyncResult:
    var body = {}
    if request.namespace_name != null:
        body["namespaceName"] = request.namespace_name
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.dry_run:
        body["xGs2DryRun"] = "true"
    var response = await session.send("adReward", "namespace", "getNamespaceStatus", body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2AdRewardGetNamespaceStatusResult.from_dict(response.body), null)


func get_namespace(request: Gs2AdRewardGetNamespaceRequest) -> Gs2AsyncResult:
    var body = {}
    if request.namespace_name != null:
        body["namespaceName"] = request.namespace_name
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.dry_run:
        body["xGs2DryRun"] = "true"
    var response = await session.send("adReward", "namespace", "getNamespace", body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2AdRewardGetNamespaceResult.from_dict(response.body), null)


func update_namespace(request: Gs2AdRewardUpdateNamespaceRequest) -> Gs2AsyncResult:
    var body = {}
    if request.namespace_name != null:
        body["namespaceName"] = request.namespace_name
    if request.description != null:
        body["description"] = request.description
    if request.transaction_setting != null:
        body["transactionSetting"] = request.transaction_setting.to_dict()
    if request.admob != null:
        body["admob"] = request.admob.to_dict()
    if request.unity_ad != null:
        body["unityAd"] = request.unity_ad.to_dict()
    if request.app_lovin_maxes != null:
        body["appLovinMaxes"] = request.app_lovin_maxes.map(func(v): return null if v == null else v.to_dict())
    if request.acquire_point_script != null:
        body["acquirePointScript"] = request.acquire_point_script.to_dict()
    if request.consume_point_script != null:
        body["consumePointScript"] = request.consume_point_script.to_dict()
    if request.change_point_notification != null:
        body["changePointNotification"] = request.change_point_notification.to_dict()
    if request.log_setting != null:
        body["logSetting"] = request.log_setting.to_dict()
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.dry_run:
        body["xGs2DryRun"] = "true"
    var response = await session.send("adReward", "namespace", "updateNamespace", body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2AdRewardUpdateNamespaceResult.from_dict(response.body), null)


func delete_namespace(request: Gs2AdRewardDeleteNamespaceRequest) -> Gs2AsyncResult:
    var body = {}
    if request.namespace_name != null:
        body["namespaceName"] = request.namespace_name
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.dry_run:
        body["xGs2DryRun"] = "true"
    var response = await session.send("adReward", "namespace", "deleteNamespace", body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2AdRewardDeleteNamespaceResult.from_dict(response.body), null)


func get_service_version(request: Gs2AdRewardGetServiceVersionRequest) -> Gs2AsyncResult:
    var body = {}
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.dry_run:
        body["xGs2DryRun"] = "true"
    var response = await session.send("adReward", "namespace", "getServiceVersion", body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2AdRewardGetServiceVersionResult.from_dict(response.body), null)


func dump_user_data_by_user_id(request: Gs2AdRewardDumpUserDataByUserIdRequest) -> Gs2AsyncResult:
    var body = {}
    if request.user_id != null:
        body["userId"] = request.user_id
    if request.time_offset_token != null:
        body["timeOffsetToken"] = request.time_offset_token
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.dry_run:
        body["xGs2DryRun"] = "true"
    var response = await session.send("adReward", "namespace", "dumpUserDataByUserId", body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2AdRewardDumpUserDataByUserIdResult.from_dict(response.body), null)


func check_dump_user_data_by_user_id(request: Gs2AdRewardCheckDumpUserDataByUserIdRequest) -> Gs2AsyncResult:
    var body = {}
    if request.user_id != null:
        body["userId"] = request.user_id
    if request.time_offset_token != null:
        body["timeOffsetToken"] = request.time_offset_token
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.dry_run:
        body["xGs2DryRun"] = "true"
    var response = await session.send("adReward", "namespace", "checkDumpUserDataByUserId", body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2AdRewardCheckDumpUserDataByUserIdResult.from_dict(response.body), null)


func clean_user_data_by_user_id(request: Gs2AdRewardCleanUserDataByUserIdRequest) -> Gs2AsyncResult:
    var body = {}
    if request.user_id != null:
        body["userId"] = request.user_id
    if request.time_offset_token != null:
        body["timeOffsetToken"] = request.time_offset_token
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.dry_run:
        body["xGs2DryRun"] = "true"
    var response = await session.send("adReward", "namespace", "cleanUserDataByUserId", body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2AdRewardCleanUserDataByUserIdResult.from_dict(response.body), null)


func check_clean_user_data_by_user_id(request: Gs2AdRewardCheckCleanUserDataByUserIdRequest) -> Gs2AsyncResult:
    var body = {}
    if request.user_id != null:
        body["userId"] = request.user_id
    if request.time_offset_token != null:
        body["timeOffsetToken"] = request.time_offset_token
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.dry_run:
        body["xGs2DryRun"] = "true"
    var response = await session.send("adReward", "namespace", "checkCleanUserDataByUserId", body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2AdRewardCheckCleanUserDataByUserIdResult.from_dict(response.body), null)


func prepare_import_user_data_by_user_id(request: Gs2AdRewardPrepareImportUserDataByUserIdRequest) -> Gs2AsyncResult:
    var body = {}
    if request.user_id != null:
        body["userId"] = request.user_id
    if request.time_offset_token != null:
        body["timeOffsetToken"] = request.time_offset_token
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.dry_run:
        body["xGs2DryRun"] = "true"
    var response = await session.send("adReward", "namespace", "prepareImportUserDataByUserId", body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2AdRewardPrepareImportUserDataByUserIdResult.from_dict(response.body), null)


func import_user_data_by_user_id(request: Gs2AdRewardImportUserDataByUserIdRequest) -> Gs2AsyncResult:
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
    var response = await session.send("adReward", "namespace", "importUserDataByUserId", body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2AdRewardImportUserDataByUserIdResult.from_dict(response.body), null)


func check_import_user_data_by_user_id(request: Gs2AdRewardCheckImportUserDataByUserIdRequest) -> Gs2AsyncResult:
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
    var response = await session.send("adReward", "namespace", "checkImportUserDataByUserId", body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2AdRewardCheckImportUserDataByUserIdResult.from_dict(response.body), null)


func get_point(request: Gs2AdRewardGetPointRequest) -> Gs2AsyncResult:
    var body = {}
    if request.namespace_name != null:
        body["namespaceName"] = request.namespace_name
    if request.access_token != null:
        body["accessToken"] = request.access_token
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.access_token != null:
        body["xGs2AccessToken"] = request.access_token
    if request.dry_run:
        body["xGs2DryRun"] = "true"
    var response = await session.send("adReward", "point", "getPoint", body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2AdRewardGetPointResult.from_dict(response.body), null)


func get_point_by_user_id(request: Gs2AdRewardGetPointByUserIdRequest) -> Gs2AsyncResult:
    var body = {}
    if request.namespace_name != null:
        body["namespaceName"] = request.namespace_name
    if request.user_id != null:
        body["userId"] = request.user_id
    if request.time_offset_token != null:
        body["timeOffsetToken"] = request.time_offset_token
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.dry_run:
        body["xGs2DryRun"] = "true"
    var response = await session.send("adReward", "point", "getPointByUserId", body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2AdRewardGetPointByUserIdResult.from_dict(response.body), null)


func acquire_point_by_user_id(request: Gs2AdRewardAcquirePointByUserIdRequest) -> Gs2AsyncResult:
    var body = {}
    if request.namespace_name != null:
        body["namespaceName"] = request.namespace_name
    if request.user_id != null:
        body["userId"] = request.user_id
    if request.point != null:
        body["point"] = request.point
    if request.time_offset_token != null:
        body["timeOffsetToken"] = request.time_offset_token
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.duplication_avoider != null:
        body["xGs2DuplicationAvoider"] = request.duplication_avoider
    if request.dry_run:
        body["xGs2DryRun"] = "true"
    var response = await session.send("adReward", "point", "acquirePointByUserId", body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2AdRewardAcquirePointByUserIdResult.from_dict(response.body), null)


func consume_point(request: Gs2AdRewardConsumePointRequest) -> Gs2AsyncResult:
    var body = {}
    if request.namespace_name != null:
        body["namespaceName"] = request.namespace_name
    if request.access_token != null:
        body["accessToken"] = request.access_token
    if request.point != null:
        body["point"] = request.point
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.access_token != null:
        body["xGs2AccessToken"] = request.access_token
    if request.duplication_avoider != null:
        body["xGs2DuplicationAvoider"] = request.duplication_avoider
    if request.dry_run:
        body["xGs2DryRun"] = "true"
    var response = await session.send("adReward", "point", "consumePoint", body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2AdRewardConsumePointResult.from_dict(response.body), null)


func consume_point_by_user_id(request: Gs2AdRewardConsumePointByUserIdRequest) -> Gs2AsyncResult:
    var body = {}
    if request.namespace_name != null:
        body["namespaceName"] = request.namespace_name
    if request.user_id != null:
        body["userId"] = request.user_id
    if request.point != null:
        body["point"] = request.point
    if request.time_offset_token != null:
        body["timeOffsetToken"] = request.time_offset_token
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.duplication_avoider != null:
        body["xGs2DuplicationAvoider"] = request.duplication_avoider
    if request.dry_run:
        body["xGs2DryRun"] = "true"
    var response = await session.send("adReward", "point", "consumePointByUserId", body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2AdRewardConsumePointByUserIdResult.from_dict(response.body), null)


func delete_point_by_user_id(request: Gs2AdRewardDeletePointByUserIdRequest) -> Gs2AsyncResult:
    var body = {}
    if request.namespace_name != null:
        body["namespaceName"] = request.namespace_name
    if request.user_id != null:
        body["userId"] = request.user_id
    if request.time_offset_token != null:
        body["timeOffsetToken"] = request.time_offset_token
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.duplication_avoider != null:
        body["xGs2DuplicationAvoider"] = request.duplication_avoider
    if request.dry_run:
        body["xGs2DryRun"] = "true"
    var response = await session.send("adReward", "point", "deletePointByUserId", body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2AdRewardDeletePointByUserIdResult.from_dict(response.body), null)


func acquire_point_by_stamp_sheet(request: Gs2AdRewardAcquirePointByStampSheetRequest) -> Gs2AsyncResult:
    var body = {}
    if request.stamp_sheet != null:
        body["stampSheet"] = request.stamp_sheet
    if request.key_id != null:
        body["keyId"] = request.key_id
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.dry_run:
        body["xGs2DryRun"] = "true"
    var response = await session.send("adReward", "point", "acquirePointByStampSheet", body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2AdRewardAcquirePointByStampSheetResult.from_dict(response.body), null)