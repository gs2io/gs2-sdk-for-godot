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
class_name Gs2StateMachineServiceCache
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
        Gs2StateMachineDescribeNamespacesMethodCache.put_cache(
            Gs2StateMachineDescribeNamespacesResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2StateMachineDescribeNamespacesRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "createNamespace":
        Gs2StateMachineCreateNamespaceMethodCache.put_cache(
            Gs2StateMachineCreateNamespaceResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2StateMachineCreateNamespaceRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "getNamespaceStatus":
        Gs2StateMachineGetNamespaceStatusMethodCache.put_cache(
            Gs2StateMachineGetNamespaceStatusResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2StateMachineGetNamespaceStatusRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "getNamespace":
        Gs2StateMachineGetNamespaceMethodCache.put_cache(
            Gs2StateMachineGetNamespaceResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2StateMachineGetNamespaceRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "updateNamespace":
        Gs2StateMachineUpdateNamespaceMethodCache.put_cache(
            Gs2StateMachineUpdateNamespaceResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2StateMachineUpdateNamespaceRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "deleteNamespace":
        Gs2StateMachineDeleteNamespaceMethodCache.put_cache(
            Gs2StateMachineDeleteNamespaceResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2StateMachineDeleteNamespaceRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "getServiceVersion":
        Gs2StateMachineGetServiceVersionMethodCache.put_cache(
            Gs2StateMachineGetServiceVersionResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2StateMachineGetServiceVersionRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "dumpUserDataByUserId":
        Gs2StateMachineDumpUserDataByUserIdMethodCache.put_cache(
            Gs2StateMachineDumpUserDataByUserIdResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2StateMachineDumpUserDataByUserIdRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "checkDumpUserDataByUserId":
        Gs2StateMachineCheckDumpUserDataByUserIdMethodCache.put_cache(
            Gs2StateMachineCheckDumpUserDataByUserIdResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2StateMachineCheckDumpUserDataByUserIdRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "cleanUserDataByUserId":
        Gs2StateMachineCleanUserDataByUserIdMethodCache.put_cache(
            Gs2StateMachineCleanUserDataByUserIdResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2StateMachineCleanUserDataByUserIdRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "checkCleanUserDataByUserId":
        Gs2StateMachineCheckCleanUserDataByUserIdMethodCache.put_cache(
            Gs2StateMachineCheckCleanUserDataByUserIdResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2StateMachineCheckCleanUserDataByUserIdRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "prepareImportUserDataByUserId":
        Gs2StateMachinePrepareImportUserDataByUserIdMethodCache.put_cache(
            Gs2StateMachinePrepareImportUserDataByUserIdResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2StateMachinePrepareImportUserDataByUserIdRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "importUserDataByUserId":
        Gs2StateMachineImportUserDataByUserIdMethodCache.put_cache(
            Gs2StateMachineImportUserDataByUserIdResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2StateMachineImportUserDataByUserIdRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "checkImportUserDataByUserId":
        Gs2StateMachineCheckImportUserDataByUserIdMethodCache.put_cache(
            Gs2StateMachineCheckImportUserDataByUserIdResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2StateMachineCheckImportUserDataByUserIdRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "describeStateMachineMasters":
        Gs2StateMachineDescribeStateMachineMastersMethodCache.put_cache(
            Gs2StateMachineDescribeStateMachineMastersResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2StateMachineDescribeStateMachineMastersRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "updateStateMachineMaster":
        Gs2StateMachineUpdateStateMachineMasterMethodCache.put_cache(
            Gs2StateMachineUpdateStateMachineMasterResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2StateMachineUpdateStateMachineMasterRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "getStateMachineMaster":
        Gs2StateMachineGetStateMachineMasterMethodCache.put_cache(
            Gs2StateMachineGetStateMachineMasterResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2StateMachineGetStateMachineMasterRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "deleteStateMachineMaster":
        Gs2StateMachineDeleteStateMachineMasterMethodCache.put_cache(
            Gs2StateMachineDeleteStateMachineMasterResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2StateMachineDeleteStateMachineMasterRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "describeStatuses":
        Gs2StateMachineDescribeStatusesMethodCache.put_cache(
            Gs2StateMachineDescribeStatusesResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2StateMachineDescribeStatusesRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "describeStatusesByUserId":
        Gs2StateMachineDescribeStatusesByUserIdMethodCache.put_cache(
            Gs2StateMachineDescribeStatusesByUserIdResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2StateMachineDescribeStatusesByUserIdRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "getStatus":
        Gs2StateMachineGetStatusMethodCache.put_cache(
            Gs2StateMachineGetStatusResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2StateMachineGetStatusRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "getStatusByUserId":
        Gs2StateMachineGetStatusByUserIdMethodCache.put_cache(
            Gs2StateMachineGetStatusByUserIdResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2StateMachineGetStatusByUserIdRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "startStateMachineByUserId":
        Gs2StateMachineStartStateMachineByUserIdMethodCache.put_cache(
            Gs2StateMachineStartStateMachineByUserIdResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2StateMachineStartStateMachineByUserIdRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "emit":
        Gs2StateMachineEmitMethodCache.put_cache(
            Gs2StateMachineEmitResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2StateMachineEmitRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "emitByUserId":
        Gs2StateMachineEmitByUserIdMethodCache.put_cache(
            Gs2StateMachineEmitByUserIdResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2StateMachineEmitByUserIdRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "report":
        Gs2StateMachineReportMethodCache.put_cache(
            Gs2StateMachineReportResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2StateMachineReportRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "reportByUserId":
        Gs2StateMachineReportByUserIdMethodCache.put_cache(
            Gs2StateMachineReportByUserIdResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2StateMachineReportByUserIdRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "deleteStatusByUserId":
        Gs2StateMachineDeleteStatusByUserIdMethodCache.put_cache(
            Gs2StateMachineDeleteStatusByUserIdResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2StateMachineDeleteStatusByUserIdRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "exitStateMachine":
        Gs2StateMachineExitStateMachineMethodCache.put_cache(
            Gs2StateMachineExitStateMachineResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2StateMachineExitStateMachineRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "exitStateMachineByUserId":
        Gs2StateMachineExitStateMachineByUserIdMethodCache.put_cache(
            Gs2StateMachineExitStateMachineByUserIdResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2StateMachineExitStateMachineByUserIdRequest.from_dict(_parse(request_payload))
        )
        return
    pass