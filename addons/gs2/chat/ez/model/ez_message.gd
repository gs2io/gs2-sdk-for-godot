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
class_name Gs2ChatEzMessage
extends RefCounted


var name = null
var room_name = null
var user_id = null
var category = 0
var metadata = null
var created_at = 0


func with_name(v) -> Gs2ChatEzMessage:
    name = v
    return self


func with_room_name(v) -> Gs2ChatEzMessage:
    room_name = v
    return self


func with_user_id(v) -> Gs2ChatEzMessage:
    user_id = v
    return self


func with_category(v) -> Gs2ChatEzMessage:
    category = v
    return self


func with_metadata(v) -> Gs2ChatEzMessage:
    metadata = v
    return self


func with_created_at(v) -> Gs2ChatEzMessage:
    created_at = v
    return self


func to_model() -> Gs2ChatMessage:
    var ret = Gs2ChatMessage.new()
    ret.name = name
    ret.room_name = room_name
    ret.user_id = user_id
    ret.category = category
    ret.metadata = metadata
    ret.created_at = created_at
    return ret


static func from_model(model) -> Gs2ChatEzMessage:
    var ret = Gs2ChatEzMessage.new()
    ret.name = model.name
    ret.room_name = model.room_name
    ret.user_id = model.user_id
    ret.category = 0 if model.category == null else model.category
    ret.metadata = model.metadata
    ret.created_at = 0 if model.created_at == null else model.created_at
    return ret