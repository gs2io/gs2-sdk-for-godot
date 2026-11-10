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
class_name Gs2GatewayEzFirebaseToken
extends RefCounted


var user_id = null
var token = null
var locale = null


func with_user_id(v) -> Gs2GatewayEzFirebaseToken:
    user_id = v
    return self


func with_token(v) -> Gs2GatewayEzFirebaseToken:
    token = v
    return self


func with_locale(v) -> Gs2GatewayEzFirebaseToken:
    locale = v
    return self


func to_model() -> Gs2GatewayFirebaseToken:
    var ret = Gs2GatewayFirebaseToken.new()
    ret.user_id = user_id
    ret.token = token
    ret.locale = locale
    return ret


static func from_model(model) -> Gs2GatewayEzFirebaseToken:
    var ret = Gs2GatewayEzFirebaseToken.new()
    ret.user_id = model.user_id
    ret.token = model.token
    ret.locale = model.locale
    return ret