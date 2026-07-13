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
class_name Gs2InboxEzDomain
extends RefCounted

signal receive_notification(
    notification: Gs2InboxReceiveNotification
)


var _domain: Gs2Inbox
var _connection: Gs2Connection

func _init(
    ez: Gs2EzDomain
):
    _domain = ez.gs2.inbox
    _connection = ez.connection
    _domain.receive_notification.connect(
        func(notification): receive_notification.emit(notification)
    )


func namespace_(
    namespace_name
) -> Gs2InboxEzNamespaceDomain:
    return Gs2InboxEzNamespaceDomain.new(
        _domain.namespace_(
            namespace_name
        ),
        _connection
    )