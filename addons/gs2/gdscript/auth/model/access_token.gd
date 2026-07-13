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
class_name Gs2AuthAccessToken
extends RefCounted


var token = null
var user_id = null
var federation_from_user_id = null
var expire = null
var time_offset = null


func with_token(v) -> Gs2AuthAccessToken:
    token = v
    return self


func with_user_id(v) -> Gs2AuthAccessToken:
    user_id = v
    return self


func with_federation_from_user_id(v) -> Gs2AuthAccessToken:
    federation_from_user_id = v
    return self


func with_expire(v) -> Gs2AuthAccessToken:
    expire = v
    return self


func with_time_offset(v) -> Gs2AuthAccessToken:
    time_offset = v
    return self


static func from_dict(data) -> Gs2AuthAccessToken:
    if data == null:
        return null
    var ret = Gs2AuthAccessToken.new()
    ret.token = null if data.get("token") == null else str(data.get("token"))
    ret.user_id = null if data.get("userId") == null else str(data.get("userId"))
    ret.federation_from_user_id = null if data.get("federationFromUserId") == null else str(data.get("federationFromUserId"))
    ret.expire = null if data.get("expire") == null else int(data.get("expire"))
    ret.time_offset = null if data.get("timeOffset") == null else int(data.get("timeOffset"))
    return ret


func to_dict() -> Dictionary:
    var ret = {}
    ret["token"] = token
    ret["userId"] = user_id
    ret["federationFromUserId"] = federation_from_user_id
    ret["expire"] = expire
    ret["timeOffset"] = time_offset
    return ret