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
class_name Gs2ExchangeServiceCache
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
        Gs2ExchangeDescribeNamespacesMethodCache.put_cache(
            Gs2ExchangeDescribeNamespacesResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2ExchangeDescribeNamespacesRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "createNamespace":
        Gs2ExchangeCreateNamespaceMethodCache.put_cache(
            Gs2ExchangeCreateNamespaceResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2ExchangeCreateNamespaceRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "getNamespaceStatus":
        Gs2ExchangeGetNamespaceStatusMethodCache.put_cache(
            Gs2ExchangeGetNamespaceStatusResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2ExchangeGetNamespaceStatusRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "getNamespace":
        Gs2ExchangeGetNamespaceMethodCache.put_cache(
            Gs2ExchangeGetNamespaceResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2ExchangeGetNamespaceRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "updateNamespace":
        Gs2ExchangeUpdateNamespaceMethodCache.put_cache(
            Gs2ExchangeUpdateNamespaceResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2ExchangeUpdateNamespaceRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "deleteNamespace":
        Gs2ExchangeDeleteNamespaceMethodCache.put_cache(
            Gs2ExchangeDeleteNamespaceResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2ExchangeDeleteNamespaceRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "getServiceVersion":
        Gs2ExchangeGetServiceVersionMethodCache.put_cache(
            Gs2ExchangeGetServiceVersionResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2ExchangeGetServiceVersionRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "dumpUserDataByUserId":
        Gs2ExchangeDumpUserDataByUserIdMethodCache.put_cache(
            Gs2ExchangeDumpUserDataByUserIdResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2ExchangeDumpUserDataByUserIdRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "checkDumpUserDataByUserId":
        Gs2ExchangeCheckDumpUserDataByUserIdMethodCache.put_cache(
            Gs2ExchangeCheckDumpUserDataByUserIdResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2ExchangeCheckDumpUserDataByUserIdRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "cleanUserDataByUserId":
        Gs2ExchangeCleanUserDataByUserIdMethodCache.put_cache(
            Gs2ExchangeCleanUserDataByUserIdResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2ExchangeCleanUserDataByUserIdRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "checkCleanUserDataByUserId":
        Gs2ExchangeCheckCleanUserDataByUserIdMethodCache.put_cache(
            Gs2ExchangeCheckCleanUserDataByUserIdResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2ExchangeCheckCleanUserDataByUserIdRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "prepareImportUserDataByUserId":
        Gs2ExchangePrepareImportUserDataByUserIdMethodCache.put_cache(
            Gs2ExchangePrepareImportUserDataByUserIdResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2ExchangePrepareImportUserDataByUserIdRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "importUserDataByUserId":
        Gs2ExchangeImportUserDataByUserIdMethodCache.put_cache(
            Gs2ExchangeImportUserDataByUserIdResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2ExchangeImportUserDataByUserIdRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "checkImportUserDataByUserId":
        Gs2ExchangeCheckImportUserDataByUserIdMethodCache.put_cache(
            Gs2ExchangeCheckImportUserDataByUserIdResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2ExchangeCheckImportUserDataByUserIdRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "describeRateModels":
        Gs2ExchangeDescribeRateModelsMethodCache.put_cache(
            Gs2ExchangeDescribeRateModelsResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2ExchangeDescribeRateModelsRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "getRateModel":
        Gs2ExchangeGetRateModelMethodCache.put_cache(
            Gs2ExchangeGetRateModelResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2ExchangeGetRateModelRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "describeRateModelMasters":
        Gs2ExchangeDescribeRateModelMastersMethodCache.put_cache(
            Gs2ExchangeDescribeRateModelMastersResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2ExchangeDescribeRateModelMastersRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "createRateModelMaster":
        Gs2ExchangeCreateRateModelMasterMethodCache.put_cache(
            Gs2ExchangeCreateRateModelMasterResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2ExchangeCreateRateModelMasterRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "getRateModelMaster":
        Gs2ExchangeGetRateModelMasterMethodCache.put_cache(
            Gs2ExchangeGetRateModelMasterResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2ExchangeGetRateModelMasterRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "updateRateModelMaster":
        Gs2ExchangeUpdateRateModelMasterMethodCache.put_cache(
            Gs2ExchangeUpdateRateModelMasterResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2ExchangeUpdateRateModelMasterRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "deleteRateModelMaster":
        Gs2ExchangeDeleteRateModelMasterMethodCache.put_cache(
            Gs2ExchangeDeleteRateModelMasterResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2ExchangeDeleteRateModelMasterRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "describeIncrementalRateModels":
        Gs2ExchangeDescribeIncrementalRateModelsMethodCache.put_cache(
            Gs2ExchangeDescribeIncrementalRateModelsResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2ExchangeDescribeIncrementalRateModelsRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "getIncrementalRateModel":
        Gs2ExchangeGetIncrementalRateModelMethodCache.put_cache(
            Gs2ExchangeGetIncrementalRateModelResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2ExchangeGetIncrementalRateModelRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "describeIncrementalRateModelMasters":
        Gs2ExchangeDescribeIncrementalRateModelMastersMethodCache.put_cache(
            Gs2ExchangeDescribeIncrementalRateModelMastersResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2ExchangeDescribeIncrementalRateModelMastersRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "createIncrementalRateModelMaster":
        Gs2ExchangeCreateIncrementalRateModelMasterMethodCache.put_cache(
            Gs2ExchangeCreateIncrementalRateModelMasterResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2ExchangeCreateIncrementalRateModelMasterRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "getIncrementalRateModelMaster":
        Gs2ExchangeGetIncrementalRateModelMasterMethodCache.put_cache(
            Gs2ExchangeGetIncrementalRateModelMasterResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2ExchangeGetIncrementalRateModelMasterRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "updateIncrementalRateModelMaster":
        Gs2ExchangeUpdateIncrementalRateModelMasterMethodCache.put_cache(
            Gs2ExchangeUpdateIncrementalRateModelMasterResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2ExchangeUpdateIncrementalRateModelMasterRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "deleteIncrementalRateModelMaster":
        Gs2ExchangeDeleteIncrementalRateModelMasterMethodCache.put_cache(
            Gs2ExchangeDeleteIncrementalRateModelMasterResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2ExchangeDeleteIncrementalRateModelMasterRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "exchange":
        Gs2ExchangeExchangeMethodCache.put_cache(
            Gs2ExchangeExchangeResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2ExchangeExchangeRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "exchangeByUserId":
        Gs2ExchangeExchangeByUserIdMethodCache.put_cache(
            Gs2ExchangeExchangeByUserIdResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2ExchangeExchangeByUserIdRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "incrementalExchange":
        Gs2ExchangeIncrementalExchangeMethodCache.put_cache(
            Gs2ExchangeIncrementalExchangeResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2ExchangeIncrementalExchangeRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "incrementalExchangeByUserId":
        Gs2ExchangeIncrementalExchangeByUserIdMethodCache.put_cache(
            Gs2ExchangeIncrementalExchangeByUserIdResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2ExchangeIncrementalExchangeByUserIdRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "exportMaster":
        Gs2ExchangeExportMasterMethodCache.put_cache(
            Gs2ExchangeExportMasterResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2ExchangeExportMasterRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "getCurrentRateMaster":
        Gs2ExchangeGetCurrentRateMasterMethodCache.put_cache(
            Gs2ExchangeGetCurrentRateMasterResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2ExchangeGetCurrentRateMasterRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "preUpdateCurrentRateMaster":
        Gs2ExchangePreUpdateCurrentRateMasterMethodCache.put_cache(
            Gs2ExchangePreUpdateCurrentRateMasterResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2ExchangePreUpdateCurrentRateMasterRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "updateCurrentRateMaster":
        Gs2ExchangeUpdateCurrentRateMasterMethodCache.put_cache(
            Gs2ExchangeUpdateCurrentRateMasterResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2ExchangeUpdateCurrentRateMasterRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "updateCurrentRateMasterFromGitHub":
        Gs2ExchangeUpdateCurrentRateMasterFromGitHubMethodCache.put_cache(
            Gs2ExchangeUpdateCurrentRateMasterFromGitHubResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2ExchangeUpdateCurrentRateMasterFromGitHubRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "createAwaitByUserId":
        Gs2ExchangeCreateAwaitByUserIdMethodCache.put_cache(
            Gs2ExchangeCreateAwaitByUserIdResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2ExchangeCreateAwaitByUserIdRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "describeAwaits":
        Gs2ExchangeDescribeAwaitsMethodCache.put_cache(
            Gs2ExchangeDescribeAwaitsResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2ExchangeDescribeAwaitsRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "describeAwaitsByUserId":
        Gs2ExchangeDescribeAwaitsByUserIdMethodCache.put_cache(
            Gs2ExchangeDescribeAwaitsByUserIdResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2ExchangeDescribeAwaitsByUserIdRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "getAwait":
        Gs2ExchangeGetAwaitMethodCache.put_cache(
            Gs2ExchangeGetAwaitResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2ExchangeGetAwaitRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "getAwaitByUserId":
        Gs2ExchangeGetAwaitByUserIdMethodCache.put_cache(
            Gs2ExchangeGetAwaitByUserIdResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2ExchangeGetAwaitByUserIdRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "acquire":
        Gs2ExchangeAcquireMethodCache.put_cache(
            Gs2ExchangeAcquireResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2ExchangeAcquireRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "acquireByUserId":
        Gs2ExchangeAcquireByUserIdMethodCache.put_cache(
            Gs2ExchangeAcquireByUserIdResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2ExchangeAcquireByUserIdRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "acquireForceByUserId":
        Gs2ExchangeAcquireForceByUserIdMethodCache.put_cache(
            Gs2ExchangeAcquireForceByUserIdResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2ExchangeAcquireForceByUserIdRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "skipByUserId":
        Gs2ExchangeSkipByUserIdMethodCache.put_cache(
            Gs2ExchangeSkipByUserIdResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2ExchangeSkipByUserIdRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "deleteAwait":
        Gs2ExchangeDeleteAwaitMethodCache.put_cache(
            Gs2ExchangeDeleteAwaitResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2ExchangeDeleteAwaitRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "deleteAwaitByUserId":
        Gs2ExchangeDeleteAwaitByUserIdMethodCache.put_cache(
            Gs2ExchangeDeleteAwaitByUserIdResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2ExchangeDeleteAwaitByUserIdRequest.from_dict(_parse(request_payload))
        )
        return
    pass