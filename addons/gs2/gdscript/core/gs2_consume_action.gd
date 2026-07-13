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
class_name Gs2ConsumeAction
extends RefCounted


var action: Variant = null
var request: Variant = null


func with_action(v) -> Gs2ConsumeAction:
    action = v
    return self


func with_request(v) -> Gs2ConsumeAction:
    request = v
    return self


static func from_dict(data) -> Gs2ConsumeAction:
    if data == null:
        return null
    var ret = Gs2ConsumeAction.new()
    ret.action = data.get("action")
    ret.request = data.get("request")
    return ret


func to_dict() -> Dictionary:
    var ret = {}
    ret["action"] = action
    ret["request"] = request
    return ret


## request 内の #{key} プレースホルダを value で置換した新しいアクションを返す
func apply_config(key, value) -> Gs2ConsumeAction:
    var escaped = ""
    if value != null:
        var regex = RegEx.new()
        regex.compile("(?<!\\\\)\"")
        escaped = regex.sub(str(value), "\\\"", true)
    var ret = Gs2ConsumeAction.new()
    ret.action = action
    ret.request = request.replace("#{%s}" % str(key), escaped) if request != null else null
    return ret
