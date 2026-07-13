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
class_name Gs2ProjectSignInRequest
extends Gs2Request


var email = null
var password = null
var otp = null


func with_email(v) -> Gs2ProjectSignInRequest:
    email = v
    return self


func with_password(v) -> Gs2ProjectSignInRequest:
    password = v
    return self


func with_otp(v) -> Gs2ProjectSignInRequest:
    otp = v
    return self


static func from_dict(data) -> Gs2ProjectSignInRequest:
    if data == null:
        return null
    var ret = Gs2ProjectSignInRequest.new()
    ret.email = null if data.get("email") == null else str(data.get("email"))
    ret.password = null if data.get("password") == null else str(data.get("password"))
    ret.otp = null if data.get("otp") == null else str(data.get("otp"))
    return ret


func to_dict() -> Dictionary:
    var ret = {}
    ret["email"] = email
    ret["password"] = password
    ret["otp"] = otp
    return ret