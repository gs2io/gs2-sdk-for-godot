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
class_name Gs2MegaFieldServiceCache
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
        Gs2MegaFieldDescribeNamespacesMethodCache.put_cache(
            Gs2MegaFieldDescribeNamespacesResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2MegaFieldDescribeNamespacesRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "createNamespace":
        Gs2MegaFieldCreateNamespaceMethodCache.put_cache(
            Gs2MegaFieldCreateNamespaceResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2MegaFieldCreateNamespaceRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "getNamespaceStatus":
        Gs2MegaFieldGetNamespaceStatusMethodCache.put_cache(
            Gs2MegaFieldGetNamespaceStatusResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2MegaFieldGetNamespaceStatusRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "getNamespace":
        Gs2MegaFieldGetNamespaceMethodCache.put_cache(
            Gs2MegaFieldGetNamespaceResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2MegaFieldGetNamespaceRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "updateNamespace":
        Gs2MegaFieldUpdateNamespaceMethodCache.put_cache(
            Gs2MegaFieldUpdateNamespaceResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2MegaFieldUpdateNamespaceRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "deleteNamespace":
        Gs2MegaFieldDeleteNamespaceMethodCache.put_cache(
            Gs2MegaFieldDeleteNamespaceResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2MegaFieldDeleteNamespaceRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "getServiceVersion":
        Gs2MegaFieldGetServiceVersionMethodCache.put_cache(
            Gs2MegaFieldGetServiceVersionResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2MegaFieldGetServiceVersionRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "describeAreaModels":
        Gs2MegaFieldDescribeAreaModelsMethodCache.put_cache(
            Gs2MegaFieldDescribeAreaModelsResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2MegaFieldDescribeAreaModelsRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "getAreaModel":
        Gs2MegaFieldGetAreaModelMethodCache.put_cache(
            Gs2MegaFieldGetAreaModelResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2MegaFieldGetAreaModelRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "describeAreaModelMasters":
        Gs2MegaFieldDescribeAreaModelMastersMethodCache.put_cache(
            Gs2MegaFieldDescribeAreaModelMastersResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2MegaFieldDescribeAreaModelMastersRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "createAreaModelMaster":
        Gs2MegaFieldCreateAreaModelMasterMethodCache.put_cache(
            Gs2MegaFieldCreateAreaModelMasterResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2MegaFieldCreateAreaModelMasterRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "getAreaModelMaster":
        Gs2MegaFieldGetAreaModelMasterMethodCache.put_cache(
            Gs2MegaFieldGetAreaModelMasterResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2MegaFieldGetAreaModelMasterRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "updateAreaModelMaster":
        Gs2MegaFieldUpdateAreaModelMasterMethodCache.put_cache(
            Gs2MegaFieldUpdateAreaModelMasterResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2MegaFieldUpdateAreaModelMasterRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "deleteAreaModelMaster":
        Gs2MegaFieldDeleteAreaModelMasterMethodCache.put_cache(
            Gs2MegaFieldDeleteAreaModelMasterResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2MegaFieldDeleteAreaModelMasterRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "describeLayerModels":
        Gs2MegaFieldDescribeLayerModelsMethodCache.put_cache(
            Gs2MegaFieldDescribeLayerModelsResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2MegaFieldDescribeLayerModelsRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "getLayerModel":
        Gs2MegaFieldGetLayerModelMethodCache.put_cache(
            Gs2MegaFieldGetLayerModelResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2MegaFieldGetLayerModelRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "describeLayerModelMasters":
        Gs2MegaFieldDescribeLayerModelMastersMethodCache.put_cache(
            Gs2MegaFieldDescribeLayerModelMastersResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2MegaFieldDescribeLayerModelMastersRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "createLayerModelMaster":
        Gs2MegaFieldCreateLayerModelMasterMethodCache.put_cache(
            Gs2MegaFieldCreateLayerModelMasterResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2MegaFieldCreateLayerModelMasterRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "getLayerModelMaster":
        Gs2MegaFieldGetLayerModelMasterMethodCache.put_cache(
            Gs2MegaFieldGetLayerModelMasterResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2MegaFieldGetLayerModelMasterRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "updateLayerModelMaster":
        Gs2MegaFieldUpdateLayerModelMasterMethodCache.put_cache(
            Gs2MegaFieldUpdateLayerModelMasterResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2MegaFieldUpdateLayerModelMasterRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "deleteLayerModelMaster":
        Gs2MegaFieldDeleteLayerModelMasterMethodCache.put_cache(
            Gs2MegaFieldDeleteLayerModelMasterResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2MegaFieldDeleteLayerModelMasterRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "exportMaster":
        Gs2MegaFieldExportMasterMethodCache.put_cache(
            Gs2MegaFieldExportMasterResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2MegaFieldExportMasterRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "getCurrentFieldMaster":
        Gs2MegaFieldGetCurrentFieldMasterMethodCache.put_cache(
            Gs2MegaFieldGetCurrentFieldMasterResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2MegaFieldGetCurrentFieldMasterRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "preUpdateCurrentFieldMaster":
        Gs2MegaFieldPreUpdateCurrentFieldMasterMethodCache.put_cache(
            Gs2MegaFieldPreUpdateCurrentFieldMasterResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2MegaFieldPreUpdateCurrentFieldMasterRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "updateCurrentFieldMaster":
        Gs2MegaFieldUpdateCurrentFieldMasterMethodCache.put_cache(
            Gs2MegaFieldUpdateCurrentFieldMasterResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2MegaFieldUpdateCurrentFieldMasterRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "updateCurrentFieldMasterFromGitHub":
        Gs2MegaFieldUpdateCurrentFieldMasterFromGitHubMethodCache.put_cache(
            Gs2MegaFieldUpdateCurrentFieldMasterFromGitHubResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2MegaFieldUpdateCurrentFieldMasterFromGitHubRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "putPosition":
        Gs2MegaFieldPutPositionMethodCache.put_cache(
            Gs2MegaFieldPutPositionResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2MegaFieldPutPositionRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "putPositionByUserId":
        Gs2MegaFieldPutPositionByUserIdMethodCache.put_cache(
            Gs2MegaFieldPutPositionByUserIdResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2MegaFieldPutPositionByUserIdRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "fetchPosition":
        Gs2MegaFieldFetchPositionMethodCache.put_cache(
            Gs2MegaFieldFetchPositionResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2MegaFieldFetchPositionRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "fetchPositionFromSystem":
        Gs2MegaFieldFetchPositionFromSystemMethodCache.put_cache(
            Gs2MegaFieldFetchPositionFromSystemResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2MegaFieldFetchPositionFromSystemRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "nearUserIds":
        Gs2MegaFieldNearUserIdsMethodCache.put_cache(
            Gs2MegaFieldNearUserIdsResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2MegaFieldNearUserIdsRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "nearUserIdsFromSystem":
        Gs2MegaFieldNearUserIdsFromSystemMethodCache.put_cache(
            Gs2MegaFieldNearUserIdsFromSystemResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2MegaFieldNearUserIdsFromSystemRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "action":
        Gs2MegaFieldActionMethodCache.put_cache(
            Gs2MegaFieldActionResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2MegaFieldActionRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "actionByUserId":
        Gs2MegaFieldActionByUserIdMethodCache.put_cache(
            Gs2MegaFieldActionByUserIdResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2MegaFieldActionByUserIdRequest.from_dict(_parse(request_payload))
        )
        return
    pass