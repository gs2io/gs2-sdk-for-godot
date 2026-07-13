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
class_name Gs2FreezeWebSocketClient
extends Gs2AbstractWebSocketClient


func promote_stage(request: Gs2FreezePromoteStageRequest) -> Gs2AsyncResult:
    var body = {}
    if request.stage_name != null:
        body["stageName"] = request.stage_name
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.dry_run:
        body["xGs2DryRun"] = "true"
    var response = await session.send("freeze", "stage", "promoteStage", body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2FreezePromoteStageResult.from_dict(response.body), null)


func rollback_stage(request: Gs2FreezeRollbackStageRequest) -> Gs2AsyncResult:
    var body = {}
    if request.stage_name != null:
        body["stageName"] = request.stage_name
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.dry_run:
        body["xGs2DryRun"] = "true"
    var response = await session.send("freeze", "stage", "rollbackStage", body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2FreezeRollbackStageResult.from_dict(response.body), null)