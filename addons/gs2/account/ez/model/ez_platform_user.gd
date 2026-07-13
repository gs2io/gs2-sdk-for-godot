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
class_name Gs2AccountEzPlatformUser
extends RefCounted


var type = 0
var user_identifier = null
var user_id = null


func with_type(v) -> Gs2AccountEzPlatformUser:
    type = v
    return self


func with_user_identifier(v) -> Gs2AccountEzPlatformUser:
    user_identifier = v
    return self


func with_user_id(v) -> Gs2AccountEzPlatformUser:
    user_id = v
    return self


func to_model() -> Gs2AccountPlatformUser:
    var ret = Gs2AccountPlatformUser.new()
    ret.type = type
    ret.user_identifier = user_identifier
    ret.user_id = user_id
    return ret


static func from_model(model) -> Gs2AccountEzPlatformUser:
    var ret = Gs2AccountEzPlatformUser.new()
    ret.type = 0 if model.type == null else model.type
    ret.user_identifier = model.user_identifier
    ret.user_id = model.user_id
    return ret