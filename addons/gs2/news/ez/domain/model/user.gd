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
class_name Gs2NewsEzUserDomain
extends RefCounted


var _domain: Gs2NewsUserDomain
var _connection: Gs2Connection
var content_hash: Variant:
    get:
        return _domain.content_hash
var template_hash: Variant:
    get:
        return _domain.template_hash
var namespace_name: Variant:
    get:
        return null if _domain == null else _domain.namespace_name
var user_id: Variant:
    get:
        return null if _domain == null else _domain.user_id


func _init(
    domain: Gs2NewsUserDomain,
    connection: Gs2Connection
):
    _domain = domain
    _connection = connection


func news(
) -> Gs2NewsEzNewsDomain:
    return Gs2NewsEzNewsDomain.new(
        _domain.news(
        ),
        _connection
    )