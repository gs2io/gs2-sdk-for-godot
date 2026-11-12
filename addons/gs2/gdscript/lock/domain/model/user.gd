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
class_name Gs2LockUserDomain
extends RefCounted

var _gs2: Gs2DomainCore
var _client: Gs2LockRestClient
var namespace_name: Variant = null
var user_id: Variant = null


func _init(
    gs2: Gs2DomainCore,
    namespace_name_,
    user_id_
):
    _gs2 = gs2
    _client = Gs2LockRestClient.new(gs2.rest_session)
    namespace_name = namespace_name_
    user_id = user_id_
func mutex(
    property_id
) -> Gs2LockMutexDomain:
    return Gs2LockMutexDomain.new(
        _gs2,
        namespace_name,
        user_id,
        property_id
    )