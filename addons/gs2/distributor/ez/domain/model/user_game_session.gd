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
class_name Gs2DistributorEzUserGameSessionDomain
extends RefCounted


var _domain: Gs2DistributorUserAccessTokenDomain
var _game_session: Gs2GameSessionBase
var _connection: Gs2Connection
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
    domain: Gs2DistributorUserAccessTokenDomain,
    game_session: Gs2GameSessionBase,
    connection: Gs2Connection
):
    _domain = domain
    _game_session = game_session
    _connection = connection


func user_data(
) -> Gs2DistributorEzDescribeUserDataIterator:
    return Gs2DistributorEzDescribeUserDataIterator.new(
        _domain,
        _game_session,
        _connection
    )


func subscribe_user_data(
    callback: Callable
) -> int:
    return _domain.subscribe_user_data(
        func(items): callback.call([] if items == null else items.map(func(v): return Gs2DistributorEzUserDataEntry.from_model(v)))
    )


func unsubscribe_user_data(
    callback_id: int
) -> void:
    _domain.unsubscribe_user_data(
        callback_id
    )


func stamp_sheet_result(
    transaction_id
) -> Gs2DistributorEzStampSheetResultGameSessionDomain:
    return Gs2DistributorEzStampSheetResultGameSessionDomain.new(
        _domain.stamp_sheet_result(
            transaction_id
        ),
        _game_session,
        _connection
    )


func transaction_result(
    transaction_id
) -> Gs2DistributorEzTransactionResultGameSessionDomain:
    return Gs2DistributorEzTransactionResultGameSessionDomain.new(
        _domain.transaction_result(
            transaction_id
        ),
        _game_session,
        _connection
    )