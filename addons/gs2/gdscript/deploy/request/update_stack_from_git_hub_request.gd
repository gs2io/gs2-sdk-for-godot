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
class_name Gs2DeployUpdateStackFromGitHubRequest
extends Gs2Request


var stack_name = null
var description = null
var checkout_setting = null


func with_stack_name(v) -> Gs2DeployUpdateStackFromGitHubRequest:
    stack_name = v
    return self


func with_description(v) -> Gs2DeployUpdateStackFromGitHubRequest:
    description = v
    return self


func with_checkout_setting(v) -> Gs2DeployUpdateStackFromGitHubRequest:
    checkout_setting = v
    return self


static func from_dict(data) -> Gs2DeployUpdateStackFromGitHubRequest:
    if data == null:
        return null
    var ret = Gs2DeployUpdateStackFromGitHubRequest.new()
    ret.stack_name = null if data.get("stackName") == null else str(data.get("stackName"))
    ret.description = null if data.get("description") == null else str(data.get("description"))
    ret.checkout_setting = null if data.get("checkoutSetting") == null else Gs2DeployGitHubCheckoutSetting.from_dict(data.get("checkoutSetting"))
    return ret


func to_dict() -> Dictionary:
    var ret = {}
    ret["stackName"] = stack_name
    ret["description"] = description
    ret["checkoutSetting"] = null if checkout_setting == null else checkout_setting.to_dict()
    return ret