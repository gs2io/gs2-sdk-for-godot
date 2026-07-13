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
class_name Gs2GradeEzNamespaceDomain
extends RefCounted


var _domain: Gs2GradeNamespaceDomain
var _connection: Gs2Connection
var status: Variant:
    get:
        return _domain.status
var url: Variant:
    get:
        return _domain.url
var upload_token: Variant:
    get:
        return _domain.upload_token
var upload_url: Variant:
    get:
        return _domain.upload_url
var next_page_token: Variant:
    get:
        return _domain.next_page_token
var namespace_name: Variant:
    get:
        return null if _domain == null else _domain.namespace_name


func _init(
    domain: Gs2GradeNamespaceDomain,
    connection: Gs2Connection
):
    _domain = domain
    _connection = connection


func grade_models(
) -> Gs2GradeEzListGradeModelsIterator:
    return Gs2GradeEzListGradeModelsIterator.new(
        _domain,
        _connection
    )


func subscribe_grade_models(
    callback: Callable
) -> int:
    return _domain.subscribe_grade_models(
        func(items): callback.call([] if items == null else items.map(func(v): return Gs2GradeEzGradeModel.from_model(v)))
    )


func unsubscribe_grade_models(
    callback_id: int
) -> void:
    _domain.unsubscribe_grade_models(
        callback_id
    )


func grade_model(
    grade_name
) -> Gs2GradeEzGradeModelDomain:
    return Gs2GradeEzGradeModelDomain.new(
        _domain.grade_model(
            grade_name
        ),
        _connection
    )


func user(
    user_id
) -> Gs2GradeEzUserDomain:
    return Gs2GradeEzUserDomain.new(
        _domain.user(
            user_id
        ),
        _connection
    )


func me(
    game_session
) -> Gs2GradeEzUserGameSessionDomain:
    return Gs2GradeEzUserGameSessionDomain.new(
        _domain.access_token(
            game_session.access_token
        ),
        game_session,
        _connection
    )