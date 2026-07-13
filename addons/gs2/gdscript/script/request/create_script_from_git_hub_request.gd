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
class_name Gs2ScriptCreateScriptFromGitHubRequest
extends Gs2Request


var namespace_name = null
var name = null
var description = null
var checkout_setting = null
var disable_string_number_to_number = null


func with_namespace_name(v) -> Gs2ScriptCreateScriptFromGitHubRequest:
    namespace_name = v
    return self


func with_name(v) -> Gs2ScriptCreateScriptFromGitHubRequest:
    name = v
    return self


func with_description(v) -> Gs2ScriptCreateScriptFromGitHubRequest:
    description = v
    return self


func with_checkout_setting(v) -> Gs2ScriptCreateScriptFromGitHubRequest:
    checkout_setting = v
    return self


func with_disable_string_number_to_number(v) -> Gs2ScriptCreateScriptFromGitHubRequest:
    disable_string_number_to_number = v
    return self


static func from_dict(data) -> Gs2ScriptCreateScriptFromGitHubRequest:
    if data == null:
        return null
    var ret = Gs2ScriptCreateScriptFromGitHubRequest.new()
    ret.namespace_name = null if data.get("namespaceName") == null else str(data.get("namespaceName"))
    ret.name = null if data.get("name") == null else str(data.get("name"))
    ret.description = null if data.get("description") == null else str(data.get("description"))
    ret.checkout_setting = null if data.get("checkoutSetting") == null else Gs2ScriptGitHubCheckoutSetting.from_dict(data.get("checkoutSetting"))
    ret.disable_string_number_to_number = null if data.get("disableStringNumberToNumber") == null else bool(data.get("disableStringNumberToNumber"))
    return ret


func to_dict() -> Dictionary:
    var ret = {}
    ret["namespaceName"] = namespace_name
    ret["name"] = name
    ret["description"] = description
    ret["checkoutSetting"] = null if checkout_setting == null else checkout_setting.to_dict()
    ret["disableStringNumberToNumber"] = disable_string_number_to_number
    return ret