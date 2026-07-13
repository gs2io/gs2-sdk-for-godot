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
class_name Gs2FriendEzDomain
extends RefCounted

signal follow_notification(
    notification: Gs2FriendFollowNotification
)

signal accept_request_notification(
    notification: Gs2FriendAcceptRequestNotification
)

signal reject_request_notification(
    notification: Gs2FriendRejectRequestNotification
)

signal delete_friend_notification(
    notification: Gs2FriendDeleteFriendNotification
)

signal receive_request_notification(
    notification: Gs2FriendReceiveRequestNotification
)

signal cancel_request_notification(
    notification: Gs2FriendCancelRequestNotification
)


var _domain: Gs2Friend
var _connection: Gs2Connection

func _init(
    ez: Gs2EzDomain
):
    _domain = ez.gs2.friend
    _connection = ez.connection
    _domain.follow_notification.connect(
        func(notification): follow_notification.emit(notification)
    )
    _domain.accept_request_notification.connect(
        func(notification): accept_request_notification.emit(notification)
    )
    _domain.reject_request_notification.connect(
        func(notification): reject_request_notification.emit(notification)
    )
    _domain.delete_friend_notification.connect(
        func(notification): delete_friend_notification.emit(notification)
    )
    _domain.receive_request_notification.connect(
        func(notification): receive_request_notification.emit(notification)
    )
    _domain.cancel_request_notification.connect(
        func(notification): cancel_request_notification.emit(notification)
    )


func namespace_(
    namespace_name
) -> Gs2FriendEzNamespaceDomain:
    return Gs2FriendEzNamespaceDomain.new(
        _domain.namespace_(
            namespace_name
        ),
        _connection
    )