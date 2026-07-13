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
class_name Gs2ProjectGetProjectTokenByIdentifierRequest
extends Gs2Request


var account_name = null
var project_name = null
var user_name = null
var password = null
var otp = null


func with_account_name(v) -> Gs2ProjectGetProjectTokenByIdentifierRequest:
    account_name = v
    return self


func with_project_name(v) -> Gs2ProjectGetProjectTokenByIdentifierRequest:
    project_name = v
    return self


func with_user_name(v) -> Gs2ProjectGetProjectTokenByIdentifierRequest:
    user_name = v
    return self


func with_password(v) -> Gs2ProjectGetProjectTokenByIdentifierRequest:
    password = v
    return self


func with_otp(v) -> Gs2ProjectGetProjectTokenByIdentifierRequest:
    otp = v
    return self


static func from_dict(data) -> Gs2ProjectGetProjectTokenByIdentifierRequest:
    if data == null:
        return null
    var ret = Gs2ProjectGetProjectTokenByIdentifierRequest.new()
    ret.account_name = null if data.get("accountName") == null else str(data.get("accountName"))
    ret.project_name = null if data.get("projectName") == null else str(data.get("projectName"))
    ret.user_name = null if data.get("userName") == null else str(data.get("userName"))
    ret.password = null if data.get("password") == null else str(data.get("password"))
    ret.otp = null if data.get("otp") == null else str(data.get("otp"))
    return ret


func to_dict() -> Dictionary:
    var ret = {}
    ret["accountName"] = account_name
    ret["projectName"] = project_name
    ret["userName"] = user_name
    ret["password"] = password
    ret["otp"] = otp
    return ret