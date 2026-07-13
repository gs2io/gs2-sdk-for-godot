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
class_name Gs2ChatEzRoom
extends RefCounted


var name = null
var metadata = null
var white_list_user_ids = []


func with_name(v) -> Gs2ChatEzRoom:
    name = v
    return self


func with_metadata(v) -> Gs2ChatEzRoom:
    metadata = v
    return self


func with_white_list_user_ids(v) -> Gs2ChatEzRoom:
    white_list_user_ids = v
    return self


func to_model() -> Gs2ChatRoom:
    var ret = Gs2ChatRoom.new()
    ret.name = name
    ret.metadata = metadata
    ret.white_list_user_ids = null if white_list_user_ids == null else white_list_user_ids.map(func(v): return v)
    return ret


static func from_model(model) -> Gs2ChatEzRoom:
    var ret = Gs2ChatEzRoom.new()
    ret.name = model.name
    ret.metadata = model.metadata
    ret.white_list_user_ids = [] if model.white_list_user_ids == null else model.white_list_user_ids.map(func(v): return v)
    return ret