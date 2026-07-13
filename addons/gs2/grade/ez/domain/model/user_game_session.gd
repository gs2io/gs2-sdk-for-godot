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
class_name Gs2GradeEzUserGameSessionDomain
extends RefCounted


var _domain: Gs2GradeUserAccessTokenDomain
var _game_session: Variant
var _connection: Gs2Connection
var experience_namespace_name: Variant:
    get:
        return _domain.experience_namespace_name
var next_page_token: Variant:
    get:
        return _domain.next_page_token
var namespace_name: Variant:
    get:
        return null if _domain == null else _domain.namespace_name
var user_id: Variant:
    get:
        return null if _domain == null else _domain.user_id


func _init(
    domain: Gs2GradeUserAccessTokenDomain,
    game_session: Variant,
    connection: Gs2Connection
):
    _domain = domain
    _game_session = game_session
    _connection = connection


func statuses(
    grade_name = null
) -> Gs2GradeEzListStatusesIterator:
    return Gs2GradeEzListStatusesIterator.new(
        _domain,
        _game_session,
        _connection,
        grade_name
    )


func subscribe_statuses(
    callback: Callable,
    grade_name = null
) -> int:
    return _domain.subscribe_statuses(
        func(items): callback.call([] if items == null else items.map(func(v): return Gs2GradeEzStatus.from_model(v))),
        grade_name
    )


func unsubscribe_statuses(
    callback_id: int,
    grade_name = null
) -> void:
    _domain.unsubscribe_statuses(
        callback_id,
        grade_name
    )


func status(
    grade_name,
    property_id
) -> Gs2GradeEzStatusGameSessionDomain:
    return Gs2GradeEzStatusGameSessionDomain.new(
        _domain.status(
            grade_name,
            property_id
        ),
        _game_session,
        _connection
    )