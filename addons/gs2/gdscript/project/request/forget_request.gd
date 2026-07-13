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
class_name Gs2ProjectForgetRequest
extends Gs2Request


var email = null
var lang = null


func with_email(v) -> Gs2ProjectForgetRequest:
    email = v
    return self


func with_lang(v) -> Gs2ProjectForgetRequest:
    lang = v
    return self


static func from_dict(data) -> Gs2ProjectForgetRequest:
    if data == null:
        return null
    var ret = Gs2ProjectForgetRequest.new()
    ret.email = null if data.get("email") == null else str(data.get("email"))
    ret.lang = null if data.get("lang") == null else str(data.get("lang"))
    return ret


func to_dict() -> Dictionary:
    var ret = {}
    ret["email"] = email
    ret["lang"] = lang
    return ret