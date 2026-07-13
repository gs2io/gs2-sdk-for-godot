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
class_name Gs2AuthWebSocketClient
extends Gs2AbstractWebSocketClient


func login(request: Gs2AuthLoginRequest) -> Gs2AsyncResult:
    var body = {}
    if request.user_id != null:
        body["userId"] = request.user_id
    if request.time_offset != null:
        body["timeOffset"] = request.time_offset
    if request.time_offset_token != null:
        body["timeOffsetToken"] = request.time_offset_token
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.dry_run:
        body["xGs2DryRun"] = "true"
    var response = await session.send("auth", "accessToken", "login", body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2AuthLoginResult.from_dict(response.body), null)


func login_by_signature(request: Gs2AuthLoginBySignatureRequest) -> Gs2AsyncResult:
    var body = {}
    if request.key_id != null:
        body["keyId"] = request.key_id
    if request.body != null:
        body["body"] = request.body
    if request.signature != null:
        body["signature"] = request.signature
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.dry_run:
        body["xGs2DryRun"] = "true"
    var response = await session.send("auth", "accessToken", "loginBySignature", body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2AuthLoginBySignatureResult.from_dict(response.body), null)


func federation(request: Gs2AuthFederationRequest) -> Gs2AsyncResult:
    var body = {}
    if request.original_user_id != null:
        body["originalUserId"] = request.original_user_id
    if request.user_id != null:
        body["userId"] = request.user_id
    if request.policy_document != null:
        body["policyDocument"] = request.policy_document
    if request.time_offset != null:
        body["timeOffset"] = request.time_offset
    if request.time_offset_token != null:
        body["timeOffsetToken"] = request.time_offset_token
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.dry_run:
        body["xGs2DryRun"] = "true"
    var response = await session.send("auth", "accessToken", "federation", body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2AuthFederationResult.from_dict(response.body), null)


func issue_time_offset_token_by_user_id(request: Gs2AuthIssueTimeOffsetTokenByUserIdRequest) -> Gs2AsyncResult:
    var body = {}
    if request.user_id != null:
        body["userId"] = request.user_id
    if request.time_offset != null:
        body["timeOffset"] = request.time_offset
    if request.time_offset_token != null:
        body["timeOffsetToken"] = request.time_offset_token
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.dry_run:
        body["xGs2DryRun"] = "true"
    var response = await session.send("auth", "accessToken", "issueTimeOffsetTokenByUserId", body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2AuthIssueTimeOffsetTokenByUserIdResult.from_dict(response.body), null)


func get_service_version(request: Gs2AuthGetServiceVersionRequest) -> Gs2AsyncResult:
    var body = {}
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.dry_run:
        body["xGs2DryRun"] = "true"
    var response = await session.send("auth", "accessToken", "getServiceVersion", body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2AuthGetServiceVersionResult.from_dict(response.body), null)