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
class_name Gs2GatewayServiceCache
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
        Gs2GatewayDescribeNamespacesMethodCache.put_cache(
            Gs2GatewayDescribeNamespacesResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2GatewayDescribeNamespacesRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "createNamespace":
        Gs2GatewayCreateNamespaceMethodCache.put_cache(
            Gs2GatewayCreateNamespaceResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2GatewayCreateNamespaceRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "getNamespaceStatus":
        Gs2GatewayGetNamespaceStatusMethodCache.put_cache(
            Gs2GatewayGetNamespaceStatusResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2GatewayGetNamespaceStatusRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "getNamespace":
        Gs2GatewayGetNamespaceMethodCache.put_cache(
            Gs2GatewayGetNamespaceResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2GatewayGetNamespaceRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "updateNamespace":
        Gs2GatewayUpdateNamespaceMethodCache.put_cache(
            Gs2GatewayUpdateNamespaceResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2GatewayUpdateNamespaceRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "deleteNamespace":
        Gs2GatewayDeleteNamespaceMethodCache.put_cache(
            Gs2GatewayDeleteNamespaceResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2GatewayDeleteNamespaceRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "getServiceVersion":
        Gs2GatewayGetServiceVersionMethodCache.put_cache(
            Gs2GatewayGetServiceVersionResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2GatewayGetServiceVersionRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "dumpUserDataByUserId":
        Gs2GatewayDumpUserDataByUserIdMethodCache.put_cache(
            Gs2GatewayDumpUserDataByUserIdResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2GatewayDumpUserDataByUserIdRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "checkDumpUserDataByUserId":
        Gs2GatewayCheckDumpUserDataByUserIdMethodCache.put_cache(
            Gs2GatewayCheckDumpUserDataByUserIdResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2GatewayCheckDumpUserDataByUserIdRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "cleanUserDataByUserId":
        Gs2GatewayCleanUserDataByUserIdMethodCache.put_cache(
            Gs2GatewayCleanUserDataByUserIdResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2GatewayCleanUserDataByUserIdRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "checkCleanUserDataByUserId":
        Gs2GatewayCheckCleanUserDataByUserIdMethodCache.put_cache(
            Gs2GatewayCheckCleanUserDataByUserIdResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2GatewayCheckCleanUserDataByUserIdRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "prepareImportUserDataByUserId":
        Gs2GatewayPrepareImportUserDataByUserIdMethodCache.put_cache(
            Gs2GatewayPrepareImportUserDataByUserIdResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2GatewayPrepareImportUserDataByUserIdRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "importUserDataByUserId":
        Gs2GatewayImportUserDataByUserIdMethodCache.put_cache(
            Gs2GatewayImportUserDataByUserIdResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2GatewayImportUserDataByUserIdRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "checkImportUserDataByUserId":
        Gs2GatewayCheckImportUserDataByUserIdMethodCache.put_cache(
            Gs2GatewayCheckImportUserDataByUserIdResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2GatewayCheckImportUserDataByUserIdRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "describeWebSocketSessions":
        Gs2GatewayDescribeWebSocketSessionsMethodCache.put_cache(
            Gs2GatewayDescribeWebSocketSessionsResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2GatewayDescribeWebSocketSessionsRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "describeWebSocketSessionsByUserId":
        Gs2GatewayDescribeWebSocketSessionsByUserIdMethodCache.put_cache(
            Gs2GatewayDescribeWebSocketSessionsByUserIdResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2GatewayDescribeWebSocketSessionsByUserIdRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "setUserId":
        Gs2GatewaySetUserIdMethodCache.put_cache(
            Gs2GatewaySetUserIdResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2GatewaySetUserIdRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "setUserIdByUserId":
        Gs2GatewaySetUserIdByUserIdMethodCache.put_cache(
            Gs2GatewaySetUserIdByUserIdResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2GatewaySetUserIdByUserIdRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "sendNotification":
        Gs2GatewaySendNotificationMethodCache.put_cache(
            Gs2GatewaySendNotificationResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2GatewaySendNotificationRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "disconnectByUserId":
        Gs2GatewayDisconnectByUserIdMethodCache.put_cache(
            Gs2GatewayDisconnectByUserIdResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2GatewayDisconnectByUserIdRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "disconnectAll":
        Gs2GatewayDisconnectAllMethodCache.put_cache(
            Gs2GatewayDisconnectAllResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2GatewayDisconnectAllRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "setFirebaseToken":
        Gs2GatewaySetFirebaseTokenMethodCache.put_cache(
            Gs2GatewaySetFirebaseTokenResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2GatewaySetFirebaseTokenRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "setFirebaseTokenByUserId":
        Gs2GatewaySetFirebaseTokenByUserIdMethodCache.put_cache(
            Gs2GatewaySetFirebaseTokenByUserIdResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2GatewaySetFirebaseTokenByUserIdRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "getFirebaseToken":
        Gs2GatewayGetFirebaseTokenMethodCache.put_cache(
            Gs2GatewayGetFirebaseTokenResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2GatewayGetFirebaseTokenRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "getFirebaseTokenByUserId":
        Gs2GatewayGetFirebaseTokenByUserIdMethodCache.put_cache(
            Gs2GatewayGetFirebaseTokenByUserIdResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2GatewayGetFirebaseTokenByUserIdRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "deleteFirebaseToken":
        Gs2GatewayDeleteFirebaseTokenMethodCache.put_cache(
            Gs2GatewayDeleteFirebaseTokenResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2GatewayDeleteFirebaseTokenRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "deleteFirebaseTokenByUserId":
        Gs2GatewayDeleteFirebaseTokenByUserIdMethodCache.put_cache(
            Gs2GatewayDeleteFirebaseTokenByUserIdResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2GatewayDeleteFirebaseTokenByUserIdRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "sendMobileNotificationByUserId":
        Gs2GatewaySendMobileNotificationByUserIdMethodCache.put_cache(
            Gs2GatewaySendMobileNotificationByUserIdResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2GatewaySendMobileNotificationByUserIdRequest.from_dict(_parse(request_payload))
        )
        return
    pass