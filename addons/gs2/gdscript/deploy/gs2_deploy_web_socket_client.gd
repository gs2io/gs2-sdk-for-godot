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
class_name Gs2DeployWebSocketClient
extends Gs2AbstractWebSocketClient


func pre_create_stack(request: Gs2DeployPreCreateStackRequest) -> Gs2AsyncResult:
    var body = {}
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.dry_run:
        body["xGs2DryRun"] = "true"
    var response = await session.send("deploy", "stack", "preCreateStack", body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2DeployPreCreateStackResult.from_dict(response.body), null)


func pre_validate(request: Gs2DeployPreValidateRequest) -> Gs2AsyncResult:
    var body = {}
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.dry_run:
        body["xGs2DryRun"] = "true"
    var response = await session.send("deploy", "stack", "preValidate", body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2DeployPreValidateResult.from_dict(response.body), null)


func validate(request: Gs2DeployValidateRequest) -> Gs2AsyncResult:
    var body = {}
    if request.mode != null:
        body["mode"] = request.mode
    if request.template != null:
        body["template"] = request.template
    if request.upload_token != null:
        body["uploadToken"] = request.upload_token
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.dry_run:
        body["xGs2DryRun"] = "true"
    var response = await session.send("deploy", "stack", "validate", body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2DeployValidateResult.from_dict(response.body), null)


func pre_update_stack(request: Gs2DeployPreUpdateStackRequest) -> Gs2AsyncResult:
    var body = {}
    if request.stack_name != null:
        body["stackName"] = request.stack_name
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.dry_run:
        body["xGs2DryRun"] = "true"
    var response = await session.send("deploy", "stack", "preUpdateStack", body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2DeployPreUpdateStackResult.from_dict(response.body), null)


func pre_change_set(request: Gs2DeployPreChangeSetRequest) -> Gs2AsyncResult:
    var body = {}
    if request.stack_name != null:
        body["stackName"] = request.stack_name
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.dry_run:
        body["xGs2DryRun"] = "true"
    var response = await session.send("deploy", "stack", "preChangeSet", body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2DeployPreChangeSetResult.from_dict(response.body), null)


func get_service_version(request: Gs2DeployGetServiceVersionRequest) -> Gs2AsyncResult:
    var body = {}
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.dry_run:
        body["xGs2DryRun"] = "true"
    var response = await session.send("deploy", "stack", "getServiceVersion", body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2DeployGetServiceVersionResult.from_dict(response.body), null)