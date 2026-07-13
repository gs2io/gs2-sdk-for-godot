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
# deny overwrite
class_name Gs2MatchmakingEzDomain
extends RefCounted

signal join_notification(
    notification: Gs2MatchmakingJoinNotification
)

signal leave_notification(
    notification: Gs2MatchmakingLeaveNotification
)

signal complete_notification(
    notification: Gs2MatchmakingCompleteNotification
)

signal change_rating_notification(
    notification: Gs2MatchmakingChangeRatingNotification
)


var _domain: Gs2Matchmaking
var _connection: Gs2Connection

func _init(
    ez: Gs2EzDomain
):
    _domain = ez.gs2.matchmaking
    _connection = ez.connection
    _domain.join_notification.connect(
        func(notification): join_notification.emit(notification)
    )
    _domain.leave_notification.connect(
        func(notification): leave_notification.emit(notification)
    )
    _domain.complete_notification.connect(
        func(notification): complete_notification.emit(notification)
    )
    _domain.change_rating_notification.connect(
        func(notification): change_rating_notification.emit(notification)
    )


func namespace_(
    namespace_name
) -> Gs2MatchmakingEzNamespaceDomain:
    return Gs2MatchmakingEzNamespaceDomain.new(
        _domain.namespace_(
            namespace_name
        ),
        _connection
    )
