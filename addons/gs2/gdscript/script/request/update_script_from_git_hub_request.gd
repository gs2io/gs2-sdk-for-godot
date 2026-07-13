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
class_name Gs2ScriptUpdateScriptFromGitHubRequest
extends Gs2Request


var namespace_name = null
var script_name = null
var description = null
var checkout_setting = null
var disable_string_number_to_number = null


func with_namespace_name(v) -> Gs2ScriptUpdateScriptFromGitHubRequest:
    namespace_name = v
    return self


func with_script_name(v) -> Gs2ScriptUpdateScriptFromGitHubRequest:
    script_name = v
    return self


func with_description(v) -> Gs2ScriptUpdateScriptFromGitHubRequest:
    description = v
    return self


func with_checkout_setting(v) -> Gs2ScriptUpdateScriptFromGitHubRequest:
    checkout_setting = v
    return self


func with_disable_string_number_to_number(v) -> Gs2ScriptUpdateScriptFromGitHubRequest:
    disable_string_number_to_number = v
    return self


static func from_dict(data) -> Gs2ScriptUpdateScriptFromGitHubRequest:
    if data == null:
        return null
    var ret = Gs2ScriptUpdateScriptFromGitHubRequest.new()
    ret.namespace_name = null if data.get("namespaceName") == null else str(data.get("namespaceName"))
    ret.script_name = null if data.get("scriptName") == null else str(data.get("scriptName"))
    ret.description = null if data.get("description") == null else str(data.get("description"))
    ret.checkout_setting = null if data.get("checkoutSetting") == null else Gs2ScriptGitHubCheckoutSetting.from_dict(data.get("checkoutSetting"))
    ret.disable_string_number_to_number = null if data.get("disableStringNumberToNumber") == null else bool(data.get("disableStringNumberToNumber"))
    return ret


func to_dict() -> Dictionary:
    var ret = {}
    ret["namespaceName"] = namespace_name
    ret["scriptName"] = script_name
    ret["description"] = description
    ret["checkoutSetting"] = null if checkout_setting == null else checkout_setting.to_dict()
    ret["disableStringNumberToNumber"] = disable_string_number_to_number
    return ret