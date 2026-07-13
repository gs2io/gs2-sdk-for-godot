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
class_name Gs2GuildEzDomain
extends RefCounted

signal receive_request_notification(
    notification: Gs2GuildReceiveRequestNotification
)

signal remove_request_notification(
    notification: Gs2GuildRemoveRequestNotification
)

signal change_notification(
    notification: Gs2GuildChangeNotification
)

signal join_notification(
    notification: Gs2GuildJoinNotification
)

signal leave_notification(
    notification: Gs2GuildLeaveNotification
)

signal change_member_notification(
    notification: Gs2GuildChangeMemberNotification
)


var _domain: Gs2Guild
var _connection: Gs2Connection

func _init(
    ez: Gs2EzDomain
):
    _domain = ez.gs2.guild
    _connection = ez.connection
    _domain.receive_request_notification.connect(
        func(notification): receive_request_notification.emit(notification)
    )
    _domain.remove_request_notification.connect(
        func(notification): remove_request_notification.emit(notification)
    )
    _domain.change_notification.connect(
        func(notification): change_notification.emit(notification)
    )
    _domain.join_notification.connect(
        func(notification): join_notification.emit(notification)
    )
    _domain.leave_notification.connect(
        func(notification): leave_notification.emit(notification)
    )
    _domain.change_member_notification.connect(
        func(notification): change_member_notification.emit(notification)
    )


func namespace_(
    namespace_name
) -> Gs2GuildEzNamespaceDomain:
    return Gs2GuildEzNamespaceDomain.new(
        _domain.namespace_(
            namespace_name
        ),
        _connection
    )