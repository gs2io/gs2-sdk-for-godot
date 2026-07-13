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
class_name Gs2ScheduleServiceCache
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
        Gs2ScheduleDescribeNamespacesMethodCache.put_cache(
            Gs2ScheduleDescribeNamespacesResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2ScheduleDescribeNamespacesRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "createNamespace":
        Gs2ScheduleCreateNamespaceMethodCache.put_cache(
            Gs2ScheduleCreateNamespaceResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2ScheduleCreateNamespaceRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "getNamespaceStatus":
        Gs2ScheduleGetNamespaceStatusMethodCache.put_cache(
            Gs2ScheduleGetNamespaceStatusResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2ScheduleGetNamespaceStatusRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "getNamespace":
        Gs2ScheduleGetNamespaceMethodCache.put_cache(
            Gs2ScheduleGetNamespaceResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2ScheduleGetNamespaceRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "updateNamespace":
        Gs2ScheduleUpdateNamespaceMethodCache.put_cache(
            Gs2ScheduleUpdateNamespaceResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2ScheduleUpdateNamespaceRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "deleteNamespace":
        Gs2ScheduleDeleteNamespaceMethodCache.put_cache(
            Gs2ScheduleDeleteNamespaceResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2ScheduleDeleteNamespaceRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "getServiceVersion":
        Gs2ScheduleGetServiceVersionMethodCache.put_cache(
            Gs2ScheduleGetServiceVersionResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2ScheduleGetServiceVersionRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "dumpUserDataByUserId":
        Gs2ScheduleDumpUserDataByUserIdMethodCache.put_cache(
            Gs2ScheduleDumpUserDataByUserIdResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2ScheduleDumpUserDataByUserIdRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "checkDumpUserDataByUserId":
        Gs2ScheduleCheckDumpUserDataByUserIdMethodCache.put_cache(
            Gs2ScheduleCheckDumpUserDataByUserIdResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2ScheduleCheckDumpUserDataByUserIdRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "cleanUserDataByUserId":
        Gs2ScheduleCleanUserDataByUserIdMethodCache.put_cache(
            Gs2ScheduleCleanUserDataByUserIdResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2ScheduleCleanUserDataByUserIdRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "checkCleanUserDataByUserId":
        Gs2ScheduleCheckCleanUserDataByUserIdMethodCache.put_cache(
            Gs2ScheduleCheckCleanUserDataByUserIdResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2ScheduleCheckCleanUserDataByUserIdRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "prepareImportUserDataByUserId":
        Gs2SchedulePrepareImportUserDataByUserIdMethodCache.put_cache(
            Gs2SchedulePrepareImportUserDataByUserIdResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2SchedulePrepareImportUserDataByUserIdRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "importUserDataByUserId":
        Gs2ScheduleImportUserDataByUserIdMethodCache.put_cache(
            Gs2ScheduleImportUserDataByUserIdResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2ScheduleImportUserDataByUserIdRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "checkImportUserDataByUserId":
        Gs2ScheduleCheckImportUserDataByUserIdMethodCache.put_cache(
            Gs2ScheduleCheckImportUserDataByUserIdResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2ScheduleCheckImportUserDataByUserIdRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "describeEventMasters":
        Gs2ScheduleDescribeEventMastersMethodCache.put_cache(
            Gs2ScheduleDescribeEventMastersResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2ScheduleDescribeEventMastersRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "createEventMaster":
        Gs2ScheduleCreateEventMasterMethodCache.put_cache(
            Gs2ScheduleCreateEventMasterResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2ScheduleCreateEventMasterRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "getEventMaster":
        Gs2ScheduleGetEventMasterMethodCache.put_cache(
            Gs2ScheduleGetEventMasterResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2ScheduleGetEventMasterRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "updateEventMaster":
        Gs2ScheduleUpdateEventMasterMethodCache.put_cache(
            Gs2ScheduleUpdateEventMasterResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2ScheduleUpdateEventMasterRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "deleteEventMaster":
        Gs2ScheduleDeleteEventMasterMethodCache.put_cache(
            Gs2ScheduleDeleteEventMasterResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2ScheduleDeleteEventMasterRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "describeTriggers":
        Gs2ScheduleDescribeTriggersMethodCache.put_cache(
            Gs2ScheduleDescribeTriggersResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2ScheduleDescribeTriggersRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "describeTriggersByUserId":
        Gs2ScheduleDescribeTriggersByUserIdMethodCache.put_cache(
            Gs2ScheduleDescribeTriggersByUserIdResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2ScheduleDescribeTriggersByUserIdRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "getTrigger":
        Gs2ScheduleGetTriggerMethodCache.put_cache(
            Gs2ScheduleGetTriggerResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2ScheduleGetTriggerRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "getTriggerByUserId":
        Gs2ScheduleGetTriggerByUserIdMethodCache.put_cache(
            Gs2ScheduleGetTriggerByUserIdResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2ScheduleGetTriggerByUserIdRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "triggerByUserId":
        Gs2ScheduleTriggerByUserIdMethodCache.put_cache(
            Gs2ScheduleTriggerByUserIdResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2ScheduleTriggerByUserIdRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "extendTriggerByUserId":
        Gs2ScheduleExtendTriggerByUserIdMethodCache.put_cache(
            Gs2ScheduleExtendTriggerByUserIdResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2ScheduleExtendTriggerByUserIdRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "deleteTrigger":
        Gs2ScheduleDeleteTriggerMethodCache.put_cache(
            Gs2ScheduleDeleteTriggerResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2ScheduleDeleteTriggerRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "deleteTriggerByUserId":
        Gs2ScheduleDeleteTriggerByUserIdMethodCache.put_cache(
            Gs2ScheduleDeleteTriggerByUserIdResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2ScheduleDeleteTriggerByUserIdRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "verifyTrigger":
        Gs2ScheduleVerifyTriggerMethodCache.put_cache(
            Gs2ScheduleVerifyTriggerResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2ScheduleVerifyTriggerRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "verifyTriggerByUserId":
        Gs2ScheduleVerifyTriggerByUserIdMethodCache.put_cache(
            Gs2ScheduleVerifyTriggerByUserIdResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2ScheduleVerifyTriggerByUserIdRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "describeEvents":
        Gs2ScheduleDescribeEventsMethodCache.put_cache(
            Gs2ScheduleDescribeEventsResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2ScheduleDescribeEventsRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "describeEventsByUserId":
        Gs2ScheduleDescribeEventsByUserIdMethodCache.put_cache(
            Gs2ScheduleDescribeEventsByUserIdResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2ScheduleDescribeEventsByUserIdRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "describeRawEvents":
        Gs2ScheduleDescribeRawEventsMethodCache.put_cache(
            Gs2ScheduleDescribeRawEventsResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2ScheduleDescribeRawEventsRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "getEvent":
        Gs2ScheduleGetEventMethodCache.put_cache(
            Gs2ScheduleGetEventResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2ScheduleGetEventRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "getEventByUserId":
        Gs2ScheduleGetEventByUserIdMethodCache.put_cache(
            Gs2ScheduleGetEventByUserIdResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2ScheduleGetEventByUserIdRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "getRawEvent":
        Gs2ScheduleGetRawEventMethodCache.put_cache(
            Gs2ScheduleGetRawEventResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2ScheduleGetRawEventRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "verifyEvent":
        Gs2ScheduleVerifyEventMethodCache.put_cache(
            Gs2ScheduleVerifyEventResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2ScheduleVerifyEventRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "verifyEventByUserId":
        Gs2ScheduleVerifyEventByUserIdMethodCache.put_cache(
            Gs2ScheduleVerifyEventByUserIdResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2ScheduleVerifyEventByUserIdRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "exportMaster":
        Gs2ScheduleExportMasterMethodCache.put_cache(
            Gs2ScheduleExportMasterResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2ScheduleExportMasterRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "getCurrentEventMaster":
        Gs2ScheduleGetCurrentEventMasterMethodCache.put_cache(
            Gs2ScheduleGetCurrentEventMasterResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2ScheduleGetCurrentEventMasterRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "preUpdateCurrentEventMaster":
        Gs2SchedulePreUpdateCurrentEventMasterMethodCache.put_cache(
            Gs2SchedulePreUpdateCurrentEventMasterResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2SchedulePreUpdateCurrentEventMasterRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "updateCurrentEventMaster":
        Gs2ScheduleUpdateCurrentEventMasterMethodCache.put_cache(
            Gs2ScheduleUpdateCurrentEventMasterResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2ScheduleUpdateCurrentEventMasterRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "updateCurrentEventMasterFromGitHub":
        Gs2ScheduleUpdateCurrentEventMasterFromGitHubMethodCache.put_cache(
            Gs2ScheduleUpdateCurrentEventMasterFromGitHubResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2ScheduleUpdateCurrentEventMasterFromGitHubRequest.from_dict(_parse(request_payload))
        )
        return
    pass