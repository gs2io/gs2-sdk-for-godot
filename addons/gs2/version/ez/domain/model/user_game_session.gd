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
class_name Gs2VersionEzUserGameSessionDomain
extends RefCounted


var _domain: Gs2VersionUserAccessTokenDomain
var _game_session: Variant
var _connection: Gs2Connection
var body: Variant:
    get:
        return _domain.body
var signature: Variant:
    get:
        return _domain.signature
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
    domain: Gs2VersionUserAccessTokenDomain,
    game_session: Variant,
    connection: Gs2Connection
):
    _domain = domain
    _game_session = game_session
    _connection = connection


func accept_versions(
) -> Gs2VersionEzListIterator:
    return Gs2VersionEzListIterator.new(
        _domain,
        _game_session,
        _connection
    )


func subscribe_accept_versions(
    callback: Callable
) -> int:
    return _domain.subscribe_accept_versions(
        func(items): callback.call([] if items == null else items.map(func(v): return Gs2VersionEzAcceptVersion.from_model(v)))
    )


func unsubscribe_accept_versions(
    callback_id: int
) -> void:
    _domain.unsubscribe_accept_versions(
        callback_id
    )


func accept_version(
    version_name
) -> Gs2VersionEzAcceptVersionGameSessionDomain:
    return Gs2VersionEzAcceptVersionGameSessionDomain.new(
        _domain.accept_version(
            version_name
        ),
        _game_session,
        _connection
    )


func checker(
) -> Gs2VersionEzCheckerGameSessionDomain:
    return Gs2VersionEzCheckerGameSessionDomain.new(
        _domain.checker(
        ),
        _game_session,
        _connection
    )