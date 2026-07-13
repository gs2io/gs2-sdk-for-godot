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
class_name Gs2AuthEzAccessToken
extends RefCounted


var token = null
var user_id = null
var expire = 0


func with_token(v) -> Gs2AuthEzAccessToken:
    token = v
    return self


func with_user_id(v) -> Gs2AuthEzAccessToken:
    user_id = v
    return self


func with_expire(v) -> Gs2AuthEzAccessToken:
    expire = v
    return self


func to_model() -> Gs2AuthAccessToken:
    var ret = Gs2AuthAccessToken.new()
    ret.token = token
    ret.user_id = user_id
    ret.expire = expire
    return ret


static func from_model(model) -> Gs2AuthEzAccessToken:
    var ret = Gs2AuthEzAccessToken.new()
    ret.token = model.token
    ret.user_id = model.user_id
    ret.expire = 0 if model.expire == null else model.expire
    return ret