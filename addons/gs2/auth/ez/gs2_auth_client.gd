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
class_name Gs2AuthClient
extends RefCounted


var _connection: Gs2Connection
var _rest_client: Gs2AuthRestClient


func _init(connection: Gs2Connection):
    _connection = connection
    _rest_client = Gs2AuthRestClient.new(connection.rest_session)


func login(body, signature, key_id = null) -> Gs2AsyncResult:
    var request_action = func():
        var request = Gs2AuthLoginBySignatureRequest.new()
        request.key_id = key_id
        request.body = body
        request.signature = signature
        return await _rest_client.login_by_signature(request)
    var async_result = await _connection.run(null, request_action)
    if async_result.error != null:
        return Gs2AsyncResult.new(null, async_result.error)
    return Gs2AsyncResult.new(null if async_result.result == null else Gs2AuthEzLoginResult.from_model(async_result.result), null)