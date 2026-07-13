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
class_name Gs2Money2EzUserDomain
extends RefCounted


var _domain: Gs2Money2UserDomain
var _connection: Gs2Connection
var withdraw_transactions: Variant:
    get:
        return null if _domain.withdraw_transactions == null else _domain.withdraw_transactions.map(func(v): return Gs2Money2EzDepositTransaction.from_model(v))
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
    domain: Gs2Money2UserDomain,
    connection: Gs2Connection
):
    _domain = domain
    _connection = connection


func wallet(
    slot
) -> Gs2Money2EzWalletDomain:
    return Gs2Money2EzWalletDomain.new(
        _domain.wallet(
            slot
        ),
        _connection
    )


func subscription_status(
    content_name
) -> Gs2Money2EzSubscriptionStatusDomain:
    return Gs2Money2EzSubscriptionStatusDomain.new(
        _domain.subscription_status(
            content_name
        ),
        _connection
    )