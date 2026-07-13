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
class_name Gs2Money2GetUnusedBalanceRequest
extends Gs2Request


var namespace_name = null
var currency = null


func with_namespace_name(v) -> Gs2Money2GetUnusedBalanceRequest:
    namespace_name = v
    return self


func with_currency(v) -> Gs2Money2GetUnusedBalanceRequest:
    currency = v
    return self


static func from_dict(data) -> Gs2Money2GetUnusedBalanceRequest:
    if data == null:
        return null
    var ret = Gs2Money2GetUnusedBalanceRequest.new()
    ret.namespace_name = null if data.get("namespaceName") == null else str(data.get("namespaceName"))
    ret.currency = null if data.get("currency") == null else str(data.get("currency"))
    return ret


func to_dict() -> Dictionary:
    var ret = {}
    ret["namespaceName"] = namespace_name
    ret["currency"] = currency
    return ret