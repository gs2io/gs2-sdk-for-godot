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
class_name Gs2FreezeServiceCache
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
    if method == "describeStages":
        Gs2FreezeDescribeStagesMethodCache.put_cache(
            Gs2FreezeDescribeStagesResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2FreezeDescribeStagesRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "getStage":
        Gs2FreezeGetStageMethodCache.put_cache(
            Gs2FreezeGetStageResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2FreezeGetStageRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "promoteStage":
        Gs2FreezePromoteStageMethodCache.put_cache(
            Gs2FreezePromoteStageResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2FreezePromoteStageRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "rollbackStage":
        Gs2FreezeRollbackStageMethodCache.put_cache(
            Gs2FreezeRollbackStageResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2FreezeRollbackStageRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "describeOutputs":
        Gs2FreezeDescribeOutputsMethodCache.put_cache(
            Gs2FreezeDescribeOutputsResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2FreezeDescribeOutputsRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "getOutput":
        Gs2FreezeGetOutputMethodCache.put_cache(
            Gs2FreezeGetOutputResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2FreezeGetOutputRequest.from_dict(_parse(request_payload))
        )
        return
    pass