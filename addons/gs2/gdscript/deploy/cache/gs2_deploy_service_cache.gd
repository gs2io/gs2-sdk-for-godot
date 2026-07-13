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
class_name Gs2DeployServiceCache
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
    if method == "describeStacks":
        Gs2DeployDescribeStacksMethodCache.put_cache(
            Gs2DeployDescribeStacksResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2DeployDescribeStacksRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "preCreateStack":
        Gs2DeployPreCreateStackMethodCache.put_cache(
            Gs2DeployPreCreateStackResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2DeployPreCreateStackRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "createStack":
        Gs2DeployCreateStackMethodCache.put_cache(
            Gs2DeployCreateStackResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2DeployCreateStackRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "createStackFromGitHub":
        Gs2DeployCreateStackFromGitHubMethodCache.put_cache(
            Gs2DeployCreateStackFromGitHubResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2DeployCreateStackFromGitHubRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "preValidate":
        Gs2DeployPreValidateMethodCache.put_cache(
            Gs2DeployPreValidateResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2DeployPreValidateRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "validate":
        Gs2DeployValidateMethodCache.put_cache(
            Gs2DeployValidateResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2DeployValidateRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "getStackStatus":
        Gs2DeployGetStackStatusMethodCache.put_cache(
            Gs2DeployGetStackStatusResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2DeployGetStackStatusRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "getStack":
        Gs2DeployGetStackMethodCache.put_cache(
            Gs2DeployGetStackResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2DeployGetStackRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "preUpdateStack":
        Gs2DeployPreUpdateStackMethodCache.put_cache(
            Gs2DeployPreUpdateStackResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2DeployPreUpdateStackRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "updateStack":
        Gs2DeployUpdateStackMethodCache.put_cache(
            Gs2DeployUpdateStackResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2DeployUpdateStackRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "preChangeSet":
        Gs2DeployPreChangeSetMethodCache.put_cache(
            Gs2DeployPreChangeSetResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2DeployPreChangeSetRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "changeSet":
        Gs2DeployChangeSetMethodCache.put_cache(
            Gs2DeployChangeSetResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2DeployChangeSetRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "updateStackFromGitHub":
        Gs2DeployUpdateStackFromGitHubMethodCache.put_cache(
            Gs2DeployUpdateStackFromGitHubResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2DeployUpdateStackFromGitHubRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "deleteStack":
        Gs2DeployDeleteStackMethodCache.put_cache(
            Gs2DeployDeleteStackResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2DeployDeleteStackRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "forceDeleteStack":
        Gs2DeployForceDeleteStackMethodCache.put_cache(
            Gs2DeployForceDeleteStackResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2DeployForceDeleteStackRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "deleteStackResources":
        Gs2DeployDeleteStackResourcesMethodCache.put_cache(
            Gs2DeployDeleteStackResourcesResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2DeployDeleteStackResourcesRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "deleteStackEntity":
        Gs2DeployDeleteStackEntityMethodCache.put_cache(
            Gs2DeployDeleteStackEntityResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2DeployDeleteStackEntityRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "getServiceVersion":
        Gs2DeployGetServiceVersionMethodCache.put_cache(
            Gs2DeployGetServiceVersionResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2DeployGetServiceVersionRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "describeResources":
        Gs2DeployDescribeResourcesMethodCache.put_cache(
            Gs2DeployDescribeResourcesResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2DeployDescribeResourcesRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "getResource":
        Gs2DeployGetResourceMethodCache.put_cache(
            Gs2DeployGetResourceResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2DeployGetResourceRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "describeEvents":
        Gs2DeployDescribeEventsMethodCache.put_cache(
            Gs2DeployDescribeEventsResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2DeployDescribeEventsRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "getEvent":
        Gs2DeployGetEventMethodCache.put_cache(
            Gs2DeployGetEventResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2DeployGetEventRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "describeOutputs":
        Gs2DeployDescribeOutputsMethodCache.put_cache(
            Gs2DeployDescribeOutputsResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2DeployDescribeOutputsRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "getOutput":
        Gs2DeployGetOutputMethodCache.put_cache(
            Gs2DeployGetOutputResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2DeployGetOutputRequest.from_dict(_parse(request_payload))
        )
        return
    pass