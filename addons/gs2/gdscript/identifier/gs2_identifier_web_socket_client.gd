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
class_name Gs2IdentifierWebSocketClient
extends Gs2AbstractWebSocketClient


func create_user(request: Gs2IdentifierCreateUserRequest) -> Gs2AsyncResult:
    var body = {}
    if request.name != null:
        body["name"] = request.name
    if request.description != null:
        body["description"] = request.description
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.dry_run:
        body["xGs2DryRun"] = "true"
    var response = await session.send("identifier", "user", "createUser", body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2IdentifierCreateUserResult.from_dict(response.body), null)


func update_user(request: Gs2IdentifierUpdateUserRequest) -> Gs2AsyncResult:
    var body = {}
    if request.user_name != null:
        body["userName"] = request.user_name
    if request.description != null:
        body["description"] = request.description
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.dry_run:
        body["xGs2DryRun"] = "true"
    var response = await session.send("identifier", "user", "updateUser", body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2IdentifierUpdateUserResult.from_dict(response.body), null)


func get_user(request: Gs2IdentifierGetUserRequest) -> Gs2AsyncResult:
    var body = {}
    if request.user_name != null:
        body["userName"] = request.user_name
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.dry_run:
        body["xGs2DryRun"] = "true"
    var response = await session.send("identifier", "user", "getUser", body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2IdentifierGetUserResult.from_dict(response.body), null)


func delete_user(request: Gs2IdentifierDeleteUserRequest) -> Gs2AsyncResult:
    var body = {}
    if request.user_name != null:
        body["userName"] = request.user_name
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.dry_run:
        body["xGs2DryRun"] = "true"
    var response = await session.send("identifier", "user", "deleteUser", body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2IdentifierDeleteUserResult.from_dict(response.body), null)


func create_identifier(request: Gs2IdentifierCreateIdentifierRequest) -> Gs2AsyncResult:
    var body = {}
    if request.user_name != null:
        body["userName"] = request.user_name
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.dry_run:
        body["xGs2DryRun"] = "true"
    var response = await session.send("identifier", "identifier", "createIdentifier", body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2IdentifierCreateIdentifierResult.from_dict(response.body), null)


func get_identifier(request: Gs2IdentifierGetIdentifierRequest) -> Gs2AsyncResult:
    var body = {}
    if request.user_name != null:
        body["userName"] = request.user_name
    if request.client_id != null:
        body["clientId"] = request.client_id
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.dry_run:
        body["xGs2DryRun"] = "true"
    var response = await session.send("identifier", "identifier", "getIdentifier", body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2IdentifierGetIdentifierResult.from_dict(response.body), null)


func delete_identifier(request: Gs2IdentifierDeleteIdentifierRequest) -> Gs2AsyncResult:
    var body = {}
    if request.user_name != null:
        body["userName"] = request.user_name
    if request.client_id != null:
        body["clientId"] = request.client_id
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.dry_run:
        body["xGs2DryRun"] = "true"
    var response = await session.send("identifier", "identifier", "deleteIdentifier", body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2IdentifierDeleteIdentifierResult.from_dict(response.body), null)


func get_service_version(request: Gs2IdentifierGetServiceVersionRequest) -> Gs2AsyncResult:
    var body = {}
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.dry_run:
        body["xGs2DryRun"] = "true"
    var response = await session.send("identifier", "identifier", "getServiceVersion", body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2IdentifierGetServiceVersionResult.from_dict(response.body), null)


func create_password(request: Gs2IdentifierCreatePasswordRequest) -> Gs2AsyncResult:
    var body = {}
    if request.user_name != null:
        body["userName"] = request.user_name
    if request.password != null:
        body["password"] = request.password
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.dry_run:
        body["xGs2DryRun"] = "true"
    var response = await session.send("identifier", "password", "createPassword", body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2IdentifierCreatePasswordResult.from_dict(response.body), null)


func get_password(request: Gs2IdentifierGetPasswordRequest) -> Gs2AsyncResult:
    var body = {}
    if request.user_name != null:
        body["userName"] = request.user_name
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.dry_run:
        body["xGs2DryRun"] = "true"
    var response = await session.send("identifier", "password", "getPassword", body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2IdentifierGetPasswordResult.from_dict(response.body), null)


func enable_mfa(request: Gs2IdentifierEnableMfaRequest) -> Gs2AsyncResult:
    var body = {}
    if request.user_name != null:
        body["userName"] = request.user_name
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.dry_run:
        body["xGs2DryRun"] = "true"
    var response = await session.send("identifier", "password", "enableMfa", body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2IdentifierEnableMfaResult.from_dict(response.body), null)


func challenge_mfa(request: Gs2IdentifierChallengeMfaRequest) -> Gs2AsyncResult:
    var body = {}
    if request.user_name != null:
        body["userName"] = request.user_name
    if request.passcode != null:
        body["passcode"] = request.passcode
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.dry_run:
        body["xGs2DryRun"] = "true"
    var response = await session.send("identifier", "password", "challengeMfa", body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2IdentifierChallengeMfaResult.from_dict(response.body), null)


func disable_mfa(request: Gs2IdentifierDisableMfaRequest) -> Gs2AsyncResult:
    var body = {}
    if request.user_name != null:
        body["userName"] = request.user_name
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.dry_run:
        body["xGs2DryRun"] = "true"
    var response = await session.send("identifier", "password", "disableMfa", body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2IdentifierDisableMfaResult.from_dict(response.body), null)


func delete_password(request: Gs2IdentifierDeletePasswordRequest) -> Gs2AsyncResult:
    var body = {}
    if request.user_name != null:
        body["userName"] = request.user_name
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.dry_run:
        body["xGs2DryRun"] = "true"
    var response = await session.send("identifier", "password", "deletePassword", body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2IdentifierDeletePasswordResult.from_dict(response.body), null)


func login(request: Gs2IdentifierLoginRequest) -> Gs2AsyncResult:
    var body = {}
    if request.client_id != null:
        body["clientId"] = request.client_id
    if request.client_secret != null:
        body["clientSecret"] = request.client_secret
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.dry_run:
        body["xGs2DryRun"] = "true"
    var response = await session.send("identifier", "projectToken", "login", body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2IdentifierLoginResult.from_dict(response.body), null)


func login_by_user(request: Gs2IdentifierLoginByUserRequest) -> Gs2AsyncResult:
    var body = {}
    if request.user_name != null:
        body["userName"] = request.user_name
    if request.password != null:
        body["password"] = request.password
    if request.otp != null:
        body["otp"] = request.otp
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.dry_run:
        body["xGs2DryRun"] = "true"
    var response = await session.send("identifier", "projectToken", "loginByUser", body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2IdentifierLoginByUserResult.from_dict(response.body), null)