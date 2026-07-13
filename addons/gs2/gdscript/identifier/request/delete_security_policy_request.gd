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
class_name Gs2IdentifierDeleteSecurityPolicyRequest
extends Gs2Request


var security_policy_name = null


func with_security_policy_name(v) -> Gs2IdentifierDeleteSecurityPolicyRequest:
    security_policy_name = v
    return self


static func from_dict(data) -> Gs2IdentifierDeleteSecurityPolicyRequest:
    if data == null:
        return null
    var ret = Gs2IdentifierDeleteSecurityPolicyRequest.new()
    ret.security_policy_name = null if data.get("securityPolicyName") == null else str(data.get("securityPolicyName"))
    return ret


func to_dict() -> Dictionary:
    var ret = {}
    ret["securityPolicyName"] = security_policy_name
    return ret