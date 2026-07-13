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
class_name Gs2ScriptCreateScriptRequest
extends Gs2Request


var namespace_name = null
var name = null
var description = null
var script_ = null
var disable_string_number_to_number = null


func with_namespace_name(v) -> Gs2ScriptCreateScriptRequest:
    namespace_name = v
    return self


func with_name(v) -> Gs2ScriptCreateScriptRequest:
    name = v
    return self


func with_description(v) -> Gs2ScriptCreateScriptRequest:
    description = v
    return self


func with_script(v) -> Gs2ScriptCreateScriptRequest:
    script_ = v
    return self


func with_disable_string_number_to_number(v) -> Gs2ScriptCreateScriptRequest:
    disable_string_number_to_number = v
    return self


static func from_dict(data) -> Gs2ScriptCreateScriptRequest:
    if data == null:
        return null
    var ret = Gs2ScriptCreateScriptRequest.new()
    ret.namespace_name = null if data.get("namespaceName") == null else str(data.get("namespaceName"))
    ret.name = null if data.get("name") == null else str(data.get("name"))
    ret.description = null if data.get("description") == null else str(data.get("description"))
    ret.script_ = null if data.get("script") == null else str(data.get("script"))
    ret.disable_string_number_to_number = null if data.get("disableStringNumberToNumber") == null else bool(data.get("disableStringNumberToNumber"))
    return ret


func to_dict() -> Dictionary:
    var ret = {}
    ret["namespaceName"] = namespace_name
    ret["name"] = name
    ret["description"] = description
    ret["script"] = script_
    ret["disableStringNumberToNumber"] = disable_string_number_to_number
    return ret