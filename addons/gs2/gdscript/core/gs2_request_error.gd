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
class_name Gs2RequestError
extends RefCounted


var component: Variant = null
var message: Variant = null
var code: Variant = null


static func from_dict(data) -> Gs2RequestError:
    if data == null:
        return null
    var ret = Gs2RequestError.new()
    ret.component = data.get("component")
    ret.message = data.get("message")
    ret.code = data.get("code")
    return ret


func to_dict() -> Dictionary:
    var ret = {}
    ret["component"] = component
    ret["message"] = message
    ret["code"] = code
    return ret
