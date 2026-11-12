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
class_name Gs2VersionCheckerDomain
extends RefCounted

var _gs2: Gs2DomainCore
var _client: Gs2VersionRestClient
var namespace_name: Variant = null
var user_id: Variant = null
var project_token: Variant = null
var warnings: Variant = null
var errors: Variant = null
var body: Variant = null
var signature: Variant = null


func _init(
    gs2: Gs2DomainCore,
    namespace_name_,
    user_id_
):
    _gs2 = gs2
    _client = Gs2VersionRestClient.new(gs2.rest_session)
    namespace_name = namespace_name_
    user_id = user_id_


func check_version(
    request: Gs2VersionCheckVersionByUserIdRequest
) -> Gs2AsyncResult:
    request = request.with_context_stack(_gs2.default_context_stack if request.context_stack == null or request.context_stack == "" else request.context_stack)
    request = request.with_namespace_name(namespace_name)
    request = request.with_user_id(user_id)
    var async_result = await Gs2VersionCheckVersionByUserIdMethodCache.invoke(
        _gs2.cache,
        user_id,
        null,
        request,
        func(): return await _client.check_version_by_user_id(request)
    )
    if async_result.error != null:
        return async_result
    var result = async_result.result
    var domain = self
    self.project_token = null if result == null else result.project_token
    domain.project_token = self.project_token
    self.warnings = null if result == null else result.warnings
    domain.warnings = self.warnings
    self.errors = null if result == null else result.errors
    domain.errors = self.errors
    return Gs2AsyncResult.new(domain, null)