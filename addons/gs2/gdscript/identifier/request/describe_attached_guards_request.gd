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
class_name Gs2IdentifierDescribeAttachedGuardsRequest
extends Gs2Request


var client_id = null
var user_name = null


func with_client_id(v) -> Gs2IdentifierDescribeAttachedGuardsRequest:
    client_id = v
    return self


func with_user_name(v) -> Gs2IdentifierDescribeAttachedGuardsRequest:
    user_name = v
    return self


static func from_dict(data) -> Gs2IdentifierDescribeAttachedGuardsRequest:
    if data == null:
        return null
    var ret = Gs2IdentifierDescribeAttachedGuardsRequest.new()
    ret.client_id = null if data.get("clientId") == null else str(data.get("clientId"))
    ret.user_name = null if data.get("userName") == null else str(data.get("userName"))
    return ret


func to_dict() -> Dictionary:
    var ret = {}
    ret["clientId"] = client_id
    ret["userName"] = user_name
    return ret