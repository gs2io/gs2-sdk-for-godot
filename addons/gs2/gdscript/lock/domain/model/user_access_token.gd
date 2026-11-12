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
class_name Gs2LockUserAccessTokenDomain
extends RefCounted

var _gs2: Gs2DomainCore
var _client: Gs2LockRestClient
var namespace_name: Variant = null
var access_token: Gs2AuthAccessToken
var user_id: Variant:
    get:
        return null if access_token == null else access_token.user_id


func _init(
    gs2: Gs2DomainCore,
    namespace_name_,
    access_token_
):
    _gs2 = gs2
    _client = Gs2LockRestClient.new(gs2.rest_session)
    namespace_name = namespace_name_
    access_token = access_token_
func mutex(
    property_id
) -> Gs2LockMutexAccessTokenDomain:
    return Gs2LockMutexAccessTokenDomain.new(
        _gs2,
        namespace_name,
        access_token,
        property_id
    )