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
class_name Gs2RealtimeEzDomain
extends RefCounted

signal create_notification(
    notification: Gs2RealtimeCreateNotification
)


var _domain: Gs2Realtime
var _connection: Gs2Connection
var timestamp: Variant:
    get:
        return _domain.timestamp

func _init(
    ez: Gs2EzDomainCore
):
    _domain = ez.gs2.realtime
    _connection = ez.connection
    _domain.create_notification.connect(
        func(notification): create_notification.emit(notification)
    )


func namespace_(
    namespace_name
) -> Gs2RealtimeEzNamespaceDomain:
    return Gs2RealtimeEzNamespaceDomain.new(
        _domain.namespace_(
            namespace_name
        ),
        _connection
    )