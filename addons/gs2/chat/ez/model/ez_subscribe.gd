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
class_name Gs2ChatEzSubscribe
extends RefCounted


var user_id = null
var room_name = null
var notification_types = []


func with_user_id(v) -> Gs2ChatEzSubscribe:
    user_id = v
    return self


func with_room_name(v) -> Gs2ChatEzSubscribe:
    room_name = v
    return self


func with_notification_types(v) -> Gs2ChatEzSubscribe:
    notification_types = v
    return self


func to_model() -> Gs2ChatSubscribe:
    var ret = Gs2ChatSubscribe.new()
    ret.user_id = user_id
    ret.room_name = room_name
    ret.notification_types = null if notification_types == null else notification_types.map(func(v): return null if v == null else v.to_model())
    return ret


static func from_model(model) -> Gs2ChatEzSubscribe:
    var ret = Gs2ChatEzSubscribe.new()
    ret.user_id = model.user_id
    ret.room_name = model.room_name
    ret.notification_types = [] if model.notification_types == null else model.notification_types.map(func(v): return Gs2ChatEzNotificationType.from_model(v))
    return ret