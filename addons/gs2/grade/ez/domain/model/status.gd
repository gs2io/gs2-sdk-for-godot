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
class_name Gs2GradeEzStatusDomain
extends RefCounted


var _domain: Gs2GradeStatusDomain
var _connection: Gs2Connection
var experience_namespace_name: Variant:
    get:
        return _domain.experience_namespace_name
var namespace_name: Variant:
    get:
        return null if _domain == null else _domain.namespace_name
var user_id: Variant:
    get:
        return null if _domain == null else _domain.user_id
var grade_name: Variant:
    get:
        return null if _domain == null else _domain.grade_name
var property_id: Variant:
    get:
        return null if _domain == null else _domain.property_id


func _init(
    domain: Gs2GradeStatusDomain,
    connection: Gs2Connection
):
    _domain = domain
    _connection = connection